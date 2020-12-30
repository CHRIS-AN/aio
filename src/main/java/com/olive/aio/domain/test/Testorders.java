package com.olive.aio.domain.test;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.olive.aio.draft.Draft;
import lombok.*;
import org.springframework.ui.ModelMapExtensionsKt;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Testorders {

    @Id @GeneratedValue
    private Integer testordersid;

    private Integer testorderscnt;

    private Date testordersregdate;

    private String testordersstate;

    private Integer testorderstotsum;

    private String testtitle;

    private String crop;

//    @OneToMany(mappedBy = "testordersid", cascade = CascadeType.PERSIST)
    @OneToMany(mappedBy = "testordersid", fetch = FetchType.EAGER)
    @JsonManagedReference
    private Set<Draft> draftseq = new HashSet<>();

}
