package com.olive.aio.employee.form;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.*;

@Data
public class EmplForm {

    @Id
    @NotBlank(message = "사원 아이디를 입력해주세요.")
    private String emplId;

    @NotBlank(message = "이름은 필수입니다.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣]{2,8}$", message = "한글 2~8자만 입력해주세요.")
    private String name;

    @NotBlank(message = "주민등록번호는 필수입니다.")
    @Pattern(regexp = "\\d{2}([0]\\d|[1][0-2])([0][1-9]|[1-2]\\d|[3][0-1])[-]*[1-4]\\d{6}", message = "알맞는 주민번호를 입력해주세요")
    private String jumin;

    @NotBlank(message = "주소는 필수입니다.")
    private String address;

    @NotNull(message = "주소는 필수입니다.")
    private Integer post_num;

    @NotBlank
    @Pattern(regexp = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$", message = "형식에 맞게 다시 입력해주세요.")
    private String phone;

    @NotBlank
    private String dept;

    private String password;

    @NotBlank(message = "이미지는 필수입니다.")
    private String photo;

    @NotBlank(message = "이메일을 입력해주세요")
    @Pattern(regexp = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$", message = "유효한 이메일이 아닙니다.")
    private String email;

    private String work_state  = "재직";

    @Column(name = "empl_regdate")
    @NotBlank(message = "입사 일자를 선택해주세요")
    private String emplRegdate;

    @Column(name = "empl_resigdate")
    private String emplResigdate;

}
