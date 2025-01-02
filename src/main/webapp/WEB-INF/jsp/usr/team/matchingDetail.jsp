<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="매치 상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="py-8">
	<div
		class="max-w-5xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
		<!-- Image Carousel -->
		<div class="relative h-80 bg-gray-100">
			<img src="${matching.imgUrl}" alt="Stadium Image"
				class="w-full h-full object-cover">
		</div>

		<!-- Match Info -->
		<div class="p-6">
			<div class="mb-6">
				<h1 class="text-2xl font-bold text-gray-800">${matching.stadium}</h1>
				<div class="flex items-center">
					<p class="text-gray-600">축구 매치</p>
					<div class="flex items-center gap-4 ml-4">
						<span class="text-sm text-gray-500"> <i
							class="fas fa-clock mr-2"></i> ${matching.matchDate.substring(0, 10)}
							${matching.dayOfWeek}
						</span>
					</div>
				</div>
			</div>

			<!-- Match Details Grid -->
			<div class="grid grid-cols-2 gap-6 mb-6">
				<div class="space-y-4">
					<div class="flex items-center">
						<div class="w-20 text-gray-600">매치 형태</div>
						<div class="flex-1">
							<span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
								${matching.playerCount} </span>
						</div>
					</div>
					<div class="flex items-center">
						<div class="w-20 text-gray-600">성별</div>
						<div class="flex-1">
							<span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
								${matching.genderInKorean} </span>
						</div>
					</div>
					<div class="flex items-center">
						<div class="w-20 text-gray-600">구장 정보</div>
						<div class="flex-1">
							<span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
								${matching.stadium} </span>
						</div>
					</div>
				</div>

				<div class="space-y-4">
					<div class="flex items-center">
						<div class="w-20 text-gray-600">시간</div>
						<div class="flex-1">
							<span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
								20~30분 </span>
						</div>
					</div>
					<div class="flex items-center">
						<div class="w-20 text-gray-600">위치</div>
						<div class="flex-1">
							<span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
								${matching.region} </span>
						</div>
					</div>
					<div class="flex items-center">
						<div class="w-20 text-gray-600">결제 유무</div>
						<div class="flex-1">
							<span class="px-3 py-1 bg-gray-100 rounded-full text-sm">
								${matching.payAtName != null ? matching.payAtName : "결제 방법 정보가 없습니다."}
							</span>
						</div>
					</div>
				</div>
				<div>
					<i class="fa-solid fa-futbol"></i>
					<p style="display: inline; margin-left: 8px;"text-gray-600"">신청
						후 자세한 내용은 사이트 내 채팅을 이용해 주세요.</p>
				</div>
			</div>


			<div class="mt-6">
				<button
					class="w-full bg-stone-400 text-white py-3 rounded-lg hover:bg-stone-500 transition-colors">
					신청하기</button>
			</div>

			<!-- Stadium Detail Content -->
			<div class="mt-6">
				<h2 class="text-xl font-bold text-gray-800">구장 정보</h2>
				<p class="text-gray-600 mt-4 whitespace-pre-line">
					${matching.detailContent}</p>
			</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>