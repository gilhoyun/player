<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<script src="https://cdn.tailwindcss.com"></script>
<!-- 테일윈드CSS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- JQuery -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<!-- 폰트어썸 -->
<!-- Common css -->
<link rel="stylesheet" href="/resource/common.css" />

</head>

<body>
	<div class="flex justify-between items-center p-4 bg-stone-400 text-white px-32">
		<div>
			<a href="${pageContext.request.contextPath}/" class="text-xl font-bold">logo</a>
		</div>
		
		<ul class="flex space-x-4">
			<li><a href="${pageContext.request.contextPath}/" class="hover:underline">HOME</a></li>
			<li><a href="${pageContext.request.contextPath}/usr/article/list" class="hover:underline">LIST</a></li>
		</ul>
	</div>

	<section class="py-5 px-32">
		<div>
			<h1 class="text-2xl font-semibold">${pageTitle } 페이지</h1>
		</div>
	</section>