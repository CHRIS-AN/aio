package com.olive.aio.corp;

import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/yeonji/")
public class CorpController {

    @Autowired
    private CorpService corpService;

    // 모든 거래처 목록 조회
    @GetMapping("corpList")
    public String corpList(Model model, Corp corp){
        List<Corp> corpList = corpService.findAll(corp);
        model.addAttribute("corp", corpList);
        return "yeonji/corpList";
    }

    // 거래처 등록 & submit 후 값 검증
    @PostMapping("corpInsert")
    public String corpInsertSubmit(@Valid Corp corp, @CurrentEmpl Empl empl, Errors errors) {
        if(errors.hasErrors()) { //에러가 있다면
            log.info("에러냐?");
            return null;
        }
        corp.setEmpl(empl);
        corpService.insertCorp(corp);
        //TODO 거래처 추가 처리
        return "redirect:corpList";
    }

    // 거래처 수정
    @PostMapping("corpUpdate")
    public String corpUpdate(@Valid Corp corp, @CurrentEmpl Empl empl, Model model, Errors errors) {

        if(errors.hasErrors()) { //에러가 있다면
            return null;
        }
        corpService.updateCorp(corp, empl);
        //TODO 거래처 수정 처리
        return "redirect:corpList";
    }

    // 거래처 삭제
    @PostMapping("corpDelete")
    public String corpDelete(Corp corp){
        corpService.deleteById(corp);
        return "redirect:corpList";
    }

}
