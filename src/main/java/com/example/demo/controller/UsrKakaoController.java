package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import com.example.demo.service.MemberService;

@Controller
public class UsrKakaoController {

	 private MemberService memberService;

	 @Value("${kakao.client_id}")
	    private String client_id;

	  @Value("${kakao.redirect_uri}")
	  private String redirect_uri;
	
	public UsrKakaoController(MemberService memberService) {
	    this.memberService = memberService;
	}

	

}
