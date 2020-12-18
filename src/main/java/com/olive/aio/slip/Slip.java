package com.olive.aio.slip;

import com.olive.aio.domain.Empl;
import com.olive.aio.domain.PayStatement;
import com.olive.aio.domain.RegisterSlip;
import lombok.*;
import org.springframework.web.bind.annotation.PostMapping;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.HashSet;
import java.util.Set;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "id")
@Builder @AllArgsConstructor @NoArgsConstructor
@ToString
public class Slip {

    // 자동 생성 전략
    @Id
    @GeneratedValue
    @Column(name = "slip_uid")
    private Long slipId; // 전표 고유번호

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_date;

    private String tradingType; // 매입/매출 거래

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_write; // 전표 작성자

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_code; // 계정코드

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String corp; // 거래처

    @NotNull(message="이 값은 비어있을 수 없습니다!!")
    private Integer slip_account; // 전표 금액

    @NotNull(message="이 값은 비어있을 수 없습니다!!")
    private Integer slip_vat; //부가세 10%

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String slip_summary; // 적요

    @NotBlank(message="이 값은 비어있을 수 없습니다!!")
    private String paymentType; // 결제 방법


//    @Enumerated(EnumType.STRING)
//    private RegisterSlip slip_type;  // 4가지 타입을 catg 분류하기


    //private int account_uid; // Fk 계정과목

//    @Lob
//    private String slip_comment; // 전표 첨언내용

    @Enumerated(EnumType.STRING)
    private PayStatement slip_ok; // 전표 결제승인

    @ManyToMany
    private Set<Empl> managers = new HashSet<>(); // 회원중 관리자

    @ManyToMany
    private Set<Empl> users = new HashSet<>(); // 회원중 유저
}
