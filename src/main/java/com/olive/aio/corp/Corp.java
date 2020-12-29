package com.olive.aio.corp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Corp {

    @Id
    @GeneratedValue
    private long corp_id; // 거래처 고유번호

    @NotBlank(message = "상호를 입력해주세요.")
//    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-Z]", message = "유효한 기업명을 작성해주세요.")
    private String corp_name; // 거래처명

    @NotBlank(message = "주소를 입력해주세요.")
    private String corp_address; //주소

    @NotBlank(message="전화번호를 입력해주세요.")
//    @Pattern(regexp="^(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message="올바른 전화번호를 입력해주세요.")
    private String corp_call; //연락처

    @NotBlank(message = "대표자를 입력해주세요.")
//    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-Z]{2,30}", message = "유효한 값을 작성해주세요.")
    private String corp_ceo; //대표자

    @NotBlank(message = "사업자등록번호를 입력해주세요.")
//    @Pattern(regexp = "^[1-9]{10,30}", message = "유효한 값을 작성해주세요.")
    private String corp_num; //사업자 등록번호



}
