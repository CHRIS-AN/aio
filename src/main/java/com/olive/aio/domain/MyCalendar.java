package com.olive.aio.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "id")
@Builder @AllArgsConstructor @NoArgsConstructor
public class MyCalendar {

    @Id @GeneratedValue
    private Long Id;

    @JsonBackReference
    @ManyToOne
    private Empl empl;

    private String calWorkDate;

    private String attendance;

    public void setNow() {
        calWorkDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
    }

}
