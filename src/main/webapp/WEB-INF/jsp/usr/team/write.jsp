<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <select name="region" id="regionSelect" class="border p-2 rounded w-full" required>
                            <option value="">지역을 선택하세요</option>
                            <c:forEach items="${regions}" var="region">
                                <option value="${region}">${region}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="py-2 px-4 font-medium text-gray-700 bg-gray-100 text-center">구장</th>
                    <td class="py-2 px-4">
                        <select name="stadium" id="stadiumSelect" class="border p-2 rounded w-full" required>
                            <option value="">구장을 선택하세요</option>
                        </select>
                        <input type="hidden" name="fullStadiumName" id="fullStadiumName">
                    </td>
                </tr>
                <!-- Rest of the form remains the same -->
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

<script>
    // JSON 데이터를 JavaScript 객체로 안전하게 파싱
    const stadiumsByRegion = JSON.parse('<c:out value="${stadiumsByRegion}" escapeXml="false"/>');
    
    document.getElementById('regionSelect').addEventListener('change', function() {
        const region = this.value;
        const stadiumSelect = document.getElementById('stadiumSelect');
        const fullStadiumNameInput = document.getElementById('fullStadiumName');
        
        // 구장 선택 옵션 초기화
        stadiumSelect.innerHTML = '<option value="">구장을 선택하세요</option>';
        fullStadiumNameInput.value = '';
        
        if (region && stadiumsByRegion[region]) {
            // 선택된 지역의 풋살장 목록을 표시
            stadiumsByRegion[region].forEach(stadiumInfo => {
                const option = document.createElement('option');
                option.value = stadiumInfo.name;
                option.textContent = stadiumInfo.name;
                option.dataset.fullName = stadiumInfo.fullName;
                stadiumSelect.appendChild(option);
            });
        }
    });

    // 구장 선택 시 전체 이름 저장
    document.getElementById('stadiumSelect').addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        const fullStadiumNameInput = document.getElementById('fullStadiumName');
        
        if (selectedOption && selectedOption.dataset.fullName) {
            fullStadiumNameInput.value = selectedOption.dataset.fullName;
        } else {
            fullStadiumNameInput.value = '';
        }
    });
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>