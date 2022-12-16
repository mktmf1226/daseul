<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<!-- 본문 시작 -->
<style>
.leftcontent, .rightcontent, .box {border:1px solid black;}
.leftcontent div, rightcontent {padding:10px;}
</style>

<div class="title">
	<h3 style="text-align: center;">마이페이지</h3>
</div>
<div></div>

<div class="leftcontent" style="float:left; width:15%; margin-right:5%; height:100%;">
	<div><b>kangsun</b> 님</div>
	<div></div>
	<div><a href="/mypage/updateG">회원 정보 수정</a></div>
	<div></div>
	<div class="box">
		<div ><b>MY티켓</b>
			<div><a href="/mypage/myticket">- 예매 확인 / 취소</a></div>	
		</div>
		<div><b>MY상품</b></div>
			<div><a href="/mypage/myproduct">- 상품 구매내역</a></div>	
			<div><a href="#">- 나의 문의내역</a></div>	
		<div><b>좋아요</b></div>
		<div><a href="/mypage/mylike">- 관심 공연 / 관심 상품</a></div>
		<div><b>MY쿠폰 / MY포인트</b></div>
		<div><a href="/couponDetail/detail">- 보유 쿠폰</a></div>
		<div><a href="/pointDetail/detail">- 보유 포인트</a></div>
	</div>

</div><!-- leftcontent end -->



<div class="rightcontent" style="float:right; width:80%; height:100%;"> 
	<div class="detailTable">
		<table class="table table-hover">
				<tr class="info"> <!-- 배치 이상함 -->
					<th>보유 쿠폰
						<td>- 할인 쿠폰 : 0매</td>
						<td><b>- 만료 예정 쿠폰 : 1매</b></td> <!-- 빨간글씨로 -->
					</th>
					<th>보유 포인트
						<td>- 보유 포인트 : 900P</td>
						<td></td>
					</th>
				</tr>
		</table>
	</div>
	<div></div>
	<div>
		<p>최근 티켓 예매내역</p>
		<table class="table table-hover">
			<tr>
				<th>예매일</th>
				<th>예매번호</th>
				<th>공연명</th>
				<th>관람일시</th>
				<th>매수</th>
				<th>예매상태</th>
			</tr>
			<tr>									<!-- 데이터 넣기 -->
				<td>2022. 11. 18</td>
				<td>984758979</td>
				<td>프렙 내한공연 PREP LIVE IN SEOUL</td>
				<td>2022. 12. 03</td>
				<td>1</td>
				<td>결제 완료</td>
			</tr>
		</table>
	</div>
	<div></div>
	<div>
		<p>최근 상품 구매내역</p>
		<table class="table table-hover">
			<tr>
				<th>구매일</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>배송상태</th>
			</tr>
			<tr> <!-- 데이터 넣기 -->
				<td>2022. 11. 18</td>
				<td>984758979</td>
				<td>프렙 내한공연 굿즈 PREP LIVE IN SEOUL</td>
				<td>1</td>
				<td>배송 완료</td>
			</tr>
		</table>
	</div>

</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>