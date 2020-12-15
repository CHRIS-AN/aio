package com.olive.aio.Employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmplController {

    @GetMapping("/hr")
    public String manageHR() {

        return "yeonsup/hr/manage";
    }


}
