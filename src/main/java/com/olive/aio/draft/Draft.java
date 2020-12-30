package com.olive.aio.draft;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.olive.aio.domain.test.Testorders;
import com.olive.aio.minjong.Product;
import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "draft_seq")
public class Draft {

    @Id
    @GeneratedValue
    private Long draft_seq; //물품순서

    //    @NotBlank
//    @Pattern(regexp = "^[0-9]{1,10}$")
    private int draft_cnt; //물품수량

    //    @NotBlank
//    @Pattern(regexp = "^[0-9]{1,50}$")
    private int draft_prod_price; //물품가격

//    @ManyToOne(fetch = FetchType.LAZY)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "prod_id")
    @JsonManagedReference
    private Product product;

//    @ManyToOne(fetch = FetchType.LAZY)
    @ManyToOne
    @JoinColumn(name = "testordersid")
    @JsonBackReference
    private Testorders testordersid;

}