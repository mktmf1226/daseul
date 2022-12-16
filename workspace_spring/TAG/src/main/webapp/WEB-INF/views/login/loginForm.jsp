<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>


<style>
.table {
	border: none;
	text-align: center;
    vertical-align: middle;

}

.login-title {
	font-size : 25px;
}


.login-btn {	
	font-size : 14px;
	width: 120px;
	height: 40px;
	background-color: black;
	color: white;
	border: none;
	border-radius: 20px; 
  }
  
  .join-btn {	
	font-size : 14px;
	width: 120px;
	height: 40px;
	background-color: white;
	color: black;
	border: 1px solid black;
	border-radius: 20px; 
	margin-right: 10px;
  }
  
  .login-btn:hover {
  	color: black;
  	background-color: #33FF33;
  }

.untree_co-section {
padding-top:55px;
height: 425px;
}


td {
 border-spacing: 0 10px;
height: 325px;
vertical-align:middle;
border-top-width: 0px;
}

.seller {
	width: 400px;
	height: 400px;
	border: 1px solid;
}

.general {
	width: 400px;
	height: 400px;
	border: 1px solid;
}

/* .table {
  height: auto;
  min-height: 100%;
  padding-bottom: 170px;
} */

footer{
  height: 170px;
  position : relative;
  transform : translateY(-100%);
}

p {padding-bottom: 10px;}
  
</style>

<!-- 본문영역 -->

<table class="table"  style="text-align: center; vertical-align:middle;">

	<td class="seller"> <!-- 판매자 회원 박스 시작 -->
		<div class='my-div'>
			<p class="login-title" >판매자 회원</p>
		 	<button class="join-btn" type="button" onclick="location.href='/agreementS.do'">회원가입</button>
		 	<button class="login-btn" type="button" onclick="location.href='loginS.do'">로그인</button>
		</div>
	</td> <!-- 판매자 회원 박스 끝 -->
	
	<td class="general"> <!-- 일반 회원 박스 시작 -->
		<div class='my-div'>
			<p class="login-title">일반 회원</p>
		 	<button class="join-btn" type="button" onclick="location.href='/agreementG.do'">회원가입</button>
		 	<button class="login-btn" type="button" onclick="location.href='/loginG.do'">로그인</button>
		</div>
	</td> <!-- 일반 회원 박스 끝 -->
	
</table>


<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>