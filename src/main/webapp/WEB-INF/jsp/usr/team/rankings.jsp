<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="팀 순위" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8">
    <div class="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">팀 순위</h2>
        <table class="w-full text-center border-collapse">
            <thead>
                <tr class="bg-gray-100 border-b">
                    <th class="py-3 px-4 font-medium text-gray-700">순위</th>
                    <th class="py-3 px-4 font-medium text-gray-700">팀 이름</th>  
                    <th class="py-3 px-4 font-medium text-gray-700">승</th>
                    <th class="py-3 px-4 font-medium text-gray-700">무</th>
                    <th class="py-3 px-4 font-medium text-gray-700">패</th>
                    <th class="py-3 px-4 font-medium text-gray-700">승점</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="team" items="${rankedTeams}" varStatus="status">
                    <tr class="border-b hover:bg-gray-50">
                        <td class="py-3 px-4">${status.index + 1}</td>
                        <td class="py-3 px-4 font-medium text-gray-900">${team.teamName}</td>                      
                        <td class="py-3 px-4">${team.wins}</td>
                        <td class="py-3 px-4">${team.draws}</td>
                        <td class="py-3 px-4">${team.losses}</td>
                        <td class="py-3 px-4">${team.points}</td>
                    </tr>
                </c:forEach>
            </tbody>
            <span><i class="fa-solid fa-futbol"></i> 승 - 승점 3점 /  무 - 승점 1점 /  패 - 승점 0점</span>
        </table>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
