package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Matching;
import com.example.demo.dto.Team;


@Mapper
public interface TeamDao {

	@Insert("""
		    INSERT INTO team
		        SET teamName = #{teamName},
		            region = #{region},
		            slogan = #{slogan},
		            teamImage = #{encodedImage},
		            createdBy = #{createdBy},
		            teamLeader = #{createdBy}, 
		            regDate = NOW(),
		            updateDate = NOW()
		""")
		void joinTeam(String teamName, String region, String slogan, String encodedImage, Integer createdBy);

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

		@Delete("""
				DELETE FROM `team`
				WHERE teamName = #{teamName}
				""")
		void doDeleteTeam(String teamName);

		@Select("""
				SELECT * 
				FROM `team`
				WHERE id = #{id}
				""")
		Team getTeamById(int id);
	
		@Update("""
			    UPDATE `team`
			    SET updateDate = NOW(),
			        teamName = #{teamName},
			        region = #{region},
			        slogan = #{slogan},
			        teamImage = COALESCE(#{encodedImage}, teamImage)
			    WHERE id = #{id}
			""")
			void doModifyTeam(int id, String teamName, String region, String slogan, String encodedImage);

		
		
		
		@Select("""
			    SELECT wins, draws, losses, points
			    FROM `team`
			    WHERE id = #{teamId}
			""")
			Team getCurrentTeamResults(int teamId);

			@Update("""
			    UPDATE `team`
			    SET wins = #{wins},
			        draws = #{draws},
			        losses = #{losses},
			        points = #{points},
			        updateDate = NOW()
			    WHERE id = #{teamId}
			""")
			void updateTeamResults(int teamId, int wins, int draws, int losses, int points, int loginedMemberId);

			
			
			@Select("""
					SELECT * 
					FROM `team`
					ORDER BY points DESC, wins DESC, id ASC
					""")
			List<Team> getRankedTeams();

			@Select("""
				    SELECT t.id as teamId, COUNT(tm.id) as memberCount 
				    FROM team t
				    LEFT JOIN team_member tm ON t.id = tm.teamId
				    GROUP BY t.id
				    """)
				List<Map<String, Object>> getTeamMemberCounts();


			@Select("""
					SELECT LAST_INSERT_ID();
					""")
			int getLastInsertId();

			@Insert("""
		            INSERT INTO matching
		            SET regDate = NOW(),
		                updateDate = NOW(),
		                hostTeamId = #{hostTeamId},
		                createdBy = #{createdBy},
		                matchDate = #{matchDate},
		                region = #{region},
		                stadium = #{stadium},
		                playerCount = #{formattedPlayerCount},
		                gender = #{gender},
		                description = #{description},
		                imgUrl = #{imgUrl}
		            """)
		    void writeMatching(int hostTeamId, int createdBy, String matchDate, String region, String stadium, String formattedPlayerCount, String gender, String description, byte[] imgUrl);
			
			@Select("""
			        <script>
			        SELECT M.*, T.teamName AS hostTeamName
			        FROM matching AS M
			        INNER JOIN team AS T
			        ON M.hostTeamId = T.id
			        WHERE 1=1
			        <if test="searchKeyword != ''">
			            <choose>
			                <when test="searchType == 'region'">
			                    AND M.region LIKE CONCAT('%', #{searchKeyword}, '%')
			                </when>
			                <when test="searchType == 'stadium'">
			                    AND M.stadium LIKE CONCAT('%', #{searchKeyword}, '%')
			                </when>
			                <when test="searchType == 'teamName'">
			                    AND T.teamName LIKE CONCAT('%', #{searchKeyword}, '%')
			                </when>
			                <otherwise>
			                    AND (
			                        M.region LIKE CONCAT('%', #{searchKeyword}, '%')
			                        OR M.stadium LIKE CONCAT('%', #{searchKeyword}, '%')
			                        OR T.teamName LIKE CONCAT('%', #{searchKeyword}, '%')
			                    )
			                </otherwise>
			            </choose>
			        </if>
			        GROUP BY M.id
			        ORDER BY M.matchDate ASC, M.id ASC
			        LIMIT #{limitFrom}, 10
			        </script>
			        """)
			List<Matching> getMatchings(int limitFrom, String searchType, String searchKeyword);

			@Select("""
			        <script>
			        SELECT COUNT(*)
			        FROM matching AS M
			        INNER JOIN team AS T
			        ON M.hostTeamId = T.id
			        WHERE 1=1
			        <if test="searchKeyword != ''">
			            <choose>
			                <when test="searchType == 'region'">
			                    AND M.region LIKE CONCAT('%', #{searchKeyword}, '%')
			                </when>
			                <when test="searchType == 'stadium'">
			                    AND M.stadium LIKE CONCAT('%', #{searchKeyword}, '%')
			                </when>
			                <when test="searchType == 'teamName'">
			                    AND T.teamName LIKE CONCAT('%', #{searchKeyword}, '%')
			                </when>
			                <otherwise>
			                    AND (
			                        M.region LIKE CONCAT('%', #{searchKeyword}, '%')
			                        OR M.stadium LIKE CONCAT('%', #{searchKeyword}, '%')
			                        OR T.teamName LIKE CONCAT('%', #{searchKeyword}, '%')
			                    )
			                </otherwise>
			            </choose>
			        </if>
			        </script>
			        """)
			int getMatchingsCnt(String searchType, String searchKeyword);

			@Select("""
					SELECT * 
					FROM `matching`
					WHERE id = #{id} 
					""")
			Matching getMatchingbyId(int id);
}
