package com.olive.aio.slip.form;

import com.olive.aio.domain.RegisterSlip;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.time.LocalDateTime;

@Data
public class SlipForm {

    private String tradingType; // 거래 타입

    private String slip_write; // 전표 작성자

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDateTime slip_date; // 전표 작성 일자

    private String slip_code;

    private String corp; // 거래처

    private int slip_account; // 전표 금액

    private int slip_vat = slip_account/10; // 부가세

    private String slip_summary; // 적요

    private String paymentType; // 결제 방법법


}
