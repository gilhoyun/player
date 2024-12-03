package com.example.demo.dto;

import java.io.IOException;

import com.example.demo.service.TeamService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

public class Rq {

    @Getter
    private int loginedMemberId;

    private HttpServletResponse resp;
    private HttpSession session;
    private TeamService teamService; // TeamService 추가

    public Rq(HttpServletRequest req, HttpServletResponse resp, TeamService teamService) {
        this.session = req.getSession();
        this.teamService = teamService; // TeamService 주입

        int loginedMemberId = -1;

        if (this.session.getAttribute("loginedMemberId") != null) {
            loginedMemberId = (int) this.session.getAttribute("loginedMemberId");
        }

        this.loginedMemberId = loginedMemberId;
        this.resp = resp;
    }

    public void jsPrintReplace(String msg, String uri) {
        resp.setContentType("text/html; charset=UTF-8;");

        try {
            resp.getWriter().append(Util.jsReturn(msg, uri));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void login(int loginedMemberId) {
        this.session.setAttribute("loginedMemberId", loginedMemberId);
    }

    public void logout() {
        this.session.removeAttribute("loginedMemberId");
    }

    // 사용자가 팀을 생성했는지 여부 확인
    public boolean hasTeam() {
        if (this.loginedMemberId == -1) {
            return false; // 로그인이 안 된 경우 false 반환
        }
        return teamService.hasTeam(this.loginedMemberId);
    }
}
