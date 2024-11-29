<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${pageTitle}- PLAYER</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- DaisyUI -->
<link
	href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css"
	rel="stylesheet" type="text/css" />

<!-- jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

<!-- Custom CSS -->
<link rel="stylesheet" href="/resource/common.css" />
</head>
<body class="bg-white text-gray-900">
	<!-- Navigation Bar -->
	<header class="bg-stone-400 text-white">
		<nav
			class="container mx-auto px-32 py-4 flex justify-between items-center">
			<div class="flex items-center">
				<a href="${pageContext.request.contextPath}/"
					class="text-xl font-bold hover:text-gray-200 transition">
					PLAYER </a>
			</div>

			<div class="flex items-center space-x-4">
				<!-- Home Icon -->
				<a href="${pageContext.request.contextPath}/"
					class="hover:text-gray-200 transition"> <svg
						xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
						viewBox="0 0 24 24" stroke="currentColor">
    <path stroke-linecap="round" stroke-linejoin="round"
							stroke-width="2"
							d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
</svg>
				</a>

				<!-- Board Links -->
				<a
					href="${pageContext.request.contextPath}/usr/article/list?boardId=1"
					class="hover:underline">공지사항</a> <a
					href="${pageContext.request.contextPath}/usr/article/list?boardId=2"
					class="hover:underline">자유</a>

				<!-- User Authentication & Profile Menu -->
				<div class="dropdown dropdown-end">
					<div tabindex="0" role="button"
						class="btn btn-ghost btn-circle avatar">
						<div class="w-10 rounded-full">
							<c:choose>
								<c:when test="${rq.getLoginedMemberId() != -1}">
									<img src="/path/to/default/avatar.jpg" alt="User Avatar" />
								</c:when>
								<c:otherwise>
									<svg xmlns="http://www.w3.org/2000/svg" fill="none"
										viewBox="0 0 24 24" stroke="currentColor"
										class="text-gray-600">
                                        <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<ul tabindex="0"
						class="menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-100 rounded-box w-52 text-black">
						<c:choose>
							<c:when test="${rq.getLoginedMemberId() == -1}">
								<li><a
									href="${pageContext.request.contextPath}/usr/member/login">Login</a></li>
								<li><a
									href="${pageContext.request.contextPath}/usr/member/join">Join</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="${pageContext.request.contextPath}/usr/member/myPage">My
										Page</a></li>
								<li><a
									href="${pageContext.request.contextPath}/usr/member/doLogout">Logout</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>


	<!-- Main Content Area -->
	<main class="container mx-auto">
		<!-- Your page-specific content will go here -->
	</main>

	<!-- Optional Footer -->
</body>
</html>