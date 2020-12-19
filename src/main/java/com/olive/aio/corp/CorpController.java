package com.olive.aio.corp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("yeonji/")
public class CorpController {

    @GetMapping("corp")
    public String corpList(Model model){
        model.addAttribute("corp", new Corp());
        return "yeonji/corpList";
    }

    @GetMapping("corpadd")
    public String corpAdd(){
        return "yeonji/corpAdd";
    }
}
