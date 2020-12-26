package com.olive.aio.MyPage;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.CurrentEmpl;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class MyPageRestController {

    private final MyPageService myPageService;
    private final ObjectMapper objectMapper;

    @PostMapping("/mypage/mycalendar")
    public String loadMyCalendar(@CurrentEmpl Empl empl, Model model) throws JsonProcessingException {
        model.addAttribute(empl);
        List<Map> jsonList =  myPageService.loadCalendarAll(empl);
        return objectMapper.writeValueAsString(jsonList);
    }
}
