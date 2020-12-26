package com.olive.aio.slip;

import com.olive.aio.domain.Slip;
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

    static final String ROOT = "/";
    static final String FINANCE = "finance";
    static final String PSTR = "/purchaseSalesTradingRegister";
    static final String SM = "/statementManagement";
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
        if (errors.hasErrors()) {
            model.addAttribute("slip", slip);

            Map<String, String> validatorResult = SlipService.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
                log.info(key);
            }
            return FINANCE + PSTR;
        }
        slipService.saveSlip(slip);
        return "index";
    }

    //  전표관리 리스트 뽑는 핸들러
    @GetMapping(OA)
    public String outstandingAuthorizationList(@PageableDefault(size = 5, page = 0, sort = "slipId",
            direction = Sort.Direction.DESC) Pageable pageable,
                                               Model model, String keyword) {
        Page<Slip> slipList = slipRepository.findByKeywordAndPayStatementType(pageable);
        model.addAttribute("slipList", slipList);
        return "thymeleaf/searchList" + OA;
    }

    // 전표관리 리스트 해당 상세보기 핸들러
    @GetMapping(OA + "DetailView/{slipId}")
    public String outstandingAuthorizationView(@PathVariable Long slipId, Model model) {
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slipId);
        slipList.add(slip);
        model.addAttribute("slipList", slipList); // List의 정보를 가져오기.
        return "finance" + OA + "DetailView";
    }

    // 해당 상세보기 전표 수정 Form
    @GetMapping(OA + "DetailView/{slipId}/edit")
    public String updateOutstandingAuthorizationForm(@PathVariable("slipId") Long slipId, Model model) {
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slipId);
        slipList.add(slip);
        model.addAttribute("slipList", slipList);
        return FINANCE + PSTR + "Update";
    }

    // 해당 상세보기 전표 수정 Submit
    @PostMapping(OA + "DetailView/{slipId}/edit")
    public String updateOutstandingAuthorizationSubmit(SlipForm slipForm, @PathVariable Long slipId, Model model,
                                                       Errors errors,
                                                       RedirectAttributes attributes) {
        if (errors.hasErrors()) {
            return FINANCE + PSTR + "Update";
        }
        slipService.updateSlip(slipForm, slipId);
        attributes.addFlashAttribute("message", "내용을 수정했습니다.");
        List<Slip> slipList = slipService.listSlip();
        model.addAttribute("slipList", slipList);
        return "redirect:/finance" + OA;
    }

    // 해당 상세보기 전표 삭제
    @PostMapping(OA + "DetailView/delete")
    public String deleteOutstandingAuthorization(SlipForm slipForm, Model model,
                                                 Errors errors, RedirectAttributes attributes) {

        System.out.println(slipForm.toString());
        if (errors.hasErrors()) {
            return FINANCE + PSTR + "DetailView/{slipId}/View";
        }
        slipService.deleteSlip(slipForm);
        attributes.addFlashAttribute("message", "내용을 삭제했습니다.");
        return "redirect:/finance" + OA;
    }

    @GetMapping("/search/slip")
    public String outstandingSearchSlip(@PageableDefault(size = 5, page = 0, sort = "slipId", direction = Sort.Direction.DESC)
                                     Pageable pageable, String keyword, Model model) {

        if (keyword.equals("null") || keyword.isEmpty() || keyword.isBlank() || keyword == "" || keyword == "null") {
            keyword = "";
        }
        Page<Slip> slipList = slipRepository.findByKeywordAndPayStatementType(keyword, pageable);
        model.addAttribute("slipList", slipList);
        model.addAttribute("keyword", keyword);
        return "thymeleaf/searchList" + OA;
    }


    // 전표관리 Search.
    @GetMapping("/search/slipmanagement")
    public String slipSearchSlip(@PageableDefault(size = 5, page = 0, sort = "slipId", direction = Sort.Direction.DESC)
                                     Pageable pageable, String keyword, Model model) {

        if (keyword.equals("null") || keyword.isEmpty() || keyword.isBlank() || keyword == "" || keyword == "null") {
            keyword = "";
        }
        Page<Slip> slipList = slipRepository.findByKeywordAndPayStatementType(keyword, pageable);
        model.addAttribute("slipList", slipList);
        model.addAttribute("keyword", keyword);
        return "thymeleaf/searchList" + SM;
    }




    // 승인대기 결제 승인
    @GetMapping("/slipPayment/approve")
    public String paymentApprove(Long slipId, Model model, String keyword) throws Exception {

        Slip slipReject = slipService.paymentApprove(slipId);
        if (keyword.equals("null")) {
            keyword = "";
        }
        keyword = URLEncoder.encode(keyword, "UTF-8");
        return "redirect:/finance/search/slip?keyword=" + keyword;
    }

    // 승인결제 거절
    @GetMapping("/slipPayment/reject")
    public String paymentReject(Long slipId, Model model, String keyword) throws Exception {

        System.out.println(" keyword " + keyword);
        Slip slipReject = slipService.paymentRemove(slipId);
        if (keyword.equals("null")) {
            keyword = "";
        }
        keyword = URLEncoder.encode(keyword, "UTF-8");
        return "redirect:/finance/search/slip?keyword=" + keyword;
    }

    //  전표관리 섹션.  statementManagement.html
    @GetMapping("/statementManagement/list")
    public String slipList(@PageableDefault(size = 5, page = 0, sort = "slipDate", direction = Sort.Direction.DESC)
                                   Pageable pageable, Model model, String keyword, Integer months) {
        System.out.println("months : " + months);
        if (months == null || months.equals("null")) {
            months = 0;
        }
        if (keyword == null || keyword.equals("null")) {
            keyword = "";
        }

        model.addAttribute("keyword", keyword);

        if (months != null) {
            Date now = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(now);
            cal.add(Calendar.MONTH, -months);

            Page<Slip> slipStatementManagement = slipRepository.findByPayStatementntTypeAndSlipDateBetweenAndSlipWriteContaining
                    ("승인", new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()),
                            new SimpleDateFormat("yyyy-MM-dd").format(now), keyword, pageable);
            model.addAttribute("slipList", slipStatementManagement);
        } else {
            Page<Slip> slipStatementManagement = slipRepository.findByKeywordAndPayStatementType(keyword, pageable);
            model.addAttribute("slipList", slipStatementManagement);
        }

        return "thymeleaf/searchList" + SM;
    }


    // 전표관리 수정 Form
    @GetMapping(SM + "/edit")
    public String updateStatementManagementForm(@PathVariable("slipId") String slipId, Model model) {
        List<Slip> slipList = new ArrayList<>();
        Slip slip = slipService.viewSlip(slipId);
        slipList.add(slip);
        model.addAttribute("slipList", slipList);
        return FINANCE + PSTR + "Update";
    }

    // 전표관리 수정 Submit
    @PostMapping(SM + "DetailView/{slipId}/edit")
    public String updateStatementManagementSubmit(SlipForm slipForm, @PathVariable String slipId, Model model,
                                                  Errors errors,
                                                  RedirectAttributes attributes) {
        if (errors.hasErrors()) {
            return FINANCE + PSTR + "Update";
        }
        slipService.updateSlip(slipForm, slipId);
        attributes.addFlashAttribute("message", "내용을 수정했습니다.");
        List<Slip> slipList = slipService.listSlip();
        model.addAttribute("slipList", slipList);
        return "redirect:/finance" + OA;
    }
}
