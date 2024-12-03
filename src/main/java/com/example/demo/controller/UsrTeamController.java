package com.example.demo.controller;

import java.io.IOException;
import java.text.Format;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;
import com.example.demo.dto.Member;
import com.example.demo.dto.Reply;
import com.example.demo.dto.ResultData;
import com.example.demo.dto.Rq;
import com.example.demo.dto.Team;
import com.example.demo.service.ArticleService;
import com.example.demo.service.ReplyService;
import com.example.demo.service.TeamService;
import com.example.demo.util.Util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Builder.Default;

@Controller
public class UsrTeamController {

	private TeamService teamService;

	public UsrTeamController(TeamService teamService) {
		this.teamService = teamService;
	}

	@GetMapping("/usr/team/createTeam") // 대소문자 수정
	public String createTeam() { // 메서드 이름도 카멜 케이스로 수정
	    return "usr/team/CreateTeam";
	}

	@PostMapping("/usr/team/doCreateTeam")
	@ResponseBody
	public String doCreateTeam(String teamName, String region, String slogan, @RequestParam("teamImage") MultipartFile teamImage, HttpServletRequest req) {
		
		Rq rq = (Rq) req.getAttribute("rq");
	    try {
	        // MultipartFile을 byte[]로 변환
	        byte[] teamImageBytes = teamImage.getBytes();

	        // 세션에서 로그인한 사용자의 ID 가져오기
	        Integer createdBy = (Integer) rq.getLoginedMemberId();  // "memberId"는 세션에 저장된 사용자 ID

	        if (createdBy == null) {
	            return Util.jsReturn("로그인 정보가 없습니다.", null);
	        }

	        // 팀 가입 서비스 호출
	        teamService.joinTeam(teamName, region, slogan, teamImageBytes, createdBy);
	    } catch (IOException e) {
	        return Util.jsReturn("파일 업로드 실패", null);
	    }

	    return Util.jsReturn(String.format("%s팀의 창단을 환영합니다~", teamName), "/");
	}
	
	@GetMapping("/usr/team/teamDupChk")
	@ResponseBody
	public ResultData loginIdDupChk(String teamName) {
		
		Team team = teamService.getTeamByTeamName(teamName);
		
		if (team != null) {
			return ResultData.from("F-1", String.format("[ %s ]은(는) 이미 사용중인 팀명입니다", teamName));
		}
		
		return ResultData.from("S-1", String.format("[ %s ]은(는) 사용가능한 팀명입니다", teamName));
	}
	
	
	@GetMapping("/usr/team/myTeam")
	public String myTeam(HttpServletRequest req, Model model) {
	    // 로그인한 사용자 정보 가져오기
	    Rq rq = (Rq) req.getAttribute("rq");

	    Integer createdBy = rq.getLoginedMemberId();

	    // 로그인 정보가 없으면 처리
	    if (createdBy == null) {
	        return Util.jsReturn("로그인 정보가 없습니다.", "/usr/member/login");
	    }

	    // 사용자가 생성한 팀 목록 가져오기
	    List<Team> teams = teamService.getTeamsByCreatedBy(createdBy);

	    // 모델에 팀 정보 추가
	    model.addAttribute("teams", teams);

	    // myTeam 페이지로 이동
	    return "usr/team/myTeam";
	}
}
