package com.olive.aio.employee.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class EmplForm {

    @Id
    @NotBlank
    private String emplId;

    @NotBlank
    private String name;

    @NotBlank(message = "주민등록번호는 필수 입력 값 입니다.")
    private String jumin;

    @NotBlank
    private String address;

    @NotNull
    private Integer post_num;

    @NotBlank
    private String phone;

    @NotBlank
    private String dept;

    private String password;

    private MultipartFile photo;

    @NotBlank
    private String email;

    @NotBlank
    private String work_state  = "재직";

    @Column(name = "empl_regdate")
    private String emplRegdate;

    @Column(name = "empl_resigdate")
    private String emplResigdate;

}
