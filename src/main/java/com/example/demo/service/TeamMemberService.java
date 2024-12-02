package com.example.demo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dao.TeamDao;
import com.example.demo.dao.TeamMemberDao;
import com.example.demo.dto.Article;
import com.example.demo.dto.Board;


@Service
public class TeamMemberService {
	
	private TeamMemberDao teamMemberDao;
	
	public TeamMemberService(TeamMemberDao teamMemberDao) {

		this.teamMemberDao = teamMemberDao;
	}

	
}
