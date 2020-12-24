package com.olive.aio.corp;

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
@RequestMapping("/yeonji")
public class CorpController {

    @Autowired
    private CorpService corpService;

    // 모든 거래처 목록 조회
    @GetMapping("/corpList")
    public String corpList(Model model, Corp corp){
        List<Corp> corpList = corpService.findAll(corp);
        System.out.println(corpList);
        model.addAttribute("corp", corpList);
        return "yeonji/corpList";
    }

    // 거래처 등록 & submit 후 값 검증
    @PostMapping("/corpInsert")
    public String corpInsertSubmit(@Valid Corp corp, Errors errors) {
        log.info("Post로 Insert 했냐?");
        if(errors.hasErrors()) { //에러가 있다면
            log.info("에러냐?");
            return null;
        }
        log.info("에러 아니다.");
        corpService.insertCorp(corp);
        //TODO 거래처 추가 처리
        return "redirect:yeonji/corpList";
    }

    // 거래처 수정
    @PostMapping("/corpUpdate")
    public String corpUpdate(@Valid Corp corp, Model model, Errors errors) {

        log.info("수정시작");
        if(errors.hasErrors()) { //에러가 있다면
            log.info("에러냐?");
            return null;
        }
        corpService.updateCorp(corp);
        log.info("수정완료");
        //TODO 거래처 수정 처리
        return "redirect:corpList";
    }

    // 거래처 삭제
    @PostMapping("/corpDelete")
    public String corpDelete(Corp corp){
        corpService.deleteById(corp);
        return "redirect:corpList";
    }

}
