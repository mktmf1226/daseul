<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->
<style>
	.leftcontent, .rightcontent, .box {
		border:1px solid black;
	}
	.leftcontent div, .rightcontent {
		padding:10px;
	}
	.clickInfo {
		text-align: center;
		margin: 10px;
		color: #000000;
		animation-name: blink;
		animation-duration: 3s;
		animation-iteration-count: infinite;
	}
	@keyframes blink {
		50% {opacity: 0;}
	}
</style>

<div class="title">
	<h3 style="text-align: center;">티켓 예매내역</h3>
</div>
<div></div>

<div class="leftcontent" style="float:left; width:15%; margin-right:5%; height:100%;">
   <div><b>${s_m_id}</b> 님</div>
   <div><a href="/mypage/memberupdateG">회원 정보 수정</a></div>
   <div class="box">
      <div><b>MY티켓</b>
         <div><a href="/mypage/myticket">- 예매 확인 / 취소</a></div>   
      </div>
      <div><b>MY상품</b>
         <div><a href="/mypage/myproduct">- 상품 구매내역</a></div>   
         <div><a href="#">- 나의 문의내역</a></div>
      </div>
      <div><b>좋아요</b>
         <div><a href="/mypage/mylike">- 관심 공연 / 관심 상품</a></div>
      </div>
      <div><b>MY쿠폰 / MY포인트</b>
         <div><a href="/couponDetail/detail">- 보유 쿠폰</a></div>
         <div><a href="/pointDetail/detail">- 보유 포인트</a></div>
      </div>
   </div>

</div><!-- leftcontent end -->


<div class="rightcontent" style="float:right; width:80%; height:100%;"> 
	<div></div>
	<div class="myticketList">
		<p class="clickInfo">상세내역을 보고싶으시면 예매번호를 클릭해주세요!</p>
		<table class="table table-hover">
			<tr>
				<th>예매번호</th>
				<th style="width:40%">공연 이름</th>
				<th>수량</th>
				<th>최종 결제금액</th>
				<th>결과 상태</th>
			</tr>
			<c:forEach var="row" items="${list}" varStatus="vs">
			<tr>
				<td><a href="/mypage/myticket/${row.tck_num}">${row.tck_num}</a></td>
				<td>${row.title}</td>
				<td>${row.cnt}</td>
				<td>${row.total_price}</td>
				<td>${row.stus}</td>
			</tr>
			</c:forEach>
		</table>
	</div>

	<!-- 페이징 시작 -->
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
			
			<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
			<c:if test="${startPage > 1}">
				<a href="/mypage/myticket?pageNum=${startPage-1}">[이전]</a>
			</c:if>

			<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${pageNum == i}">
						<span style="font-weight: bold">${i}</span>
					</c:when>
					<c:when test="${pageNum != i}">
						<a href="/mypage/myticket?pageNum=${i}">${i}</a>
					</c:when>
				</c:choose>
			</c:forEach>

			<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
			<c:if test="${endPage < pageCount}">
				<a href="/mypage/myticket?pageNum=${startPage+5}">[다음]</a>
			</c:if>
	</c:if>
	</div>	



</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>