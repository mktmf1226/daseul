<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="./ssi.jsp" %>

<!-- 본문 시작 -->
<br>
<br>
<br>

<h3 style="text-align: center;">공지사항</h3>
<br>
<p>
	<button type="button" onclick="location.href='/write'">글쓰기</button>
	<!-- <button type="button" onclick="location.href='/notice/list'">목록</button> -->
</p>
<div class="container">
	<table class="table table-hover" border="1">
		<tr class="info">
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	<br>
	
		<!-- varStatus="상태용 변수" -->
		<c:forEach var="row" items="${list}" varStatus="vs">
		<tr>
			<td>${row.n_no}</td>
			<td>
				<a href="detail/${row.n_no}">${row.subject}</a>
			</td>
			<td>관리자</td>
			<td>${row.regdate}</td>
		</tr>
		</c:forEach>
	</table>
</div>	

<hr>
총 ${cnt}개의 글
<hr>
	
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>