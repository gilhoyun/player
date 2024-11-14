<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section>
	<div>
		<table border=1>
			<thead>
				<tr>
					<th>번호</th>
					<td>${foundArticle.id}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${foundArticle.regDate.substring(2,16) }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${foundArticle.updateDate.substring(2,16) }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${foundArticle.loginId }</td>
				</tr>
				<tr>

					<th>제목</th>
					<td>${foundArticle.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${foundArticle.body}</td>
				</tr>


			</thead>
		</table>
	</div>
	
	<div>
		<button onclick="history.back(); ">뒤로가기</button>
	</div>
</section>






<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
