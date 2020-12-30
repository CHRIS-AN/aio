package com.olive.aio.slip;

import com.olive.aio.corp.Corp;
import com.olive.aio.corp.CorpService;
import com.olive.aio.domain.Empl;
import com.olive.aio.domain.Slip;
import com.olive.aio.employee.CurrentEmpl;
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

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.olive.aio.slip.SlipController.FINANCE;
import static com.olive.aio.slip.SlipController.ROOT;

@Slf4j
@Controller
@RequestMapping(ROOT + FINANCE)
@RequiredArgsConstructor
public class SlipController {


    private final SlipService slipService;
    private final SlipRepository slipRepository;
    private final CorpService corpService;

    static final String ROOT = "/";
    static final String FINANCE = "finance";
    static final String PSTR = "/purchaseSalesTradingRegister";
    static final String SM = "/statementManagement";
    static final String OA = "/outstandingAuthorization";


    @GetMapping(PSTR)
    private String purchaseSalesTradingRegisterForm(@CurrentEmpl Empl empl, Model model, Corp corp) {
        List<Corp> corpList = corpService.findAll(corp);
        model.addAttribute(new SlipForm());
        model.addAttribute("empl", empl);
        model.addAttribute("corpList", corpList);
        return FINANCE + PSTR;
    }

    @PostMapping(PSTR)
    public String purchaseSalesTradingRegisterSubmit(@CurrentEmpl Empl empl,
                                                     @Valid Slip slip,
                                                     Errors errors,
                                                     Model model, Corp corp) {
        try{
            List<Corp> corpList = corpService.findAll(corp);
            System.out.println(slip.toString());
            if (errors.hasErrors()) {
                System.out.println("2번리턴?");

                if(slip.getSlipCode().equals("계정과목을 선택해주세요.")){
                    model.addAttribute("valid_slipCode", "전표타입을 선택하신 다음, 다시 계정과목을 선택해주세요.");
                }
                model.addAttribute("empl", empl);
                model.addAttribute("slip", slip);
                model.addAttribute("corpList", corpList);
                Map<String, String> validatorResult = SlipService.validateHandling(errors);
                for (String key : validatorResult.keySet()) {
                    model.addAttribute(key, validatorResult.get(key));
                }
                return FINANCE + PSTR;
            }
            slip.setCorp(corp.getCorp_name());
            slipService.saveSlip(slip);
            model.addAttribute("empl", empl);
            return "redirect:/finance" + OA;
        }catch (NullPointerException e){
            e.printStackTrace();
            return FINANCE + PSTR;
        }
    }

    //  승인 요청대기 리스트 뽑는 핸들러
    @GetMapping(OA)
    public String outstandingAuthorizationList(@CurrentEmpl Empl empl,
                                               @PageableDefault(size = 5, page = 0, sort = "slipId",
                                                       direction = Sort.Direction.DESC) Pageable pageable,
                                               Model model, String keyword) {

        Page<Slip> slipList = slipRepository.findByKeywordAndPayStatementType(pageable);
        model.addAttribute("empl", empl);
        model.addAttribute("keyword", keyword);
        model.addAttribute("slipList", slipList);
        return "thymeleaf/searchList" + OA;
    }

    // 승인 요청대기 리스트 해당 상세보기 핸들러
    @GetMapping(OA + "DetailView/{slipId}")
    public String outstandingAuthorizationView(@CurrentEmpl Empl empl, @PathVariable Long slipId, Model model) {
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slipId);
        slipList.add(slip);
        model.addAttribute("empl", empl);
        model.addAttribute("slipList", slipList); // List의 정보를 가져오기.
        model.addAttribute("title", "승인 대기 전표 상세보기");
        return "finance" + OA + "DetailView";
    }


    // 해당 상세보기 전표 수정 Form
    @GetMapping(OA + "DetailView/{slipId}/edit")
    public String updateOutstandingAuthorizationForm(@CurrentEmpl Empl empl,  Corp corp,
                                                     @PathVariable("slipId") Long slipId, Model model) {
        List<Corp> corpList = corpService.findAll(corp);
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slipId);
        slipList.add(slip);
        model.addAttribute("empl", empl);
        model.addAttribute("slipList", slipList);
        model.addAttribute("corpList", corpList);
        model.addAttribute("title", "전표 수정");

        System.out.println("전표 폼 데이터를 던져 주기.");
        return FINANCE + PSTR + "Update";
    }

    // 해당 상세보기 전표 수정 Submit
    @PostMapping(OA + "DetailView/{slipId}/edit")
    public String updateOutstandingAuthorizationSubmit(@CurrentEmpl Empl empl,
                                                       @Valid SlipForm slipForm,
                                                       Errors errors,
                                                       @PathVariable Long slipId,
                                                       Model model,
                                                       Corp corp,
                                                       RedirectAttributes attributes) {
        List<Corp> corpList = corpService.findAll(corp);
        System.out.println(slipForm.toString());
            if (errors.hasErrors()) {
                List<SlipForm> slipList = new ArrayList<>();
                slipList.add(slipForm);
                model.addAttribute("empl", empl);
                model.addAttribute("corpList", corpList);
                model.addAttribute("slipList", slipList);
                model.addAttribute("title", "전표 수정");
                Map<String, String> validatorResult = SlipService.validateHandling(errors);
                for (String key : validatorResult.keySet()) {
                    model.addAttribute(key, validatorResult.get(key));
                }
                return FINANCE + PSTR + "Update";
            }
        slipService.updateSlip(slipForm, slipId, corp);
        attributes.addFlashAttribute("message", "내용을 수정했습니다.");
        List<Slip> slipList = slipService.listSlip();
        model.addAttribute("empl", empl);
        model.addAttribute("slipList", slipList);
        return "redirect:/finance" + OA + "DetailView/" + slipId;
    }

    // 해당 승인대기 전표 상세보기 전표 삭제
    @PostMapping(OA + "DetailView/delete")
    public String deleteOutstandingAuthorization(@CurrentEmpl Empl empl, SlipForm slipForm, Model model,
                                                 Errors errors, Long slipId, RedirectAttributes attributes) {

        System.out.println(slipForm.toString());
        System.out.println("slipId : " + slipId);
        if (errors.hasErrors()) {
            return FINANCE + PSTR + "DetailView/{slipId}/View";
        }
        slipService.deleteSlip(slipId);
        attributes.addFlashAttribute("message", "내용을 삭제했습니다.");
        model.addAttribute("empl", empl);

        return "redirect:/finance" + OA;
    }

    // 해당 전표 상세보기 전표 삭제
    @PostMapping(SM + "DetailView/delete")
    public String deleteStatementManagement(@CurrentEmpl Empl empl, SlipForm slipForm, Model model,
                                                 Errors errors, Long slipId, RedirectAttributes attributes) {

        System.out.println(slipForm.toString());
        System.out.println("slipId : " + slipId);
        if (errors.hasErrors()) {
            return FINANCE + PSTR + "DetailView/{slipId}/View";
        }
        slipService.deleteSlip(slipId);
        attributes.addFlashAttribute("message", "내용을 삭제했습니다.");
        model.addAttribute("empl", empl);

        return "redirect:/finance" + SM + "/list";
    }

    // 승인대기list Search
    @GetMapping("/search/slip")
    public String outstandingSearchSlip(@CurrentEmpl Empl empl,
                                        @PageableDefault(size = 5, page = 0, sort = "slipId", direction = Sort.Direction.DESC)
                                     Pageable pageable, String keyword, Model model) {

        if (keyword.equals("null") || keyword.isEmpty() || keyword.isBlank() || keyword == "" || keyword == "null") {
            keyword = "";
        }
        Page<Slip> slipList = slipRepository.findByKeywordAndPayStatementType(keyword, pageable);
        model.addAttribute("empl", empl);
        model.addAttribute("slipList", slipList);
        model.addAttribute("keyword", keyword);
        return "thymeleaf/searchList" + OA;
    }


    // 전표관리 Search(?)
    @GetMapping("/search/slipmanagement")
    public String slipSearchSlip(@CurrentEmpl Empl empl,
                                 @PageableDefault(size = 5, page = 0, sort = "slipId", direction = Sort.Direction.DESC)
                                     Pageable pageable, String keyword, Model model) {

        if (keyword.equals("null") || keyword.isEmpty() || keyword.isBlank() || keyword == "" || keyword == "null") {
            keyword = "";
        }
        Page<Slip> slipList = slipRepository.findByKeywordAndPayStatementType(keyword, pageable, "승인");
        model.addAttribute("empl", empl);
        model.addAttribute("slipList", slipList);
        model.addAttribute("keyword", keyword);
        System.out.println("page" + pageable.toString());
        return "thymeleaf/searchList" + SM +"Search";
    }
    // 승인대기 결제 승인
    @GetMapping("/slipPayment/approve")
    public String paymentApprove(@CurrentEmpl Empl empl,
                                 Long slipId, Model model, String keyword) throws Exception {

        Slip slipReject = slipService.paymentApprove(slipId);
        if (keyword.equals("null")) {
            keyword = "";
        }
        keyword = URLEncoder.encode(keyword, "UTF-8");
        return "redirect:/finance/search/slip?keyword=" + keyword;
    }

    // 승인결제 거절
    @GetMapping("/slipPayment/reject")
    public String paymentReject(@CurrentEmpl Empl empl,
                                Long slipId, Model model, String keyword) throws Exception {

        System.out.println(" keyword " + keyword);
        Slip slipReject = slipService.paymentRemove(slipId);
        if (keyword.equals("null")) {
            keyword = "";
        }
        keyword = URLEncoder.encode(keyword, "UTF-8");
        return "redirect:/finance/search/slip?keyword=" + keyword;
    }

    //  전표관리 섹션.  statementManagement.html
    @GetMapping(SM + "/list")
    public String slipList(@CurrentEmpl Empl empl,
                           @PageableDefault(size = 5, page = 0, sort = "slipDate", direction = Sort.Direction.DESC)
                                   Pageable pageable, Model model, String keyword, Integer months) {
        System.out.println("months : " + months);
        if (months == null || months.equals("null")) {
            months = 0;
            // 오늘 날짜 전표를 볼 수 있게 표시를 해줍니다.
            model.addAttribute("todaySlip", "오늘 날짜 전표입니다.");
        }
        if (keyword == null || keyword.equals("null")) {
            keyword = "";
        }

        model.addAttribute("empl", empl);
        model.addAttribute("keyword", keyword);
        model.addAttribute("months", months);

        if (months != null) {
            Date now = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(now);
            cal.add(Calendar.MONTH, -months);

            String nowDate = new SimpleDateFormat("yyyy-MM-dd").format(now);
            String searchDate = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());

            Page<Slip> slipStatementManagement = slipRepository.findByPayStatementntTypeAndSlipDateBetweenAndSlipWriteContaining
                    ("승인", searchDate, nowDate, keyword, pageable);
            model.addAttribute("empl", empl);
            model.addAttribute("slipList", slipStatementManagement);
            model.addAttribute("nowDate", nowDate);
            model.addAttribute("searchDate", searchDate);
        } else {
            Page<Slip> slipStatementManagement = slipRepository.findByKeywordAndPayStatementType(keyword, pageable);
            model.addAttribute("empl", empl);
            model.addAttribute("slipList", slipStatementManagement);
        }

        model.addAttribute("empl", empl);
        return "thymeleaf/searchList" + SM;
    }

    // 전표 관리 상세보기
    @GetMapping(SM + "/{slipId}")
    public String viewStatementManagement(@CurrentEmpl Empl empl,
                                          @PathVariable Long slipId, Model model) {
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slipId);
        slipList.add(slip);
        model.addAttribute("empl", empl);
        model.addAttribute("slipList", slipList);
        model.addAttribute("title", "전표 상세보기");
        return "finance" + OA + "DetailView";
    }
}
