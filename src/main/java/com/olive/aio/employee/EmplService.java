package com.olive.aio.employee;

import com.olive.aio.domain.Empl;
import com.olive.aio.email.EmailMessage;
import com.olive.aio.email.EmailService;
import com.olive.aio.employee.form.EmplForm;
import com.olive.aio.employee.form.EmplUpdateForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
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
        } else {
            role = "ROLE_ALL";
        }
        log.info(role);
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

    public void updateEmpl(Empl empl, @Valid EmplUpdateForm emplForm) {
        Empl byEmplId = emplRepository.findByEmplId(empl.getEmplId());

        if(emplForm.getEmplResigdate().length() > 0) {
            emplForm.setWork_state("퇴사");
        }

        modelMapper.map(emplForm, byEmplId);

        return;
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
        boolean matches = passwordEncoder.matches(passwordEncoder.encode(password) , empl.getPassword());
        return matches;
    }

    public void sendEmail(Empl empl, String emplId) {
        Empl toEmpl = emplRepository.findByEmplId(emplId);

        StringBuffer buffer = new StringBuffer();

        buffer.append("<h2>비밀번호 설정</h2>");
        buffer.append("<p>비밀번호가 초기화 되었습니다.</p>");
        buffer.append("<p>해당 비밀번호로 로그인한 후 비밀번호 재설정 해주십시오.</p>");

        String tempPassword = UUID.randomUUID().toString().replaceAll("-","").substring(0, 10);

        toEmpl.setPassword(tempPassword);

        buffer.append("비밀번호 : " + tempPassword);

        EmailMessage emailMessage = EmailMessage.builder()
                .to(toEmpl.getEmail())
                .subject("비밀번호 설정")
                .message(buffer.toString())
                .from(empl.getEmail())
                .build();

        emailService.sendEmail(emailMessage);
    }
}







