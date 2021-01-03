package com.olive.aio.logisticsManage.derivative;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Derivativelist;
import com.olive.aio.orders.Orders;
import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeRestController {

    private final DerivativeService derivativeService;
    

    // 발주리스트
    @GetMapping("/getOrdersList/{ordersid}")
    public Orders ordersList(@PathVariable Long ordersid){ return derivativeService.ordersList(ordersid); }
    
    // 입고리스트
    @GetMapping("/getDerivList/{derivid}")
    public Derivative derivChkList(@PathVariable Integer derivid){ return derivativeService.derivChkList(derivid); }

    // 입고완료리스트
    @GetMapping("/getDerivOkList/{derivid}")
    public List<Derivativelist> derivOkList(@PathVariable Integer derivid){ return derivativeService.derivOkList(derivid); }

}
