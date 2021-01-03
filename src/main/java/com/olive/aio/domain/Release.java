package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data @EqualsAndHashCode(of = "releaid")
public class Release {

    @Id @GeneratedValue
    @Column(name = "relea_id")
    private Integer releaid;

    @Column(name = "relea_regdate")
    private String relearegdate;

    @Column(name = "relea_state")
    private String releastate;

    @Column(name = "relea_title")
    private String releatitle;

    @Column(name = "relea_ok_totcnt")
    private Integer releaOktotcnt;

    @Column(name = "relea_ok_confirmdate")
    private String releaokconfirmdate;

    @ManyToOne
    @JoinColumn(name = "empl_id")
    @JsonManagedReference
    private Empl emplid;

    @OneToOne
    @JoinColumn(name = "request_id")
    private Requestdummy requestid;

    @OneToMany(mappedBy = "releaseid", fetch = FetchType.EAGER)
    @OrderBy("relealistid asc")
    @JsonManagedReference
    private Set<Releaselist> releaselists = new HashSet<>();
}
