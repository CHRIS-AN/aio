package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Data
public class Derivativelist{

    @Id @Column(name = "deriv_list_id")
    @GeneratedValue
    private Integer derivListid;

    @Column(name = "deriv_ok_confirmcnt", columnDefinition = "Integer default 0")
    private Integer derivokconfirmcnt;

    @ManyToOne
    @JoinColumn(name = "deriv_id")
    @JsonBackReference
    private Derivative derivativeid;

}
