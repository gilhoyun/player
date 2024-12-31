package com.example.demo.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.dao.TeamDao;
import com.example.demo.dto.Matching;
import com.example.demo.dto.Team;


@Service
public class TeamService {
	
	private TeamDao teamDao;
	
	public TeamService(TeamDao teamDao) {

		this.teamDao = teamDao;
	}

	public void joinTeam(String teamName, String region, String slogan, String encodedImage, Integer createdBy) {
	    if (teamDao.getTeamByTeamName(teamName) != null) {
	        throw new RuntimeException("이미 존재하는 팀 이름입니다.");
	    }


	    teamDao.joinTeam(teamName, region, slogan, encodedImage, createdBy);
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

	public List<Team> getTeams(int limitFrom, String searchType, String searchKeyword) {
	    return teamDao.getTeams(limitFrom, searchType, searchKeyword);
	}

	public int teamsCnt(String searchType, String searchKeyword) {
	    return teamDao.teamsCnt(searchType, searchKeyword);
	}

	public Team getTeambyId(int id) {
		
		return teamDao.getTeambyId(id);
	}

	public void increaseViews(int id) {
		teamDao.increaseViews(id);
		
	}

	public void doDeleteTeam(String teamName) {
		teamDao.doDeleteTeam(teamName);
		
	}

	public Team getTeamById(int id) {
		return teamDao.getTeamById(id);
	}

	public void updateTeamResults(int teamId, int wins, int draws, int losses, int points, int loginedMemberId) {
	    // 현재 팀의 경기 결과 가져오기
	    Team currentResults = teamDao.getCurrentTeamResults(teamId);
	    if (currentResults == null) {
	        throw new RuntimeException("팀 정보를 찾을 수 없습니다.");
	    }

	    // 누적 값 계산
	    int newWins = currentResults.getWins() + wins;
	    int newDraws = currentResults.getDraws() + draws;
	    int newLosses = currentResults.getLosses() + losses;
	    int newPoints = currentResults.getPoints() + points;

	    // DB 업데이트
	    teamDao.updateTeamResults(teamId, newWins, newDraws, newLosses, newPoints, loginedMemberId);
	}

	public void doModifyTeam(int id, String teamName, String region, String slogan, String encodedImage) {
	    teamDao.doModifyTeam(id, teamName, region, slogan, encodedImage);
	}

	public Team getCurrentTeamResults(int teamId) {
		return teamDao.getCurrentTeamResults( teamId);
	}

	public List<Team> getRankedTeams() {
		return teamDao.getRankedTeams();
	}

	public Map<Integer, Integer> getTeamMemberCounts() {
	    List<Map<String, Object>> results = teamDao.getTeamMemberCounts();
	    Map<Integer, Integer> teamMemberCounts = new HashMap<>();
	    
	    for (Map<String, Object> result : results) {
	        int teamId = ((Number) result.get("teamId")).intValue();
	        int memberCount = ((Number) result.get("memberCount")).intValue();
	        teamMemberCounts.put(teamId, memberCount);
	    }
	    
	    return teamMemberCounts;
	}


	public int getLastInsertId() {
		return teamDao.getLastInsertId();
	}

	public void writeMatching(int hostTeamId, int createdBy, String matchDate, String region, String stadium, String formattedPlayerCount, String gender, String description, byte[] imgUrl) {
	    teamDao.writeMatching(hostTeamId, createdBy, matchDate, region, stadium, formattedPlayerCount, gender, description, imgUrl);
	}

	public List<Matching> getMatchings(int limitFrom, String searchType, String searchKeyword) {
	    return teamDao.getMatchings(limitFrom, searchType, searchKeyword);
	}

	public int getMatchingsCnt(String searchType, String searchKeyword) {
	    return teamDao.getMatchingsCnt(searchType, searchKeyword);
	}

	public Matching getMatchingbyId(int id) {
		return teamDao.getMatchingbyId(id);
	}

}
