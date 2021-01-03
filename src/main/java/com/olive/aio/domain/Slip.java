package com.olive.aio.domain;

import com.olive.aio.corp.Corp;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "id")
@Builder @AllArgsConstructor @NoArgsConstructor
@SequenceGenerator(name = "ORDERS_SEQ_GENERATOR", sequenceName = "ORDERS_SEQ", initialValue = 10, allocationSize = 1)
@ToString
public class Slip {

    // 자동 생성 전략
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CORP_SEQ_GENERATOR")
    private Long slipId; // 전표 고유번호

    @NotBlank(message="날짜 입력란이 비어있습니다.")
    private String slipDate;

    @NotBlank(message="전표 타입을 선택해주세요.")
    private String tradingType; // 매입/매출 거래

    @NotBlank(message="작성자를 입력해주세요.")
    private String slipWrite; // 전표 작성자

    @NotBlank(message="계정코드를 선택해주세요.")
    private String slipCode; // 계정코드

    @NotBlank(message="거래처를 선택해주세요.")
    private String corp;

    @NotBlank(message="금액란이 비어있습니다. 다시 입력해주세요.")
    private String slip_account; // 전표 금액

    @NotBlank(message="거래 금액을 입력해주시면, 자동적으로 입력이 됩니다.")
    private String slip_vat; //부가세 10%

    @NotBlank(message="적요를 간략하게 적어주세요.")
    private String slip_summary; // 적요

    @NotBlank(message="결제수단을 선택해주세요.")
    private String paymentType; // 결제 방법
    // 결제 !
    private String payStatementntType = "대기"; // 전표 결제승인
}
