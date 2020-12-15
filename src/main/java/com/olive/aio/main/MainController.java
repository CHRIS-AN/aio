package com.olive.aio.main;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class MainController {

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


}
