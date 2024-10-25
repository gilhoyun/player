package com.example.demo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dto.Article;


@Service
public class ArticleService {
	
	private ArticleDao articleDao;
	
	public ArticleService(ArticleDao articleDao) {

		this.articleDao = articleDao;
	}

	public void writeArticle(int loginedMemberId, String title, String body) {
		
		articleDao.writeArticle(loginedMemberId, title,body);
	}

	public Article getArticlebyId(int id) {
		return articleDao.getArticlebyId(id);
	}

	public List<Article> getArticles() {
		
		return articleDao.getArticles();
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


}
