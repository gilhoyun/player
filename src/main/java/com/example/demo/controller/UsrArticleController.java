package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

@Controller
public class UsrArticleController {

	private int lastArticleId;
	
	private ArticleService articleService;

	public UsrArticleController(ArticleService articleService) {
		this.articleService = articleService;
		this.lastArticleId = 3;	
	}

	
	@GetMapping("/usr/article/doWrite")
	@ResponseBody
	public Article doWrite(String title, String body) {

		articleService.writeArticle(title, body);
		
		int id = articleService.getLastInsertId();
		
		Article article = articleService.getArticlebyId(id);
			
		return article;
	}


	@GetMapping("/usr/article/showList")
	@ResponseBody
	public List<Article> showList() {
		return articleService.getArticles();

	}

	@GetMapping("usr/article/showDetail")
	@ResponseBody
	public Object showDetail(int id) {

		Article foundArticle = articleService.getArticlebyId(id);

		if (foundArticle == null) {
			return id + "번 게시물은 존개하지 않습니다.";
		}

		return foundArticle;

	}

	@GetMapping("/usr/article/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {

		Article foundArticle = articleService.getArticlebyId(id);
				
		if (foundArticle == null) {
			return id + "번 게시물은 존개하지 않습니다.";
		}	
		
		
		
		articleService.doModify(id, title, body);
		
		

		return id + "번 게시물을 수정했습니다.";

	}

	@GetMapping("/usr/article/doDelete")
	@ResponseBody
	public Object doDelete(int id) {
		
		Article foundArticle = articleService.getArticlebyId(id);
		
		if (foundArticle == null) {
			return id + "번 게시물은 존개하지 않습니다.";
		}
			
		articleService.doDelete(id);
		
		return id + "번 게시물을 삭제했습니다.";

	}

}
