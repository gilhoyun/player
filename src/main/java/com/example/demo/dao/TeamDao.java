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
			            createdBy = #{createdBy},  -- createdBy 값 추가
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


}
