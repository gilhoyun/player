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
public interface ArticleDao {

	Article getLastInsertArticle = null;

	@Insert("""
			       INSERT INTO article
			           SET regDate = NOW()
			           , updateDate = NOW()
			           , boardId = #{boardId}
			           , memberId =#{loginedMemberId}
			           , title = #{title}
			           , `body` = #{body}
			""")
	public void writeArticle(int loginedMemberId, int boardId, String title, String body);

	@Select("""
		    SELECT article.*, `member`.loginId
			FROM article
			INNER JOIN `member`
			ON article.memberid = `member`.id
			WHERE article.boardId = #{boardId}
			ORDER BY article.id desc
			""")
	public List<Article> getArticles(int boardId);

	@Select("""
			SELECT article.*, `member`.loginId
			FROM article
			INNER JOIN `member`
			ON article.memberid = `member`.id
			WHERE article.id = #{id}
			""")
	public Article getArticlebyId(int id);

	@Update("""
			<script>
			UPDATE article
			       SET updateDate = Now()
			          ,title = #{title}
			          ,`body` = #{body}
			       WHERE id = #{id}
			</script>
			""")
	public void doModify(int id, String title, String body);

	@Delete("""
			DELETE FROM article
			WHERE id = #{id}
			""")
	public void doDelete(int id);

	@Select("""
			SELECT LAST_INSERT_ID();
			""")
	public int getLastInsertId();

	@Select("""
			SELECT * FROM board
			WHERE id= #{boardId}
			""")
	public Board getBoardId(int boardId);
}
