package com.olive.aio.corp;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public class Corp {

    @Id
    private String corp_id;

    private String corp_name;
    private String corp_address;
    private int corp_call;
    private String corp_ceo;

}
