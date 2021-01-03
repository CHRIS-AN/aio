package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "derivative_list")
@Data
public class Derivativelist{

    @Id @Column(name = "deriv_list_id")
    @GeneratedValue
    private Integer derivListid;

    @Column(name = "deriv_ok_confirmcnt", columnDefinition = "Integer default 0")
    private Integer derivokconfirmcnt;

    @ManyToOne
    @JoinColumn(name = "deriv_id")
    @JsonManagedReference
    private Derivative derivativeid;

}
