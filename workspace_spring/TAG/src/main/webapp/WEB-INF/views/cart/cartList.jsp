<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700;800;900&family=Mulish:wght@200;300;400;500;600;700;800;900;1000&display=swap" rel="stylesheet">

<style>

/* 전체 가로 너비 */
.container {max-width: 1350px; !important;} 

/* 상품 테이블 전체박스 */
#product_box {
  width: 355px;
  padding: 0 25px 0 25px;
  --padding-right: 50px;
  padding-bottom: 70px;
}


/* 좋아요, 카트 hover 되면 보이게 */
#cart{display: none;}


/* 상품마다 밑에 라인넣기 */
#list_line{
  padding-top: 28px;
  border-bottom: 1px solid black;
}

/* 상품 이름 밑에 여백주기 */
#product_price{margin-top: 3px;}


/* 바디 전체 폰트 설정 */
body {
  font-family: 'Jost', sans-serif;
  letter-spacing: 0.25px;
}

/* 링크 컬러 */
a{color: black; !important;}

/* 상품명 위에 공연명 */
#concert_name {
  font-size: 13px;
  margin-bottom: 3px;
  font-weight: 300;
}

/* 상품명 */
#product_name{font-size: 18px;}

/* 제목 (Merchandise) */
h2{
  font-size: 60px; !important;
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
  padding: 50px 0 70px 0;
}

/* 검색기능 오른쪽으로 */
#product_search {float: right;}

/* 최신순 카테고리 오른쪽으로 */
#catergory {float: right;}

/* aside 네비바 큰 카테고리 (All, Concert) */
h3{
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
}

/* 선택박스(최신순, 인기순, 좋아요순) 디자인 */
select {
  width: 80px;
  border: none; 
  border-bottom: 2px solid black;
  font-size: 14px;
}

/* aside 네비바 텍스트 디자인 */
#pro_name {
  border: none; 
  border-bottom: 2px solid black;
}

/* aisde 네비바 큰 카테고리 밑에 여백 */
.h3_title{padding-bottom: 10px;}

/* 검색기능까지 영역 아래 여백 */
#intro_wrap{padding-bottom: 70px;}

/* ul 점 제거 */
ul{
  list-style:none;
  margin:0px; padding:0px;
  font-size: 20px;
}

   
/* 상품 이미지 꽉차게 */
img{object-fit: contain;}


/* 네비바 + 상품 전체 영역 */
.list_container {
  width: 100%;
  margin: 0 auto;
  --background-color: lightgrey;
}

.list_container:after {  /* after를 이용하여 float해제하기 */
  display: block;
  clear: both;
  content: '';
}


/* 상품의 네비바 영역 */
.list_aside {
  background-color: lightblue;
  position: sticky;
  --top: 80;
  width: 30%;
  height: 70%;
  --padding-top: 20px;
  margin-bottom: 20px;
  float: right;
}

/* 상품 영역 */
.list_content {
  background-color: lightgreen;
  width: 70%;
  --padding-top: 20px;
  margin-bottom: 20px;
  float: left;
}
 
/* 푸터 */
.footer {
    clear: both;
}

/* Go to top */
#myBtn {
  position: fixed;
  bottom: 10px;
  right: 10px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  color: black;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
  background: transparent;
}
#myBtn:hover {color: #B3B6B7;}


/* 상품마다 화살표 아이콘 띄우기 */
#arrow-icon {display: none;}
#product_box:hover #arrow-icon {display: block;}

/* 상품안에 아이콘 */
.product-imageandicon {
  width: 100%;
  position: relative;
}
.product-image img{
  width: 100%;
  vertical-align: middle;
}
.heart-icon{
  display: none;
  position: absolute;
  top: 10px;
  left: 0px;
}

.cart-icon{
  display: none;
  position: absolute;
  top: 11px;
  right: 0px;
}

#product_box:hover .heart-icon {display: block;}
#product_box:hover .cart-icon {display: block;}





.order-arrow {color: #D7DBDD;}
.order-check{font-weight: 400;}



  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }

</style>


<script>
/* Go to top */
function scrollFunction() {
	let mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	$('html, body').animate({scrollTop:0}, '200');
}//scrollFunction() end



function musicCategory(){
	var category = $('#category').val();
	alert(category);
}//musicCategory() end




function categoryList() {
	var category = $('#category').val();
	alert(category);
	
	
}


</script>



<!-- 본문영역 -->
<h2>Shopping Bag</h2>

<div class="order-check">
<span> 01 LIST CHECK </span> <span class="order-arrow"> &nbsp; > &nbsp; </span> 
<span> 02 ORDER </span> <span class="order-arrow"> &nbsp; > &nbsp; </span>  
<span> 03 ORDER CONFIRM </span> 
</div>

<button onclick="topFunction()" id="myBtn" title="Go to top" style="font-size: 26px;">Go to top ↑</button>

<div class="wrapAll">
	
		<!-- intro_wrap 시작 -->
		<div id="intro_wrap">
		    
			 
		</div><!-- intro_wrap 끝 -->	
		
		
		
		<!-- list_container 시작 -->
		<div class="list_container">
		
			<!-- list_aside 시작 -->
			<div class="list_aside">
				list_aside list_aside list_aside list_aside

				<div class="li_title">
				        
				        
				</div><!-- li_title 끝 -->
			</div><!-- list_aside 끝 -->
			
			
			<!-- list_content 시작 -->
			<div class="list_content">
				<table>
					<thead>
					  <tr>
					    <th>상품정보</th><th>가격</th><th>수량</th><th>배송비</th>
					  </tr>
					</thead>
 					<tbody>
				      <tr>
				        <td>Lorem</td><td>Ipsum</td><td>Dolor</td><td>Dolor</td>
				      </tr>
				      <tr>
				        <td>Lorem</td><td>Ipsum</td><td>Dolor</td><td>Dolor</td>
				      </tr>
				    </tbody>
				</table>   
				
										
					

					
				<div style="width: 100%; display: block; text-align: center;">	
					<c:if test="${requestScope.count > 0}">
						<c:set var="pageCount" value="${requestScope.totalPage}" />
						<c:set var="startPage" value="${requestScope.startPage}" />
						<c:set var="endPage" value="${requestScope.endPage}" />
				
				
							<!-- endPage는 10단위이기에 총 페이지가 end 페이지보다 작으면 그 수를 대입한다 -->
							<!-- 즉, 만약 최종 페이지 수가 22라면 30까지 표시할 필요가 없으니 엔드 페이지 수를 22로 맞춘다 -->
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>
				
				
							<c:if test="${category == null}">
				
								<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
								<c:if test="${startPage > 1}">
									<a href="/list.do?pageNum=${startPage-1}">[이전]</a>
								</c:if>
					
								<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${pageNum == i}">
											<span style="font-weight: bold">${i}</span>
										</c:when>
										<c:when test="${pageNum != i}">
											<a href="/list.do?pageNum=${i}">${i}</a>
										</c:when>
									</c:choose>
								</c:forEach>
					
								<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
								<c:if test="${endPage < pageCount}">
									<a href="/list.do?pageNum=${startPage+10}">[다음]</a>
								</c:if>
							
							</c:if>
							
							
							
							<c:if test="${category != null}">
								
								<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
								<c:if test="${startPage > 1}">
									<a href="/list.do?category=${category}&pageNum=${startPage-1}">[이전]</a>
								</c:if>
					
								<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${pageNum == i}">
											<span style="font-weight: bold">${i}</span>
										</c:when>
										<c:when test="${pageNum != i}">
											<a href="/list.do?category=${category}&pageNum=${i}">${i}</a>
										</c:when>
									</c:choose>
								</c:forEach>
					
								<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
								<c:if test="${endPage < pageCount}">
									<a href="/list.do?category=${category}&pageNum=${startPage+10}">[다음]</a>
								</c:if>
							</c:if>
							
							
							
							
					</c:if>
				</div>	
						
			</div><!-- list_content -->
		</div><!-- list_container -->

</div><!-- wrapAll end -->

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>