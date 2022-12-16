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
	
	<div id="search" style="text-align: right; margin-bottom: 28px;">
		<form method="post" action="/mypageS/ordersearch" >
						<input type="text" id="order_num" name="order_num" value="${order_num}" style="font-size:12px;" placeholder="주문번호로 검색">
						<input type="submit" id="btnSubmit" value="검색" style="display:none;">
							<label for="btnSubmit">
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
							</label>
		</form> 	
	</div><!-- search -->
	
	
	<table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed; font-size: 14px;" >
		<tr style=" border-bottom:1px solid black; font-size: 12px;">	
			<td style="padding:0 10px 5px 10px; width: 100px;"> 주문번호</td>
			<td colspan="5" style="padding:0 10px 5px 10px; width: 550px;"> 수령인 정보</td>
			<td style="padding:0 10px 5px 10px;"> 수량</td>
			<td style="padding:0 10px 5px 10px;"> 금액</td>
			<td style="padding:0 10px 5px 10px;"> 주문일</td>
		</tr>
		
		<c:if test="${empty orderlist}"> 
			<tr>
				<td colspan="9" style="padding-top: 20px; font-size: 16px;">
					주문 내역이 없습니다.
				</td>
			</tr>
		</c:if>
		
			<c:forEach var="row" items="${orderlist}" varStatus="vs">
				<tr>
					<td style="border-bottom:1px solid #ededed;" > ${row.order_num} </td>
 
					<td colspan="5" style="border-bottom:1px solid #ededed; text-align: left; padding:5px 0px 5px 30px; word-break:break-all; ">  
						<a href="/mypageS/orderMdetail/${row.order_num}" style="color:black;">
							 ${row.m_id} (${row.rec_name})
							<br> ${row.rec_addr} ｜ ${row.rec_tel}	
						</a>	 
					</td> 
					<td style="border-bottom:1px solid #ededed;">
							${row.total_cnt}	
					</td> 
					
					<td style="border-bottom:1px solid #ededed;">
						<fmt:formatNumber value="${row.total_price}" pattern="#,###"/>
					</td> 
								
					<td style="border-bottom:1px solid #ededed;"> 
					   <fmt:parseDate var="dateString" value="${row.order_date}" pattern="yyyyMMdd" />
					   <fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
					</td>
				</tr>	
			
			
			</c:forEach>
</table>
	
	<div id="paging" style="text-align: center; margin-top: 20px;">
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
				<a href="/mypageS/orderM?pageNum=${startPage-1}">[이전]</a>
			</c:if>
	
			<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${pageNum == i}">
						<span style="font-weight: bold">${i}</span>
					</c:when>
					<c:when test="${pageNum != i}">
						<a href="/mypageS/orderM?pageNum=${i}">${i}</a>
					</c:when>
				</c:choose>
			</c:forEach>
	
			<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
			<c:if test="${endPage < pageCount}">
				<a href="/mypageS/orderM?pageNum=${startPage+10}">[다음]</a>
			</c:if>
		
		</c:if>
	 </div>	<!-- paging -->
</div><!-- rightcontent -->

</div><!-- float -->

<!-- 본문영역 -->
 
<script>
	
</script>


<%@ include file="../footer.jsp" %>