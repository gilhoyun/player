<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	let validLoginId = null;

	const joinForm_onSubmit = function(form) {
		form.loginId.value = form.loginId.value.trim();
		form.loginPw.value = form.loginPw.value.trim();
		form.loginPwChk.value = form.loginPwChk.value.trim();
		form.name.value = form.name.value.trim();

		if (!form.loginId.value) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			return false;
		}

		if (form.loginId.value != validLoginId) {
			alert('사용불가능한 아이디입니다.');
			form.loginId.value = '';
			form.loginId.focus();
			return false;
		}

		if (!form.loginPw.value) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return false;
		}

		if (!form.loginPwChk.value) {
			alert('비밀번호 확인을 입력해주세요.');
			form.loginPwChk.focus();
			return false;
		}

		if (form.loginPw.value !== form.loginPwChk.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPw.value = '';
			form.loginPwChk.value = '';
			form.loginPw.focus();
			return false;
		}

		if (!form.name.value) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return false;
		}

		if (!form.email.value) {
			alert('이메일을 입력해주세요.');
			form.email.focus();
			return false;
		}

		if (!form.profileImage.value) {
			alert('프로필 사진을 업로드해주세요.');
			form.profileImage.focus();
			return false;
		}

		return true;
	};

	const loginIdDupChk = function(el) {
		el.value = el.value.trim();

		let loginIdDupChkMsg = $('#loginIdDupChkMsg');

		if (!el.value) {
			loginIdDupChkMsg.removeClass('text-green-500');
			loginIdDupChkMsg.addClass('text-red-500');
			loginIdDupChkMsg.html('아이디는 필수 입력 정보입니다');
			return;
		}

		$.ajax({
			url : '/usr/member/loginIdDupChk',
			type : 'GET',
			data : {
				loginId : el.value
			},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					loginIdDupChkMsg.removeClass('text-red-500');
					loginIdDupChkMsg.addClass('text-green-500');
					loginIdDupChkMsg.text(data.resultMsg);
					validLoginId = el.value;
				} else {
					loginIdDupChkMsg.removeClass('text-green-500');
					loginIdDupChkMsg.addClass('text-red-500');
					loginIdDupChkMsg.text(data.resultMsg);
					validLoginId = null;
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
		<h1 class="text-3xl font-semibold text-center text-gray-800 mb-6">회원가입</h1>
		<form action="doJoin" method="post" enctype="multipart/form-data"
			onsubmit="return joinForm_onSubmit(this);">
			<div class="space-y-6">
				<!-- 아이디 -->
				<div>
					<label class="block font-medium text-gray-700">아이디</label>
					<input name="loginId" type="text"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none"
						placeholder="아이디를 입력해주세요." onblur="loginIdDupChk(this)" />
					<div id="loginIdDupChkMsg" class="mt-2 text-sm text-gray-500"></div>
				</div>

				<!-- 비밀번호 -->
				<div>
					<label class="block font-medium text-gray-700">비밀번호</label>
					<input name="loginPw" type="password"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none"
						placeholder="비밀번호를 입력해주세요." />
				</div>

				<!-- 비밀번호 확인 -->
				<div>
					<label class="block font-medium text-gray-700">비밀번호
						확인</label> <input name="loginPwChk" type="password"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none"
						placeholder="비밀번호를 다시 입력해주세요." />
				</div>

				<!-- 이름 -->
				<div>
					<label class="block font-medium text-gray-700">이름</label> <input
						name="name" type="text"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none"
						placeholder="이름을 입력해주세요." />
				</div>

				<!-- 이메일 -->
				<div>
					<label class="block font-medium text-gray-700">이메일</label>
					<input name="email" type="text"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none"
						placeholder="이메일을 입력해주세요." />
				</div>

				<!-- 프로필 사진 -->
				<div>
					<label class="block font-medium text-gray-700">프로필
						사진</label> <input name="profileImage" type="file" accept="image/*"
						class="mt-1 block w-full border-gray-300 rounded-lg shadow-sm focus:ring-0 focus:outline-none" />
				</div>
			</div>

			<!-- 가입 버튼 -->
			<div class="mt-8 text-center">
				<button type="submit"
					class="w-full py-3 bg-stone-400 text-white font-medium rounded-lg shadow-md hover:bg-stone-500 transition focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
					가입하기</button>
			</div>
		</form>
	</div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
