<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="수정" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	const writeForm_onSubmit = function(form) {
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


<section class="px-auto py-8 ">
	<div class="max-w-2xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<form action="doWrite" method="post" onsubmit="writeForm_onSubmit(this); return false;">
			<input name="id" type="hidden" value="${article.id }" />
			<div class="table-box">
				<table class="w-full text-left border-collapse">
					<thead>
					    <tr>
							<th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">게시판</th>
							<td class="py-2 px-4">
						      <label class="flex items-center">
							    <input type="radio" name="boardId" class="radio radio-sm border p-2 rounded" value="1"/>&nbsp;&nbsp; 공지사항 
							  </label>
							  <label class="flex items-center">
							    <input type="radio" name="boardId" class="radio radio-sm  border p-2 rounded" value="2" checked/>&nbsp;&nbsp; 자유
							  </label>
							</td>
							
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
				<button type="submit" class="px-6 py-2 bg-stone-500 text-white rounded hover:bg-stone-600 transition">등록</button>
			</div>
		</form>
	</div>
</section>

<!-- input의 name은 doModify에 있는 id,title, body를 의미한다. -->
<!-- label태그로 글자를 눌러도 라이오버튼 클릭가능하게 만듬 -->

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
