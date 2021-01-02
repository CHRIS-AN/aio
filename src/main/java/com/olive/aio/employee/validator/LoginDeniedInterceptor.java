package com.olive.aio.employee.validator;

import com.olive.aio.MyPage.MyCalendarRepository;
import com.olive.aio.config.WebAccessDeniedHandler;
import com.olive.aio.domain.Empl;
import com.olive.aio.employee.UserEmpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
@RequiredArgsConstructor
public class LoginDeniedInterceptor implements HandlerInterceptor {

    private final MyCalendarRepository myCalendarRepository;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (modelAndView != null && authentication != null && authentication.getPrincipal() instanceof UserEmpl) {
            Empl empl = ((UserEmpl) authentication.getPrincipal()).getEmpl();
            if (empl.getWork_state() != null && empl.getWork_state().equals("퇴사")) {
                AccessDeniedHandler accessDeniedHandler = new WebAccessDeniedHandler();
                accessDeniedHandler.handle(request, response, new AccessDeniedException(empl.getEmplId()));
            }
        }
    }

    private boolean isRedirectView(ModelAndView modelAndView) {
        return modelAndView.getViewName().equals("index") || modelAndView.getView() instanceof RedirectView;
    }
}
