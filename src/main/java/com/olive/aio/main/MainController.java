package com.olive.aio.main;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.EmplService;
import com.olive.aio.employee.form.EmplForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {

    private final EmplService emplService;
    private final ObjectMapper objectMapper;

    private static final String EMPL_VIEW_PREFIX = "yeonsup/hr/";

    @GetMapping("/")
    public String index() {

        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "yeonsup/login";
    }

    @GetMapping("/example")
    public String example() {
        return "layout/example";
    }


    @GetMapping("/hr")
    public String manageHR(Model model, @CurrentEmpl Empl empl) {
        model.addAttribute(new EmplForm());
        model.addAttribute("empl", empl);

        return EMPL_VIEW_PREFIX + "manage";
    }

    @PostMapping("/hr")
    public String createMember(@CurrentEmpl Empl empl, @Valid EmplForm emplForm, Errors errors, Model model) {
        model.addAttribute(empl);
        log.info(emplForm.toString());
        if (emplService.addErrors(emplForm, errors, model)) {

            return EMPL_VIEW_PREFIX + "manage";
        }
        emplService.saveEmpl(emplForm);
        return "redirect:/hr";
    }




}
