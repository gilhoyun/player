<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	const replyForm_onSubmit = function(form) {
		form.body.value = form.body.value.trim();

		if (form.body.value == 0) {
			alert('내용을 입력해주세요.');
			form.body.focus();
			return;
		}
		form.submit();

	}
	
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
			<div class="flex space-x-4">
				<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
					<a onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
						href="doDelete?id=${article.getId()}"
						class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 transition">삭제</a>
				</c:if>
				<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
					<a href="modify?id=${article.getId()}"
						class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition">수정
					</a>
				</c:if>
			</div>
		</div>
	</div>
</section>

<section>
	<div class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">댓글</h2>
		
          <c:forEach var="reply" items="${replies }">
			<div class="py-2 border-b-2 border-slate-200 pl-20">
				<div class="font-semibold">${reply.getLoginId() }</div>
				<div class="text-lg my-1 ml-2">${reply.getForPrintBody() }</div>
				<div class="text-xs text-gray-400">${reply.getRegDate() }</div>
			</div>
		 </c:forEach>
		<c:if test="${rq.getLoginedMemberId() != -1 }">
		  <form action="/usr/reply/doWrite" method="post" onsubmit="replyForm_onSubmit(this); return false;">
			<input name="relTypeCode" type="hidden" value="article" /> 
			<input name="relId" type="hidden" value="${article.id }" />
			<div class="table-box">
				<table class="w-full text-left border-collapse">
					<thead>
						<tr>
							<textarea name="body" class="border p-2 rounded w-full" placeholder="내용을 입력해주세요."></textarea>
							<div class="flex justify-end mt-4">
								<button type="submit" class="px-6 py-2 bg-stone-500 text-white rounded hover:bg-stone-600 transition">작성</button>
							</div>
						</tr>
					</thead>
				</table>
			</div>
		  </form>
		</c:if> 
	</div>
</section>

<!-- //댓글의 input relId,relTypeCode를 가지고 controller에서 쓴다 -->





<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
