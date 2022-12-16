<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문영역 -->


<br>
	<h1 class="saem_title"> <a href="/mypageS" style="color:black" class="saem_title"> MY PAGE </a> </h1>
<br> 

<div class="float" style="width: 100%; height: 100%; flex: 1;">
						
					
<div class="leftcontent" style="float:left; width:15%; margin-right:5%;">
	<div class="stickyP" style="height: 100%;">
			<p style="font-size: 20px; font-weight: 500;" class="fontG">
				${s_p_id}&nbsp;님 <!-- 세션아이디 -->
			</p>
	<br>	
		<div class="stickyC" style="position: sticky; top: 100px; padding-bottom: 100px;">	
			<ul style="font-size:13px; list-style-type: none; padding-left:0px;">
				<li class="side_liT"> PRODUCT </li>
					<li>&nbsp;<a href="/mypageS/create" style="color:black; font-size: 12px;" class="fontS">  - 상품등록 &nbsp;</a></li>
					<li>&nbsp;<a href="/mypageS/productM" style="color:black; font-size: 12px;" class="fontS">  - 상품관리 &nbsp;</a></li>
		<br>	
				<li class="side_liT" style="color:lightgreen;"> ORDER </li>
					<li>&nbsp;<a href="/mypageS/orderM" style="color:black; font-size: 12px;" class="fontS"> - 주문관리 &nbsp;</a></li>	
		<br>	
				<li class="side_liT"> QnA </li>
					<li>&nbsp;<a href="/mypageS/qna" style="color:black; font-size: 12px;" class="fontS"> - 답변대기 &nbsp;</a></li>
					<li>&nbsp;<a href="/mypageS/answer" style="color:black; font-size: 12px;" class="fontS"> - 답변완료 &nbsp;</a></li>
		<br>			
				<li style="font-size: 12px; font-weight: 400; color: #bcbcbc;" class="fontS"> <a> 회원정보수정 </a> </li>
			</ul>
		</div><!-- stickyC -->
	 </div><!-- stickyP -->
</div><!-- "leftcontent" -->


<div class="rightcontent" id="rightcontent" style="float:right; width:80%;"> 
	<form action="/mypageS/orderdetailProc/${orderdetail.order_num}" method="post">	</form>
	
	<div style="display:inline-block; float: left; font-size: 12px; color:gray;">${orderdetail.order_num}</div>
	<div style="display:inline-block; float: right;font-size: 12px; color:gray;">
						<fmt:parseDate var="dateString" value="${orderdetail.order_date}" pattern="yyyyMMdd" />
					   <fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
	</div>
<br>
<br>
	<c:forEach var="row" items="${orderdetailList}" varStatus="vs">		
	
	<input type="hidden" value="${row.detail_no}" name="detail_no">
	
	<div style=" width: 100%; height: 115px; ">
	
			
			<div style="width: 80px; height: 80px; overflow: hidden; float: left; margin:0 auto; display: inline-block; position: relative;">
			<img src="/storage/${row.postername}" style="width:100%; height:100%; object-fit:cover;" >
			</div><!-- product image -->
			
			<div style="position: absolute; padding-left: 30px; padding-top: 10px; display: inline-block; width: 550px;"> 
				<span style="font-size: 20px; font-weight: 600;"> ${row.pro_name} </span>
			<br>	
				<span style="font-size: 13px;"> 
					${row.color} ｜ ${row.size} size 		 
				</span>
			</div>
	
	
			<div style="display: inline-block; float: right; padding-top: 25px;">
			<form action="/mypageS/orderstus/${row.order_num}" method="post">
				<input type="hidden" value="${row.detail_no}" name="detail_no"/>
				<span style="padding-right: 50px; font-size: 13px;"> <fmt:formatNumber value="${row.price}" pattern="#,###"/> 원 </span>
				<span style="padding-right: 50px; font-size: 13px;"> ${row.detail_cnt}개 </span> 
				
				<select style="width:85; font-size:12px;" name="stus" disabled>
					<option value="주문취소" <c:if test="${row.stus == '주문취소'}">selected</c:if>>주문취소</option>
					<option value="결제대기" <c:if test="${row.stus == '결제대기'}">selected</c:if>>결제대기</option>
					<option value="결제완료" <c:if test="${row.stus == '결제완료'}">selected</c:if>>결제완료</option>
					<option value="상품준비중" <c:if test="${row.stus == '상품준비중'}">selected</c:if>>상품준비중</option>
					<option value="배송중" <c:if test="${row.stus == '배송중'}">selected</c:if>>배송중</option>
					<option value="배송완료" <c:if test="${row.stus == '배송완료'}">selected</c:if>>배송완료</option>
				</select>
				<br>
				<button type="submit" name="stusbtn" class="btn btn-outline-black btn-sm" 
						style=" display:none; width: 40px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 10px; float: right; margin-top: 5px;">
					저장
				</button>
			</form> 
			</div>
	
	</div>
	</c:forEach>
	
<br>
	<form action="/mypageS/orderdetailProc/${orderdetail.order_num}" method="post">
	<input type="hidden" value="${orderdetail.order_num}" name="order_num">
	<div style="display: inline-block; float:left; width: 50%; height: 400px; padding-right: 10px;">
		<span style="font-size: 14px; font-weight: bold; border-bottom:2px solid lightgreen;">&nbsp;주문자 정보&nbsp;</span>
		<br>
		<span style="font-size: 14px;">
			<br> 	 <span style="color:#999999;">주문자</span>  &nbsp;&nbsp;  ${orderdetail.m_id}
			<br><br> <span style="color:#999999;">이메일</span>  &nbsp;&nbsp;  ${orderdetail.m_email}
			<br><br> <span style="color:#999999;">연락처</span>  &nbsp;&nbsp;  ${orderdetail.m_tel}
		</span>
		<hr>
		<span style="font-size: 14px; font-weight: bold; border-bottom:2px solid lightgreen;">&nbsp;수령인 정보&nbsp;</span>
		<br>
		<span style="font-size: 14px;">
		<br> 	 <span style="color:#999999;">수령인</span>  &nbsp;&nbsp;  <input type="text" value="${orderdetail.rec_name}" style="font-size: 14px; border:none;" readonly size="45" name="rec_name">
		<br><br> <span style="color:#999999;">연락처</span>  &nbsp;&nbsp;  <input type="text" value="${orderdetail.rec_tel}" style="font-size: 14px; border:none;"  readonly size="45" name="rec_tel">
		<br><br> <span style="color:#999999;">배송지</span>  &nbsp;&nbsp;  <input type="text" value="${orderdetail.rec_addr}" style="font-size: 14px; border:none;" readonly size="45" name="rec_addr">
		<br><br> <span style="color:#999999;">메세지</span>  &nbsp;&nbsp;  <input type="text" value="${orderdetail.msg}" style="font-size: 14px; border:none;" readonly size="45">
		</span>
	</div> <!-- 주문자/수령인정보 -->
	<div style="display: inline-block; float:right; width:50%; height: 400px; padding-left: 5px; padding-right: 5px;">
		<span style="font-size: 20px; font-weight: bold; border-bottom:3px solid lightgreen;">&nbsp;결제 정보&nbsp;</span>
		<br><br>
				<span style="color:#999999;">상품 금액</span>	
					<span style="float:right;"><fmt:formatNumber value="${orderdetail.org_price}" pattern="#,###"/>원</span>
		<br><br><span style="color:#999999;">마일리지</span>
					<span style="float:right;"> - <fmt:formatNumber value="${orderdetail.pt_minus}" pattern="#,###"/></span>
		<br><br><span style="color:#999999;">할인 금액</span>
					<span style="float:right;"><fmt:formatNumber value="${orderdetail.discount}" pattern="#,###"/>원</span>
		<br><br><span style="color:#999999;">할인 정보</span>
					<span style="float:right;"> 
							<c:choose>
								<c:when test="${orderdetail.coupon == 'Bc'}"> 공연 예매자 (10%)</c:when>
								<c:when test="${orderdetail.coupon == 'EBc'}"> 얼리버드 (15%)</c:when>
								<c:when test="${orderdetail.coupon == 'Dc'}"> 배송비 할인 </c:when>
								<c:when test="${orderdetail.coupon == 'Bday'}"> 생일 축하 쿠폰 (10%) </c:when>
							</c:choose>
					</span>
		<br><br><span style="color:#999999;">배송비</span>
					<span style="float:right;"><fmt:formatNumber value="${orderdetail.d_fee}" pattern="#,###"/>원</span>
		<br><br><span style="color:#999999;">결제 금액</span>
					<span style="float:right;"><fmt:formatNumber value="${orderdetail.total_price}" pattern="#,###"/>원</span>
	 	<br><br><br>
	 <div style="float: right;">
		<button type="button" class="btn btn-outline-black btn-sm" id="updatebtn"
				style=" width: 80px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 15px;">
			수정
		</button>
		<button id="orderlistbtn" type="button" class="btn btn-outline-black btn-sm" 
				onclick="location.href='/mypageS/orderM'"
				style=" width: 80px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 15px;">
			목록
		</button>
		
		<button type="submit" id="updateSavebtn" class="btn btn-outline-black btn-sm" 
				style=" display:none; width: 80px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 15px;">
			저장
		</button>
		
		<button id="updateCancelbtn" type="button" class="btn btn-outline-black btn-sm"
				style="display:none; width: 80px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 15px;">
			취소
		</button>
	 </div> <!-- 버튼 -->
	</div> <!-- 결제정보 -->
	</form>	
</div><!-- rightcontent -->

</div><!-- float -->

<!-- 본문영역 -->
<script>
	$('#updatebtn').click(function(){
		$('#updatebtn').css("display","none");
		$('#orderlistbtn').css("display","none");
		
		$('#updateSavebtn').css("display","inline");
		$('#updateCancelbtn').css("display","inline");
		
		$('select[name="stus"]').attr("disabled",false);
		$('button[name="stusbtn"]').css("display","inline");
		
		$('input[name="rec_name"]').attr("readonly",false);
		$('input[name="rec_name"]').css("border-bottom","1px solid black");
		
		$('input[name="rec_tel"]').attr("readonly",false);
		$('input[name="rec_tel"]').css("border-bottom","1px solid black");
		
		$('input[name="rec_addr"]').attr("readonly",false);
		$('input[name="rec_addr"]').css("border-bottom","1px solid black");
	})//end
	
	$('#updateCancelbtn').click(function(){
		location.reload();
	})//end
	
</script>


<%@ include file="../footer.jsp" %>