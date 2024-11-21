<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 테일윈드CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!--데이지UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<!-- JQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<!-- Common css -->
<link rel="stylesheet" href="/resource/common.css" />


</head>

<body>
	<div
		class="flex justify-between items-center p-4 bg-stone-400 text-white px-32">
		<div>
			<a href="${pageContext.request.contextPath}/"
				class="text-xl font-bold">PLAYER</a>
		</div>

		<ul class="flex space-x-4">
		 <li>
    <a href="${pageContext.request.contextPath}/"
				class="hover:underline">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-5 w-5"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor">
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
      </svg>
    </a>
  </li><a href="${pageContext.request.contextPath}/usr/article/list?boardId=1" class="hover:underline">공지사항</a></li>
  </li><a href="${pageContext.request.contextPath}/usr/article/list?boardId=2" class="hover:underline">자유</a></li>
			<c:if test="${rq.getLoginedMemberId() == -1 }">
				<li><a href="${pageContext.request.contextPath}/usr/member/login" class="hover:underline">LOGIN</a></li>
				<li><a href="${pageContext.request.contextPath}/usr/member/join" class="hover:underline">JOIN</a></li>
			</c:if>	
			<c:if test="${rq.getLoginedMemberId() != -1 }">	
				<li><a href="${pageContext.request.contextPath}/usr/member/doLogout" class="hover:underline">LOGOUT</a></li>
			</c:if>
		</ul>
	</div>

	<section class="py-5 px-32">
		<div>
			<h1 class="text-2xl font-semibold">${pageTitle }페이지</h1>
		</div>
	</section>