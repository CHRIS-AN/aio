package com.olive.aio.corp;

import com.olive.aio.domain.Empl;
import com.olive.aio.domain.Slip;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CORP")
public class Corp {

    @Id
    @GeneratedValue
    private long corp_id; // 거래처 고유번호

    @Column(name = "CORP_NAME")
    @NotNull(message = "상호를 입력해주세요.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣-a-zA-Z0-9_:,.' ']{1,100}$", message = "유효한 상호명을 넣어주세요.")
    private String corpName; // 거래처명

    @NotNull(message = "주소를 입력해주세요.")
    private String corp_address; //주소

    @NotNull(message="전화번호를 입력해주세요.")
    @Pattern(regexp="^[0-9]{5,11}$", message="올바른 전화번호를 입력해주세요.")
    private String corp_call; //연락처

    @NotNull(message = "대표자를 입력해주세요.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-Z]{2,30}$", message = "유효한 대표자명을 작성해주세요.")
    private String corp_ceo; //대표자

    @NotNull(message = "사업자등록번호를 입력해주세요.")
    @Pattern(regexp = "^[0-9]{10,30}$", message = "유효한 번호를 작성해주세요.")
    private String corp_num; //사업자 등록번호


    @ManyToOne
    Empl empl;


}
