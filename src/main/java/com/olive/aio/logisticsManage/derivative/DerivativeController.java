package com.olive.aio.logisticsManage.derivative;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeController {

    @GetMapping("/derivative")
    public String derivList(Model mode){


        return "logistic_manage/deriv_main";
    }

//    @GetMapping("/come")
//    public String test11(Model model){
//        return "/logistic_manage/test1";
//    }

//    @GetMapping("/derivative")
//    public String derivList(Model model,
//                            @PageableDefault(size = 15, sort = "derivid",
//                                    direction = Sort.Direction.DESC)Pageable pageable){
//
//        String state = "입고대기";
//        Page<Derivative> derivList = derivativeRepository.findAllByDerivstate(state, pageable);
//
//
//        return "/logistic_manage/deriv_main";
//    }



}
