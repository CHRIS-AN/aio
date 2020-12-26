package com.olive.aio.slip.form;

import com.olive.aio.domain.Slip;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.Date;


@Data
@NoArgsConstructor
public class SlipForm extends Slip {

    @NotBlank(message="전표 타입을 선택해주세요.")
    private String tradingType; // 거래 타입

    @NotBlank(message="작성자를 입력해주세요.")
    private String slipWrite; // 전표 작성자

    @NotBlank(message="날짜 입력란이 비어있습니다.")
    private String slipDate; // 전표 작성 일자

    @NotBlank(message="계정코드를 선택해주세요.")
    private String slipCode; // 계정코드

    @NotBlank(message="거래처를 선택해주세요.")
    private String corp; // 거래처

    @NotBlank(message="금액란이 비어있습니다. 다시 입력해주세요.")
    private String slip_account; // 전표 금액

    @NotBlank(message="수수료, 부가세 등 추가적으로 나간 금액을 입력해주세요.")
    private String slip_vat; // 부가세

    @NotBlank(message="적요를 간략하게 적어주세요.")
    @Length(max = 40)
    private String slip_summary; // 적요

    @NotBlank(message="결제타입을 선택해주세요.")
    private String paymentType; // 결제 방법법

    // 결제 !
    private String payStatementntType = "대기"; // 전표 결제승인

}
