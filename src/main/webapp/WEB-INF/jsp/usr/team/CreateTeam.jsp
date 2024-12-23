<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	let validLoginId = null;

	const teamJoinForm_onSubmit = function(form) {
		form.teamName.value = form.teamName.value.trim();
		form.region.value = form.region.value.trim();
		form.slogan.value = form.slogan.value.trim();
		form.teamImage.value = form.teamImage.value.trim();

		if (!form.teamName.value) {
			alert('팀이름을 입력해주세요.');
			form.teamName.focus();
			return false;
		}

		if (!form.region.value) {
			alert('지역을 입력해주세요.');
			form.region.focus();
			return false;
		}

		if (!form.slogan.value) {
			alert('슬로건을 입력해주세요.');
			form.slogan.focus();
			return false;
		}

		if (!form.teamImage.value) {
			alert('팀 사진을 업로드해주세요.');
			form.teamImage.focus();
			return false;
		}

		return true;
	};

	const teamDupChk = function(el) {
		el.value = el.value.trim();

		let teaemDupChkMsg = $('#teaemDupChkMsg');

		if (!el.value) {
			teaemDupChkMsg.removeClass('text-green-500');
			teaemDupChkMsg.addClass('text-red-500');
			teaemDupChkMsg.html(`<span>팀이름은 필수 입력 정보입니다</span>`);
			return;
		}

		$.ajax({
			url : '/usr/team/teamDupChk',
			type : 'GET',
			data : {
				teamName : el.value
			},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					teamDupChk.removeClass('text-red-500');
					teamDupChk.addClass('text-green-500');
					teamDupChk.html(`<span>${data.resultMsg}</span>`);
					validTeamName = el.value;
				} else {
					teaemDupChkMsg.removeClass('text-green-500');
					teaemDupChkMsg.addClass('text-red-500');
					teaemDupChkMsg.html(`<span>${data.resultMsg}</span>`);
					validTeamName = null;
				}
			},
			error : function(xhr, status, error) {
				console.log('Error: ' + error);
			},
		});
	};
</script>

<section class="px-4 py-12">
	<div
		class="max-w-2xl mx-auto p-8 bg-white rounded-xl shadow-lg border border-gray-200">
		<h1 class="text-3xl font-semibold text-center text-gray-800 mb-6">팀
			창단</h1>
		<form action="doCreateTeam" method="post"
			enctype="multipart/form-data"
			onsubmit="return teamJoinForm_onSubmit(this);">
			<div class="space-y-6">
				<!-- 팀 이름 -->
				<div>
					<label class="block font-medium text-gray-700">팀 이름</label> <input
						name="teamName" type="text"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none p-2"
						placeholder="팀 이름을 입력해주세요." onblur="teamDupChk(this)" />
					<div id="teaemDupChkMsg" class="mt-2 text-sm text-gray-500"></div>
				</div>

				<!-- 지역 -->
				<div>
					<label class="block font-medium text-gray-700">지역</label> <input
						name="region" type="text"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none p-2"
						placeholder="지역을 입력해주세요." />
				</div>

				<!-- 슬로건 -->
				<div>
					<label class="block font-medium text-gray-700">슬로건</label> <input
						name="slogan" type="text"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none p-2"
						placeholder="슬로건을 입력해주세요." />
				</div>

				<!-- 팀 사진 -->
				<div>
					<label class="block font-medium text-gray-700">팀 사진</label> <input
						name="teamImage" type="file" accept="image/*"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none p-2" />
				</div>
			</div>

			<!-- 창단 버튼 -->
			<div class="mt-8 text-center">
				<button type="submit"
					class="w-full py-3 bg-stone-400 text-white font-medium rounded-lg shadow-md hover:bg-stone-500 transition focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
					창단하기</button>
			</div>
		</form>
	</div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
