package com.olive.aio.draft;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.minjong.Product;
import com.olive.aio.orders.Orders;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Data
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

    @ManyToOne
    @JsonManagedReference
    Product product;

    @ManyToOne
    @JsonBackReference
    Orders orders;

}
