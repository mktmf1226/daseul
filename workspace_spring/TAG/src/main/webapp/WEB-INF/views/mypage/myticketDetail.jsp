<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->
<style>
	table {border-collapse:collapse;}

	.leftcontent, .box {
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
	
	.clearfix::after {
	  content: "";
	  display: block;
	  clear: both;
	}
	
	.myticketDetail ol{
		text-align:right; 
		list-style:none; 
		padding-right:15px; 
		padding-top:15px; 
		padding-bottom:15px; 
		font-size:18px; 
		font-weight:bold;
	}
	
	.bill{
		padding-left:40px;
		padding-right:200px;
	}
	
	.topLine{
		border-top: 1.5px solid black;
	}
	
	.alignRight{
		text-align:right;
	}
	
	.paddingBottom{
		padding-bottom:40px;
	}
	
</style>
<div class="clearfix">
<div class="title">
	<h3 style="text-align: center;">티켓 예매 상세</h3>
</div>

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


<div class="rightcontent" style="float:right; width:80%;">
	<div class="myticketDetail">
		<h1 style="width:40px; padding-left:40px;">PREP LIVE IN SEOUL</h1>
		<div class="bill">
			<table class="table table-hover">
			<tr>
				<th colspan='2' class="alignRight">주문번호 : 20221019-11240005</th>
			</tr>
			<tr class="topLine">
				<th>티켓 좌석번호</th>
				<th></th>
			</tr>
			<tr>
				<td>R석 1층 스탠딩 B구역 입장번호 50</td>
				<td class="alignRight">88,000원</td>
			</tr>
			<tr>
				<td>R석 1층 스탠딩 B구역 입장번호 51</td>
				<td class="alignRight">77,000원</td>
			</tr>			
			<tr class="topLine paddingBottom">
				<th class="paddingBottom">총 수량</th>
				<td class="alignRight">2매</td>
			</tr>
			<tr><td> </td><td> </td></tr>
			<tr class="topLine">
				<th class="paddingBottom">주문 금액</th>
				<td class="alignRight">165,000원</td>
			</tr>	
			<tr>
				<th>할인 금액</th>
				<td class="alignRight">-3,000원</td>
			</tr>	
			<tr>
				<td class="paddingBottom"></td>
				<td class="alignRight">국가유공자 할인 1매, 장애인 할인 2매</td>
			</tr>					
			<tr><td> </td><td> </td></tr>
			<tr class="topLine">
				<th>배송비</th>
				<td class="alignRight">3,000원</td>
			</tr>
			<tr><td> </td><td> </td></tr>
			<tr class="topLine">
				<th class="paddingBottom">최종 결제금액</th>
				<td class="alignRight">165,000원</td>
			</tr>	
			<tr><td> </td><td> </td></tr>
			<tr class="topLine">
				<th>받는사람</th>
				<td>이강선</td>
			</tr>	
			<tr>
				<th>핸드폰번호</th>
				<td>010-5456-3425</td>
			</tr>
			<tr>
				<th>받는주소</th>
				<td>서울시 강남구 삼원타워 4층</td>
			</tr>
			<tr>
				<th class="paddingBottom">배송메세지</th>
				<td>빨리주세요</td>
			</tr>	
			<tr><td> </td><td> </td></tr>
			<tr class="topLine">
				<th class="paddingBottom">결과상태</th>
				<td>배송완료</td>
			</tr>					
			</table>
		</div>
	</div><!-- myticketDetail end -->
</div><!-- rightcontent end -->
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>