package com.olive.aio.slip;

import com.olive.aio.domain.Empl;
import com.olive.aio.domain.PayStatement;
import com.olive.aio.domain.RegisterSlip;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


@Entity
@Getter @Setter @EqualsAndHashCode(of = "id")
@Builder @AllArgsConstructor @NoArgsConstructor
public class Slip {

    // 자동 생성 전략
    @Id @GeneratedValue
    private Long slip_uid; // 전표 고유번호

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date slip_date;

    private String tradingType;

    @Column(nullable = false, length = 20)
    private String slip_write; // 전표 작성자

    private String slip_code; // 계정코드

    @Column(nullable = false , length = 40)
    private String corp; // 거래처

    @Column(nullable = false)
    private int slip_account; // 전표 금액

    private int slip_vat; //부가세 10%

    @Column(nullable = false, length = 40)
    private String slip_summary; // 적요

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private RegisterSlip slip_type;  // 4가지 타입을 catg 분류하기


    private int account_uid; // Fk 계정과목

    @Lob
    private String slip_comment; // 전표 첨언내용

    @Enumerated(EnumType.STRING)
    private PayStatement slip_ok; // 전표 결제승인

    @ManyToMany
    private Set<Empl> managers = new HashSet<>(); // 회원중 관리자

    @ManyToMany
    private Set<Empl> users = new HashSet<>(); // 회원중 유저




}
