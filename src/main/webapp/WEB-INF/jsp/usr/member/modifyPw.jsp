<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="비밀번호 확인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
const modifyPwForm_onSubmit = async function(form) {
form.loginPw.value = form.loginPw.value.trim();
form.loginPwChk.value = form.loginPwChk.value.trim();

if (form.loginPw.value.length == 0) {
alert('변경할 비밀번호를 입력해주세요');
form.loginPw.focus();
return;
}

if (form.loginPw.value != form.loginPwChk.value) {
alert('비밀번호가 일치하지 않습니다');
form.loginPw.value = '';
form.loginPw.focus();
return;
}

form.submit();
}
</script>

<section class="py-8 bg-gray-50">
    <div class="max-w-3xl mx-auto p-8 bg-white rounded-xl shadow-lg">
        <form action="doModifyPw" method="post" onsubmit="modifyPwForm_onSubmit(this); return false;">
            <div class="space-y-6">
                <!-- 변경할 비밀번호 입력 -->
                <div class="flex items-center justify-between">
                    <label for="loginPw" class="text-lg font-semibold text-gray-700">변경할 비밀번호</label>
                </div>
                <div>
                    <input class="input input-bordered w-full p-4 border-2 border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500 transition duration-200"
                           type="password" name="loginPw" id="loginPw" placeholder="변경할 비밀번호를 입력해주세요" />
                </div>
                
                <!-- 비밀번호 확인 입력 -->
                <div class="flex items-center justify-between">
                    <label for="loginPwChk" class="text-lg font-semibold text-gray-700">비밀번호 확인</label>
                </div>
                <div>
                    <input class="input input-bordered w-full p-4 border-2 border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500 transition duration-200"
                           type="password" name="loginPwChk" id="loginPwChk" placeholder="비밀번호 확인을 입력해주세요" />
                </div>

                <!-- 확인 버튼 -->
                <div class="flex justify-end mt-6">
                    <button type="submit" class="px-6 py-3 bg-stone-400 text-white rounded-lg hover:bg-stone-500 focus:outline-none focus:ring-2 focus:ring-stone-500 transition duration-300">
                        확인
                    </button>
                </div>
            </div>
        </form>
    </div>
</section>


<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>