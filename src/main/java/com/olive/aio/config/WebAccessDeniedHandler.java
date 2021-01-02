package com.olive.aio.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@Component
public class WebAccessDeniedHandler implements AccessDeniedHandler {
// || ((User)authentication.getPrincipal()).getAuthorities().contains(new SimpleGrantedAuthority("ROLE_VIEW"))
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        response.setStatus(HttpStatus.FORBIDDEN.value());

        if(e instanceof AccessDeniedException) {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if(authentication != null) {
                if(((User)authentication.getPrincipal()).getAuthorities().contains(new SimpleGrantedAuthority("ROLE_RETIREE"))) {
                    log.info(">>>>> 로그인 권한이 없는 사용자");
                    request.setAttribute("msg", "로그인 권한이 없는 사용자입니다.");
                    request.setAttribute("nextPage", "/login");
                    response.setStatus(HttpStatus.UNAUTHORIZED.value());
                    SecurityContextHolder.clearContext();
                } else {
                    request.setAttribute("msg", "접근권한이 없는 사용자입니다.");
                    request.setAttribute("nextPage", "/");
                }
            }
        } else {
            log.info(e.getClass().getCanonicalName());
        }
        request.getRequestDispatcher("/err/denied-page").forward(request, response);
    }
}
