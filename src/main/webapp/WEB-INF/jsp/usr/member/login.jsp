<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="px-auto py-8 ">
	<div class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<form action="doLogin" method="post">
			<div class="table-box">
				<table class="w-full text-left border-collapse">
					<thead>
						<tr class="border-b">
							<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">아이디</th>
							<td class="p-4"><input type="text" name="loginId" placeholder="아이디를 입력해주세요"/></td>
						</tr>
						<tr class="border-b">
							<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">비밀번호</th>
							<td class="p-4"><input type="text" name="loginPw" placeholder="비밀번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<td class="text-center  px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-600 transition" colspan="2">
							<button>로그인</button>
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</form>
		<div class="mt-6 text-right flex justify-between ">
			<button onclick="history.back();"
				class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-500 transition">뒤로가기</button>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
