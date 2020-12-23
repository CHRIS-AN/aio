package com.olive.aio.excel;


import com.olive.aio.domain.Slip;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
@RequiredArgsConstructor
public class ExcelService {

    private final ExcelRepository repository;
}
