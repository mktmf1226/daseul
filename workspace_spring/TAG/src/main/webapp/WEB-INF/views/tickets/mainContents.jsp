<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="map1Fjsp">
	<h2>좌석선택-가격할인-배송현장수령</h2>
	<h4>스탠딩 1층</h4>
	<p>스탠딩은 실제 좌석과 다르며 예매시 지정하는 번호가 입장 번호 순서입니다. 빠른 번호를 예매 할수록 입장 순서가 빨라집니다.</p>
	<div id="standA" style="display: inline-block; margin-right:40px;">
		<h4>스탠딩 A구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatA" begin="1" end="825" step="1">
				<td>
					<input type="button" id=btnA${seatA} name=btnA${seatA} value="${seatA}" onclick="standAdd(this, 'A', ${seatA})">
				</td>
				<c:if test="${seatA mod 25 == 0}">
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
	<div id="standB" style="display: inline-block;">
		<h4>스탠딩 B구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatB" begin="1" end="825" step="1">
				<td>
					<input type="button" id=btnB${seatB} name=btnB${seatB} value="${seatB}" onclick="standAdd(this, 'B', ${seatB})">
				</td>
				<c:if test="${seatB mod 25 == 0}">
				<!-- 테이블 한줄에 5줄씩 -->
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
</div><!-- map1Fjsp end -->

<div id="map2Fjsp">
	<h2>좌석선택-가격할인-배송현장수령</h2>
	<h4>지정석 2층</h4>
	<p>객석 2층은 지정좌석제입니다.</p>
	<div id="rseatX" style="display: inline-block;">
		<h4>지정좌석 X구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<!-- X구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullX" value="<%=new int[] {0,1,2,3,3,5,6} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatX" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullX)}" step="1">
				<c:forEach var="nullXtd" begin="1" end="${nullX[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullX end -->
				<c:forEach var="c" begin="1" end="${15-nullX[r-1]+1}" step="1">
					<td>
						<c:if test="${c <= (15-nullX[r-1])}">
							<!-- ${seatX} 1씩 늘어나게하기 -->
							<c:set var="seatX" value="${seatX+1}"/>
							<input type="button" id=btnX${seatX} name=btnX${seatX} value="${c}" onclick="rseatAdd(this, 'X', ${r}, ${seatX})">
						</c:if>
						<c:if test="${c == (15-nullX[r-1]+1)}">
							<button disabled>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- c end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatX" end -->
	<div id="rseatY" style="display: inline-block;">
		<h4>지정좌석 Y구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Y구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullYL"   value="<%=new int[] {4,3,3,2,1,0,1} %>"/><!-- Left -->
			<c:set var="nullYR"   value="<%=new int[] {3,3,2,1,1,0,1} %>"/><!-- Right -->
			<c:set var="nullYAll"   value="<%=new int[] {7,6,5,3,2,0,2} %>"/><!-- L+R -->
			<!-- "seatY" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatY" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullYL)}" step="1">
				<c:forEach var="nullYLtd" begin="1" end="${nullYL[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullYL end -->
				<c:forEach var="c" begin="1" end="${28-nullYAll[r-1]}" step="1">
					<c:choose><%-- if else문 --%>
						<c:when test="${r == 7 && c <= 11}"><!-- 7열 11번째 좌석까지 생성 -->
							<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 7 && c >= 16}"><!-- 7열 16번째 좌석부터 생성 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c-4}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 7 && c > 11 && c < 16}"><!-- 7열 빈 좌석 생성 -->
					    	<td></td>
						</c:when>
						<c:otherwise><!-- 그 외 일반 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
					  	</c:otherwise>
					</c:choose><!-- choose end -->
				</c:forEach><!-- c end -->
				<c:forEach var="nullYRtd" begin="1" end="${nullYR[r-1]+1}" step="1">
					<td>
						<c:if test="${nullYRtd == nullYR[r-1]+1 }">
							<button disabled>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- nullYR end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatY" end -->
	<div id="rseatZ" style="display: inline-block;">
		<h4>지정좌석 Z구역</h4>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Z구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullZ" value="<%=new int[] {0,1,2,3,3,5,6} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatZ" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullZ)}" step="1">
				<c:forEach var="c" begin="1" end="${15-nullZ[r-1]}" step="1">
					<td>
						<!-- ${seatZ} 1씩 늘어나게하기 -->
						<c:set var="seatZ" value="${seatZ+1}"/>
						<input type="button" id=btnZ${seatZ} name=btnZ${seatZ} value="${c}" onclick="rseatAdd(this, 'Z', ${r}, ${seatZ})">
					</td>
				</c:forEach><!-- c end -->
				<c:forEach var="nullZtd" begin="0" end="${nullZ[r-1]}" step="1">
					<td>
						<c:if test="${nullZtd == nullZ[r-1] }">
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- null end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatZ" end -->
</div><!-- map2Fjsp end -->	

<div id="ticketSalejsp">
	<h2>좌석선택-가격할인-배송현장수령</h2>
	<h3>* 가격/할인 *</h3>
	<table>
	<tr>
		<td>등급</td>
		<td>할인명</td>
		<td>할인금액</td>
		<td>매수</td>
		<td>설명</td>
	</tr>
	<tr>
		<td>R석</td>
		<td>
			<select name="disSelectR">
				<option value="N">-선택없음-</option>
				<option value="J">장애인 할인</option>
				<option value="K">국가유공자 할인</option>
			</select>
		</td>
		<td>
			<input type="text" id="disPriceR" value="0원">
		</td>
		<td>
			<select name="disCntR">
				<option value="0">-선택없음-</option>
			</select>
		</td>
		<td>
			<input type="text" id="disDesR" value="일반 기본가">
		</td>
	</tr>
	<tr>
		<td>S석</td>
		<td>
			<select name="disSelectS">
				<option value="N">-선택없음-</option>
				<option value="J">장애인 할인</option>
				<option value="K">국가유공자 할인</option>
			</select>
		</td>
		<td>
			<input type="text" id="disPriceS" value="0원">
		</td>
		<td>
			<select name="disCntS">
				<option value="0">-선택없음-</option>
			</select>
		</td>
		<td>
			<input type="text" id="disDesS" value="일반 기본가">
		</td>
	</tr>
	<tr>
		<td>A석</td>
		<td>
			<select name="disSelectA">
				<option value="N">-선택없음-</option>
				<option value="J">장애인 할인</option>
				<option value="K">국가유공자 할인</option>
			</select>
		</td>
		<td>
			<input type="text" id="disPriceA" value="0원">
		</td>
		<td>
			<select name="disCntA">
				<option value="0">-선택없음-</option>
			</select>
		</td>
		<td>
			<input type="text" id="disDesA" value="일반 기본가">
		</td>
	</tr>
	</table>
</div>

<div id="ticketDeliveryjsp">
	<h2>좌석선택-가격할인-배송현장수령</h2>
	<h3>* 배송선택/주문자확인 *</h3>
	<table>
	<tr>
		<td>수령방법선택</td>
		<td>
			<input type="radio" id="dlvBtn" name="deliverBtn" value="3000" onclick="dlvSelected()"><!-- value 3000원 -->
 				<label for="dlvBtn">배송</label><br>
 				<input type="radio" id="pUpBtn" name="deliverBtn" value="0" onclick="pUpSelected()" checked><!-- value 0원 -->
 				<label for="pUpBtn">현장수령</label><br>
		</td>
	</tr>
	<tr>
		<td colspan='2'>주문자확인</td>
	</tr>
	<tr>
		<td><label for="rec_name">이름</label></td>
		<td><input type="text" id="rec_name" name="rec_name" value="정다슬"></td>
	</tr>
	<tr>
		<td><label for="rec_tel">연락처</label></td>
		<td><input type="text" id="rec_tel" name="rec_tel" value="010-1234-1234"></td>
	</tr>
	<!-- 
	<tr>
		<td><label for="rec_email">이메일</label></td>
		<td><input type="text" id="rec_email" value="mktmf1226@gmail.com"></td>
	</tr>
	 -->
	<tr>
		<td><label for="rec_addr">받는주소</label></td>
		<td><input type="text" id="rec_addr" name="rec_addr" value="서울시 관악구"></td>
	</tr>
	<tr>
		<td><label for="msg">배송메세지</label></td>
		<td><input type="text" id="msg" name="msg" value="배송 전 연락바랍니다."></td>
	</tr>				
	</table>
</div><!-- ticketDeliveryjsp end -->