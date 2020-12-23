package com.olive.aio.excel;


import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class CosmaticExcel {

    private final String slip_code; // 계정과목(코드)

    private final String slip_account; // 계정 금액

}
