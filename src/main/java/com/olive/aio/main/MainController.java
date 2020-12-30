package com.olive.aio.main;


import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.EmplService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;



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

    @GetMapping("/logout")
    public String logOff() {
        SecurityContextHolder.clearContext();
        return "redirect:/login";
    }

    @GetMapping("/err/denied-page")
    public String deniedPage() {
        return "err/denied-page";
    }
}
