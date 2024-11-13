<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<h1>게시물 목록</h1>
	
	<div>
		<div><a href="/">로고</a></div>
		
		<ul>
			<li><a href="/">HOME</a></li>
			<li><a href="/usr/article/list">LIST</a></li>
		</ul>
	</div>
	
	<section>
		<div>
			<ul>
<%-- 				<c:forEach var="i" begin="0" end="2"> --%>
<%-- 					<li>${articles.get(i).getId() } | ${articles.get(i).getTitle() } | ${articles.get(i).getLoginId() } | ${articles.get(i).getRegDate() }</li> --%>
<%-- 				</c:forEach> --%>
				<c:forEach var="article" items="${articles }">
					<li>${article.getId() } | ${article.getTitle() } | ${article.getLoginId() } | ${article.getRegDate().substring(2,16) }</li>
				</c:forEach>
			</ul>
		</div>
	</section>
</body>
</html>