package com.olive.aio.logisticsManage.derivative;


import com.olive.aio.domain.Testderivative;
import com.olive.aio.domain.test.Testorders;
import lombok.RequiredArgsConstructor;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeController {

    private final DerivativeService derivativeService;
    private final DerivativeRepository derivativeRepository;

    @GetMapping("/derivative")
    public String derivWaitList(){
        return "logistic_manage/deriv_main";
    }

    @PostMapping("/deirvRegist")
    public String derivWaitInsert(@RequestParam(value = "derivregdate")@DateTimeFormat(pattern="yyyy-MM-dd") Date derivregdate,
                                  @RequestParam(value = "ordersid")  Integer ordersid){
        System.out.println("이건 발주번호" + ordersid + ", 발주날짜 " + derivregdate);
        Testorders ordersId = derivativeService.findByOrdersId(ordersid);
        
        String state = "검수요청";
        
        Testderivative deirvRegist = new Testderivative();
        deirvRegist.setDerivregdate(derivregdate);
        deirvRegist.setDerivstate(state);
        deirvRegist.setOrdersid(ordersId);

        derivativeRepository.save(deirvRegist);

        return "logistic_manage/deriv_main";
    }


}
