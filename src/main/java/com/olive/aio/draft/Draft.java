package com.olive.aio.draft;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.minjong.Product;
import com.olive.aio.orders.Orders;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Pattern;

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

    @Pattern(regexp = "^[0-9]{1,10}$", message = "수량을 입력해주세요.")
    private String draft_cnt; //물품수량

    private String draft_prod_price; //물품가격

    @ManyToOne
    @JsonManagedReference
    Product product;

    @ManyToOne
    @JsonBackReference
    Orders orders;

}

