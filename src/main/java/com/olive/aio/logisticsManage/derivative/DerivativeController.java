package com.olive.aio.logisticsManage.derivative;


import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Derivativelist;
import com.olive.aio.domain.Empl;
import com.olive.aio.domain.test.Testorders;
import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.logisticsManage.derivative.form.TestderivInsertForm;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;


@Controller
@RequiredArgsConstructor
    @RequestMapping("/logistics")
public class DerivativeController {

    private final DerivativeService derivativeService;


    @GetMapping("/derivative")
    public String derivWaitList(@CurrentEmpl Empl empl, Model model){

        viewList(model);
        model.addAttribute("nowEmpl", empl);

        return "logistic_manage/deriv_main";
    }

    @PostMapping("/deirvRegist")
    public String derivWaitInsert(@CurrentEmpl Empl empl,Model model, Derivative derivative){

        String state = "검수요청";
        derivative.setDerivstate(state);

        derivativeService.saveDerivChk(derivative);

        Integer odersid = derivative.getOrdersid().getTestordersid();

        derivativeService.updateOdersState(odersid, state);

        viewList(model);
        model.addAttribute("empl", empl);

        return "redirect:/logistics/derivative";
    }

    @PostMapping("/deirvConfirm")
    public String derivConfirmUpdate(@CurrentEmpl Empl empl, Model model, @ModelAttribute ConfirmCnt confirmCnt, Derivative derivative) throws Exception{

        String state = derivative.getDerivstate();
        derivativeService.derivOkSave(confirmCnt, derivative, state);

        Integer odersid = derivative.getOrdersid().getTestordersid();
        derivativeService.updateOdersState(odersid, state);

        viewList(model);
        model.addAttribute("empl", empl);

        return "redirect:/logistics/derivative";
    }


    // ======= 중복코드 메소드 ======
    private void viewList(Model model) {
        String derivWait = "결제완료";
        List<Testorders> derivWaitList = derivativeService.findByOdersState(derivWait);

        String derivChk = "검수요청";
        List<Derivative> derivChkList = derivativeService.findByDerivstateA(derivChk);

        String derivOk = "입고완료";
        List<Derivative> derivOkList = derivativeService.findByDerivstateD(derivOk);

        model.addAttribute("derivWaitList", derivWaitList);
        model.addAttribute("derivChkList", derivChkList);
        model.addAttribute("derivOkList", derivOkList);
    }

}
