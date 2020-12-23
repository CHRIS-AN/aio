package com.olive.aio.MyPage;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.employee.EmplService;
import com.olive.aio.employee.form.EmplUpdateForm;
import lombok.RequiredArgsConstructor;
import org.dom4j.rule.Mode;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MyPageController {

    private final ModelMapper modelMapper;
    private final EmplService emplService;
    private final MyPageService myInfoService;
    private final ObjectMapper objectMapper;

    @GetMapping("/mypage")
    public String myPage(@CurrentEmpl Empl empl, Model model) {


        model.addAttribute(empl);

        return "thymeleaf/yeonsup/mypage";
    }

    @GetMapping("/mypage/update")
    public String updateMyInfo(@CurrentEmpl Empl empl, EmplUpdateForm myInfoForm, Model model) {
        model.addAttribute(empl);

        modelMapper.map(empl, myInfoForm);

        model.addAttribute(myInfoForm);

        return "thymeleaf/yeonsup/update";
    }

    @PostMapping("/mypage/update")
    public String submitUpdateMyInfo(@CurrentEmpl Empl empl, @Valid EmplUpdateForm myInfoForm, Errors errors, Model model) {

        if(errors.hasErrors()) {
            model.addAttribute(myInfoForm);
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




}
