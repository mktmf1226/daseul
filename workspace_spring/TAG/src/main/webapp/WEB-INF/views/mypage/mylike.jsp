<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>


<!-- 본문 시작 -->

<style>
	.leftcontent {
		float: left;
		width: 15%;
		margin-right: 5%;
		height: 100%;
	}
	.rightcontent {
		float: right;
		width: 80%;
		height: 100%;
	}
	.leftcontent, .rightcontent, .box {
		border: 1px solid black;
	}
	.leftcontent div, .rightcontent {
		padding: 10px;
	}
	.rightcontent ul {
		list-style: none;
		padding-left: 0;
		margin: 0 auto;
		width: 100%;
		display: flex;
		border: 1px solid red;
	}
	.rightcontent li {
		border: 1px solid black;
		/*display: inline;*/
		/*margin-right: 30px;*/
		margin: 0 auto;
	}
	.likecategory {
		float: right;
	}
	.memberLike {
		display: flex;
		flex-wrap: wrap; /* 상위 요소의 너비보다 하위 요소의 너비가 더 클 경우 줄바꿈 */
		justify-content: space-between;
		width: 800px;
		/*height: 100%;*/
		border: 1px solid blue;
		margin: 0 auto;
	}
	.memberLike .likeItem {
		border: 1px solid green; /* 테두리를 1px 실선의 #eee 색상으로 */
		height: 350px;
		width: 250px;
		padding: 5px;
		margin-bottom: 10px;	
	}
	.likeItem img {
		height: 150px;
		width: 200px;
	}
	.likeItem p {
		font-size: 14px;
	}
</style>

<div class="title">
	<h3 style="text-align: center;">관심 공연 / 관심 상품</h3>
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




	<div class="myLike">
		<div class="likeItem">
		상품개수 : ${fn:length(list)}
			<br>
			<table border="1">
				<tr>
					<th>일련번호</th>
					<th>구분코드</th>
					<th>관심상품</th>
				</tr>
				<c:forEach var="row" items="${list}" varStatus="vs">
				<tr>
					<td>${row.lno}</td>
					<td>${row.like_cd}</td>
					<td>${row.like_li}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>


<div class="rightcontent" style="">
	<div class=mylike_concert>
		<table border="1">
		<tr>
			
			<c:forEach var="row" items="${imglist_c}" varStatus="vs">
			
				<td>
					<c:choose>
						<c:when test="${row != '-'}">
							<img src="/storage/${row}" width="100px">
						</c:when>
						<c:otherwise>
							등록된 사진 없음!!<br>
						</c:otherwise>
					</c:choose>
				</td>

			</c:forEach>
		</tr>
		</table>
	</div>
	
	<div class=mylike_product>
		<table border="1">
		<tr>
			<!-- varStatus="상태용 변수" -->
			<c:forEach var="row" items="${list_p}" varStatus="vs">
				<td>
					<c:choose>
						<c:when test="${row.edit != null}">
							<img src="/storage/${row.edit}" width="100px">
						</c:when>
						<c:otherwise>
							등록된 사진 없음!!<br>
						</c:otherwise>
					</c:choose>
				</td>
				<!-- 테이블 한줄에 5칸씩 -->
				<c:if test="${vs.count mod 5==0 }">
					<tr></tr>
				</c:if>
			</c:forEach>
		</tr>
		</table>
	</div>


</div><!-- rightcontent end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>