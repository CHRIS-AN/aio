package com.olive.aio.order;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Data
@Entity
public class Draft {

    @Id
    @GeneratedValue
    private String draft_seq; //물품순서
    private String draft_cnt; //물품수량
    private String draft_prod_price; //물품가격

}
