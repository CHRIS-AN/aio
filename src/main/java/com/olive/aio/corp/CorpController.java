package com.olive.aio.corp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("yeonji/")
public class CorpController {

    @Autowired
    private CorpService corpService;

    //모든 거래처 목록 조회
    @GetMapping("corpList")
    public String corpList(Model model, Corp corp){
        List<Corp> corpList = corpService.findAll(corp);
        model.addAttribute("corp", corpList);
        return "yeonji/corpList";
    }

    @GetMapping("corpadd")
    public String corpAdd(){
        return "yeonji/corpAdd";
    }
}
