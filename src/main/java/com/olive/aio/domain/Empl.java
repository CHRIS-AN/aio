package com.olive.aio.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.LazyToOne;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Getter @Setter
public class Empl {

    @Id @GeneratedValue
    private String id;

}
