package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.product.Product;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "request_dummy_list")
@Data
public class Requestdummylist {

    @Id @GeneratedValue
    @Column(name = "req_list_id")
    private Integer reqdummylistid;

    @Column(name = "req_list_cnt")
    private Integer requestcnt;

    @ManyToOne
    @JoinColumn(name = "prod_id")
    @JsonManagedReference
    private Product prodid;

    @ManyToOne
    @JoinColumn(name = "request_id")
    @JsonBackReference
    private Requestdummy reqdummyid;

}
