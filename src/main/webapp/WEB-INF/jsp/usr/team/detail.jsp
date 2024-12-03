<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="팀 상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>

	
	$(document).ready(function() {
		if (${rq.getLoginedMemberId() != -1 }) {
			getLoginId();
		}
		
	})
	
	

	
</script>


<section class="py-8 ">
	<div class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">팀 살펴보기</h2>
		<table class="w-full text-left border-collapse">
			<thead>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">창단일</th>
					<td class="p-4">${team.regDate.substring(2,16)}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">수정일</th>
					<td class="p-4">${team.updateDate.substring(2,16)}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">팀장</th>
					<td class="p-4">${team.getTeamLeaderLoginId()}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">팀
						명</th>
					<td class="p-4">${team.teamName}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">지역</th>
					<td class="p-4">${team.region}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">슬로건</th>
					<td class="p-4">${team.slogan}</td>
				</tr>
				<tr class="border-b">
					<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">조회수</th>
					<td class="p-4">${team.views}</td>
				</tr>
			</thead>
		</table>
		<!-- 		<div class="mt-6 text-right flex justify-between items-center"> -->
		<!-- 			<div class="flex space-x-4"> -->
		<%-- 				<c:if test="${rq.getCreatedBy() == team.getTeamLeaderLoginId() }"> --%>
		<!-- 					<a onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" -->
		<%-- 						href="doDelete?id=${team.getId()}" --%>
		<!-- 						class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 transition">삭제</a> -->
		<%-- 				</c:if> --%>
		<%-- 				<c:if test="${rq.getCreatedBy() == team.getTeamLeaderLoginId() }"> --%>
		<%-- 					<a href="modify?id=${article.getId()}" --%>
		<!-- 						class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition">수정 -->
		<!-- 					</a> -->
		<%-- 				</c:if> --%>
		<!-- 			</div> -->
		<!-- 		</div> -->
	</div>
</section>



<!-- //댓글의 input relId,relTypeCode를 가지고 controller에서 쓴다 -->





<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
