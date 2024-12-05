<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="수정" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<%@ include file="/WEB-INF/jsp/common/toastUiEditorLib.jsp" %>


<!-- input name은 폼을 제출할 때 서버로 전송, 서버에서는 이 id를 사용하여 어떤 게시글을 수정할 것인지 판단 -->
<section class="px-auto py-8">
    <div class="max-w-4xl mx-auto p-6 bg-white rounded-lg shadow-md">
        <form action="/usr/team/doModify" method="post" enctype="multipart/form-data" onsubmit="submitForm(this); return false;">
            <input name="id" type="hidden" value="${team.id}" />
            <div class="table-box">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr>
                            <th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">팀명</th>
                            <td class="py-2 px-4">
                                <input type="text" name="teamName" value="${team.teamName}" class="border p-2 rounded w-full" />
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">지역</th>
                            <td class="py-2 px-4">
                                <input type="text" name="region" value="${team.region}" class="border p-2 rounded w-full" />
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">슬로건</th>
                            <td class="py-2 px-4">
                                <input type="text" name="slogan" value="${team.slogan}" class="border p-2 rounded w-full" />
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center py-2 px-4 font-medium text-gray-700 bg-gray-100">팀 사진</th>
                            <td class="py-2 px-4">
                                <input name="teamImage" type="file" accept="image/*" class="border p-2 rounded w-full" />
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="text-right mt-4">
                <button type="submit" class="px-6 py-2 bg-stone-500 text-white rounded hover:bg-stone-600 transition">수정</button>
            </div>
        </form>
    </div>
</section>


<!-- input의 name은 doModify에 있는 id,title, body를 의미한다. -->

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
