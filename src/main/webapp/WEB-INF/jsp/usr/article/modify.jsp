<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="수정" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	const modifyForm_onSubmit = function(form) {
		form.title.value = form.title.value.trim();
		form.body.value = form.body.value.trim();

		if (form.title.value == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			return;
		}

		if (form.body.value == 0) {
			alert('내용을 입력해주세요.');
			form.body.focus();
			return;
		}

		form.submit();
	}
</script>


<!-- input name은 폼을 제출할 때 서버로 전송, 서버에서는 이 id를 사용하여 어떤 게시글을 수정할 것인지 판단 -->
<section class="px-auto py-8 ">
	<div class="max-w-2xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<form action="doModify" method="post" onsubmit="modifyForm_onSubmit(this); return false;">
			<input name="id" type="hidden" value="${article.id }" />
			<div class="table-box">
				<table class="w-full text-left border-collapse">
					<thead>
						<tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">번호</th>
							<td class="py-2 px-4">${article.id }</td>
						</tr>
						<tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">작성일</th>
							<td class="py-2 px-4">${article.regDate.substring(2,16)}</td>
						</tr>
						<tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">수정일</th>
							<td class="py-2 px-4">${article.updateDate.substring(2,16)}</td>
						</tr>
						<tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">작성자</th>
							<td class="py-2 px-4">${article.loginId}</td>
						</tr>
						<tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">제목</th>
							<td class="py-2 px-4"><input name="title" type="text" class="border p-2 rounded w-full" value="${article.title }" placeholder="제목을 입력해주세요." /></td>
						</tr>
						<tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">내용</th>
							<td class="py-2 px-4"><textarea name="body" class="border p-2 rounded w-full" placeholder="내용을 입력해주세요.">${article.body }</textarea></td>
						</tr>
					</thead>
				</table>
			</div>
			<div class="text-right mt-4">
				<button type="submit" class="px-6 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition">수정</button>
			</div>
		</form>
	</div>
</section>

<!-- input의 name은 doModify에 있는 id,title, body를 의미한다. -->

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
