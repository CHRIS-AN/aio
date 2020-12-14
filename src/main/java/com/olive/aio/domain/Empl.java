package com.olive.aio.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Empl {

    @Id @GeneratedValue
    private String id;
}
