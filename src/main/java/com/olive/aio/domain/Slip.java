package com.olive.aio.domain;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;


@Entity
@Getter @Setter @EqualsAndHashCode(of = "id")
@Builder @AllArgsConstructor @NoArgsConstructor
public class Slip {

    @Id @GeneratedValue
    private Long slip_uid; // 전표 고유번호

    @ManyToMany
    private Set<Empl> managers = new HashSet<>(); // 회원중 관리자

    @ManyToMany
    private Set<Empl> users = new HashSet<>(); // 회원중 유저

    private String slip_write; // 전표 작성자

    private Integer slip_account; // 전표 금액

    private String slip_summary; // 적요

    private LocalDateTime slip_type;

    private String corp;





}
