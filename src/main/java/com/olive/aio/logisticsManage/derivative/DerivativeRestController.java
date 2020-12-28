package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.test.Testorders;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeRestController {

    private final DerivativeService derivativeService;


    @GetMapping("/derivWait")
    public List<Testorders> derivWaitList(){

        String target = "결제완료";

        return derivativeService.findByOdersState(target);
    }

    @GetMapping("/{state}")
    public List<Derivative> derivList(@PathVariable String state){

        String target = "";
        List<Derivative> derivList = new ArrayList<>();

        if(state.equals("derivChk")){
            target = "검수요청";
            derivList = derivativeService.findByDerivstateA(target);
        } else if(state.equals("deirvOk")){
            target = "입고완료";
            derivList = derivativeService.findByDerivstateD(target);
        }

        return derivList;
    }




}
