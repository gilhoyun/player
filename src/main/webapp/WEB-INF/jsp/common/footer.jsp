<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fixed Footer Example</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/daisyui"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1;
        }
    </style>
</head>
<body>
    <main>
        <div class="p-8">
            <p></p>
        </div>
    </main>
    <div class="bar bg-gray-700">
        <div class="footerWrap max-w-6xl mx-auto py-12 px-6">
            <div class="flex justify-between w-full"> 
                <div class="footerNav w-1/5">
                    <ul class="list-none">
                        <h3 class="text-lg font-bold text-white">팀</h3>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">팀 찾기</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">팀 리그</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">팀 매칭</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">구장 예약</a></li>
                    </ul>
                </div>
                <div class="footerNav w-1/5">
                    <ul class="list-none">
                        <h3 class="text-lg font-bold text-white">채팅</h3>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">채팅 목록</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">채팅방 생성</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">공지 알림</a></li>
                    </ul>
                </div>
                <div class="footerNav w-1/5">
                    <ul class="list-none">
                        <h3 class="text-lg font-bold text-white">게시글</h3>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">공지사항</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">자유 게시판</a></li>
                    </ul>
                </div>
                <div class="footerNav w-1/5">
                    <ul class="list-none">
                        <h3 class="text-lg font-bold text-white">서비스</h3>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">고객 지원</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">문의하기</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">개인정보처리방침</a></li>
                        <li><a href="#" class="text-sm text-gray-400 hover:text-white">이용 약관</a></li>
                    </ul>
                </div>
                <div class="company w-1/5">
                    <h2 class="text-xl font-bold text-white mb-3">
                        <a href="#" class="text-stone-300 italic border-b-2 border-orange-300">PLAYER</a>
                    </h2>
                    <p class="text-sm text-gray-400 mb-6">언제든지 풋살을 즐기고 싶을 땐, Player</p>
                    <div class="space-y-2">
                        <div class="text-sm text-gray-400">
                            <a href="#" class="hover:text-white">이용 약관</a> | 
                            <a href="#" class="hover:text-white">개인정보 처리방침</a> | 
                            <a href="#" class="hover:text-white">회사 소개</a>
                        </div>
                        <div class="text-xs text-gray-400">PLAYER | ooo시 00구 00로00 0000빌딩 0층 | 대표 메일 ooo@oooo.com</div>
                        <div class="text-xs text-gray-400">주식회사 ####컴퍼니 | 사업자번호 000-00-00000 | 대표 ooo </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
