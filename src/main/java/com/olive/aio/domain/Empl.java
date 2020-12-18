package com.olive.aio.domain;

import lombok.*;
import org.hibernate.annotations.LazyToOne;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "empl_id")
@NoArgsConstructor @AllArgsConstructor
public class Empl {

    @Id
    @Column(name = "empl_id")
    private String emplId;


    private String name;


    private String jumin;


    private String address;


    private Integer post_num;


    private String phone;


    private String dept;


    private String password;

    @Lob @Basic(fetch = FetchType.EAGER)
    private String photo;


    private String email;


    private String empl_jumin;


    private String work_state = "재직";

    @Column(name = "empl_regdate")
    private String emplRegdate;

    @Column(name = "empl_resigdate")
    private String emplResigdate;

}
