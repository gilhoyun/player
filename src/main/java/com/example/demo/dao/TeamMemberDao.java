package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Article;
import com.example.demo.dto.Board;

@Mapper
public interface TeamMemberDao {

	@Update("""
		    UPDATE team_member
		    SET status = #{status}
		    WHERE id = #{teamMemberId}
		""")
		void updateMembershipStatus(Integer teamMemberId, String status);

}
