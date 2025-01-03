<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	const loginForm_onSubmit = function(form) { // 아이디, 비밀번호 입력하지 않으면 alert로 알려주기(공백검증)
		form.loginId.value = form.loginId.value.trim();
		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginId.value == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus(); // 커서 다시 아이디로 이동
			return;
		}

		if (form.loginPw.value == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus(); // 커서 다시 비밀번호로 이동
			return;
		}

		form.submit(); //입력한게 있을 때 실행(form에 있는게 그대로 전송)

	}//form은 밑의 form의 this이다., value는 값이기 때문에 변수취급 할 수 있다.
</script>

<section class="px-auto py-8">
	<div class="max-w-2xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<div class="mb-8 mt-5 text-center">
			<h2 class="font-light text-3xl leading-[120%]">언제든지 풋살 하고 싶을 땐</h2>
			<h2 class="font-bold text-3xl text-stone-400">PLAYER</h2>
		</div>
		<form action="doLogin" method="post"
			onsubmit="loginForm_onSubmit(this); return false;">
			<div class="table-box">
				<table class="w-full text-left border-collapse">
					<thead>
						<label class="input input-bordered flex items-center gap-2 my-10">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
								fill="currentColor" class="h-4 w-4 opacity-70">
    <path
									d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
  </svg> <input type="text" name="loginId" placeholder="LOGINID" />
						</label>
						<label class="input input-bordered flex items-center gap-2 my-10">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
								fill="currentColor" class="h-4 w-4 opacity-70">
    <path fill-rule="evenodd"
									d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z"
									clip-rule="evenodd" />
  </svg> <input type="text" name="loginPw" placeholder="PASSWORD" />
						</label>
						<tr>
							<td colspan="2">
								<button
									class="w-full text-center px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-500 transition">로그인</button>
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</form>
		<div class="mt-4 flex justify-center">
			<div>
				<a class="" href="findLoginId">아이디</a>/ <a class=""
					href="findLoginPw">비밀번호 찾기</a>
			</div>
		</div>
		<div class="my-6 flex items-center">
			<hr class="flex-grow border-t border-gray-300" />
			<span class="px-4 text-gray-500 text-sm">소셜 로그인</span>
			<hr class="flex-grow border-t border-gray-300" />
		</div>
		<div class="mt-4 flex justify-center space-x-4">
			<a href="/usr/kakao/login"> <img
				src="https://i0.wp.com/forhappywomen.com/wp-content/uploads/2018/11/%EC%82%B0%EB%B6%80%EC%9D%B8%EA%B3%BC-%ED%8F%AC%ED%95%B4%ED%94%BC%EC%9A%B0%EB%A8%BC-%EB%AC%B8%EC%9D%98-%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%94%8C%EB%9F%AC%EC%8A%A4%EC%B9%9C%EA%B5%AC-%EB%B2%84%ED%8A%BC.png?resize=586%2C586&ssl=1"
				alt="카카오 로그인 버튼"
				class="w-10 h-10 object-cover hover:opacity-80 transition" />
			</a> <a href="/usr/naver/login"> <img
				src="https://blog.kakaocdn.net/dn/bU1uVm/btqGsLHK8Ha/ndkom6FPH3Ld5BXtGd7pt0/img.png"
				alt="네이버 로그인 버튼"
				class="w-10 h-10 object-cover hover:opacity-80 transition" />
			</a>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>