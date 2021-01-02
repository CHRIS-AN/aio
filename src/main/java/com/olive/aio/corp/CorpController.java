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
import java.util.Map;

@Slf4j
@Controller
@AllArgsConstructor
@RequestMapping("/yeonji/")
public class CorpController {

    @Autowired
    private CorpService corpService;

//    private final CorpInsertFormValidator corpInsertFormValidator;
//
//    @InitBinder("corp")
//    public void initBinder(WebDataBinder webDataBinder){
//        webDataBinder.addValidators(corpInsertFormValidator);
//    }

    // 모든 거래처 목록 조회
    @GetMapping("corpList")
    public String corpList(Model model, Corp corp){
        List<Corp> corpList = corpService.findAll(corp);
        model.addAttribute("corp", corpList);
        return "yeonji/corpList";
    }

    // 거래처 등록 & submit 후 값 검증
    @PostMapping("corpInsert")
    public String corpInsertSubmit(@CurrentEmpl Empl empl, @Valid Corp corp, Errors errors, Model model) {
        if (errors.hasErrors()) {
            //제품 등록 실패시, 입력 데이터를 유지
            model.addAttribute("corpError", corp);

            List<Corp> corpList = corpService.findAll(corp);
            model.addAttribute("corp", corpList);

            //모달 창 바로 뜨게 하기 위한 model
            model.addAttribute("error","error");

            //유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = corpService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }

            return "yeonji/corpList";

        }
        corp.setEmpl(empl);
        corpService.insertCorp(corp);
        //TODO 거래처 추가 처리
        return "redirect:corpList";
    }

    // 거래처 수정
    @PostMapping("corpUpdate")
    public String corpUpdate(@CurrentEmpl Empl empl, @Valid Corp corp, Errors errors,  Model model) {
        log.info("1");
        if (errors.hasErrors()) {

            model.addAttribute("corpError2", corp);
            log.info("2");
            //제품 등록 실패시, 입력 데이터를 유지
            List<Corp> corpList = corpService.findAll(corp);
            model.addAttribute("corp", corpList);
            log.info("3");
            //모달 창 바로 뜨게 하기 위한 model
            model.addAttribute("error2","error");
            log.info("4");
            //유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = corpService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            log.info("5");
            return "yeonji/corpList";
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
