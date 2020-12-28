package com.olive.aio.domain;

//import com.olive.aio.domain.Orders;
import com.olive.aio.domain.test.Testorders;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "DERIVATIVE_TABLE")
@Data
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

    @Column(name = "deriv_totcnt")
    private Integer derivtotcnt;

    @ManyToOne
    @JoinColumn(name = "empl_id")
    private Empl emplid;

    @OneToOne
    @JoinColumn(name = "orders_id")
    private Testorders ordersid;

}
