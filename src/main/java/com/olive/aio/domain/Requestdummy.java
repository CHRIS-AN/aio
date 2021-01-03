package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.corp.Corp;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Request_dummy")
@Data @EqualsAndHashCode(of = "requestid")
public class Requestdummy {

    @Id @GeneratedValue
    @Column(name = "request_id")
    private Integer requestid;

    @Column(name = "request_totcnt")
    private Integer requesttotcnt;

    @Column(name = "request_regdate")
    private String requestregdate;

    @Column(name = "request_state")
    private String requeststate;

    @Column(name = "store_name")
    private String storename;

    @Lob
    private String reason;

    @OneToOne
    @JoinColumn(name = "relea_id")
    private Release releaseid;

    @OneToMany(mappedBy = "reqdummyid", fetch = FetchType.EAGER)
    @OrderBy("reqdummylistid asc")
    @JsonManagedReference
    private Set<Requestdummylist> dummyLists = new HashSet<>();

}
