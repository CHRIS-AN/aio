package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.domain.test.Testorders;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "DERIVATIVE_TABLE")
@Data @EqualsAndHashCode(of = "derivid")
public class Derivative {

    @Id @Column(name = "deriv_id")
    @GeneratedValue
    private Integer derivid;

    @NotNull
    @Column(name = "deriv_regdate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date derivregdate;

    @NotBlank
    @Column(name = "deriv_state")
    private String derivstate;

    @Column(name = "deriv_ok_confirmtotcnt")
    private Integer derivokconfirmtotcnt;

    @Column(name = "deriv_ok_confirmdate")
    private String derivokconfirmdate;

    @ManyToOne
    @JoinColumn(name = "empl_id")
    private Empl emplid;

    @OneToOne
    @JoinColumn(name = "orders_id")
    private Testorders ordersid;

    @OneToMany(mappedBy = "derivativeid", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<Derivativelist> derivlistid = new HashSet<>();

}