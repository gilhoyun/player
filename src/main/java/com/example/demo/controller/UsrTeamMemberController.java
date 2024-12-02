package com.example.demo.controller;

import java.text.Format;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;
import com.example.demo.dto.Reply;
import com.example.demo.dto.ResultData;
import com.example.demo.dto.Rq;
import com.example.demo.service.ArticleService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.TeamMemberService;
import com.example.demo.service.TeamService;
import com.example.demo.util.Util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Builder.Default;

@Controller
public class UsrTeamMemberController {

	private TeamMemberService teamMemberService;
	
	public UsrTeamMemberController(TeamMemberService teamMemberService) {
		this.teamMemberService = teamMemberService;
	}

	
}
