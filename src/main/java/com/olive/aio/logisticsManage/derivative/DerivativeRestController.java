package com.olive.aio.logisticsManage.derivative;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Derivativelist;
import com.olive.aio.domain.test.Testorders;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;


@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/logistics")
public class DerivativeRestController {

    private final DerivativeService derivativeService;
    private final ObjectMapper objectMapper;

    // 검수요청 리스트
    @GetMapping("/derivChk/{derivid}")
    public Derivative derivChkList(@PathVariable Integer derivid){
        return derivativeService.derivChkList(derivid);
    }
    
    // 입고확정 리스트
    @GetMapping("/derivOk/{derivid}")
    public Derivative derivOkList(@PathVariable Integer derivid){
        return derivativeService.derivChkList(derivid);
    }


}
