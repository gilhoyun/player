package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // 생성자 생성도 자동
public class UsrHomeController {
	
	@GetMapping("/usr/home/main")
	@ResponseBody
	public String shoeMain() {
		return "안녕하세요1";
	}
}
