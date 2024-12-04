<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="내 팀 목록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8">
    <div class="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">내 팀 정보</h2>
        
        <c:choose>
            <c:when test="${not empty teams}">
                <c:forEach var="team" items="${teams}">
                    <div class="border-b pb-6 mb-6">
                        <table class="w-full text-left border-collapse">
                            <tr class="border-b">
                                <th class="text-center p-4 font-medium text-gray-700 bg-gray-100">창단일</th>
                                <td class="p-4">${team.regDate.substring(0, 16)}</td>
                            </tr>
                            <tr class="border-b">
                                <th class="text-center p-4 font-medium text-gray-700 bg-gray-100">정보 수정일</th>
                                <td class="p-4">${team.updateDate.substring(0, 16)}</td>
                            </tr>
                            <tr class="border-b">
                                <th class="text-center p-4 font-medium text-gray-700 bg-gray-100">팀 명</th>
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
                                <th class="text-center p-4 font-medium text-gray-700 bg-gray-100">팀 이미지</th>
                                <td class="p-4">
                                    <c:if test="${not empty team.teamImage}">
                                        <img src="data:image/jpeg;base64,${team.teamImage}" alt="팀 이미지" class="w-32 h-32 object-cover"/>
                                    </c:if>
                                    <c:if test="${empty team.teamImage}">
                                        <p>이미지가 없습니다.</p>
                                    </c:if>
                                </td>
                            </tr>
                        </table>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="text-center text-gray-600">생성된 팀이 없습니다.</p>
            </c:otherwise>
        </c:choose>
        
        <div class="mt-6 text-right">
            <button onclick="history.back();" class="px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-600 transition">뒤로가기</button>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>