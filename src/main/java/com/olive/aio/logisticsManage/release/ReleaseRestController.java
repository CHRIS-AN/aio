package com.olive.aio.logisticsManage.release;

import com.olive.aio.domain.Derivative;
import com.olive.aio.domain.Release;
import com.olive.aio.domain.Requestdummy;
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
public class ReleaseRestController {

    private final ReleaseService releaseService;

    // 출고요청리스트
    @GetMapping("/getReqList/{requestid}")
    public Requestdummy reqList(@PathVariable Integer requestid){ return releaseService.reqList(requestid); }

    // 출고리스트
    @GetMapping("/getReleaList/{releaid}")
    public Release releaList(@PathVariable Integer releaid){ return releaseService.releaList(releaid); }

}
