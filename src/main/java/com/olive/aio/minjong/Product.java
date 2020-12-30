package com.olive.aio.minjong;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.domain.Derivativelist;
import com.olive.aio.draft.Draft;
import lombok.*;

import com.olive.aio.corp.Corp;
import com.olive.aio.domain.Empl;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.HashSet;
import java.util.Set;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "PROD")
public class Product {
    @Id
    @GeneratedValue
    private long prod_id;

    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣-a-zA-Z0-9_:,.' ']{1,100}$", message = "유효한 값을 넣어주세요.")
    private String prodName;

    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String prod_bundle;

    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String sell_price;

    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String buy_price;

    @NotNull(message = "유효한 값을 넣어주세요.")
    @Pattern(regexp = "^^[ㄱ-ㅎ가-힣-a-zA-Z0-9_:,.' ']{1,100}$", message = "유효한 값을 넣어주세요.")
    private String prod_catag;

    @Lob
    private String prod_explain;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    @JsonBackReference
    private Set<Draft> draftseq = new HashSet<>();

    @Lob
    private String prod_image;


    @NotNull
    @ManyToOne
    Empl empl;

    @ManyToOne
    Corp corp;

}
