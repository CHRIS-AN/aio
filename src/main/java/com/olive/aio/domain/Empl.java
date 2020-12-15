package com.olive.aio.domain;

import lombok.*;
import org.hibernate.annotations.LazyToOne;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "empl_id")
@NoArgsConstructor @AllArgsConstructor
public class Empl {

    @Id
    private String empl_id;

    @NotBlank
    private String name;

    @NotBlank
    private String birth;

    @NotBlank
    private String address;

    @NotBlank
    private Integer post_num;

    @NotBlank
    private String phone;

    @NotBlank
    private String dept;

    @NotBlank
    private String pw;

    @NotBlank @Lob @Basic(fetch = FetchType.EAGER)
    private String photo;

    @NotBlank
    private String email;

    @NotBlank
    private String empl_jumin;

    @NotBlank
    private String work_state;

    @NotBlank
    private String empl_regdate;

    @NotBlank
    private String empl_resigdate;

}
