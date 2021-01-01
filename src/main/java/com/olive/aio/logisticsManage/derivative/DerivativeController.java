package com.olive.aio.logisticsManage.derivative;


import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Empl;;
import com.olive.aio.employee.CurrentEmpl;
import com.olive.aio.orders.Orders;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;


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
        Long ordersid = derivative.getOrdersid().getOrdersid();

        derivativeService.saveDerivChk(derivative, ordersid, state);

        derivativeService.updateOdersState(ordersid, state);

        viewList(model);
        model.addAttribute("empl", empl);

        return "redirect:/logistics/derivative";
    }

    @PostMapping("/deirvConfirm")
    public String derivConfirmUpdate(@CurrentEmpl Empl empl, Model model, @ModelAttribute ConfirmCnt confirmCnt, Derivative derivative) throws Exception{

        String state = derivative.getDerivstate();
        derivativeService.derivOkSave(confirmCnt, derivative, state);

        long ordersid = derivative.getOrdersid().getOrdersid();
        derivativeService.updateOdersState(ordersid, state);

        viewList(model);
        model.addAttribute("empl", empl);

        return "redirect:/logistics/derivative";
    }


    // ======= 중복코드 메소드 ======
    private void viewList(Model model) {
        String derivWait = "결제완료";
        List<Orders> derivWaitList = derivativeService.findByOdersState(derivWait);
        List<String> derivTitleList = derivativeService.makeDerivTitleList(derivWait);
        Map<Orders, String> derivWaitListInTitle = new HashMap<>();

        for (int i = 0 ; i < derivWaitList.size() ;i++){
            for (int j = 0 ; j < derivTitleList.size() ;j++) {
                if(i == j) {
                    derivWaitListInTitle.put(derivWaitList.get(i), derivTitleList.get(j));
                }
            }
        }
        System.out.println("헐??" + derivWaitListInTitle.toString() + ", 몇개" + derivWaitListInTitle.size());

        String derivChk = "검수요청";
        List<Derivative> derivChkList = derivativeService.findByDerivstateA(derivChk);

        String derivOk = "입고완료";
        List<Derivative> derivOkList = derivativeService.findByDerivstateD(derivOk);

//        model.addAttribute("derivWaitList", derivWaitList);
        model.addAttribute("derivWaitList", derivWaitListInTitle);
        model.addAttribute("derivChkList", derivChkList);
        model.addAttribute("derivOkList", derivOkList);
    }

}
