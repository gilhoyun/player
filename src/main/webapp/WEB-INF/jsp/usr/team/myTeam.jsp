<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="내 팀 목록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8">
	<div class="max-w-5xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<h2 class="text-2xl font-semibold text-gray-800 mb-6">내 팀 정보</h2>
		<c:choose>
			<c:when test="${not empty teams}">
				<c:forEach var="team" items="${teams}">
					<div class="card w-full bg-base-100 shadow-xl">
						<!-- Team Image and Name Section -->
						<div class="card-body">
							<div class="flex flex-col md:flex-row items-center gap-6">
								<div class="avatar">
									<div class="w-40 h-40 rounded-full ring ring-stone-400 ring-offset-base-100 ring-offset-2">
										<c:choose>
											<c:when test="${not empty team.teamImage}">
												<img src="/usr/team/teamImage/${team.id}" alt="팀 이미지" />
											</c:when>
											<c:otherwise>
												<div class="bg-base-300 flex items-center justify-center">
													<svg xmlns="http://www.w3.org/2000/svg" class="h-20 w-20"
														fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round"
															stroke-width="2"
															d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                </svg>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="text-center md:text-left">
									<h2 class="text-3xl font-bold">${team.teamName}</h2>
									<div class="badge badge-stone-300 badge-outline mt-2">${team.region}</div>
									<p class="text-lg italic mt-2">"${team.slogan}"</p>
								</div>
							</div>

							<!-- Stats Section -->
							<div class="stats stats-vertical lg:stats-horizontal shadow mt-6">
								<div class="stat">
									<div class="stat-title">창단일</div>
									<div class="stat-value text-lg">${team.regDate.substring(0, 16)}</div>
								</div>

								<div class="stat">
									<div class="stat-title">정보 수정일</div>
									<div class="stat-value text-lg">${team.updateDate.substring(0, 16)}</div>
								</div>

								<div class="stat">
									<div class="stat-title">활동 지역</div>
									<div class="stat-value text-lg">${team.region}</div>
								</div>
							</div>

							<!-- Additional Info -->
							<div class="collapse collapse-plus bg-base-200 mt-6">
								<input type="checkbox" />
								<div class="collapse-title text-xl font-medium">팀 슬로건</div>
								<div class="collapse-content">
									<p>${team.slogan}</p>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${rq.getLoginedMemberId() == team.createdBy}">
						<div class="flex justify-end gap-4 mt-4">
							<!-- 수정 버튼 -->
							<a href="/usr/team/modify?id=${team.id}"
								class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition">
								수정 </a>

							<!-- 해체 버튼 -->
							<a onclick="if(confirm('정말 해체하시겠습니까?') == false) return false;"
								href="/usr/team/doDelete?id=${team.id}&teamName=${team.teamName}"
								class="px-4 py-2 bg-red-400 text-white rounded hover:bg-red-500 transition">
								해체 </a>
						</div>
					</c:if>

					<c:if test="${rq.getLoginedMemberId() == team.createdBy}">
						<form action="/usr/team/saveResults" method="post"
							class="mt-6 p-4 bg-gray-100 rounded-lg shadow-md">
							<input type="hidden" name="teamId" value="${team.id}" /> <input
								type="hidden" name="teamName" value="${team.teamName}" />

							<h3 class="text-lg font-semibold text-gray-700 mb-4">팀 경기 결과
								입력</h3>

							<div class="grid grid-cols-3 gap-4">
								<!-- 승 -->
								<div>
									<label for="wins"
										class="block text-sm font-medium text-gray-600 mb-1">승:</label>
									<input type="number" name="wins" id="wins" min="0" value="0"
										required
										class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none" />
								</div>

								<!-- 무 -->
								<div>
									<label for="draws"
										class="block text-sm font-medium text-gray-600 mb-1">무:</label>
									<input type="number" name="draws" id="draws" min="0" value="0"
										required
										class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none" />
								</div>

								<!-- 패 -->
								<div>
									<label for="losses"
										class="block text-sm font-medium text-gray-600 mb-1">패:</label>
									<input type="number" name="losses" id="losses" min="0"
										value="0" required
										class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none" />
								</div>
							</div>

							<!-- 저장 버튼 -->
							<button type="submit"
								class="mt-4 w-full py-2 px-4 bg-stone-400 text-white text-center font-medium rounded-lg hover:bg-stone-500 focus:ring-2 focus:ring-blue-400 focus:outline-none transition">
								결과 저장</button>
						</form>
					</c:if>

					<c:if test="${rq.getLoginedMemberId() == team.createdBy}">
						<c:forEach var="memberRequest" items="${pendingRequests}">
							<h3 class="text-lg font-semibold text-gray-700 mb-4 mt-6">가입
								요청</h3>
							<div class="flex justify-between items-center border-b pb-4 mb-4">
								<div>
									<p class="font-medium text-gray-800">${memberRequest.memberName}</p>
									<p class="text-sm text-gray-600">요청일:
										${memberRequest.regDate.substring(0, 16)}</p>
								</div>
								<div class="flex gap-4">
									<a
										href="/usr/teamMember/approve?teamMemberId=${memberRequest.id}"
										class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500">
										수락 </a> <a
										href="/usr/teamMember/reject?teamMemberId=${memberRequest.id}"
										class="px-4 py-2 bg-red-400 text-white rounded hover:bg-red-500">
										거절 </a>
								</div>
							</div>
						</c:forEach>
					</c:if>

					<!-- 승인된 팀원 섹션 추가 -->
					<c:if test="${rq.getLoginedMemberId() == team.createdBy}">
						<c:if test="${not empty approvedMembers}">
							<div class="mt-6">
								<h3 class="text-lg font-semibold text-gray-700 mb-4 text-center">소속
									선수</h3>
								<div class="bg-white shadow rounded-lg overflow-hidden">
									<table class="w-full">
										<thead class="bg-gray-100">
											<tr>
												<th
													class="p-4 text-center text-sm font-medium text-gray-600">이름</th>
												<th
													class="p-4 text-center text-sm font-medium text-gray-600">가입
													날짜</th>
												<th
													class="p-4 text-center text-sm font-medium text-gray-600">역할</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="member" items="${approvedMembers}">
												<tr class="border-b">
													<td class="p-4 text-center">${member.memberName}</td>
													<td class="p-4 text-center">${member.regDate.substring(0, 16)}</td>
													<td class="p-4 text-center"><c:choose>
															<c:when test="${member.role == 'LEADER'}">팀장</c:when>
															<c:otherwise>선수</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</c:if>
						<c:if test="${empty approvedMembers}">
							<p class="mt-6 text-center text-gray-600">팀원이 없습니다.</p>
						</c:if>
					</c:if>

				</c:forEach>
			</c:when>
			<c:otherwise>
				<p class="text-center text-gray-600">생성된 팀이 없습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
