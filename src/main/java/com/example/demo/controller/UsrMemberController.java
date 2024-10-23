package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Member;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

@Controller
public class UsrMemberController {

	private MemberService memberService;

	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;

	}

	@GetMapping("/usr/member/doJoin")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String loginPwChk, String name) {
		
		if (Util.isEmpty(loginId)) {
			return "아이디를 입력해주세요";
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member != null) {
			return loginId + "은(는) 이미 사용중인 아이디입니다";
		}
		
		if (Util.isEmpty(loginPw)) {
			return "비밀번호를 입력해주세요";
		}
		if (Util.isEmpty(name)) {
			return "이름을 입력해주세요";
		}
		
		if (loginPw.equals(loginPwChk) == false) {
			return "비밀번호가 일치하지 않습니다";
		}
		
		memberService.joinMember(loginId, loginPw, name);
		
		int id = memberService.getLastInsertId();
		
		return memberService.getMemberById(id);
	}
}
