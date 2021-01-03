package com.olive.aio.product;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.corp.Corp;
import com.olive.aio.domain.Empl;
import com.olive.aio.draft.Draft;
import lombok.*;

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
@SequenceGenerator(name = "PROD_SEQ_GENERATOR", sequenceName = "PROD_SEQ", initialValue = 16, allocationSize = 1)
@Table(name = "PROD")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PROD_SEQ_GENERATOR")
    private long prod_id;

    @NotNull(message = "값을 비울 수 없습니다.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣-a-zA-Z0-9_:,.' ']{1,50}$", message = "유효한 값을 넣어주세요.")
    private String prodName;

    @NotNull(message = "값을 비울 수 없습니다.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String prod_bundle;

    @NotNull(message = "값을 비울 수 없습니다.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String sell_price;

    @NotNull(message = "값을 비울 수 없습니다.")
    @Pattern(regexp = "^[0-9]{1,10}$", message = "유효한 값을 넣어주세요.")
    private String buy_price;

    @NotNull(message = "값을 비울 수 없습니다.")
    @Pattern(regexp = "^^[ㄱ-ㅎ가-힣-a-zA-Z0-9_:,.' ']{1,10}$", message = "유효한 값을 넣어주세요.")
    private String prod_catag;

    @Lob
    private String prod_explain;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    @JsonBackReference
    private Set<Draft> draftseq = new HashSet<>();

    @Lob
    private String prod_image;

    @ManyToOne
    Empl empl;

    @ManyToOne
    @JoinColumn(name = "corp_id")
    @JsonManagedReference
    Corp corp;

}
