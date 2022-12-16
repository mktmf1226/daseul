<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<! doctype html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	
	<!--  오류악마
	<link rel="shortcut icon" href="favicon.png">  
	-->

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

	<script src="/js/jquery-3.4.1.min.js"></script>
	<script src="/js/jquery.cookie.js"></script>

	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/animate.min.css">
	<link rel="stylesheet" href="/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="/css/aos.css">
	<link rel="stylesheet" href="/css/style.css">

	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.animateNumber.min.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/jquery.fancybox.min.js"></script>
	<script src="/js/jquery.sticky.js"></script>
	<!-- <script src="/js/aos.js"></script> -->
	<!-- <script src="/js/custom.js"></script> -->
	
	<!-- 스마트에디터 -->
	<!-- <script src="/js/ckeditor/ckeditor.js"></script> -->

	<title>TAG : Ticket And Goods</title>
</head>

<body>

	<div class="search-form" id="search-form">
		<form action="">
			<input type="search" class="form-control" placeholder="Enter keyword to search...">
			<button class="button">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<a href=""><path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/></a>
					<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
				</svg>
			</button>
			<button class="button">
				<div class="close-search">
					<span class="icofont-close js-close-search"></span>
				</div>
			</button>

		</form>
	</div>

	<div class="site-mobile-menu">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>



	<nav class="site-nav mb-5">
		<div class="sticky-nav js-sticky-header">

			<div class="container position-relative">
				<div class="site-navigation text-center dark">
					<a href="/home" class="logo menu-absolute m-0" style="font-size:20px;">TAG</a>

					<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
						<li class="active"><a href="home">HOME</a></li>
						<li class="has-children">
							<a href="/concert">공연</a>
							<ul class="dropdown">
								<li><a href="#">전체보기</a></li>
								<li><a href="#">랭킹</a></li>

							</ul>
						</li>
						<li class="has-children">
							<a href="#" onclick="location.href='/list.do'">굿즈</a>
							<ul class="dropdown">
								<li><a href="checkout.html">전체보기</a></li>
								<li><a href="elements.html">인기상품</a></li>
								
								<li class="has-children">
									<a href="#">카테고리</a>
									<ul class="dropdown">
										<li><a href="#">의류</a></li>
										<li><a href="#">포스터</a></li>
										<li><a href="#">음반</a></li>
										<li><a href="#">잡화</a></li>
									</ul>
								</li>
							</ul>
						</li>
						
						<li class="has-children">
							<a href="shop.html">공연장</a>
							<ul class="dropdown">
								<li><a href="#">YES24 라이브홀</a></li>
								<li><a href="#">세종문화회관 대극장</a></li>
								<li><a href="#">블루스퀘어 마스터카드홀</a></li>
							</ul>
						</li>

						
						<li><a href="shop.html">공지사항</a></li>
						
					</ul>




					<!-- 네비바 -->
					<div class="menu-icons">
						
						<!-- 검색 -->
						<a href="#" class="btn-custom-search" id="btn-search">
							<svg width="22" height="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9118)">
							<path d="M21 21L16.6569 16.6569M16.6569 16.6569C18.1046 15.2091 19 13.2091 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19C13.2091 19 15.2091 18.1046 16.6569 16.6569Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9118">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
							</svg>
						</a>
	
						<!-- 프로필 -->
						<c:choose>
							<c:when test="${mem_grade == 'B'}">		<!-- 일반 회원 -->
								<a href="/mypage/mypageG" class="user-profile">
									<svg width="23" height="23" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_429_9074)">
									<path d="M3.99988 18C3.99988 15.7908 5.79074 14 7.99988 14H15.9999C18.209 14 19.9999 15.7908 19.9999 18V18C19.9999 19.1045 19.1044 20 17.9999 20H5.99988C4.89531 20 3.99988 19.1045 3.99988 18V18Z" stroke="#292929" stroke-width="1.5" stroke-linejoin="round"/>
									<circle cx="11.9999" cy="6.99997" r="3" stroke="#292929" stroke-width="1.5"/>
									</g>
									<defs>
									<clipPath id="clip0_429_9074">
									<rect width="24" height="24" fill="white"/>
									</clipPath>
									</defs>
									</svg>
								</a>
							</c:when>
							
							<c:when test="${mem_grade == 'S'}">		<!-- 판매자 회원 -->
								<a href="/mypageS" class="user-profile">
									<svg width="23" height="23" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_429_9074)">
									<path d="M3.99988 18C3.99988 15.7908 5.79074 14 7.99988 14H15.9999C18.209 14 19.9999 15.7908 19.9999 18V18C19.9999 19.1045 19.1044 20 17.9999 20H5.99988C4.89531 20 3.99988 19.1045 3.99988 18V18Z" stroke="#292929" stroke-width="1.5" stroke-linejoin="round"/>
									<circle cx="11.9999" cy="6.99997" r="3" stroke="#292929" stroke-width="1.5"/>
									</g>
									<defs>
									<clipPath id="clip0_429_9074">
									<rect width="24" height="24" fill="white"/>
									</clipPath>
									</defs>
									</svg>
								</a>
							</c:when>
							
							<c:when test="${mem_grade == null}">	<!-- 로그인으로 이동 -->
								<a href="/loginForm" class="user-profile">
									<svg width="23" height="23" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_429_9074)">
									<path d="M3.99988 18C3.99988 15.7908 5.79074 14 7.99988 14H15.9999C18.209 14 19.9999 15.7908 19.9999 18V18C19.9999 19.1045 19.1044 20 17.9999 20H5.99988C4.89531 20 3.99988 19.1045 3.99988 18V18Z" stroke="#292929" stroke-width="1.5" stroke-linejoin="round"/>
									<circle cx="11.9999" cy="6.99997" r="3" stroke="#292929" stroke-width="1.5"/>
									</g>
									<defs>
									<clipPath id="clip0_429_9074">
									<rect width="24" height="24" fill="white"/>
									</clipPath>
									</defs>
									</svg>
								</a>
							</c:when>
						</c:choose>
					

						<a href="#" class="user-profile">
							<svg width="23" height="23" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9074)">
							<path d="M3.99988 18C3.99988 15.7908 5.79074 14 7.99988 14H15.9999C18.209 14 19.9999 15.7908 19.9999 18V18C19.9999 19.1045 19.1044 20 17.9999 20H5.99988C4.89531 20 3.99988 19.1045 3.99988 18V18Z" stroke="#292929" stroke-width="1.5" stroke-linejoin="round"/>
							<circle cx="11.9999" cy="6.99997" r="3" stroke="#292929" stroke-width="1.5"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9074">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
							</svg>
						</a>

						
						
						
						<!-- 좋아요 하트 -->
						<a href="cart.html" class="like">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9297)">
							<path d="M19.0711 13.1421L13.4142 18.799C12.6332 19.58 11.3668 19.58 10.5858 18.799L4.92894 13.1421C2.97632 11.1895 2.97632 8.02369 4.92894 6.07106C6.88157 4.11844 10.0474 4.11844 12 6.07106C13.9526 4.11844 17.1185 4.11844 19.0711 6.07106C21.0237 8.02369 21.0237 11.1895 19.0711 13.1421Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9297">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
							</svg>
						</a>
						
						
						
						
						<!-- 장바구니 아이콘 -->
						<a href="/cart" class="cart">
							<!-- <span class="item-in-cart">2</span> --><!-- 장바구니 담으면 뜨는 숫자 -->
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9132)">
							<path d="M4 9H20L19.1654 18.1811C19.0717 19.2112 18.208 20 17.1736 20H6.82643C5.79202 20 4.92829 19.2112 4.83464 18.1811L4 9Z" stroke="#292929" stroke-width="1.5" stroke-linejoin="round"/>
							<path d="M8 11V8C8 5.79086 9.79086 4 12 4C14.2091 4 16 5.79086 16 8V11" stroke="#292929" stroke-width="1.5" stroke-linecap="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9132">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
							</svg>					
						</a>
						
						
						
						<!-- 로그인 하지 않은 상태 -->
						<c:if test="${mem_grade == null}">
							<a href="/loginForm">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9095)">
							<path d="M9 4.00024H19V18.0002C19 19.1048 18.1046 20.0002 17 20.0002H9" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M12 15.0002L15 12.0002M15 12.0002L12 9.00024M15 12.0002H5" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9095">
							<rect width="24" height="24" fill="white" transform="translate(0 0.000244141)"/>
							</clipPath>
							</defs>
							</svg>
							</a>
						</c:if>
						
						<!-- 로그인 한 상태 -->
						<c:if test="${mem_grade != null}">
							<a href="/logout.do">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9096)">
							<path d="M15 4.00098H5V18.001C5 19.1055 5.89543 20.001 7 20.001H15" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							<path d="M16 15.001L19 12.001M19 12.001L16 9.00098M19 12.001H9" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9096">
							<rect width="24" height="24" fill="white" transform="translate(0 0.000976562)"/>
							</clipPath>
							</defs>
							</svg>
							</a>
						</c:if>

					</div>

					<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
						<span></span>
					</a>

				</div>
			</div>
		</div>
	</nav>
	
	<!-- 헤더 끝 -->
	
	
	<!-- <div class="owl-carousel owl-single"> -->
  		<!-- <div class="untree_co-section" style="padding-top:55px;"> -->
    		<div class="container" style="padding-top:100px; max-width: 1350px;">
      		<!-- 	<div class="align-items-center"> -->
        	
        	
	
	
	
	