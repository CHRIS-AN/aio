package com.olive.aio.minjong;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "PROD")
public class Product {
    @Id
    @GeneratedValue
    private long prod_id;

    @NotBlank(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-Z0-9_-]{1,30}$", message = "유효한 값을 넣어주세요.")
    private String prodName;

    //@Column(updatable = false)  //update의 경우 제외하는 속성
    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String prod_bundle;

    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String sell_price;

    //@Column(insertable = false,
    //        updatable = false,
    //        columnDefinition = "date default sysdate")  //null이 아니라 default 설정을 추가해서 반영
    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String buy_price;

    //@Column(insertable = false,
    //        updatable = false,
    //        columnDefinition = "number default 0")
    @NotBlank(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-zA-Z0-9_-]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String prod_catag;

    @Lob
    private String prod_explain;
}