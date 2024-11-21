package com.example.demo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;
import com.example.demo.dto.Board;


@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {

		this.articleDao = articleDao;
	}

	public void writeArticle(int loginedMemberId, int boardId, String title, String body) {
		
		articleDao.writeArticle(loginedMemberId, boardId, title,body);
	}

	public Article getArticlebyId(int id) {
		return articleDao.getArticlebyId(id);
	}

	public List<Article> getArticles(int boardId, int limitPage) {
		
		return articleDao.getArticles(boardId, limitPage);
	}

	public void doModify(int id, String title, String body) {
		articleDao.doModify(id, title, body);
	}

	public void doDelete(int id) {
		articleDao.doDelete(id);
		
	}

	public int getLastInsertId() {
		
		return articleDao.getLastInsertId();
	}

	public Board getBoardId(int boardId) {
		
		return articleDao.getBoardId(boardId);
	}

	public int articlesCnt(int boardId) {
		return articleDao.articlesCnt(boardId);
	}

	public void boardListProcess(int page) {

		
	}

}
