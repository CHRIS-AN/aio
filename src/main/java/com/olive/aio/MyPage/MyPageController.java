package com.olive.aio.MyPage;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.employee.EmplService;
import com.olive.aio.employee.form.EmplUpdateForm;
import com.olive.aio.slip.SlipService;
import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MyPageController {

    private final ModelMapper modelMapper;
    private final EmplService emplService;
    private final MyPageService myInfoService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/mypage")
    public String myPage(@CurrentEmpl Empl empl, Model model) {


        model.addAttribute(empl);

        return "thymeleaf/yeonsup/mypage";
    }

    @GetMapping("/mypage/update")
    public String updateMyInfo(@CurrentEmpl Empl empl, EmplUpdateForm myInfoForm, Model model) {
        model.addAttribute(empl);

        modelMapper.map(empl, myInfoForm);

        model.addAttribute("myInfoForm", myInfoForm);

        return "thymeleaf/yeonsup/update";
    }

    @PostMapping("/mypage/update")
    public String submitUpdateMyInfo(@CurrentEmpl Empl empl, @Valid EmplUpdateForm myInfoForm, Errors errors, Model model) {
            log.info("myinfoForm {}", myInfoForm);
        if(errors.hasErrors()) {
            log.info("errors{}",errors);
            model.addAttribute("myInfoForm", myInfoForm);
            model.addAttribute("empl", empl);
            Map<String, String> validatorResult = emplService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            return "thymeleaf/yeonsup/update";
        }

        myInfoService.updateMyInfo(empl, myInfoForm);

        return "redirect:/mypage";
    }

    @GetMapping("/mypage/myCalendar")
    public String myCalendar(@CurrentEmpl Empl empl, Model model) {
        model.addAttribute(empl);
        return "thymeleaf/yeonsup/myCalendar";
    }

    @GetMapping("/searchCorwork")
    public String readCoworker(@CurrentEmpl Empl empl, Model model, String keyword, String dept,
                              @PageableDefault(size = 9, page = 0, sort = "emplId", direction = Sort.Direction.ASC) Pageable pageable) {
        model.addAttribute(empl);
        if(keyword == null) {
            keyword = "";
        }
        if(dept == null) {
            dept = "";
        }

        Page<Empl> search = emplService.search(dept, keyword, pageable);

        log.info("search{}:", search);
        model.addAttribute("emplList", search);
        model.addAttribute("keyword", keyword);
        model.addAttribute("dept", dept);
        return "thymeleaf/yeonsup/search";
    };

    @GetMapping("/work/{state}")
    public String goWork(@CurrentEmpl Empl empl, Model model, @PathVariable String state) {
        emplService.updateGoWork(empl, model, state);
        model.addAttribute(empl);
        return "redirect:/";
    }

    @PostMapping("/cp")
    public String changePW(@CurrentEmpl Empl empl, Model model, String originPw ,String newPw) {
        log.info("originPw {}", originPw);
        log.info("newPw {}", newPw);
        if(!emplService.checkPassword(empl, originPw)) {
            model.addAttribute(empl);
            model.addAttribute("failed", "비밀번호가 맞지 않습니다.");
            return "thymeleaf/yeonsup/mypage";
        }

        myInfoService.newPw(empl, newPw);
        model.addAttribute("good", 1);

        return "yeonsup/good";
    }
}
