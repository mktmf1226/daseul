<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<title>일반회원 회원가입</title>

<style>

*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}


.jform {
	/* form전체를 div로 감싸서 width기준 가운데 정렬 */
	/* background-color: red; */
	width: 400px;
	margin: 0 auto;
}

h1{
	padding-top: 40px;
	padding-bottom: 40px;
	text-align: center;
	font-weight: bold;
}

tr {
	padding-bottom: 20px;
}


#body{
  height: auto;
  min-height: 100%;
  /* padding-bottom: 20px; */
}


html, body {
  height: 100%;
}


.footer {
  position: absolute;
  bottom: 0;
}



 input {
 	background-color: #f7f7f7;
	width: 400px;
	height: 45px;
	border: none;
	border-bottom: 1px solid black;
} 

input:focus {
        border: 1px solid #58D68D;
        outline: none;
}


form > div {
padding-bottom: 30px;
}

#joinbirth {
	width: 131px;
	height: 45px;
}

#joinbirth_mm {
	width: 130px;
	height: 45px;
	border: none;
    border-bottom: 1px solid black;
}

#joinbirth_mm:focus {
        border: 1px solid #58D68D;
        outline: none;
}

#joinbirth_dd{
	width: 130px;
	height: 45px;
}

#joinGbtn{
	font-size : 18px;
	width: 400x;
	height: 50px;
	background-color: black;
	color: white;
	border: none;
	/* border-radius: 20px;  */
	margin-bottom: 100px;
	}

#gender{
	background-color: #f7f7f7;
	width: 400px;
	height: 45px;
	border: none;
    border-bottom: 1px solid black;
}

#gender:focus {
        border: 1px solid #58D68D;
        outline: none;
}


label {
	font-weight: bold;
}

/* 주소 */
#m_zipcode{width: 270px; height: 45px; margin-right: 25px;}
#m_zipcodeBtn{width: 100px; height: 45px; background-color: black; color: white; border: none;}

.addressbox{padding-bottom: 20px;}




/* 아이디 일치 불일치 디스플레이 */
.id_input  {color:#FF0066; display: none; margin-top:5px;}
.id_ok	   {color:#58D68D; display: none; margin-top:5px;}
.id_already{color:#FF0066; display: none; margin-top:5px;}
.id_check  {color:#FF0066; display: none; margin-top:5px;}

/* 비밀번호 일치 불일치 디스플레이 */
.m_pwCheck_input{color:#FF0066; display: none; margin-top:5px;}
.m_pwCheck_johab{color:#FF0066; display: none; margin-top:5px;}
.pw_input		{color:#FF0066; display: none; margin-top:5px;}
.pwcheck_O		{color:#58D68D; display: none; margin-top:5px;}
.pwcheck_X		{color:#FF0066; display: none; margin-top:5px;}

/* 이름 유효성 검사 none */
.name_input{color:#FF0066; display: none; margin-top:5px;}

/* 닉네임 유효성 검사 */
.nickname_input {color:#FF0066; display: none; margin-top:5px;}

/* 성별 유효성 검사  */
.gender_select{color:#FF0066; display: none; margin-top:5px;}

/* 생년월일 유효성 검사 */
.joinbirth_input{color:#FF0066; display: none; margin-top:5px;}
--.joinbirth_year {color:#FF0066; display: none; margin-top:5px;}
--.joinbirth_day  {color:#FF0066; display: none; margin-top:5px;}

/* 이메일 유효성 검사 */
.email_input  {color:#FF0066; display: none; margin-top:5px;}
.email_ok	  {color:#58D68D; display: none; margin-top:5px;}
.email_already{color:#FF0066; display: none; margin-top:5px;}

/* 핸드폰 유효성 검사 */
.tel_input {color:#FF0066; display: none; margin-top:5px;}
.tel_check {color:#FF0066; display: none; margin-top:5px;}

/* 주소 유효성 검사 */
.addr_input{color:#FF0066; display: none; margin-top:5px;}

</style>


<script>


// 아이디 중복 체크
function checkId(){
    var m_id = $('#m_id').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'/idCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{m_id:m_id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
                $('.id_input').css("display", "none");
                $('.id_check').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                $('.id_input').css("display", "none");
                $('.id_check').css("display", "none");
                /* $('#m_id').val(''); → 존재하는 아이디는 '' 지워주는 코드. */ 
                $('#m_id').val();   // → 존재하는 아이디라도 지우지 않고 남겨주는 코드.
            }//if end
        },//seccess:function() end
        error:function(){
            alert("에러입니다");
        }//error:function() end
    });//ajax() end
};//checkId() end


// 비밀번호 일치 확인
function joincCheckPw() {
	var m_pwCheck = $('#m_pwCheck').val();
	var m_pw	  = $('#m_pw').val();
	
	if(m_pwCheck==m_pw){ //비밀번호가 일치하면
		$('.pwcheck_O').css("display","inline-block"); 
        $('.pwcheck_X').css("display", "none");
        $('.pw_input').css("display", "none");
        $('#m_pwCheck').val();
        return true;
	} else { // 비밀번호 불일치
		$('.pwcheck_X').css("display","inline-block");
        $('.pwcheck_O').css("display", "none");
        $('.pw_input').css("display", "none");
        $('#m_pw').val();
        return false;
	}//if end
}//joincCheckPw() end


function checkEmail() {
	   var m_email = $('#m_email').val(); //id값이 "id"인 입력란의 값을 저장
	    $.ajax({
	        url:'/emailGcheck', //Controller에서 요청 받을 주소
	        type:'post', //POST 방식으로 전달
	        data:{m_email:m_email},
	        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                $('.email_ok').css("display","inline-block"); 
	                $('.email_already').css("display", "none");
	                $('.email_input').css("display", "none");
	            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                $('.email_already').css("display","inline-block");
	                $('.email_ok').css("display", "none");
	                $('.email_input').css("display", "none");
	                $('#m_email').val();   // → 존재하는 아이디라도 지우지 않고 남겨주는 코드.
	            }//if end
	        },//seccess:function() end
	        error:function(){
	            alert("에러입니다");
	        }//error:function() end
	    });//ajax() end

}//checkEmail() end



// 회원가입 유효성 검사
function joinGcheck() {
	
	// 1. 아이디 작성하지 않았을 때
	let m_id = $("#m_id").val().trim();
    if (m_id == "") {
        $('.id_input').css("display","inline-block"); //아이디를 입력해주세요.를 보여주고
        $('.id_ok').css("display", "none");			  //사용 가능한 아이디입니다.는 숨기기
        $('.id_already').css("display", "none");	  //사용중인 아이디입니다.도 숨기기
        $('.id_check').css("display", "none");
        /* $('#m_id').val(''); */
        $("#m_id").focus();
        return false;
    }//if end
    
	
    // 아이디 영문 5글자 이상 
    let id_rule = /^[a-zA-Z0-9]{5,15}$/;
    if(!id_rule.test(m_id)) {
    	$('.id_check').css("display","inline-block");
    	$('.id_input').css("display", "none");
    	$('.id_ok').css("display", "none");
    	$('.id_already').css("display", "none");
		$("#m_id").focus();
		return false;
	}//if end
    
    
    // 2. 비밀번호 체크
	let m_pwCheck = $("#m_pwCheck").val().trim();  // 비밀번호
    let m_pw 	  = $("#m_pw").val().trim();	   // 비밀번호 확인
	
	// 2-1. 비밀번호 작성하지 않았을 때
    if (m_pwCheck == "") {
        $('.m_pwCheck_input').css("display","inline-block"); //아이디를 입력해주세요.를 보여주고
        $('.pw_input').css("display","none");
        $("#m_pwCheck").focus();
        return false;
    }//if end
    
    
	// 2-2. 비밀번호 8~20글자 이내 체크
	if(!/^[a-zA-Z0-9]{8,20}$/.test(m_pwCheck)) {
		$('.m_pwCheck_johab').css("display","inline-block");
		$('.m_pwCheck_input').css("display","none");
        $("#m_pwCheck").focus();
		return false;
	}//if end
    
    
	// 2-1. 비밀번호 작성하지 않았을 때
    if (m_pw == "") {
        $('.pw_input').css("display","inline-block"); 
        $('.pwcheck_O').css("display", "none");			  
        $('.pwcheck_X').css("display", "none");
        $("#m_pw").focus();
        return false;
    }//if end
    
    
    // 3. 이름 입력
    // 3-1. 이름 입력안했을 때
    let m_name 	  = $("#m_name").val().trim();
    if (m_name == "") {
        $('.name_input').css("display","inline-block"); 
        $('.name_check').css("display", "none");			  
        $("#m_name").focus();
        return false;
    }//if end
    
    
    // 4. 닉네임 입력
    let nickname = $("#nickname").val().trim();
    if (nickname == "") {
        $('.nickname_input').css("display","inline-block"); 		  
        $("#m_name").focus();
        return false;
    }//if end
    
    
    // 5. 성별 입력
    let gender = $("#gender").val().trim();
    if (gender == 0) {
        $('.gender_select').css("display","inline-block"); 		  
        $("#gender_select").focus();
        return false;
    }//if end
    
    
    // 6. 생년월일
   let birth = $("#birth").val().trim();
   if (birth >= new Date().toISOString().substring(0, 10)) {
	   $('.joinbirth_input').css("display","inline-block"); 	
	   return false;
   }//if end
    /*
  	let joinbirth 	 = $("#joinbirth").val().trim();
  	let joinbirth_mm = $("#joinbirth_mm").val().trim();
  	let joinbirth_dd = $("#joinbirth_dd").val().trim();
  	
  	// 생년월일 입력
	if(joinbirth == ""){
        $('.joinbirth_input').css("display","inline-block"); 
        $('.joinbirth_year').css("display", "none");
        $('.joinbirth_day').css("display", "none");
        $("#joinbirth").focus();
        return false;
  	}//if end
  	
  	// 년도 4자리 입력
  	let number = /^[0-9]+$/;
  	if(!number.test(joinbirth) || joinbirth < 1940 || joinbirth > 2022) {
  		$('.joinbirth_year').css("display","inline-block");
  		$('.joinbirth_input').css("display", "none");
  		 $('.joinbirth_day').css("display", "none");
  		$("#joinbirth").focus();
  		return false;
  	}//for end
  	
  	// 월 선택 안하면 혼쭐냄
	if(joinbirth_mm == 0){
        $('.joinbirth_input').css("display","inline-block"); 
        $('.joinbirth_year').css("display", "none");
        $('.joinbirth_day').css("display", "none");
        $("#joinbirth").focus();
        return false;
  	}//if end
  	
  	// 날짜가 1보다 작고 31일보다 크면 (날짜 31일 까지만 입력할 수 있도록)
  	if(!number.test(joinbirth_dd) || joinbirth_dd < 1 || joinbirth_dd > 31) {
  		$('.joinbirth_day').css("display","inline-block");
  		$('.joinbirth_input').css("display", "none");
  		$('.joinbirth_year').css("display", "none");
  		$("#joinbirth").focus();
  		return false;
  	}//for end
  	
  	// 날짜가 10보다 작으면 앞에 0 붙여줌. 01, 02, 03 ...
  	let day = "";
  	if(joinbirth_dd < 10){
  		day += "0";
  	}//if end
  	day += joinbirth_dd;
  	//alert(day);
  	
  	// -> 근데 05라고 작성하면 ? 005로 출력됨.. 이 문제를 어떻게 해결할꼬
  	
  	let birth = joinbirth + joinbirth_mm + joinbirth ;
    $("#birth").val().trim() = birth;
    //alert(birth);
    let form = $("#form").val().trim();
    form.submit();
  	*/
  	
	
	//7. 이메일
	let m_email = $("#m_email").val().trim();
	// 7-1. 이메일 입력하지 않았을 때
	if(m_email == "") {
		$('.email_input').css("display","inline-block");
		$('.email_ok').css("display", "none");
		$('.email_already').css("display", "none");
		$("#m_email").focus();
  		return false;
	}//if end
		
	
	// 7-2. 이메일 형식에 맞게 입력하지 않았을 때
	var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!email_rule.test(m_email)) {
		$('.email_input').css("display","inline-block");
		$('.email_ok').css("display", "none");
		$('.email_already').css("display", "none");
		$("#m_email").focus();
		return false; 
	}//if end
	
	
	
	
	// 8. 휴대전화
	let m_tel = $("#m_tel").val().trim();
	if(m_tel == "") {
		$('.tel_input').css("display","inline-block");
		$('.tel_check').css("display", "none");
		$("#m_tel").focus();
  		return false;
	}//if end
	
	// 8-1. 휴대전화 규칙성
	 var tel_rule   = /^\d{2,3}-\d{3,4}-\d{4}$/;
	 if(!tel_rule.test(m_tel)) {
		 $('.tel_check').css("display","inline-block");
		 $('.tel_input').css("display", "none");
		 $("#m_tel").focus();
	  	 return false;
	 }else {
	 	$('.tel_input').css("display", "none");
	 	$('.tel_check').css("display", "none");
	 }//if end
	
	 // 9. 주소 
	 let m_zipcode = $("#m_zipcode").val().trim();
	 if(m_zipcode == "") {
		 $('.addr_input').css("display","inline-block");
		 $("#m_zipcode").focus();
  		return false;
	 }//if end
	
	return true;
	
}//joinGcheck() end

	
	
	
	

</script>




<!-------------------- body start ---------------------->

     	<div class="jform">
		<form id = "form" method="post" action="<c:url value='/joinGproc.do'/>" onsubmit="return joinGcheck()">
        <h1>일반회원 회원가입</h1>
            <label for="address2" class="form-label mt-4">아이디</label>
        	<div class="textbox">
				<input type="text" id="m_id" name="m_id" oninput="checkId()">
				<!-- id ajax 중복체크 -->
				<div>
				<span class="id_input">아이디를 입력해주세요.</span>
				<span class="id_check">아이디는 영문, 숫자 5~15자리로 입력해주세요.</span>
				<span class="id_ok">사용 가능한 아이디입니다.</span>
				<span class="id_already">사용중인 아이디입니다.</span> 
				</div>
			</div>

 
	        <label id="title">비밀번호</label>
        	<div class="textbox">
	        	<input type="password" id="m_pwCheck" name="m_pwCheck" maxlength="15">
	        	<div>
               	<span class="m_pwCheck_input">비밀번호를 입력해주세요.</span>
               	<span class="m_pwCheck_johab">영문과 숫자조합 8~20자리로 입력해주세요.</span>
               	</div>
            </div>
     
            <label id="title">비밀번호 확인</label>
            <div class="textbox">
                <input type="password" id="m_pw" name="m_pw" maxlength="15" oninput="joincCheckPw()">
               	<div>
               	<span class="pw_input">비밀번호를 입력해주세요.</span>
	        	<span class="pwcheck_O">비밀번호가 일치합니다.</span>
	        	<span class="pwcheck_X">비밀번호가 일치하지 않습니다.</span>
	        	</div>
			</div>
     
            <label id="title">이름</label>
			<div class="textbox">
                <input type="text" id="m_name" name="m_name" maxlength="40">
                <div>
               	<span class="name_input">이름을 입력해주세요.</span>
	        	</div>
			</div>
			
			<label id="title">닉네임</label>
			<div class="textbox">
                <input type="text" id="nickname" name="nickname" maxlength="40">
                <div>
               	<span class="nickname_input">닉네임을 입력해주세요.</span>
	        	</div>
			</div>
                    
	        <label id="title">성별</label>
            <div class="textbox">
                 <select id="gender" name="gender">
                 	<option value="0">성별</option>
                    <option value="F">여성</option>
                    <option value="M">남성</option>
	             </select>
                <div>
               	<span class="gender_select">성별을 선택해주세요.</span>
	        	</div>
             </div>

             <label id="title">생년월일</label>
             <div>
             <input type="date" id="birth" name="birth" min="1940-01-01">
             <div>
               	<span class="joinbirth_input">정확한 생년월일을 선택해주세요.</span>
	        </div>
             
<!--              	<input type="text" id="joinbirth" name="joinbirth" maxlength="4" placeholder="년(4자)" size="6" >
                 <select id="joinbirth_mm" name="joinbirth_mm">
                     <option value="0">월</option>
                     <option value="01" >1</option>
                     <option value="02" >2</option>
                     <option value="03" >3</option>
                     <option value="04" >4</option>
                     <option value="05" >5</option>
                     <option value="06" >6</option>
                     <option value="07" >7</option>
                     <option value="08" >8</option>
                     <option value="09" >9</option>
                     <option value="10" >10</option>
                     <option value="11" >11</option>
                     <option value="12" >12</option>
                 </select>
                 <input type="text" id="joinbirth_dd" name="joinbirth_dd" maxlength="2" placeholder="일" size="4" >
                 <input type = "hidden" id= "birth" name="birth">
                 <div>
               	 <span class="joinbirth_input">생년월일을 정확하게 작성해주세요.</span>
               	 <span class="joinbirth_year">태어난 년도 4자리를 정확하게 입력해주세요.</span>
               	 <span class="joinbirth_day">날짜를 정확하게 입력해주세요.</span>
	        	 </div> -->
             </div>

            <label id="title">이메일</label>
			<div>
	            <input type="text" id="m_email" name="m_email" maxlength="30" oninput="checkEmail()">
	            <div>
	           	<span class="email_ok">이메일 사용이 가능합니다.</span>
	           	<span class="email_already">이미 사용중인 이메일입니다.</span>
	            <span class="email_input">이메일을 정확하게 입력해주세요. ex) example@example.com</span>
	                <!-- 
	                <input type="text" name="m_email" maxlength="30">@
	                <select name="email_2">
	                    <option>naver.com</option>
	                    <option>daum.net</option>
	                    <option>gmail.com</option>
	                    <option>nate.com</option>                        
	                </select>
	                -->
		        </div>
            </div>
            
            

            <label id="title">휴대전화</label>
			<div class="textbox">
	            <input type="text" id="m_tel" name="m_tel" />
	            <div>
	           	<span class="tel_input">전화번호를 입력해주세요.</span>
	           	<span class="tel_check">전화번호를 형식에 맞게 입력해주세요. ex) 010-1234-5678</span>
	        	</div>
			</div>


            <label id="title">주소</label>
			<div class="addressbox">
                <input type="text" size="50" id="m_zipcode" name="m_zipcode" placeholder="우편번호" readonly/>
                <input type="button" id="m_zipcodeBtn" value="주소찾기" size="50" onclick="DaumPostcode()"/>
			</div>
			<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px; margin:-10px 0 20px 0; position:relative">
			  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>

			<div class="addressbox">
                <input type="text" size="50" id="m_addr1" name="m_addr1" placeholder="주소"/>
			</div>
			
			<div class="addressbox">
                <input type="text" size="50" id="m_addr2" name="m_addr2" placeholder="상세 주소"/>
                <div>
	           	<span class="addr_input">주소를 입력해주세요.</span>
	        	</div>
			</div>
			
			
            <br>
            <div>
            <input id="joinGbtn" type="submit" value="가입하기"/> 
            </div>
        </form>

        
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('m_addr1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#m_addr2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
        
        </div>


<%@ include file="../footer.jsp" %>    