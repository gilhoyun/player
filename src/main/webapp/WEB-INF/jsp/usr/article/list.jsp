<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() } 게시판" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8 ">
	<div
		class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md relative">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">게시물</h2>
		<table class="w-full text-left border-collapse">
			<thead>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">번호</th>
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">제목</th>
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">작성자</th>
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="article" items="${articles}">
					<tr class="border-b">
						<td class="text-center p-4">${article.getId()}</td>
						<td class="hover:underline text-center p-4"><a
							href="detail?id=${article.getId()}">${article.getTitle()}</a></td>
						<td class="text-center p-4">${article.getLoginId()}</td>
						<td class="text-center p-4">${article.getRegDate().substring(2,16)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<c:if test="${rq.getLoginedMemberId() != -1 }">
			<div class="mx-auto flex justify-end my-3">
				<a
					class="px-4 py-2 bg-stone-500 text-white rounded hover:bg-stone-600 transition"
					href="write">글쓰기</a>
			</div>
		</c:if>
	</div>

</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
