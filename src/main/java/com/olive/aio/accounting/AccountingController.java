package com.olive.aio.accounting;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/finance")
@RequiredArgsConstructor
public class AccountingController {

    @GetMapping("/")
    private String newPurchaseSalesTradingRegisterForm() {

        return "index";
    }

    @GetMapping("/wageReport")
    private String newPurchaseSalesTradingRegisterSubmit() {

        return "finance/wageReport";

    }
}
