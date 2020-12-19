package com.olive.aio.employee.form;

import lombok.Data;

import javax.persistence.Column;
import javax.validation.constraints.*;

@Data
public class EmplUpdateForm {

    @NotBlank
    @Min(2) @Max(8)
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣]{2,8}$")
    private String name;

    @NotBlank(message = "주민등록번호는 필수 입력 값 입니다.")
    @Min(12) @Max(12)
    private String jumin;

    @NotBlank
    private String address;

    @NotNull
    @Min(4) @Max(4)
    private Integer post_num;

    @NotBlank
    @Min(10) @Max(11)
    private String phone;

    @NotBlank
    private String dept;

    private String photo;

    @NotBlank
    private String email;

    @NotBlank
    private String work_state  = "재직";

    @Column(name = "empl_resigdate")
    private String emplResigdate;
}
