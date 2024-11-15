package com.example.demo.dto;

import java.io.IOException;

import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

public class Rq {
	
	@Getter
	private int loginedMemberId;
	
	private HttpServletResponse resp;
	
	public Rq(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		
		int loginedMemberId = -1;
		
		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
		}
		
		this.loginedMemberId = loginedMemberId;
		this.resp = resp;
	}

	public void jsPrintReplace(String msg, String uri) {
		resp.setContentType("text/html; charset=UTF-8;");//response를 이용한 화면 그리기(spring없이 순수한 자바로 웹을 개발할 때 필요한 응답 방식)
		
		try {
			resp.getWriter().append(Util.jsReplace(msg, uri));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
