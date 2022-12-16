<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<title>일반회원 로그인</title>


<script>

	//아이디 비밀번호 입력해야 전송되는 javascript
	function logincheck() {
		
		// 1. 사용자가 입력한 아이디 값을 폼에서 가져온다.
		let m_id = $("#m_id").val().trim();
		
		// 1-1. 아이디 작성하지 않았을 때
	    if (m_id == "") {
	        //alert("아이디를 입력해 주십시오.");
	        $("#msg").empty();
	        $("#msg").append("아이디를 입력해 주세요");
	        $("#m_id").focus();
	        return false;
	    }//if end
	    
		// 1-2. 아이디 5~15글자 이내 체크
		if(m_id.length<5 || m_id.length>15) {
			$("#msg").empty();
			$("#msg").append("아이디는 5~15글자 이내 입력해 주세요");
			$("#m_id").focus();
			return false;
		}//if end
		
		
		// 2. 비밀번호 체크
		let m_pw = $("#m_pw").val().trim();
		
		// 2-1. 비밀번호 작성하지 않았을 때
	    if (m_pw == "") {
	        $("#msg").empty();
	        $("#msg").append("비밀번호를 입력해 주세요");
	        $("#m_pw").focus();
	        return false;
	    }//if end
	    
		// 2-2. 비밀번호 5~15글자 이내 체크
		if(!/^[a-zA-Z0-9]{8,20}$/.test(m_pw)) {
			$("#msg").empty();
			$("#msg").append("비밀번호는 숫자와 영문자 조합으로 8~20자리로 입력해야 합니다.");
			$("#m_pw").focus();
			return false;
		}//if end
		
		return true;
	}//logincheck() end
</script>




<h3> 일반회원 로그인 </h3>

		<!-- <form method="post" action="login.do" onsubmit="return logincheck()"> -->
		<form method="post" action="<c:url value='/loginG.do'/>" onsubmit="return logincheck()">
			<table class="table">
				<tr>
				  <td colspan="2" align="center">* 로그인 *</td>
				</tr>
				
				<tr>
				  <td>아이디</td>
				  <!-- <td><input type="text" id="m_id" name="m_id" size="20"></td> -->
				  <td><input type="text" id="m_id" name="m_id" size="20" value="${cookie.id.value}"></td>
				</tr>
				
				<tr>
				  <td>비밀번호</td>
				  <td><input type="password" id="m_pw" name="m_pw" size="20"></td>
				</tr>
				
				<tr>
					<td colspan="2">
					
						<!-- js 로그인 유효성 검사  -->
						<p id="msg"></p>
						
						<!-- 로그인 실패했을 때 -->
						<c:if test="${result == 0}">
							<div class = "login_warn" style="color: red;">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
						
					</td>
				</tr>

				
				<tr>
				  <td colspan="2" align="center">
				    <input type="submit" value="로그인" id="btn_logincheck">
				    <input type="button"  value="취소" onclick="/home">
				  </td>
				</tr>
				<tr>
					   <td colspan="2" align="center">
					      <%-- <label><input type="checkbox" name="g_id" value="SAVE">아이디 저장</label>	 --%>
					      <label><input type="checkbox" ${empty cookie.id.value ? "":"checked" } name="saveId" value="SAVE">아이디 저장</label>			  
						  &nbsp;&nbsp;&nbsp;
						  <a href="#" onclick="location.href='/agreementG.do'">회원가입</a>
						  &nbsp;&nbsp;&nbsp;
						  <a href="#" onclick="location.href=''">아이디 찾기</a>
						  <a href="#" onclick="location.href=''">비밀번호 찾기</a>
					   </td>
				</tr>	
			</table>
	</form>

<!-- </body> -->
<!-- </html> -->
<%@ include file="../footer.jsp" %>