<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="비밀번호 확인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
const checkPwForm_onSubmit = async function(form) {
form.loginPw.value = form.loginPw.value.trim();

if (form.loginPw.value.length == 0) {
alert('비밀번호를 입력해주세요');
form.loginPw.focus();
return;
}

let member = await getMemberById();
let inputLoginPw = await encryptSHA256(form.loginPw.value);

if (member.data.loginPw != inputLoginPw) {
alert('비밀번호가 일치하지 않습니다');
form.loginPw.value = '';
form.loginPw.focus();
return;
}

form.submit();
}

const getMemberById = function() {
return $.ajax({
url : '/usr/member/getMemberById',
type : 'GET',
dataType : 'json'
})
}

async function encryptSHA256(input) {
const encoder = new TextEncoder(); // 입력 문자열을 UTF-8 바이트로 인코딩
const data = encoder.encode(input);

// SHA-256 해싱
const hash = await crypto.subtle.digest("SHA-256", data);

// 해싱 결과를 16진수 문자열로 변환
return Array.from(new Uint8Array(hash))
.map(byte => byte.toString(16).padStart(2, '0')) // 각 바이트를 16진수로 변환
.join('');
}
</script>

<section class="px-auto py-8">
    <div class="max-w-2xl mx-auto p-8 bg-white rounded-xl shadow-lg">
        <form action="doCheckPw" method="post" onsubmit="checkPwForm_onSubmit(this); return false;">
            <div class="space-y-6">
                <div class="flex items-center justify-between">
                    <label for="loginPw" class="text-lg font-semibold text-gray-700">비밀번호 확인</label>
                </div>
                <div>
                    <input class="input input-bordered w-full p-4 border-2 border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500 transition duration-200"
                           type="password" name="loginPw" placeholder="비밀번호를 입력해주세요" />
                </div>
                <div class="flex justify-end mt-6">
                    <button type="submit" class="px-6 py-3 bg-stone-600 text-white rounded-lg hover:bg-stone-700 focus:outline-none focus:ring-2 focus:ring-stone-500 transition duration-300">
                        확인
                    </button>
                </div>
            </div>
        </form>
        <div class="w-9/12 mx-auto mt-4 text-sm text-gray-500 flex justify-between">
            <!-- 추가적인 텍스트나 링크가 필요한 경우 여기에 작성할 수 있습니다. -->
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>