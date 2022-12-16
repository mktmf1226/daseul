<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>

<!-- 본문 시작 -->
<br>
<br>
<br>

<h3 style="text-align: center;">글쓰기</h3>
<br>
<p>
	<button type="button" onclick="location.href='/notice/list'">목록</button>
</p>

<div>
<form name="form1" method="post" action="/notice/insert" >
<table class="table">
<tr>
	<td>제목</td>
	<td><input type="text" name="subject" align="center"></td>
</tr>
<tr>
	<td>작성자</td>
	<td>관리자</td>
</tr>
<tr>
	<td>내용</td>
	<td>
    	<textarea id="summernote" name="edit"></textarea> 
   	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="공지사항 등록">
	</td>
</tr>

</table>
</form>
</div>

<!-- 본문 끝 -->

<script>
     // summernote
      $('#summernote').summernote({
        //placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 500,
        focus: true,
        toolbar: [
          // [groupName, [list of button]]
          ['fontname', ['fontname']],
          ['fontsize', ['fontsize']],
          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          ['color', ['forecolor','color']],
          ['table', ['table']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          ['view',['codeview']]
        ],
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
      lang: "ko-KR",
      disableDragAndDrop:true
   });//end
   
</script>

<%@ include file="../footer.jsp" %>