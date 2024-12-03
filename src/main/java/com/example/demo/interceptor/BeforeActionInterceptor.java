package com.example.demo.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.dto.Rq;
import com.example.demo.service.TeamService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {

    private final TeamService teamService;

    // TeamService를 의존성으로 주입
    public BeforeActionInterceptor(TeamService teamService) {
        this.teamService = teamService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // TeamService를 포함하여 Rq 객체 생성
        Rq rq = new Rq(request, response, teamService);

        // Rq 객체를 요청에 설정하여 어디서든 사용 가능하게 함
        request.setAttribute("rq", rq);

        // 정상 동작으로 계속 진행
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
