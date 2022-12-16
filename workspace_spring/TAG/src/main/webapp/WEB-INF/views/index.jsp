<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>


<! doctype html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<meta name="description" content="" />
	<meta name="keywords" content="" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/style.css">

	<title>TAG : Ticket And Goods</title>
	
	
</head>

<body>

	<div class="search-form" id="search-form">
		<form action="">
			<input type="search" class="form-control" placeholder="Enter keyword to search...">
			<button class="button">
				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
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
					<a href="home" class="logo menu-absolute m-0" style="font-size:20px;">TAG</a>

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
								<li><a href="#" onclick="location.href='/list.do'">전체보기</a></li>
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

						
						<li><a href="/notice/list">공지사항</a></li>
						
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
							<a href="#" onclick="location.href='loginForm'">
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
							<a href="#" onclick="location.href='logout.do'">
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


	<div class="owl-carousel owl-single home-slider">
		<div class="item">
			<div class="untree_co-hero" style="background-image: url('images/헤더3.jpg');">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6">

							<h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">HARRY STYLES LOVE ON TOUR 2023 - Live in Seoul</h1>
							<div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
							</div>

							<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">Ticketing now</a></p>

						</div>
					</div>
				</div>
			</div> <!-- /.untree_co-hero -->
		</div>


		<div class="item">
			<div class="untree_co-hero" style="background-image: url('images/헤더2.jpg');">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6">

							<h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">Conan Gray Live in Seoul</h1>
							<div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200">
							</div>

							<p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="#" class="btn btn-outline-black">Ticketing now</a></p>

						</div>
					</div>
				</div>
			</div> <!-- /.untree_co-hero -->
		</div>
		
	</div>



<!-- 

	<div class="untree_co-section">
		<div class="container">


			<div class="deal-hero overlay" style="background-image: url('images/헤더3.jpg')"> 
				<div class="deal-contents">
					<span class="subtitle">해리 스타일스 첫 내한공연</span>
					<h2 class="title mb-4"><a href="#">HARRY STYLES LOVE ON TOUR 2023 - Live in Seoul</a></h2>
					<p class="mb-5">※ 본 공연은 가상계좌 입금 마감 시간이 예매 당일 23시 29분이오니, 무통장 입금 선택 예매 시 착오 없으시기 바랍니다.<br>
									※ 본 공연은 네이버 쿠폰이 적용되지 않습니다.<br>
									※ 라이브네이션 선예매는 무통장입금이 불가합니다. </p>
					<a href="#" class="btn btn-black">Ticketing Now</a>
				</div>
			</div>
		</div>
	</div>

 
	<div class="untree_co-section">
		<div class="container">

			<div class="row">
				<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							<div class="label new top-right">
								<div class='content'>New</div>
							</div>

							
							<img src="images/products/jacket-1-min.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Dark Jacket</a></h3>
						<div class="price">
							<span>Â£69.00</span>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<div class="label new top-right">
								<div class='content'>New</div>
							</div>

							<div class="label sale top-right second">
								<div class='content'>Sale</div>
							</div>
							<img src="images/products/bottoms-1-min.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Chino Bottoms</a></h3>
						<div class="price">
							<del>Â£99.00</del> &mdash; <span>Â£69.00</span>
						</div>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<img src="images/products/shoe-1-min.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Brown Shoe</a></h3>
						<div class="price">
							<span>Â£29.00</span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">

					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<img src="images/products/sock-1-min.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">The Modern Sock</a></h3>
						<div class="price">
							<span>Â£29.00</span>
						</div>
					</div>

				</div>
				<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">

					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<div class="label sale top-right">
								<div class='content'>Sale</div>
							</div>
							<img src="images/products/sweater-2-min.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Double Knit Sweater</a></h3>
						<div class="price">
							<del>Â£99.00</del> &mdash; <span>Â£69.00</span>
						</div>
					</div>


				</div>
				<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">

					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<div class="label sale top-right">
								<div class='content'>Sale</div>
							</div>
							<img src="images/products/watch-1-min.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">The Murray</a></h3>
						<div class="price">
							<del>Â£99.00</del> &mdash; <span>Â£69.00</span>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


	<div class="container">


		<div class="deal-hero overlay" style="background-image: url('images/hero-slider-3-min.jpg')"> 
			<div class="deal-contents">
				<span class="subtitle">Limited Offers 20% OFF</span>
				<h2 class="title mb-4"><a href="#">Summer Promo</a></h2>
				<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum fuga incidunt laboriosam voluptas iure, delectus dignissimos facilis neque nulla earum.</p>
				<a href="#" class="btn btn-black">Shop Now</a>
			</div>
		</div>

	</div>
-->
<br>
	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h2 class="h3">Tickets</h2>        
				</div>
				<div class="col-sm-6 carousel-nav text-sm-right">
					<a href="#" class="prev js-custom-prev-v2">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
							<path fill-rule="evenodd" d="M8.354 11.354a.5.5 0 0 0 0-.708L5.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z"/>
							<path fill-rule="evenodd" d="M11.5 8a.5.5 0 0 0-.5-.5H6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5z"/>
						</svg>
					</a>
					<a href="#" class="next js-custom-next-v2">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
							<path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
							<path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
						</svg>
					</a>
				</div>
			</div> <!-- /.heading -->
			<div class="owl-3-slider owl-carousel">
				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							<img src="images/페더엘리에스.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Love in Seoul 2022 : Peder Elias</a></h3>
						<div class="price">
							<span>￦99,000</span>
						</div>
					</div>
				</div> <!-- /.item -->


				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							
							<img src="images/크리스토퍼.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Love in Seoul 2022 : Christoper </a></h3>
						<div class="price">
							<span>￦110,000</span>
						</div>
					</div>
				</div> <!-- /.item -->


				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							<img src="images/존케이.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Love in Seoul 2022 : John K</a></h3>
						<div class="price">
							<span>￦88,000</span>
						</div>
					</div>
				</div> <!-- /.item -->

				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<img src="images/콜바넴.jpg" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Love in Seoul 2022 : Call me by your name</a></h3>
						<div class="price">
							<span>￦132,000</span>
						</div>
					</div>
				</div> <!-- /.item -->
				
			</div>
		</div> <!-- /.container -->
	</div> <!-- /.untree_co-section -->  


	<div class="untree_co-section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
					<h2 class="h3">Goods</h2>        
				</div>
				<div class="col-sm-6 carousel-nav text-sm-right">
					<a href="#" class="prev js-custom-prev-v2">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
							<path fill-rule="evenodd" d="M8.354 11.354a.5.5 0 0 0 0-.708L5.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z"/>
							<path fill-rule="evenodd" d="M11.5 8a.5.5 0 0 0-.5-.5H6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5z"/>
						</svg>
					</a>
					<a href="#" class="next js-custom-next-v2">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
							<path fill-rule="evenodd" d="M7.646 11.354a.5.5 0 0 1 0-.708L10.293 8 7.646 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
							<path fill-rule="evenodd" d="M4.5 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
						</svg>
					</a>
				</div>
			</div> <!-- /.heading -->
			<div class="owl-3-slider owl-carousel">
				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							<img src="images/카세트.png" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Harry's house</a></h3>
						<div class="price">
							<span>￦46,000</span>
						</div>
					</div>
				</div> <!-- /.item -->


				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							
							<img src="images/티셔츠.png" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Harry Styles FINE LINE : T-shirt</a></h3>
						<div class="price">
							<span>￦35,000</span>
						</div>
					</div>
				</div> <!-- /.item -->


				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">

							<img src="images/티셔츠2.png" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Harry Styles LOVE ON TOUR 2020 : T-shirt</a></h3>
						<div class="price">
							<span>￦34,000</span>
						</div>
					</div>
				</div> <!-- /.item -->

				<div class="item">
					<div class="product-item">
						<a href="shop-single.html" class="product-img">
							<img src="images/음반.png" alt="Image" class="img-fluid">
						</a>
						<h3 class="title"><a href="#">Watermelon sugar - LP</a></h3>
						<div class="price">
							<span>￦58,000</span>
						</div>
					</div>
				</div> <!-- /.item -->
				
			</div>
		</div> <!-- /.container -->
	</div> <!-- /.untree_co-section -->  






	<div class="untree_co-section bg-light">
		<div class="container">
			<div class="row align-items-stretch">
				<div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-0">
					<div class="feature h-100">
						<div class="icon mb-4">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-truck" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5v7h-1v-7a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .5.5v1A1.5 1.5 0 0 1 0 10.5v-7zM4.5 11h6v1h-6v-1z"/>
								<path fill-rule="evenodd" d="M11 5h2.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5h-1v-1h1a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4.5h-1V5zm-8 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
								<path fill-rule="evenodd" d="M12 13a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
							</svg>
						</div>
						<h3>공연 할인 정보</h3>
						<p style="font-size:12px;">장애인·국가 유공자 30% 할인</p>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-0">
					<div class="feature h-100">
						<div class="icon mb-4">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-shield-lock" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z"/>
								<path d="M9.5 6.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
								<path d="M7.411 8.034a.5.5 0 0 1 .493-.417h.156a.5.5 0 0 1 .492.414l.347 2a.5.5 0 0 1-.493.585h-.835a.5.5 0 0 1-.493-.582l.333-2z"/>
							</svg>
						</div>
						<h3>이용 안내</h3>
						<p style="font-size:12px;">
								평일 09:00~18:00 / 토요일 09:00~17:00 <br>
								(점심시간: 12:00~13:00 / 일요일, 공휴일 휴무)</p>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-4 mb-3 mb-md-0">
					<div class="feature h-100">
						<div class="icon mb-4">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-counterclockwise" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" d="M12.83 6.706a5 5 0 0 0-7.103-3.16.5.5 0 1 1-.454-.892A6 6 0 1 1 2.545 5.5a.5.5 0 1 1 .91.417 5 5 0 1 0 9.375.789z"/>
								<path fill-rule="evenodd" d="M7.854.146a.5.5 0 0 0-.708 0l-2.5 2.5a.5.5 0 0 0 0 .708l2.5 2.5a.5.5 0 1 0 .708-.708L5.707 3 7.854.854a.5.5 0 0 0 0-.708z"/>
							</svg>
						</div>
						<h3>판매 상담 및 계약 </h3>
						<p style="font-size:12px;">
							담당자와 공연 판매 대행 관련 상담 및 계약을 진행합니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->

	<div class="site-footer">


		<div class="container">
		<!-- 
			<div class="row justify-content-between">
				 
				<div class="col-lg-5">
					<div class="widget mb-4">
						  <h3 class="mb-2">About UntreeStore</h3>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate modi cumque rem recusandae quaerat at asperiores beatae saepe repudiandae quam rerum aspernatur dolores et ipsa obcaecati voluptates libero</p>
						 -->
					<!-- 
					</div>
					<div class="widget">
						
						<h3>Join our mailing list and receive exclusives</h3>
						<form action="#" class="subscribe">
							<div class="d-flex">
								<input type="email" class="form-control" placeholder="Email address">
								<input type="submit" class="btn btn-black" value="Subscribe">
							</div>
						</form>	
									
					</div>
				</div>
				-->	
<!-- 				
				<div class="col-lg-2">
					<div class="widget">
						<h3>Help</h3> 
						<ul class="list-unstyled">
							<li><a href="#">Contact us</a></li>
							<li><a href="#">Account</a></li>
							<li><a href="#">Shipping</a></li>
							<li><a href="#">Returns</a></li>
							<li><a href="#">FAQ</a></li>   
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="widget">
						<h3>About</h3>
						<ul class="list-unstyled">
							<li><a href="#">About us</a></li>
							<li><a href="#">Press</a></li>
							<li><a href="#">Careers</a></li>
							<li><a href="#">Team</a></li>
							<li><a href="#">FAQ</a></li>   
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="widget">
						<h3>Shop</h3>
						<ul class="list-unstyled">
							<li><a href="#">Store</a></li>
							<li><a href="#">Gift Cards</a></li>
							<li><a href="#">Student Discount</a></li>
						</ul>
					</div>
				</div>
				
			</div>
-->
<!-- 
			<div class="row mt-5">
				<div class="col-12 text-center">
					<ul class="list-unstyled social">
						<li><a href="#"><span class="icon-facebook"></span></a></li>
						<li><a href="#"><span class="icon-instagram"></span></a></li>
						<li><a href="#"><span class="icon-linkedin"></span></a></li>
						<li><a href="#"><span class="icon-twitter"></span></a></li>
					</ul>
				</div>
 -->
				<div class="col-12 copyright">
					<p>CONTACT US 
						<br>+84 02.6255.8002</p> 
						<hr>
					<p style="color:#b3b3b3; font-weight:100;">
					Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved.<!-- License information: https://untree.co/license/ -->
					</p>

				</div>
			</div>
		</div> <!-- /.container -->
	</div> <!-- /.site-footer -->
	
<br>
<br>

	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/custom.js"></script>
	
</body>

</html>
