<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>
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
				<li class="side_liT"> ORDER </li>
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
	<div style="background-color:black; width: 100%; height: 150px; padding: 20px 20px 20px 20px; margin-top: 10px;"> 
		
		<div style="border-right:1px solid #d5d5d5; width: 33%; height: 100%; display: inline-block; " >
			<p style="margin-top: 0; font-size:13px; font-weight: 300; color:#d5d5d5;">총 주문건수</p>
		<br>
			<p style="font-size:30px; text-align: right; padding-right: 20px; font-weight: 600; margin-top: 15px; color:white;">
				${totorder_cnt}건
			</p>
		</div>
		
		<div style="border-right:1px solid #d5d5d5; width: 33%; height: 100%; display: inline-block; padding-left: 10px;" >
			<p style="margin-top: 0; font-size:13px; font-weight: 300; color:#d5d5d5; ">배송 완료</p>
		<br> 
			<p style="font-size:30px; text-align: right; padding-right: 20px; font-weight: 600; margin-top: 15px; color:white;">
				${delCom_cnt}건	
			</p>
		</div>
		
		<div style=" width: 33%; height: 100%; display: inline-block; padding-left: 10px;" >
			<p style="margin-top: 0; font-size:13px; font-weight: 300; color:#d5d5d5;">미답변 문의</p>
		<br>
			<p style="font-size:30px; text-align: right; font-weight: 600; margin-top: 15px; color:white;">
				${qnaN_cnt}건	
			</p>
		</div>                
	
	</div>
<br><br>

		<table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed; font-size: 14px;" >
			
			<tr style=" border-bottom:3px solid black; font-size: 16px;">
			 	<td style="padding-bottom: 8px; font-weight: 600;"> 최근 주문건 </td>
			</tr>
				
			<tr style=" border-bottom:0.1px solid black; font-size: 12px;">	
				<td style="padding:10px 10px 10px 10px; width: 100px;"> 주문번호</td>
				<td colspan="5" style="padding:0 10px 5px 10px; width: 550px;"> 수령인 정보</td>
				<td style="padding:10px 10px 10px 10px;"> 수량</td>
				<td style="padding:10px 10px 10px 10px;"> 금액</td>
				<td style="padding:10px 10px 10px 10px;"> 주문일</td>
			</tr>
			
			<c:if test="${empty recently_order}"> 
				<tr>
					<td colspan="9" style="padding-top: 20px;">
						최근 주문건이 없습니다. 
					</td>
				</tr>
			</c:if>
			
			<c:forEach var="row" items="${recently_order}" varStatus="vs">
			<tr>
				<td style="border-bottom:1px solid #ededed;" > ${row.order_num}	 </td>

				<td colspan="5" style="border-bottom:1px solid #ededed; text-align: left; padding:5px 0px 5px 30px; word-break:break-all; ">  
					<a href="/mypageS/orderM" style="color:black;">
							 ${row.m_id}
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
				   ${row.order_date}
				</td>
			</tr>	
		</c:forEach>
		</table>
<br><br>
		<table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed; font-size: 14px;" >			
			<tr style=" border-bottom:3px solid black; font-size: 16px;">
			 	<td style="padding-bottom: 8px; font-weight: 600;"> 최근 문의글 </td>
			</tr>
		
			<tr style=" border-bottom:0.1px solid black; font-size: 12px;">	
				<td style="padding:10px 10px 10px 10px; width: 100px;"> 상품번호</td>
				<td colspan="5" style="padding:0 10px 5px 10px; width: 550px;"> 제목</td>
				<td style="padding:10px 10px 10px 10px;"> 아이디</td>
				<td style="padding:10px 10px 10px 10px;"> 답변</td>
				<td style="padding:10px 10px 10px 10px;"> 작성일</td>
			</tr>
			
			<c:if test="${empty recently_qna}"> 
				<tr>
					<td colspan="9" style="padding-top: 20px;">
						최근 문의글이 없습니다. 
					</td>
				</tr>
			</c:if>
			
			<c:forEach var="row" items="${recently_qna}" varStatus="vs">
			<tr>
				<td style="border-bottom:1px solid #ededed;" > ${row.pro_no} </td>

				<td colspan="5" style="border-bottom:1px solid #ededed; text-align: left; padding:5px 0px 5px 30px; word-break:break-all; ">  
					<c:choose> 
						<c:when test="${row.a_stus == 'N'}">
							<a href="/mypageS/qna" style="color:black;">
							 ${row.subject}	
							</a>
						</c:when>
						<c:otherwise>
							<a href="/mypageS/answer" style="color:black;">
							 ${row.subject}	
							</a>	
						</c:otherwise>
					</c:choose>
				</td> 
				
				<td style="border-bottom:1px solid #ededed;">
						${row.qname}
				</td> 
				
				<td style="border-bottom:1px solid #ededed;">
					<c:choose>
						<c:when test="${row.a_stus == 'N'}">NO</c:when>
						<c:when test="${row.a_stus == 'Y'}">YES</c:when>
					</c:choose>
				</td> 
							
				<td style="border-bottom:1px solid #ededed; font-size: 12px; padding: 3px 0 3px 0;"> 
				   <fmt:parseDate var="dateString" value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
				   <fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" />
				   <br>
				   <fmt:formatDate value="${dateString}" pattern="HH시 mm분" />
					
				</td>
			</tr>	
		</c:forEach>
		</table>
</div><!-- "rightcontent" -->

</div><!-- float -->

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>