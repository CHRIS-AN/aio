package com.olive.aio.MyPage;

import com.olive.aio.domain.Empl;
import com.olive.aio.employee.UserEmpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Component
@RequiredArgsConstructor
public class AttendanceInterceptor implements HandlerInterceptor {

    private final MyCalendarRepository myCalendarRepository;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (modelAndView != null && isRedirectView(modelAndView) && authentication != null && authentication.getPrincipal() instanceof UserEmpl) {
            Empl empl = ((UserEmpl) authentication.getPrincipal()).getEmpl();
            checkWorkState(empl);
        }
    }

    private void checkWorkState(Empl empl) {
        String now = LocalDateTime.now().format(DateTimeFormatter.ISO_DATE);
        int count = myCalendarRepository.countByEmplAndAttendanceAndCalWorkDateContains(
                empl, "출근", now);
        empl.setGoWork(empl.isGoWork(count));
        System.out.println("empl gowork: " + empl.isGoWork());
        count = myCalendarRepository.countByEmplAndAttendanceAndCalWorkDateContains(
                empl, "퇴근", now);
        empl.setGoHome(empl.isGoHome(count));
        System.out.println("empl gohome: " + empl.isGoHome());
    }

    private boolean isRedirectView(ModelAndView modelAndView) {
        return modelAndView.getViewName().equals("index") || modelAndView.getView() instanceof RedirectView;
    }
}
