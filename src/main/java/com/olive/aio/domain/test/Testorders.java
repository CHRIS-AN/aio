package com.olive.aio.domain.test;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import java.util.Date;

@Entity
@Data
public class Testorders {

    @Id @GeneratedValue
    Integer testordersid;

    Integer testorderscnt;

    Date testordersregdate;

    String testordersstate;

    Integer testorderstotsum;

    String testtitle;

    String crop;

}
