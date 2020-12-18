package com.olive.aio.employee.form;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class EmplUpdateForm {

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

    private MultipartFile photo;

    @NotBlank
    private String email;

    @NotBlank
    private String work_state  = "재직";

    @Column(name = "empl_resigdate")
    private String emplResigdate;
}
