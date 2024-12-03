package com.example.demo.service;


import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dao.TeamDao;
import com.example.demo.dto.Article;
import com.example.demo.dto.Board;
import com.example.demo.dto.Member;
import com.example.demo.dto.Team;


@Service
public class TeamService {
	
	private TeamDao teamDao;
	
	public TeamService(TeamDao teamDao) {

		this.teamDao = teamDao;
	}

	public void joinTeam(String teamName, String region, String slogan, byte[] teamImage, Integer createdBy) {
	    // 팀 이름 중복 체크
	    if (teamDao.getTeamByTeamName(teamName) != null) {
	        throw new RuntimeException("이미 존재하는 팀 이름입니다.");
	    }

	    // 팀 가입
	    teamDao.joinTeam(teamName, region, slogan, teamImage, createdBy);
	}


	public Team getTeamByTeamName(String teamName) {
		return teamDao.getTeamByTeamName(teamName);
	}

	public List<Team> getTeamsByCreatedBy(Integer createdBy) {
	    return teamDao.getTeamsByCreatedBy(createdBy);
	}


	public boolean hasTeam(int memberId) {
	    return teamDao.countTeamByMemberId(memberId) > 0;
	}

	
}
