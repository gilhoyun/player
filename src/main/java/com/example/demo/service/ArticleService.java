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

	public Article writeArticle(int id, String title, String body) {
		
		return articleDao.writeArticle(id,title,body);
	}

	public Article getArticlebyId(int id) {
		return articleDao.getArticlebyId(id);
	}

	public List<Article> getArticles() {
		
		return articleDao.getArticles();
	}

	public void doModify(Article foundArticle, String title, String body) {
		articleDao.getArticles(foundArticle, title, body);
	}

	public void doDelete(Article foundArticle) {
		articleDao.doDelete(foundArticle);
		
	}
	
	
	

}
