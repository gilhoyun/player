<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="비밀번호 찾기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<script>
	const findLoginPw = async function() {
		let inputLoginId = $("input[name='loginId']");
		let inputEmail = $("input[name='email']");
		
		let inputLoginIdTrim = inputLoginId.val(inputLoginId.val().trim());
		let inputEmailTrim = inputEmail.val(inputEmail.val().trim());
		
		if (inputLoginIdTrim.val().length == 0) {
			alert('아이디를 입력해주세요');
			inputLoginId.focus();
			return;
		}
		
		if (inputEmailTrim.val().length == 0) {
			alert('이메일을 입력해주세요');
			inputEmail.focus();
			return;
		}

		$('#findBtn').prop('disabled', true);
		$('#loading').show();
		
		const rs = await doFindLoginPw(inputLoginIdTrim.val(), inputEmailTrim.val());

		if (rs) {
			alert(rs.resultMsg);
			$('#loading').hide();
			$('#findBtn').prop('disabled', false);
			if (rs.success) {
				location.replace("login");
			} else {
				inputLoginId.val('');
				inputEmail.val('');
				inputLoginId.focus();
			}
		}
	}
	
	const doFindLoginPw = function(loginId, email) {
		return $.ajax({
			url : '/usr/member/doFindLoginPw',
			type : 'GET',
			data : {
				loginId : loginId,
				email : email
			},
			dataType : 'json'
		})
	}
</script>

<section class="px-auto py-8 mt-5">
    <div class="max-w-2xl mx-auto p-8 bg-white rounded-xl shadow-lg">
        <div class="space-y-6">
            <!-- 아이디 입력 -->
            <div>
                <label for="loginId" class="block text-lg font-semibold text-gray-700">아이디</label>
                <input class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200"
                       type="text" name="loginId" id="loginId" placeholder="아이디를 입력해주세요." />
            </div>

            <!-- 이메일 입력 -->
            <div>
                <label for="email" class="block text-lg font-semibold text-gray-700">이메일</label>
                <input class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200"
                       type="text" name="email" id="email" placeholder="이메일을 입력해주세요." />
            </div>

            <!-- 비밀번호 찾기 버튼 -->
            <div class="flex justify-end mt-6">
                <button id="findBtn" onclick="findLoginPw();"
                        class="px-6 py-3 bg-stone-600 text-white rounded-lg hover:bg-stone-700 focus:outline-none focus:ring-2 focus:ring-stone-500 transition duration-300">
                    비밀번호 찾기
                </button>
            </div>

            <!-- 로딩 상태 -->
            <div id="loading" class="mt-2 hidden text-center">
                <div class="spinner-border animate-spin inline-block w-6 h-6 border-4 border-solid border-gray-200 border-t-gray-600 rounded-full"></div>
                <p class="mt-2 text-gray-500">작업을 처리 중입니다. 잠시만 기다려주세요...</p>
            </div>
        </div>
    </div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>