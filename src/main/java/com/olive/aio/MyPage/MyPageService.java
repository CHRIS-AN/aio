package com.olive.aio.MyPage;

import com.olive.aio.domain.Empl;
import com.olive.aio.domain.MyCalendar;
import com.olive.aio.employee.EmplRepository;
import com.olive.aio.employee.form.EmplUpdateForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class MyPageService {

    private final EmplRepository emplRepository;
    private final ModelMapper modelMapper;
    private final MyCalendarRepository myCalendarRepository;
    private final PasswordEncoder passwordEncoder;

    public void updateMyInfo(Empl empl, EmplUpdateForm myInfoForm) {
        modelMapper.map(myInfoForm, empl);
        emplRepository.save(empl);
    }

    public List<Map> loadCalendarAll(Empl empl) {
        List<Map> jsonList = new ArrayList<>();

        List<MyCalendar> calList = myCalendarRepository.findByEmpl(empl);
        calList.forEach(cal -> {
            Map<String, String> jsonMap = new HashMap<>();
            jsonMap.put("title", cal.getAttendance());
            jsonMap.put("start", cal.getCalWorkDate());
            jsonList.add(jsonMap);
        });

        return jsonList;
    }

    public void newPw(Empl empl, String newPw) {
        empl.setPassword(passwordEncoder.encode(newPw));
        emplRepository.save(empl);
    }
}
