package com.olive.aio.accounting;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class AccountingController {

    @GetMapping("")
    private String newPurchaseSalesTradingRegisterForm() {
        return null;
    }

    @PostMapping("")
    private String newPurchaseSalesTradingRegisterSubmit() {
        return  null;

    }
}
