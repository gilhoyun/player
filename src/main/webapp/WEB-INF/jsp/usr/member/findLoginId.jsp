<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="아이디 찾기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	const findLoginId = async function() {
		let inputName = $("input[name='name']");
		let inputEmail = $("input[name='email']");
		
		let inputNameTrim = inputName.val(inputName.val().trim());
		let inputEmailTrim = inputEmail.val(inputEmail.val().trim());
		
		if (inputNameTrim.val().length == 0) {
			alert('이름을 입력해주세요');
			inputName.focus();
			return;
		}
		
		if (inputEmailTrim.val().length == 0) {
			alert('이메일을 입력해주세요');
			inputEmail.focus();
			return;
		}

		const rs = await doFindLoginId(inputNameTrim.val(), inputEmailTrim.val());

		if (rs) {
			alert(rs.resultMsg);
			if (rs.success) {
				location.replace("login");
			} else {
				inputName.val('');
				inputEmail.val('');
				inputName.focus();
			}
		}
	}
	
	const doFindLoginId = function(name, email) {
		return $.ajax({
			url : '/usr/member/doFindLoginId',
			type : 'GET',
			data : {
				name : name,
				email : email
			},
			dataType : 'json'
		})
	}
</script>

<section class="px-auto py-8 mt-5">
    <div class="max-w-2xl mx-auto p-8 bg-white rounded-xl shadow-lg">
        <div class="space-y-6">
            <!-- 이름 입력 -->
            <div>
                <label for="name" class="block text-lg font-semibold text-gray-700">이름</label>
                <input class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200" 
                       type="text" name="name" id="name" placeholder="이름을 입력해주세요." />
            </div>

            <!-- 이메일 입력 -->
            <div>
                <label for="email" class="block text-lg font-semibold text-gray-700">이메일</label>
                <input class="border-2 p-3 rounded-md w-full focus:ring-2 focus:ring-blue-500 transition duration-200" 
                       type="text" name="email" id="email" placeholder="이메일을 입력해주세요." />
            </div>

            <!-- 아이디 찾기 버튼 -->
            <div class="flex justify-end mt-6">
                <button onclick="findLoginId();"
                        class="px-6 py-3 bg-stone-600 text-white rounded-lg hover:bg-stone-700 focus:outline-none focus:ring-2 focus:ring-stone-500 transition duration-300">
                    아이디 찾기
                </button>
            </div>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>