package com.olive.aio.draft;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@AllArgsConstructor
@Slf4j
@RequestMapping("/yeonji/")
public class DraftController {

    @Autowired
    private DraftService draftService;

    @GetMapping("draftList")
    public String DraftList(Model model, Draft draft){
        List<Draft> draftList = draftService.findAll(draft);
        model.addAttribute("draft", draftList);
        return "yeonji/draftList";
    }

    @PostMapping("draftInsert")
    public String draftInsert(Draft draft){
        draftService.insertDraft(draft);
        return "redirect:draftList";
    }


}
