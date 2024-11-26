package com.example.demo.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.dto.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Rq rq = new Rq(request, response);//객체화(요청을 넣어야함(생성자에 요청이 있기때문),컨트롤러한테 도달하기전에 객체 생성)
		
		request.setAttribute("rq", rq);//요청에 다시 세팅(request)// 이거 덕분에 어떤 코드에서든 사용가능하게 해준다.
		
		return HandlerInterceptor.super.preHandle(request, response, handler);//정상, 비정상 판단(true,false)
	}

}
