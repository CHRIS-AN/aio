package com.olive.aio.logisticsManage.release;


import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Empl;
import com.olive.aio.domain.Release;
import com.olive.aio.domain.Requestdummy;
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

;

@Controller
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class ReleaseController {

    private final ReleaseService releaseService;


    @GetMapping("/release")
    public String requestList(@CurrentEmpl Empl empl, Model model){

        viewList(model);
        model.addAttribute("nowEmpl", empl);

        return "logistic_manage/release_main";
    }

    @PostMapping("/releaRegist")
    public String derivConfirmUpdate(@CurrentEmpl Empl empl, Model model, @ModelAttribute ConfirmCntR confirmCntR, Release release) throws Exception{

        String state = release.getReleastate();
        int requestId = release.getRequestid().getRequestid();

        if(state.equals("출고대기")){
            releaseService.saveReleaWait(confirmCntR, release, requestId);
            releaseService.updateReqState(requestId, state);
        } else if(state.equals("출고요청거절")){
            releaseService.updateReqState(requestId, state);
        }

        viewList(model);
        model.addAttribute("nowEmpl", empl);

        return "redirect:/logistics/release";
    }

    @PostMapping("/releaOk")
    public String releaOkInsert(@CurrentEmpl Empl empl,Model model, Release release){

        String state = release.getReleastate();

        Release releaOk = releaseService.insertReleaOk(release);

        int requestId= releaOk.getRequestid().getRequestid();
        releaseService.updateReqState(requestId, state);

        viewList(model);
        model.addAttribute("nowEmpl", empl);

        return "redirect:/logistics/release";
    }





    // ======= 중복코드 메소드 ======
    private void viewList(Model model) {
        String requestState = "출고요청";
        List<Requestdummy> requestList = releaseService.findByRequestState(requestState);
        List<String> reqestTitleList = releaseService.makeReqestTitleList(requestState);
        Map<Requestdummy, String> reqestListInTitle = new HashMap<>();

        for (int i = 0 ; i < requestList.size() ;i++){
            for (int j = 0 ; j < reqestTitleList.size() ;j++) {
                if(i == j) {
                    reqestListInTitle.put(requestList.get(i), reqestTitleList.get(j));
                }
            }
        }

        String releaChk = "출고대기";
        List<Release> releaWaitList = releaseService.findByReleastateA(releaChk);

        String releaOk = "출고완료";
        List<Release> releaOkList = releaseService.findByReleastateD(releaOk);

        model.addAttribute("requestList", reqestListInTitle);
        model.addAttribute("releaWaitList", releaWaitList);
        model.addAttribute("releaOkList", releaOkList);
    }

}
