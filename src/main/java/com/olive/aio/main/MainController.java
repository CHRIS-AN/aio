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
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {

    private final EmplService emplService;

    @GetMapping("/")
    public String index(@CurrentEmpl Empl empl, Model model) {
        model.addAttribute(empl);
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



}
