<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>
    


<title>일반회원 약관동의</title>

<style>
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}

		
#box {
	width: 400px;
	margin: 0 auto;
}

	
h1 {
	padding-top: 40px;
	padding-bottom: 40px;
	text-align: center;
	font-weight: bold;
}
	
	.agreement {
		line-height: 37px; /* 행간 */
		font-size: 24px;
		margin-bottom: 30px;
	}
	
	#check_all {
	margin-bottom: 10px;
	}
	
	.checkbox_group {
	margin-bottom: 30px;
	line-height: 20px;
	}
	
	.agreeAll {
	font-weight: bold;
	height: 40px;
	margin-bottom: 25px;
	border-bottom: 1px solid #E5E7E9;
	}
		
	.agreebtn{
	font-size : 18px;
	width: 380px;
	height: 50px;
	background-color: black;
	color: white;
	border: none;
	/* border-radius: 20px;  */
	margin-bottom: 100px;
	}
	
	
	
	
	/* 체크박스 css 시작 --------------------------------------------- */
	input[type="checkbox"] { display: none; }
	
	input[type="checkbox"] + label {
	  display: block;
	  position: relative;
	  padding-left: 35px;
	  font: 14px/20px 'Open Sans', Arial, sans-serif;
	  color: black;
	  cursor: pointer;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	}
	
	input[type="checkbox"] + label:last-child { margin-bottom: 0; }
	
	input[type="checkbox"] + label:before {
	  content: '';
	  display: block;
	  width: 18px;
	  height: 18px;
	  border: 1px solid black;
	  position: absolute;
	  left: 0;
	  top: 0;
	  opacity: .6;
	  -webkit-transition: all .12s, border-color .08s;
	  transition: all .12s, border-color .08s;
	}
	
	input[type="checkbox"]:checked + label:before {
	  width: 10px;
	  top: -5px;
	  left: 5px;
	  border-radius: 0;
	  opacity: 1;
	  border-top-color: transparent;
	  border-left-color: transparent;
	  -webkit-transform: rotate(45deg);
	  transform: rotate(45deg);
	}
	/* 체크박스 css 종료  ---------------------------------------------  */
	
	
	</style>	


<div id="box">
	<h1> 일반회원 회원가입 </h1>

	<form action="/joinG.do" onsubmit="return send()" class="form"> 
	
		<div class="agreement">
		<p> <strong>Tag</strong> 서비스 이용약관에 <br>동의해주세요. </p>
		</div>
		
		<div class="checkbox_group">
			
			<div class="agreeAll">
			<input type="checkbox" id="check_all" >
			<label for="check_all">전체 동의</label> <br>
			</div>
			 
			<input type="checkbox" id="check_1" name="check_1" class="normal" >
			<label for="check_1">[필수] 이용약관 동의 <a href="#">보기</a></label> <br>


			<input type="checkbox" id="check_2" name="check_2" class="normal" >
			<label for="check_2">[필수] 개인정보 수집 및 이용 동의 <a href="#">보기</a></label> <br>
			  
			<input type="checkbox" id="check_3" name="check_3" class="normal" >
			<label for="check_3">[선택] 광고성 정보 수신 및 마케팅 활용 동의 <a href="#">보기</a></label> <br>
		  
		</div>
		
		<div>
			<input type="submit" value="동의 후 회원가입" class="agreebtn"></intput>
		</div>
		
	</form>
</div>



<script>


	// 약관동의 기능
	// 전체동의하면 체크박스 전체 선택
	$(".checkbox_group").on("click", "#check_all", function () {
	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});
	
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;
	
	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	
	    $("#check_all").prop("checked", is_checked);
	});
	
	
	
	
	// 최소 필수약관을 체크해야 회원가입으로 넘어갈 수 있도록 해준다.
	function send() {
		var check_1 = document.getElementById("check_1");
		var check_2 = document.getElementById("check_2");
	
		
		if(check_1.checked && check_2.checked){
			return true;
		}else {
			alert("필수 약관에 동의한 후 회원가입이 가능합니다.");
			return false;
		}//if end	
	}//send() end
	
</script>


<%@ include file="../footer.jsp" %>   