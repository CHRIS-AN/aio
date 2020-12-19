package com.olive.aio.draft;

import org.modelmapper.internal.Errors;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("yeonji/")
public class DraftController {

    @GetMapping("draft")
    public String draftShow(Model model) {
//        model.addAttribute("draft" ,new Draft());
        model.addAttribute("draft",new Draft());
        return "yeonji/draft";
    }

    @PostMapping("draft")
    public String draftSubmit(@Valid Draft draft, Errors errors){ //@Valid를 이용하면, service 단이 아닌 객체 안에서, 들어오는 값에 대해 검증을 할 수 있다.
        if(errors.hasErrors()) { //만약 에러가 있으면
            return "yeonji/draft";
        }

        //TODO 발주 요청 처리
        return "redirect:ordersList";
    }
}
