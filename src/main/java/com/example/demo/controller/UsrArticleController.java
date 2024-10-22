package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;

@Controller
public class UsrArticleController {

	private int lastArticleId;

	private List<Article> articles;

	public UsrArticleController() {
		this.lastArticleId = 0;
		this.articles = new ArrayList<>();
		makeTestData();
	}

	private void makeTestData() {
		for(int i = 1; i <= 10; i++) {
			lastArticleId++;
			Article article = new Article(lastArticleId, "제목" + i, "내용" + i);
			articles.add(article);
		}		
		
	}

	@GetMapping("/usr/article/doWrite")
	@ResponseBody
	public Article doWrite(String title, String body) {

		lastArticleId++;

		Article article = new Article(lastArticleId, title, body);

		articles.add(article);

		return article;
	}

	@GetMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return articles;

	}

	@GetMapping("usr/article/showDetail")
	@ResponseBody
	public Object showDetail(int id) {

		Article foundArticle = null;

		for (Article article : articles) {
			if (article.getId() == id) {
				foundArticle = article;
				break;
			}
		}

		if (foundArticle == null) {
			return id + "번 게시물은 존개하지 않습니다.";
		}

		return foundArticle;

	}

	@GetMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		Article foundArticle = null;

		for (Article article : articles) {
			if (article.getId() == id) {
				foundArticle = article;
				break;
			}
		}
				
		if (foundArticle == null) {
			return id + "번 게시물은 존개하지 않습니다.";
		}	
		
		foundArticle.setTitle(title);
		foundArticle.setBody(body);

		return id + "번 게시물을 수정했습니다.";

	}

	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public Object doDelete(int id) {
		
		Article foundArticle = null;

		for (Article article : articles) {
			if (article.getId() == id) {
				foundArticle = article;
				break;
			}
		}
		
		if (foundArticle == null) {
			return id + "번 게시물은 존개하지 않습니다.";
		}
			
		articles.remove(foundArticle);
		
		return id + "번 게시물을 삭제했습니다.";

	}

}
