<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="매치 상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class=" py-8">
    <!-- Match Details Section -->
    <div class="max-w-5xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
        <!-- Match Title -->
        <div class="p-6 border-b border-gray-200">
            <h1 class="text-2xl font-bold text-gray-800">
                ${matching.stadium}
            </h1>
            <p class="text-gray-600 mt-2">
                ${matching.matchDate} <!-- 2024년 12월 30일 월요일 20:00 -->
            </p>
        </div>

        <!-- Match Image -->
        <div class="p-6">
            <img src="${matching.imgUrl}" alt="Stadium Image" class="w-full h-60 object-cover rounded-lg">
        </div>

        <!-- Match Info Grid -->
        <div class="p-6 grid grid-cols-2 gap-6">
            <div class="space-y-4">
                <!-- Match Type -->
                <div class="flex items-center">
                    <div class="w-24 text-gray-600">매치 형태</div>
                    <div class="flex-1">
                        <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
                            ${matching.playerCount}
                        </span>
                    </div>
                </div>

                <!-- Gender -->
                <div class="flex items-center">
                    <div class="w-24 text-gray-600">성별</div>
                    <div class="flex-1">
                        <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
                            ${matching.genderInKorean}
                        </span>
                    </div>
                </div>

                <!-- Field Type -->
                <div class="flex items-center">
                    <div class="w-24 text-gray-600">구장 정보</div>
                    <div class="flex-1">
                        <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
                            ${matching.stadium}
                        </span>
                    </div>
                </div>
            </div>

            <div class="space-y-4">
                <!-- Time -->
                <div class="flex items-center">
                    <div class="w-24 text-gray-600">시간</div>
                    <div class="flex-1">
                        <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
                            20~30분
                        </span>
                    </div>
                </div>

                <!-- Location -->
                <div class="flex items-center">
                    <div class="w-24 text-gray-600">위치</div>
                    <div class="flex-1">
                        <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
                            ${matching.region}
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Price Section -->
        <div class="p-6 bg-gray-50 border-t border-gray-200">
            <div class="flex justify-between items-center">
                <div class="text-lg font-semibold">참가비 유무</div>
                <div class="text-xl font-bold">11,000원 <span class="text-sm text-gray-600">/ 1인당</span></div>
            </div>
        </div>

        <!-- Action Button -->
        <div class="p-6 flex justify-end">
            <button class="px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors">
                신청하기
            </button>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
