package com.olive.aio.domain.test;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Testdraft {

    @Id @GeneratedValue
    Integer draftseq;

    Integer draftcnt;

    Integer draftprodprice;

    String prod;

    @ManyToOne
    @JoinColumn(name = "testordersid")
    Testorders testordersid;
}
