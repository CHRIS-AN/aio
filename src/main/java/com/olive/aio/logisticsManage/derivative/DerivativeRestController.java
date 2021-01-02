package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeRestController {

    private final DerivativeService derivativeService;

    // 입고리스트
    @GetMapping("/getDerivList/{derivid}")
    public Derivative derivChkList(@PathVariable Integer derivid){ return derivativeService.derivChkList(derivid); }

}
