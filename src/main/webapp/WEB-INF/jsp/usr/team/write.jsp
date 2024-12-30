<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="팀 매칭 등록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8">
    <div class="max-w-5xl mx-auto p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">팀 매칭 등록</h2>
        <form action="doWrite" method="post">
            <table class="w-full text-left border-collapse">
                <colgroup>
                    <col width="180">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">매칭 날짜</th>
                        <td class="py-2 px-4">
                            <input type="datetime-local" name="matchDate" class="border p-2 rounded w-full" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">지역</th>
                        <td class="py-2 px-4">
                            <input type="text" name="region" class="border p-2 rounded w-full" required placeholder="지역을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">구장</th>
                        <td class="py-2 px-4">
                            <input type="text" name="stadium" class="border p-2 rounded w-full" required placeholder="구장명을 입력하세요">
                        </td>
                    </tr>
                    <tr>
                        <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">경기 인원(? vs ?)</th>
                        <td class="py-2 px-4">
                            <input type="number" name="playerCount" class="border p-2 rounded w-full" required 
                                placeholder="경기 인원을 입력하세요" min="3" max="12" step="1">
                        </td>
                    </tr>
                    <tr>
                        <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">성별</th>
                        <td class="py-2 px-4">
                            <select name="gender" class="border p-2 rounded w-full" required>
                                <option value="MALE">남성</option>
                                <option value="FEMALE">여성</option>
                                <option value="MIXED">혼성</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">설명</th>
                        <td class="py-2 px-4">
                            <textarea name="description" class="border p-2 rounded w-full" rows="5" placeholder="추가 설명을 입력하세요"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="mt-4 text-right">
                <button type="submit" class="px-6 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition">등록</button>
            </div>
        </form>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>