<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	
</script>

<section class="py-8 ">
	<div class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">게시물 상세보기</h2>
		<table class="w-full text-left border-collapse">
			<thead>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">번호</th>
					<td class="p-4">${article.id}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">작성일</th>
					<td class="p-4">${article.regDate.substring(2,16)}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">수정일</th>
					<td class="p-4">${article.updateDate.substring(2,16)}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">작성자</th>
					<td class="p-4">${article.loginId}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">제목</th>
					<td class="p-4">${article.title}</td>
				</tr>
				<tr>
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">내용</th>
					<td class="p-4 whitespace-pre-wrap">${article.body}</td>
				</tr>
			</thead>
		</table>
		<div class="mt-6 text-right flex justify-between items-center">
			<button onclick="history.back();" class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-600 transition">뒤로가기</button>

			<div class="flex space-x-4">
				<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }"> 
				     <a onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="doDelete?id=${article.getId()}" class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 transition">삭제</a>
				</c:if>
				<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
					<a href="modify?id=${article.getId()}" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition">수정 </a>
				</c:if>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
