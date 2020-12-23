package com.olive.aio.slip.form;

import com.olive.aio.domain.PayStatement;
import com.olive.aio.slip.Slip;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotBlank;


@Data
@NoArgsConstructor
public class SlipForm extends Slip {

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String tradingType; // 거래 타입

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_write; // 전표 작성자

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_date; // 전표 작성 일자

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_code; // 계정 과목

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String corp; // 거래처


    private Integer slip_account; // 전표 금액

    private Integer slip_vat; // 부가세

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    @Length(max = 40)
    private String slip_summary; // 적요

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String paymentType; // 결제 방법법

    @Enumerated(EnumType.STRING)
    private PayStatement slip_ok;




}
