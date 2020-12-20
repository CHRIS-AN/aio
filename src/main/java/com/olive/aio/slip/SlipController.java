package com.olive.aio.slip;

import com.olive.aio.slip.form.SlipForm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static com.olive.aio.slip.SlipController.FINANCE;
import static com.olive.aio.slip.SlipController.ROOT;

@Slf4j
@Controller
@RequestMapping(ROOT + FINANCE)
@RequiredArgsConstructor
public class SlipController {


    private final SlipService slipService;
    private final SlipRepository slipRepository;

    static final String ROOT = "/";
    static final String FINANCE = "finance";
    static final String PSTR = "/purchaseSalesTradingRegister";
    static final String SR = "/spendingResolution";
    static final String SM = "/statementManagement";
    static final String WR = "/wageReport";
    static final String IS = "/incomeStatement";
    static final String OA = "/outstandingAuthorization";

    @GetMapping(ROOT)
    private String index() {
        return "index";
    }

    @GetMapping(PSTR)
    private String purchaseSalesTradingRegisterForm(Model model) {
        model.addAttribute(new SlipForm());
        return FINANCE + PSTR;
    }
    @PostMapping(PSTR)
    public String purchaseSalesTradingRegisterSubmit(@Valid Slip slip, Errors errors, Model model) {
        if(errors.hasErrors()) {
            model.addAttribute( "slip",slip);

            Map<String, String> validatorResult = SlipService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));

            }
            return FINANCE + PSTR;
        }
        slipService.saveSlip(slip);
        return "redirect:/";
    }

    //  전표관리 리스트 뽑는 핸들러
    @GetMapping(OA)
    public String outstandingAuthorizationList(Model model) {
        List<Slip> slipList = slipService.listSlip();
        model.addAttribute("slipList", slipList);
        return FINANCE + OA;
    }

    // 전표관리 리스트 해당 상세보기 핸들러
    @GetMapping(OA + "DetailView/{slip_uid}/view")
    public String outstandingAuthorizationView(@PathVariable("slip_uid") Long slip_uid , Model model ) {
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slip_uid);
        slipList.add(slip);
        model.addAttribute("slipList", slipList); // List의 정보를 가져오기.
        return FINANCE + OA + "DetailView";
    }

    // 해당 상세보기 전표 수정 Form
    @GetMapping(OA + "DetailView/{slip_uid}/edit")
    public String updateOutstandingAuthorizationForm(@PathVariable("slip_uid") Long slip_uid, Model model){
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slip_uid);
        slipList.add(slip);
        model.addAttribute("slipList", slipList);
        return FINANCE + PSTR + "Update";
    }


    // 해당 상세보기 전표 수정 Submit
    @PostMapping(OA + "DetailView/{slip_uid}/edit")
    public String updateOutstandingAuthorizationSubmit(SlipForm slipForm ,@PathVariable Long slip_uid, Model model,
                                                       Errors errors,
                                                       RedirectAttributes attributes) {
        if(errors.hasErrors()) {
            return FINANCE + PSTR + "Update";
        }
        System.out.println(slip_uid.toString());
        slipService.updateSlip(slipForm, slip_uid);
        attributes.addFlashAttribute("message", "내용을 수정했습니다.");
        System.out.println("##########리스트 조회###########");
        List<Slip> slipList = slipService.listSlip();
        model.addAttribute("slipList", slipList);
        return "redirect:/finance/"+ OA;
    }


    // 해당 상세보기 전표 삭제
    @PostMapping(OA + "DetailView/delete")
    public String deleteOutstandingAuthorization(SlipForm slipForm, Model model,
                                                    Errors errors, RedirectAttributes attributes) {

        System.out.println(slipForm.toString());
        if(errors.hasErrors()) {
            return FINANCE + PSTR + "DetailView/{slip_uid}/View";
        }
        slipService.deleteSlip(slipForm);
        attributes.addFlashAttribute("message", "내용을 삭제했습니다.");
        return "redirect:/finance/"+ OA;
    }

    // 검색 기능
//    @GetMapping("/search/slip")
//    public String searchSlip(String keyword, Model model,
//                             @PageableDefault(size = 9, sort = "slip_date",
//                                     direction = Sort.Direction.DESC) Pageable pageable) {
//        System.out.println("############################################################");
//        System.out.println("keyword :" + keyword);
//        System.out.println("pageable :" + pageable);
//        Page<Slip> slipPage = slipRepository.findByKeyword(keyword, pageable);
//        System.out.println("1차관문");
//        model.addAttribute("slipPage", slipPage);
//        model.addAttribute("keyword",keyword);
//        model.addAttribute("sortProperty", pageable.getSort().toString().contains("slip_date"));
//        System.out.println("검색한 값이 여기로 들어올 것이다. 2 차");
//        return FINANCE + OA;
//    }


    @GetMapping("/search/slip")
    public String searchSlip(String keyword, Model model) {
        List<Slip> slipList = slipRepository.findByKeyword(keyword);
        return null;
    }

}
