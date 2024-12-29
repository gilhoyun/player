<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<c:set var="pageTitle" value="수정" />
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<%@ include file="/WEB-INF/jsp/common/toastUiEditorLib.jsp" %>

<section class="px-auto py-8">
    <div class="max-w-4xl mx-auto p-8 bg-white rounded-xl shadow-lg">
        <form action="/usr/team/doModify" method="post" enctype="multipart/form-data" onsubmit="submitForm(this); return false;">
            <input name="id" type="hidden" value="${team.id}" />
            <input name="existingTeamImage" type="hidden" value="${team.teamImage}" />

            <div class="space-y-6">
                <!-- 팀명 -->
                <div>
                    <label for="teamName" class="block text-lg font-semibold text-gray-700">팀명</label>
                    <input type="text" name="teamName" id="teamName" value="${team.teamName}" class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200" />
                </div>

                <!-- 지역 -->
                <div>
                    <label for="region" class="block text-lg font-semibold text-gray-700">지역</label>
                    <input type="text" name="region" id="region" value="${team.region}" class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200" />
                </div>

                <!-- 슬로건 -->
                <div>
                    <label for="slogan" class="block text-lg font-semibold text-gray-700">슬로건</label>
                    <input type="text" name="slogan" id="slogan" value="${team.slogan}" class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200" />
                </div>

                <!-- 팀 이미지 -->
                <div>
                    <label for="teamImage" class="block text-lg font-semibold text-gray-700">팀 이미지</label>
                    <input name="teamImage" type="file" accept="image/*" class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200" />
                </div>
            </div>

            <!-- 수정 버튼 -->
            <div class="text-right mt-6">
                <button type="submit" class="px-6 py-3 bg-stone-400 text-white rounded-lg hover:bg-stone-500 focus:outline-none focus:ring-2 focus:ring-stone-500 transition duration-300">
                    수정
                </button>
            </div>
        </form>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>