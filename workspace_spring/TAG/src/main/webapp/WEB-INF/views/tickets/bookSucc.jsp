<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700;800;900&family=Mulish:wght@200;300;400;500;600;700;800;900;1000&display=swap" rel="stylesheet">

<!-- 본문영역 -->

<style>
table{border-collapse:collapse;}

/* 상품 테이블 전체박스 */
#product_box {
width: 300px;
padding-left: 30px;
padding-bottom: 40px;
}

/* 좋아요, 카트 hover 되면 보이게 */
#cart{display: none;}

/* 상품마다 밑에 라인넣기 */
#list_line{
padding-top: 25px;
border-bottom: 1px solid black;
}

/* 상품 이름 밑에 여백주기 */
#product_price{margin-top: 3px;}


body {
font-family: 'Jost', sans-serif;
letter-spacing: 0.25px;
}

#concert_name {
font-size: 13px;
margin-bottom: 3px;
font-weight: 300;
}

#product_name{
font-size: 18px;
}


#pro_name {
border: none; 
border-bottom: 2px solid black;
}

   
img{
object-fit: contain;
}

/* 링크 컬러 */
a{color: black; !important;}

.goProductBtn {
font-size:18px; 
border:solid; 
padding:10px 20px; 
--margin-top:20px;
--margin-left:710px;
border-radius: 20px 20px 20px 20px;
}


</style>



<div style="text-align: center;">
	<h6 style="text-align:center; margin-top:80px;">티켓 결제가 완료되었습니다.</h6>
	<h1 style="color:#33FF33; text-align:center; margin-top:20px;">NEW! 굿즈 할인 쿠폰이 발급되었습니다.</h1>
	<div class="content" style="display:none;">
		<dl>
			<dd>${msg1}</dd>
		</dl>
		<p>
			${content1}
		</p>
		<p>
			${content2}
			${couponDetail.issue_date}
		</p>
	</div>
	<div class="couponArea" style="display:inline-block; background-image: url('/images/Bc.png'); background-size:contain; box-shadow: 0 8px 18px -7px rgba(0,0,0,1); height:300px; width:600px; margin:50px 0 100px 0; padding:0; text-align:left; ">
		<p class="concertName">${couponDetail.c_no}</p>
		<p class="dateOfIssue">Date of Issue : ${couponDetail.issue_date}</p>
		<p class="EXP">EXP : ${couponDetail.exp_date}</p>
	</div><!-- couponArea end -->
</div>


<!-- 상품 List 시작 -->
<table>
	<tr style="border-bottom:1px solid;">
		<td colspan='3' style="margin:30px; padding-bottom:10px;">
			<a href="/listConcert?c_no=${couponDetail.c_no}">${couponDetail.c_no} 관련된 굿즈</a>
		</td>
	</tr>
	<tr>
		<div>
			<!-- varStatus 상태용 변수 -->
			<c:forEach items="${list}" var="row" varStatus="vs">
			<a href="detail/${row.pro_no}">

			<td id="product_box" style="padding-top:20px;">
			
				<!-- 상품 이미지 -->
				<c:choose>
					<c:when test="${row.postername != '-'}">
					
					<div class="product-imageandicon">
					
						<!-- 하트 아이콘 -->
						<span class="heart-icon">
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
						</span>

						<!-- 장바구니 아이콘 -->
						<span class="cart-icon">
							<svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
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
						</span>
						
						<div class="product-image">
							<a href="detail/${row.pro_no}"><img src="/storage/${row.postername}" width="300px" height="400px"></a>
						</div>
					</div>
					</c:when>
					
					<c:otherwise>
						등록된 사진 없음!! <br>
					</c:otherwise>
				</c:choose> 
				
				
				<!-- 공연명 -->
				<div id="concert_name">
					<a href="#">PREP LIVE IN SEOUL</a>
				</div>
				
				<!-- 상품명 -->
				<div id="product_name">
					<a href="detail/${row.pro_no}">${row.pro_name}</a>
				</div>
	
				<!-- 가격 -->
				<div id="product_price">
				￦ <fmt:formatNumber value="${row.price}" pattern="#,###" />
					<span style="float: right;">
					<a href="detail/${row.pro_no}">
						<svg id="arrow-icon" width="45px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26.56 15.5">
						<defs>
						<style>.cls-1{fill:none;stroke:#231f20;stroke-miterlimit:10;stroke-width:1px;}</style>
						</defs>
						<g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1">
						<line class="cls-1" y1="7.75" x2="26.03" y2="7.75"/>
						<polyline class="cls-1" points="18.55 15.23 26.03 7.75 18.55 0.27"/>
						</g>
						</g>
						</svg>
						</a>
					</span>
					
				</div>
				
				<div id="cart" >좋아요 카트</div>
				<div id="list_line"></div>
			</td>
			</a>
			<!-- 테이블 한줄에 5칸씩 -->
			<c:if test="${vs.count mod 3==0}">
				<tr><tr>
			</c:if>
			</c:forEach>
			</div>
	</tr>
	<tr>
		<td colspan='3' style="text-align:right;">
			<!-- 공연별 상품 페이지 링크 -->
			<a class="goProductBtn" href="/listConcert?c_no=${couponDetail.c_no}">할인대상 굿즈 보러가기</a>
		</td>
	</tr>
</table>   
<!-- 상품 List 끝 -->
<br><br><br>

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>