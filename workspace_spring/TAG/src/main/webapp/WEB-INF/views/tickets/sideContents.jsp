<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="seatAddFormjsp">
	<table style="border:1px solid black; height:520px; width: 347px;">
	<tr>
		<td>
			공연장 미니맵<br>
			-> 구역이동은 미니맵을 이용해주세요
		</td>
	</tr>
	<tr>
		<td>
			미니맵 이미지
			<button type="button" id="map1F" name="map1F">1층 맵</button>
			<button type="button" id="map2F" name="map2F">2층 맵</button>
		</td>
	</tr>
	<tr>
		<td>좌석등급 / 가격</td>
	</tr>
	<tr>
		<td>
			<ul>
				<li value="88000">스탠딩 R 88,000원</li>
				<li id="R" value="88000">지정석 R 88,000원</li>
				<li id="S" value="77000">지정석 S 77,000원</li>
				<li id="A" value="66000">지정석 A 66,000원</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>선택한 좌석 | <input style="display:inline-block; width:210px; text-align:right; color:red;" type="text" id="seatCnt" value="총 0석 선택하였습니다"></td>
	</tr>
	<tr>
		<td>
			<div id="panel" style="height:80px; overflow-y:scroll;">
			<!-- 
			
			 -->
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" id="reSelect" name="reSelect" onclick="reSelectFN()">다시 선택</button>
			
		</td>
	</tr>
	<tr>
		<td>
			<button type="button" id="goTaddForm" name="goTaddForm">좌석 선택 완료 ></button>
		</td>
	</tr>
	</table>
</div>

<div id="ticketAddFormjsp">
	<input type="hidden" name="tck_num" value="00000000-00000000"><!-- 예매번호 -->
	<input type="hidden" name="m_id" value="kangsun"><!-- 회원ID -->
	<input type="hidden" name="c_no" value="3"><!-- 공연일련번호 -->
	<input type="hidden" name="cnt" id="cnt" value="0"><!-- 수량 -->
	<input type="hidden" name="order_price" id="order_price" value="0"><!-- 주문금액 -->
	<input type="hidden" name="dis_price" id="dis_price" value="0"><!-- 할인금액 -->
	<input type="hidden" name="d_fee" id="d_fee" value="0"><!-- 배송비 -->
	<input type="hidden" name="total_price" id="total_price" value="0"><!-- 최종결제금액 -->
	<input type="hidden" name="dis_descrip" id="dis_descrip" value="할인내용"><!-- 할인내용 -->
	<input type="hidden" name="stus" value="결제완료"><!-- 결과상태 -->
	<table style="border:1px solid black; height:520px; width: 347px;">
	<tr>
		<td style="width:30%; background:lightgrey;">
			공연포스터 이미지
		</td>
		<td>
			공연이름<br>
			공연정보
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<strong>My 예매정보</strong>
		</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">날짜</td>
		<td>2022년 12월 15일(금)</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">시간</td>
		<td>16시 00분</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">매수</td>
		<td><input type="text" id="ticketCount"></td><!-- 수량 -->
	</tr>
	<tr>
		<td style="background:lightgrey;">선택한 좌석</td>
		<td>
			<div id="addedSeat" style="height:80px; overflow-y:scroll;">
			<!-- 
				S석 2층 Z구역 2열 5번<br>
				S석 2층 Z구역 2열 5번<br>
				S석 2층 Z구역 2열 5번<br>
				S석 2층 Z구역 2열 5번<br>
			 -->
			</div>
		</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">티켓금액</td>
		<td><input type="text" id="originPrice"></td><!-- 주문금액 -->
	</tr>
	<tr>
		<td style="background:lightgrey;">배송료</td>
		<td>
			<input style="display:inline-block; width:100px;" type="text" id="dlvPrice" value="0원"><!-- 배송비 -->
			 | 
			<input style="display:inline-block; width:100px;" type="text" id="dlvText" value="현장수령">
		</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">할인금액</td>
		<td><input type="text" id="discountPrice"></td><!-- 할인금액 -->
	</tr>
	<tr>
		<td style="background:lightgrey;">총 결제금액</td>
		<td><input type="text" id="totalPrice"></td><!-- 최종결제금액 -->
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" id="goSaddForm" name="goSaddForm">이전단계</button><!-- 1.좌석선택으로 -->
			<button type="button" id="goSale" name="goSale">이전단계</button><!-- 2.가격할인으로 -->
			<button type="button" id="goDlv" name="goDlv">다음단계</button><!-- 3.배송현장수령으로 -->
			<button type="submit" id="goFinish" name="goFinish">결제완료</button><!-- 결제완료 -->
		</td>
	</tr>
	</table>
</div>