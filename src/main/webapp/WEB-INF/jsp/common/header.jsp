<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
</head>
<body>
	<div>
		<div><a href="${pageContext.request.contextPath}/">로고</a></div>
		
		<ul>
			<li><a href="${pageContext.request.contextPath}/">HOME</a></li>
			<li><a href="${pageContext.request.contextPath}/usr/article/list">LIST</a></li>
		</ul>
	</div>

	<section>
		<div>
			<h1>${pageTitle }&nbsp;페이지</h1>
		</div>
	</section>