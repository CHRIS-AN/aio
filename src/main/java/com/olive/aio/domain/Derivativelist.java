package com.olive.aio.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Data
public class Derivativelist implements Serializable {

    @OneToOne @Id
    private Derivative derivid;

    @NotNull @Column(name = "deriv_ok_confirmcnt")
    private Integer derivokconfirmcnt;

    @NotNull @Column(name = "deriv_ok_confirmdate")
    private LocalDateTime derivokconfirmdate;

    @NotNull @Column(name = "deriv_ok_confirmtotcnt")
    private Integer derivokconfirmtotcnt;

}
