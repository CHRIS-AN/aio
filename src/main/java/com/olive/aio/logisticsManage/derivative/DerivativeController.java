package com.olive.aio.logisticsManage.derivative;


import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.test.Testorders;
import com.olive.aio.logisticsManage.derivative.form.TestderivInsertForm;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeController {

    private final DerivativeService derivativeService;


    @GetMapping("/derivative")
    public String derivWaitList(Model model){

        String derivWait = "결제완료";
        List<Testorders> derivWaitList = derivativeService.findByOdersState(derivWait);

        String derivChk = "검수요청";
        List<Derivative> derivChkList = derivativeService.findByDerivstateA(derivChk);

        String derivOk = "입고완료";
        List<Derivative> derivOkList = derivativeService.findByDerivstateD(derivOk);

        model.addAttribute("derivWaitList", derivWaitList);
        model.addAttribute("derivChkList", derivChkList);
        model.addAttribute("derivOkList", derivOkList);

//        model.addAttribute(new TestderivInsertForm());

        return "logistic_manage/deriv_main";
    }

    @PostMapping("/deirvRegist")
    public String derivWaitInsert(Derivative derivative){

        String state = "검수요청";
        derivative.setDerivstate(state);

        derivativeService.saveDerivChk(derivative);

        Integer odersid = derivative.getOrdersid().getTestordersid();
        System.out.println(odersid);

        derivativeService.updateOdersState(odersid, state);

        return "logistic_manage/deriv_main";
    }


}
