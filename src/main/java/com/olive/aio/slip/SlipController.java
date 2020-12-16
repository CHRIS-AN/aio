package com.olive.aio.slip;

import com.olive.aio.slip.form.SlipForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

import static com.olive.aio.slip.SlipController.FINANCE;
import static com.olive.aio.slip.SlipController.ROOT;

@Controller
@RequestMapping(ROOT + FINANCE)
@RequiredArgsConstructor
public class SlipController {

    private final SlipService slipService;
    private final ModelMapper modelMapper;

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

    @GetMapping(WR)
    private String wageReportForm() {
        return FINANCE + WR;
    }



    @GetMapping(PSTR)
    private String purchaseSalesTradingRegisterForm(@PathVariable String path, Model model) {
        model.addAttribute(new SlipForm());
        return FINANCE + PSTR;
    }

    @PostMapping(PSTR)
    public String purchaseSalesTradingRegisterSubmit(
            @Valid SlipForm slipForm, Errors errors, Model model
    ) {

        if(errors.hasErrors()) {
            return FINANCE + PSTR;
        }
        Slip newSlip = SlipService.createNewSlip(modelMapper.map(slipForm, Slip.class));
        return FINANCE + PSTR;
    }



    @GetMapping(SR)
    private String spendingResolutionForm() {
        return FINANCE + SR;
    }
    @GetMapping(SM)
    private String statementManagementForm() {
        return FINANCE + SM;
    }
    @GetMapping(IS)
    private String incomeStatementForm() {
        return FINANCE + IS;
    }
    @GetMapping(OA)
    private String outstandingAuthorizationForm() { return  FINANCE + OA; }
}
