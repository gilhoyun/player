<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
  const loginForm_onSubmit = function(form){ // 아이디, 비밀번호 입력하지 않으면 alert로 알려주기(공백검증)
	  form.loginId.value = form.loginId.value.trim();
	  form.loginPw.value = form.loginPw.value.trim();
	  
	  if(form.loginId.value == 0){
		  alert('아이디를 입력해주세요.');
		  form.loginId.focus(); // 커서 다시 아이디로 이동
		  return;
	  }
	  
	  if(form.loginPw.value == 0){
		  alert('비밀번호를 입력해주세요.');
		  form.loginPw.focus(); // 커서 다시 비밀번호로 이동
		  return;
	  }
	  
	  form.submit(); //입력한게 있을 때 실행(form에 있는게 그대로 전송)
	  
  }//form은 밑의 form의 this이다., value는 값이기 때문에 변수취급 할 수 있다.

</script>


<section class="px-auto py-8 ">
	<div class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow-md">
		<form action="doLogin" method="post" onsubmit="loginForm_onSubmit(this); return false;">
			<div class="table-box">
				<table class="w-full text-left border-collapse">
					<thead>
						<tr class="border-b">
							<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">아이디</th>
							<td class="p-4"><input type="text" name="loginId" placeholder="아이디를 입력해주세요"/></td>
						</tr>
						<tr class="border-b">
							<th class="text-center p-4 font-medium text-gray-700 bg-gray-100">비밀번호</th>
							<td class="p-4"><input type="text" name="loginPw" placeholder="비밀번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<td class="text-center  px-4 py-2 bg-stone-400 text-white rounded hover:bg-stone-600 transition" colspan="2">
							<button>로그인</button>
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</form>
		<div class="mt-6 text-right flex justify-between ">
			<button onclick="history.back();"
				class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-500 transition">뒤로가기</button>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>
