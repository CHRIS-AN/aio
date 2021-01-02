package com.olive.aio.employee.form;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.*;

@Data
public class EmplForm {

    @Id
    @NotBlank
    private String emplId;

    @NotBlank(message = "이름은 필수입니다.")
    @Length(min = 2, max = 8)
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣]{2,8}$", message = "한글 2~8자만 입력해주세요.")
    private String name;

    @NotBlank(message = "주민등록번호는 필수 입력 값 입니다.")
    @Length(min = 14, max = 14)
    private String jumin;

    @NotBlank(message = "주소는 필수입니다.")
    private String address;

    @NotNull
    private Integer post_num;

    @NotBlank
    @Length(min = 12, max = 13)
    private String phone;

    @NotBlank
    private String dept;

    private String password;

    private String photo;

    @NotBlank
    private String email;

    @NotBlank
    private String work_state  = "재직";

    @Column(name = "empl_regdate")
    @NotBlank
    private String emplRegdate;

    @Column(name = "empl_resigdate")
    private String emplResigdate;

}
