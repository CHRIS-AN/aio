package com.olive.aio.domain;

import lombok.*;
import org.hibernate.annotations.LazyToOne;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "emplId")
@NoArgsConstructor @AllArgsConstructor
public class Empl {

    @Id
    private String emplId;


    private String name;


    private String jumin;


    private String address;


    private Integer post_num;


    private String phone;


    private String dept;


    private String password;

    @Lob @Basic(fetch = FetchType.EAGER)
    private String photo;


    private String email;


    private String empl_jumin;

    private String work_state = "재직";

    private String emplRegdate;

    private String emplResigdate;

    private String attendance = "퇴근";

    private boolean goWork = false;

    private boolean goHome = false;

    @OneToMany(mappedBy = "empl", fetch = FetchType.EAGER)
    private Set<MyCalendar> myCalendar = new HashSet<>();

    public boolean isGoWork(int cnt) {
        if(cnt == 0){

            return false;
        }
        return true;
    }

    public boolean isGoHome(int cnt) {
        if(cnt == 0){
            return false;
        }
        return true;
    }

    public void addMyCalendar(MyCalendar calendar) {
        calendar.setEmpl(this);
        calendar.setAttendance(getAttendance());
        calendar.setNow();
        myCalendar.add(calendar);
    }

}
