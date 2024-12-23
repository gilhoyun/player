<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="회원 정보" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	
</script>

<section class="py-8">
	<div class="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">마이페이지</h2>

		<div class="card w-full bg-base-100 shadow-xl">
			<div class="card-body">
				<!-- Profile Image and Basic Info Section -->
				<div class="flex flex-col md:flex-row items-center gap-6 mb-6">
					<div class="avatar">
						<div
							class="w-40 h-40 rounded-full ring ring-stone-400 ring-offset-base-100 ring-offset-2">
							<img src="/usr/member/profileImage?memberId=${member.getId()}"
								alt="Profile Image" class="object-cover" />
						</div>
					</div>

					<div class="text-center md:text-left">
						<h2 class="text-3xl font-bold">${member.getName()}</h2>
						<p class="text-lg text-gray-600 mt-2">${member.getLoginId()}</p>
						<p class="text-md text-gray-500 mt-1">${member.getEmail()}</p>
					</div>
				</div>

				<!-- Stats Section -->
				<div class="stats stats-vertical lg:stats-horizontal shadow">
					<div class="stat">
						<div class="stat-title">가입일</div>
						<div class="stat-value text-lg">${member.getRegDate().substring(0, 16)}</div>
					</div>

					<div class="stat">
						<div class="stat-title">정보 수정일</div>
						<div class="stat-value text-lg">${member.getUpdateDate().substring(0, 16)}</div>
					</div>
				</div>

				<!-- Additional Info Section -->
				<div class="mt-6">
					<div class="bg-white shadow-md rounded-lg overflow-hidden">
						<table class="w-full text-left border-collapse">
							<thead>
								<tr class="bg-gray-100">
									<th class="text-center p-4 font-medium text-gray-700">아이디</th>
									<th class="text-center p-4 font-medium text-gray-700">이름</th>
									<th class="text-center p-4 font-medium text-gray-700">이메일</th>
								</tr>
							</thead>
							<tbody>
								<tr class="border-b hover:bg-gray-50">
									<td class="p-4 text-center">${member.getLoginId()}</td>
									<td class="p-4 text-center">${member.getName()}</td>
									<td class="p-4 text-center">${member.getEmail()}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- Action Buttons -->
		<div class="mt-6 flex justify-between items-center">
			<button onclick="history.back();"
				class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition">
				뒤로가기</button>
			<a href="checkPw"
				class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition">
				정보수정 </a>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
