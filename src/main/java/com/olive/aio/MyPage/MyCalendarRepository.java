package com.olive.aio.MyPage;

import com.olive.aio.domain.Empl;
import com.olive.aio.domain.MyCalendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Transactional
public interface MyCalendarRepository extends JpaRepository <MyCalendar, Long> {

    int countByEmplAndAttendanceAndCalWorkDateContains(Empl empl, String attendance, String now);

    List<MyCalendar> findByEmpl(Empl empl);

    List<MyCalendar> findByEmplAndCalWorkDateContains(Empl empl, String now);
}
