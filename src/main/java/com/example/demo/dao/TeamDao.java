package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;
import com.example.demo.dto.Member;
import com.example.demo.dto.Team;

@Mapper
public interface TeamDao {

	@Insert("""
		    INSERT INTO team
		        SET teamName = #{teamName},
		            region = #{region},
		            slogan = #{slogan},
		            teamImage = #{teamImage},
		            createdBy = #{createdBy},
		            teamLeader = #{createdBy}, 
		            regDate = NOW(),
		            updateDate = NOW()
		""")
		void joinTeam(String teamName, String region, String slogan, byte[] teamImage, Integer createdBy);

	@Select("""
			SELECT *
			FROM `team`
			WHERE teamName = #{teamName}
			""")
	Team getTeamByTeamName(String teamName);

	@Select("""
			    SELECT *
			    FROM `team`
			    WHERE createdBy = #{createdBy}
			""")
	List<Team> getTeamsByCreatedBy(Integer createdBy);

	@Select("""
		    SELECT COUNT(*)
		    FROM `team`
		    WHERE createdBy = #{memberId}
		    """)
		int countTeamByMemberId(int memberId);

	
	@Select("""
			<script>
			SELECT t.*, m.loginId as teamLeaderLoginId
			FROM team t
			JOIN member m ON t.teamLeader = m.id
			WHERE 1=1
			<if test="searchKeyword != ''">
			<if test="searchType == 'teamName'">
			AND t.teamName LIKE CONCAT('%', #{searchKeyword}, '%')
			</if>
			<if test="searchType == 'teamLeader'">
			AND m.loginId LIKE CONCAT('%', #{searchKeyword}, '%')
			</if>
			</if>
			ORDER BY t.id DESC
			LIMIT #{limitFrom}, 10
			</script>
			""")
			List<Team> getTeams(int limitFrom, String searchType, String searchKeyword);

			@Select("""
			<script>
			SELECT COUNT(*)
			FROM team t
			JOIN member m ON t.teamLeader = m.id
			WHERE 1=1
			<if test="searchKeyword != ''">
			<if test="searchType == 'teamName'">
			AND t.teamName LIKE CONCAT('%', #{searchKeyword}, '%')
			</if>
			<if test="searchType == 'teamLeader'">
			AND m.loginId LIKE CONCAT('%', #{searchKeyword}, '%')
			</if>
			</if>
			</script>
			""")
			int teamsCnt(String searchType, String searchKeyword);

			@Select("""
				    SELECT t.*, m.loginId as teamLeaderLoginId
				    FROM team t
				    JOIN member m ON t.teamLeader = m.id
				    WHERE t.id = #{id}
				    """)
		  Team getTeambyId(int id);

			
		@Select("""
				UPDATE `team`
				SET views = views + 1
				WHERE id = #{id}
				""")
		void increaseViews(int id);

}
