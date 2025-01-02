<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="매칭 목록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8">
	<div
		class="max-w-5xl mx-auto p-6 bg-white rounded-lg shadow-md relative">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">매칭 목록</h2>
		<div
			class="w-full mx-auto mb-4 flex justify-between items-center text-sm">
			<div class="flex items-center">총: ${matchingsCnt}개</div>
			<form class="flex items-center">
				<select class="select select-bordered select-sm mr-2"
					name="searchType">
					<option value="region"
						<c:if test="${searchType == 'region'}">selected="selected"</c:if>>지역</option>
					<option value="name"
						<c:if test="${searchType == 'name'}">selected="selected"</c:if>>팀
						이름</option>
					<option value="region,name"
						<c:if test="${searchType == 'region,name'}">selected="selected"</c:if>>지역
						+ 팀 이름</option>
				</select> <label
					class="input input-bordered input-sm flex items-center gap-2 w-60">
					<input type="text" class="grow" name="searchKeyword"
					placeholder="검색어를 입력해주세요" maxlength="25" value="${searchKeyword}" />
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
						fill="currentColor" class="h-4 w-4 opacity-70">
            <path fill-rule="evenodd"
							d="M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z"
							clip-rule="evenodd" />
          </svg>
				</label>
				<button type="submit" class="hidden">검색</button>
			</form>
		</div>

		<div class="space-y-6">
			<c:set var="currentDate" value="" />
			<c:forEach var="matching" items="${matchings}">
				<c:set var="matchDate"
					value="${matching.matchDate.substring(0, 10)}" />
				<c:if test="${currentDate ne matchDate}">
					<div class="border-b border-gray-200 pb-2 mb-4">
						<h3 class="text-lg font-medium text-gray-900">
							${matching.matchDate.substring(5, 7)}월
							${matching.matchDate.substring(8, 10)}일
							<c:set var="dayOfWeek" value="${matching.dayOfWeek}" />
							<c:choose>
								<c:when test="${dayOfWeek == '월요일'}">월요일</c:when>
								<c:when test="${dayOfWeek == '화요일'}">화요일</c:when>
								<c:when test="${dayOfWeek == '수요일'}">수요일</c:when>
								<c:when test="${dayOfWeek == '목요일'}">목요일</c:when>
								<c:when test="${dayOfWeek == '금요일'}">금요일</c:when>
								<c:when test="${dayOfWeek == '토요일'}">토요일</c:when>
								<c:when test="${dayOfWeek == '일요일'}">일요일</c:when>
							</c:choose>
						</h3>
					</div>
					<c:set var="currentDate" value="${matchDate}" />
				</c:if>

				<div class="border rounded-lg bg-white shadow-sm">
					<div class="flex items-center justify-between p-4">
						<div class="flex items-center space-x-4">
							<div class="text-lg font-medium w-20">
								${matching.matchDate.substring(11, 16)}</div>
							<div>
								<div class="font-medium">
									<a href="matchingDetail?id=${matching.id}" class="hover:underline">
										${matching.stadium} </a>
								</div>
								<div class="flex items-center space-x-2 text-xs text-gray-500">
									<span>${matching.genderInKorean}</span><span class="mx-1">/</span>
									<span>${matching.region}</span><span class="mx-1">/</span>
									<span>${matching.playerCount}</span>
								</div>
							</div>
						</div>
						<div class="flex items-center space-x-3">
							<c:choose>
								<c:when test="${matching.status == 'MATCHED'}">
									<span
										class="px-4 py-2 bg-red-500 text-white rounded-md text-sm">마감</span>
								</c:when>
								<c:when test="${matching.status == 'WAITING'}">
									<a href="matchingDetail?id=${matching.id}"
										class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition">
										신청가능 </a>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="mt-6 flex justify-between items-center">
			<div class="flex-grow flex justify-center">
				<div class="join">
					<c:set var="path"
						value="?searchType=${searchType}&searchKeyword=${searchKeyword}" />

					<c:if test="${from != 1}">
						<a href="${path}&page=1" class="join-item btn"><<</a>
						<a href="${path}&page=${from - 1}" class="join-item btn"><</a>
					</c:if>

					<c:forEach var="i" begin="${from}" end="${end}">
						<a href="${path}&page=${i}"
							class="join-item btn btn-square ${page == i ? 'btn-active' : ''}">${i}</a>
					</c:forEach>

					<c:if test="${end != totalPagesCnt}">
						<a href="${path}&page=${end + 1}" class="join-item btn">></a>
						<a href="${path}&page=${totalPagesCnt}" class="join-item btn">>></a>
					</c:if>
				</div>
			</div>
			<c:if test="${rq.getLoginedMemberId() != -1 and rq.hasTeam()}">
				<div>
					<a
						class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition"
						href="/usr/team/write">등록</a>
				</div>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>