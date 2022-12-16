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
				<li class="side_liT"> ORDER </li>
					<li>&nbsp;<a href="/mypageS/orderM" style="color:black; font-size: 12px;" class="fontS"> - 주문관리 &nbsp;</a></li>	
		<br>	
				<li class="side_liT" style="color:lightgreen;"> QnA </li>
					<li>&nbsp;<a href="/mypageS/qna" style="color:black; font-size: 12px;" class="fontS"> - 답변대기 &nbsp;</a></li>
					<li>&nbsp;<a href="/mypageS/answer" style="color:black; font-size: 12px;" class="fontS"> - 답변완료 &nbsp;</a></li>
		<br>			
				<li style="font-size: 12px; font-weight: 400; color: #bcbcbc;" class="fontS"> <a> 회원정보수정 </a> </li>
			</ul>
		</div><!-- stickyC -->
	 </div><!-- stickyP -->
</div><!-- "leftcontent" -->


<div class="rightcontent" id="rightcontent" style="float:right; width:80%;"> 
	<table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed;">
		<c:if test="${empty qnalist}"> 
			<tr>
				<td>
					답변을 기다리는 문의가 없습니다. 
				</td>
			</tr>
		</c:if>
	<c:forEach var="row" items="${qnalist}" varStatus="vs">
		
		<tr>
			<td>
				<div style="background-color: white; height: 100px; border-top: 1px solid #ededed; border-bottom: 1px solid #ededed; margin-bottom: -3px; ">   
					<div style="width: 80px; height: 80px; overflow: hidden; float: left; margin: 9px 10px 0px 10px; display: inline-block; position: relative;">
						<img src="/storage/${row.postername}" style="width:100%; height:100%; object-fit:cover;" >
					</div><!-- product image -->
					
					<div style="display: inline-block; width: 80%; float: left; text-align: left; padding-top: 9px; margin-left: 10px;">
						<p style="margin-bottom: 0; font-size: 10px; font-weight: 500; color: lightgreen;">${row.pro_name}</p>
						<p style="font-size: 22px; font-weight: 600;">${row.subject}</p>
						<p style="margin: 5px 0 5px 0; font-size: 12px; color: #b0b0b0;">${row.nickname} ｜ 
																	<fmt:parseDate var="dateString" value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
					   												<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd HH시 mm분" /></p>
					</div>
					
					<div style="display: inline-block; margin-top: 37px; ">
						<button type="button" value="qnadetail${row.q_no}" onclick="qnadetailbtn(this)" class="btn btn-outline-black btn-sm" 
								style="width: 50px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 10px; float: right; ">
							답변
						</button>
					</div>
				</div>
			</td>
		</tr>
		
		<tr class="qnadetail" id="qnadetail${row.q_no}" style="display:none;">
			<td>
				<div style="background-color:#f8f8f8; width: 100%; height: 400px; text-align: left; padding: 25px 25px 25px 25px; margin-bottom: -2px;">
					<p style="font-weight: bold; font-size:15px; color:black; margin-bottom:0;"> Q.&nbsp;</p> 
					<div style="padding-left:30px; width:100%; height: 150px; overflow: auto">
						${row.edit}
					</div>
					
					<hr>
					
					<p style="font-weight: bold; font-size:15px; color:black; margin-bottom:0;"> A.&nbsp;</p> 
			<form id="answerinsert${row.q_no}">	
			<input type="hidden" name="q_no" value="${row.q_no}" >
			<input type="hidden" name="a_no" id="a_no${row.q_no}" value="${row.a_no}" >
					<div style="padding-left:30px; text-align: center;">
						<textarea name="content" style="width:100%; border:none; height:100px; background-color: transparent; font-size:14px; resize: none;" placeholder="내용을 입력해주세요."></textarea>
						<button type="button" class="btn btn-outline-black btn-sm" value="${row.q_no}" onclick="answerbtn(this)"
								style="margin-top: 15px; width: 50px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 10px;">
							등록
						</button>
					</div>
			</form>			
					
				</div>
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
				<a href="/mypageS/qna?pageNum=${startPage-1}">[이전]</a>
			</c:if>
	
			<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${pageNum == i}">
						<span style="font-weight: bold">${i}</span>
					</c:when>
					<c:when test="${pageNum != i}">
						<a href="/mypageS/qna?pageNum=${i}">${i}</a>
					</c:when>
				</c:choose>
			</c:forEach>
	
			<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
			<c:if test="${endPage < pageCount}">
				<a href="/mypageS/qna?pageNum=${startPage+10}">[다음]</a>
			</c:if>
		
		</c:if>
	 </div>	<!-- paging -->
			

</div><!-- rightcontent -->

</div><!-- float -->

<!-- 본문영역 --> 
<script>
	function qnadetailbtn(this1) {
		//alert(this1.value);
		var divid = "#"+this1.value;
		
		if( $(divid).css("display") == "none" ) {
			$(divid).css("display","table-row");
			$('.qnadetail').not(divid).css('display', 'none');
		}else {
			$(divid).css("display","none");
		}
	}//end
	
	function answerbtn(this1){
		//alert(this1.value);
		var q_no = this1.value;
		var formid = "#answerinsert"+q_no;
		//alert(formid);
		var a_noid = "#a_no"+q_no;
		var a_no = $(a_noid).val();

		let insertData = $(formid).serialize();
		
		answerInsert(insertData,a_no);
	}//end
	
	function answerInsert(insertData,a_no){
		$.ajax({
			 		 url     : "/mypageS/answerIns"		// 명령어
					,type    : "post"					// 전송타입 
					,data    : insertData				// 데이터 (변수명)
					,success : function(data){			// 성공시 실행할 함수 (= callback함수)
								     //  ↑ : callback시(호출한 장소로 되돌아옴) 가지고 올 값(retrun값)
						//alert(data);
						// data값이 1 이면 성공 
					
						if(data == 1){
							answerOne(a_no);  		// 댓글 작성 후 댓글 목록 함수 호출
						}//if end
						
					}//suc end
		});//ajax end
		
	}//end 
	
	function answerOne(a_no){
		$.ajax({
			 	     url     : "/mypageS/answerOne"
					,type    : "get"
					,data    : {'a_no':a_no}			// 부모 글번호
					,success : function(value){
						alert('답변이 등록되었습니다.');
						$('textarea [name="content"]').val(value);
						$('textarea[name="content"]').prop("disabled", true);
					}//end
		})
	}//end
</script>


<%@ include file="../footer.jsp" %>