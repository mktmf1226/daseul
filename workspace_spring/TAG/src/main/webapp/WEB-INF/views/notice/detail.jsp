<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>


<script>
	function notice_update(){
		document.form1.action="/notice/update";
		document.form1.submit();
	}//notice_update() end
	
	function notice_delete(){
		if(confirm("삭제 후에는 복구가 불가합니다.\n정말 삭제할까요?")){
			document.form1.action="/notice/delete";
			document.form1.submit();
		}//if end
	}//notice_delete() end
</script>
<!-- 본문영역 -->
<br>
<br>
<br>

<h3 style="text-align: center;">상세보기</h3>
<br>
<p>
	<button type="button" onclick="location.href='/notice/list'">목록</button>
</p>

<div>
<form name="form1" method="post" enctype="">
<table class="table">
<tr>
	<th class="info">작성일</th>
	<td>${notice.regdate}</td>
</tr>
<tr>
	<th class="info">제목</th>
	<td>${notice.subject}</td>
</tr>
<tr>
	<th class="info">작성자</th>
	<td>관리자</td>
</tr>
<tr>
	<th class="info">내용</th>
	<td>${notice.edit}</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="hidden" name="n_no" value="${notice.n_no}">
		<input type="button" value="수정" onclick="notice_update()">
		<input type="button" value="삭제" onclick="notice_delete()">
	</td>
</tr>

</table>
</form>
</div>
<!-- 본문영역 -->

<!-- <%@ include file="../footer.jsp" %> -->