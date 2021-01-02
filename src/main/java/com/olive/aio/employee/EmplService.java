package com.olive.aio.employee;

import com.olive.aio.MyPage.MyCalendarRepository;
import com.olive.aio.config.WebAccessDeniedHandler;
import com.olive.aio.domain.Empl;
import com.olive.aio.domain.MyCalendar;
import com.olive.aio.email.EmailMessage;
import com.olive.aio.email.EmailService;
import com.olive.aio.employee.form.EmplForm;
import com.olive.aio.employee.form.EmplUpdateForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import javax.validation.Valid;
import java.util.*;

@Slf4j
@Transactional
@Service
@RequiredArgsConstructor
public class EmplService implements UserDetailsService {

    private final EmplRepository emplRepository;
    private final ModelMapper modelMapper;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;
    private final MyCalendarRepository myCalendarRepository;
    private final WebAccessDeniedHandler webAccessDeniedHandler;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Empl empl = emplRepository.findByEmplId(username);

        String dept = "";
        String role = "";

        if(empl == null) {
            throw new UsernameNotFoundException(username);
        } else {
            role = decideAuth(username, empl, role);
        }
        log.info("role {}", role);

        return new UserEmpl(empl, role);
    }


    public List<Empl> loadAllEmpl() {
        return emplRepository.findAll();
    }

    public void saveEmpl(EmplForm emplForm) {
        Empl empl = modelMapper.map(emplForm, Empl.class);
        String newPassword = emplForm.getPhone().substring(emplForm.getPhone().lastIndexOf("-") + 1);
        empl.setPassword(passwordEncoder.encode(newPassword));
        emplRepository.save(empl);
    }

    private String decideAuth(String username, Empl empl, String role) {
        String dept;
        if (!username.equals("admin")){
            if(empl.getWork_state().equals("퇴사")){
                role = "ROLE_RETIREE";
            } else {
                dept = empl.getDept();
                switch (dept) {
                    case "인사":
                        role = "ROLE_HR";
                        break;
                    case "제품":
                        role = "ROLE_PRODUCT";
                        break;
                    case "영업":
                        role = "ROLE_SALES";
                        break;
                    case "물류":
                        role = "ROLE_LOGISTICS";
                        break;
                    case "회계":
                        role = "ROLE_FINANCE";
                        break;
                    //TODO 각 부서마다 권한을 정해주세요.
                    // 제품 영업 물류 회계
                }
            }
        } else {
            role = "ROLE_ALL";
        }

        return role;
    }


    public static Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }

        return validatorResult;
    }

    public Empl loadByEmplId(String emplId) {
        Empl byEmplId = emplRepository.findByEmplId(emplId);
        return byEmplId;
    }

    public Empl updateEmpl(Empl empl, EmplUpdateForm emplForm) {
        Empl byEmplId = emplRepository.findByEmplId(emplForm.getEmplId());

        if(emplForm.getEmplResigdate() != null && emplForm.getEmplResigdate().length() > 0) {
            emplForm.setWork_state("퇴사");
        }

        modelMapper.map(emplForm, byEmplId);

        return byEmplId;
    }

    public boolean addErrors(@Valid EmplForm emplForm, Errors errors, Model model) {
        if (errors.hasErrors()) {
            model.addAttribute(emplForm);

            Map<String, String> validatorResult = validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            model.addAttribute("error", "error");
            return true;
        }
        return false;
    }

    public boolean addAjaxErrors(Errors errors, Map<String, Object> jsonMap) {
        if (errors.hasErrors()) {
            Map<String, String> validatorResult = validateHandling(errors);
            jsonMap.put("errors",validatorResult);
            return true;
        }
        return false;
    }

    public boolean checkPassword(Empl empl, String password) {
        log.info(empl.getPassword());
        log.info(password);
        boolean matches = passwordEncoder.matches(password , empl.getPassword());
        System.out.println(matches);
        return matches;
    }

    public void sendEmail(Empl empl, String emplId) {
        Empl toEmpl = emplRepository.findByEmplId(emplId);

        StringBuffer buffer = new StringBuffer();

        buffer.append("<h2>비밀번호 설정</h2>");
        buffer.append("<p>비밀번호가 초기화 되었습니다.</p>");
        buffer.append("<p>해당 비밀번호로 로그인한 후 비밀번호 재설정 해주십시오.</p>");

        String tempPassword = UUID.randomUUID().toString().replaceAll("-","").substring(0, 10);

        toEmpl.setPassword(passwordEncoder.encode(tempPassword));

        buffer.append("비밀번호 : " + tempPassword);

        EmailMessage emailMessage = EmailMessage.builder()
                .to(toEmpl.getEmail())
                .subject("비밀번호 설정")
                .message(buffer.toString())
                .from(empl.getEmail())
                .build();

        emailService.sendEmail(emailMessage);
    }

    public Page<Empl> search(String dept, String keyword, Pageable pageable) {

        Page<Empl> emplList = emplRepository.findByKeyword(dept, keyword, pageable);


        return emplList;
    }

    public Empl updateGoWork(Empl empl, Model model, String state) {
        log.info("empl {} ", empl);
        log.info("empl.getAttendance {} ", empl.getAttendance());
        if(state.equals("gowork")) {
            MyCalendar myCalendar = new MyCalendar();
            empl.setAttendance("출근");
            empl.addMyCalendar(myCalendar);
            myCalendarRepository.save(myCalendar);
        } else if(state.equals("gohome")) {
            MyCalendar myCalendar = new MyCalendar();
            empl.setAttendance("퇴근");
            empl.addMyCalendar(myCalendar);
            myCalendarRepository.save(myCalendar);
        }
        emplRepository.save(empl);
        return empl;
    }
}







