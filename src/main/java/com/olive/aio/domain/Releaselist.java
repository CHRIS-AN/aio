package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "relea_list")
@Data
public class Releaselist {

    @Id @Column(name = "relea_list_id")
    @GeneratedValue
    private Integer relealistid;

    @Column(name = "relea_ok_confirmcnt", columnDefinition = "Integer default 0")
    private Integer releaokconfirmcnt;

    @ManyToOne
    @JoinColumn(name = "relea_id")
    @JsonManagedReference
    private Release releaseid;

}
