<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<title>판매자 회원가입</title>

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

tr {padding-bottom: 20px;}

#body{height: auto; min-height: 100%;}

html, body {height: 100%;}

.footer {position: absolute; bottom: 0;}

input {width: 400px; height: 45px; background-color: #f7f7f7; border: none; border-bottom: 1px solid black;} 
input:focus {border: 1px solid #58D68D; outline: none;}

form > div {padding-bottom: 30px;}

#joinSbtn{
	font-size : 18px;
	width: 400x;
	height: 50px;
	background-color: black;
	color: white;
	border: none;
	/* border-radius: 20px;  */
	margin-bottom: 100px;
}

label {font-weight: bold;}


/* 주소 너비, 높이 */
#com_zipcode{width: 270px; height: 45px; margin-right: 25px;}
#com_zipcodeBtn{width: 100px;height: 45px; background-color: black; color: white; border: none;}

.addressbox{padding-bottom: 20px;}

#bank{width: 400px; height: 45px; background-color: #f7f7f7; border: none; border-bottom: 1px solid black;}
#bank:focus{border: 1px solid #58D68D; outline: none;}



/* 아이디 일치 불일치 디스플레이 */
.id_input  {color:#FF0066; display: none; margin-top:5px;}
.id_ok	   {color:#58D68D; display: none; margin-top:5px;}
.id_already{color:#FF0066; display: none; margin-top:5px;}
.id_check  {color:#FF0066; display: none; margin-top:5px;}

/* 비밀번호 일치 불일치 디스플레이 */
.p_pwCheck_input{color:#FF0066; display: none; margin-top:5px;}
.p_pwCheck_johab{color:#FF0066; display: none; margin-top:5px;}
.pw_input		{color:#FF0066; display: none; margin-top:5px;}
.pwcheck_O		{color:#58D68D; display: none; margin-top:5px;}
.pwcheck_X		{color:#FF0066; display: none; margin-top:5px;}

/* 회사명 유효성 검사 */
.company_input {color:#FF0066; display: none; margin-top:5px;}

/* 대표이름 유효성 검사 */
.director_input {color:#FF0066; display: none; margin-top:5px;}

/* 사업자번호 유효성 검사 */
.licence_input{color:#FF0066; display: none; margin-top:5px;}
.licence_check{color:#FF0066; display: none; margin-top:5px;}

/* 은행정보 유효성 검사 */
.bank_input{color:#FF0066; display: none; margin-top:5px;}
.bank_select{color:#FF0066; display: none; margin-top:5px;}

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
    var p_id = $('#p_id').val(); //id값이 "id"인 입력란의 값을 저장
    $.ajax({
        url:'/idCheckS', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{p_id:p_id},
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
                $('#p_id').val();   // → 존재하는 아이디라도 지우지 않고 남겨주는 코드.
            }//if end
        },//seccess:function() end
        error:function(){
            alert("에러입니다");
        }//error:function() end
    });//ajax() end
};//checkId() end


// 비밀번호 일치 확인
function joincCheckPw() {
	var p_pwCheck = $('#p_pwCheck').val();
	var p_pw	  = $('#p_pw').val();
	
	if(p_pwCheck==p_pw){ //비밀번호가 일치하면
		$('.pwcheck_O').css("display","inline-block"); 
        $('.pwcheck_X').css("display", "none");
        $('.pw_input').css("display", "none");
        $('#p_pwCheck').val();
        return true;
	} else { // 비밀번호 불일치
		$('.pwcheck_X').css("display","inline-block");
        $('.pwcheck_O').css("display", "none");
        $('.pw_input').css("display", "none");
        $('#p_pw').val();
        return false;
	}//if end
}//joincCheckPw() end


function checkEmail() {
	   var com_email = $('#com_email').val(); //id값이 "id"인 입력란의 값을 저장
	    $.ajax({
	        url:'/emailScheck', //Controller에서 요청 받을 주소
	        type:'post', //POST 방식으로 전달
	        data:{com_email:com_email},
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
function joinScheck() {

	// 1. 아이디 작성하지 않았을 때
	let p_id = $("#p_id").val().trim();
    if (p_id == "") {
        $('.id_input').css("display","inline-block"); //아이디를 입력해주세요.를 보여주고
        $('.id_ok').css("display", "none");			  //사용 가능한 아이디입니다.는 숨기기
        $('.id_already').css("display", "none");	  //사용중인 아이디입니다.도 숨기기
        $('.id_check').css("display", "none");
        /* $('#m_id').val(''); */
        $("#p_id").focus();
        return false;
    }//if end
	
    // 1-1. 아이디 영문 5글자 이상 
    let id_rule = /^[a-zA-Z0-9]{5,15}$/;
    if(!id_rule.test(p_id)) {
    	$('.id_check').css("display","inline-block");
    	$('.id_input').css("display", "none");
    	$('.id_ok').css("display", "none");
    	$('.id_already').css("display", "none");
		$("#p_id").focus();
		return false;
	}//if end
    
    

    // 2. 비밀번호 체크
	let p_pwCheck = $("#p_pwCheck").val().trim();  // 비밀번호
    let p_pw 	  = $("#p_pw").val().trim();	   // 비밀번호 확인
	
	// 2-1. 비밀번호 작성하지 않았을 때
    if (p_pwCheck == "") {
        $('.p_pwCheck_input').css("display","inline-block"); //아이디를 입력해주세요.를 보여주고
        $('.p_pwCheck_johab').css("display","none");
        $('.pw_input').css("display","none");
        $("#p_pwCheck").focus();
        return false;
    }//if end
    
	// 2-1. 비밀번호 8~20글자 이내 체크
	if(!/^[a-zA-Z0-9]{8,20}$/.test(p_pwCheck)) {
		$('.p_pwCheck_johab').css("display","inline-block");
		$('.p_pwCheck_input').css("display","none");
        $("#p_pwCheck").focus();
		return false;
	}//if end
	$('.p_pwCheck_johab').css("display","none");
    
	// 2-2. 비밀번호 작성하지 않았을 때
    if (p_pw == "") {
        $('.pw_input').css("display","inline-block"); 
        $('.pwcheck_O').css("display", "none");			  
        $('.pwcheck_X').css("display", "none");
        $("#p_pw").focus();
        return false;
    }//if end
    
    
    // 3. 회사명
    let company = $("#company").val().trim();
    if (company == "") {
        $('.company_input').css("display","inline-block"); 		  
        $("#company").focus();
        return false;
    }//if end
    $('.company_input').css("display","none"); 
    
    
    // 4. 대표이름
    let director = $("#director").val().trim();
    if (director == "") {
        $('.director_input').css("display","inline-block"); 		  
        $("#director").focus();
        return false;
    }//if end
    $('.director_input').css("display","none"); 
    
    
    
 // 12/7 여기까지 유효성 검사 완료! - 잘못 작성하고 제대로 작성해도 밑에 빨간색 글자 뜸. (이름을 입력해주세요. 같은 메세지.) if문 밑에 display none 추가하기
    
    
    // 5. 사업자번호
    let licence = $("#licence").val().trim();
    if(director == "" ){
    	 $('.licence_input').css("display","inline-block"); 
    	 $('.licence_check').css("display", "none");
    	 $("#licence").focus();
    	 return false;
    }//if end
    
    // 4-1. 사업자번호 000-00-00000 형식 
    let licence_rule =  /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
    if(!licence_rule.test(licence)){
   	 $('.licence_check').css("display","inline-block"); 
	 $('.licence_input').css("display", "none");
	 $("#licence").focus();
	 return false;
    }//if end
    
    
    // 5. 은행
    let bank = $("#bank").val().trim();
    let bank_num = $("#bank_num").val().trim();
    
    // 5-1. 은헹 선택하지 않으면 false
    if(bank == 0) {
    	$('.bank_select').css("display","inline-block"); 
    	$('.bank_input').css("display", "none");
    	$("#bank").focus();
    	return false;
    }//if end
    
    // 5-2. 계좌번호 입력하지 않으면 false
    if(bank_num == "") {
    	$('.bank_input').css("display","inline-block"); 
    	$('.bank_select').css("display", "none");
    	$("#bank").focus();
    	return false;
    }//if end
    
    
 	// 6. 이메일
 	let com_email = $("#com_email").val().trim();
	// 6-1. 이메일 입력하지 않았을 때
	if(com_email == "") {
		$('.email_input').css("display","inline-block");
		$('.email_ok').css("display", "none");
		$('.email_already').css("display", "none");
		$("#com_email").focus();
  		return false;
	}//if end
	
	// 6-2. 이메일 형식에 맞게 입력하지 않았을 때
	var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!email_rule.test(com_email)) {
		$('.email_input').css("display","inline-block");
		$('.email_ok').css("display", "none");
		$('.email_already').css("display", "none");
		$("#m_email").focus();
		return false; 
	}//if end
	
 	
 	// 7. 전화번호
 	let com_tel = $("#com_tel").val().trim();
	if(com_tel == "") {
		$('.tel_input').css("display","inline-block");
		$('.tel_check').css("display", "none");
		$("#com_tel").focus();
  		return false;
	}//if end
	
 	let tel_rule = /^[0-9]{4}-[0-9]{4}$/;
	if(!tel_rule.test(com_tel)) {
		$('.tel_check').css("display","inline-block");
		$('.tel_input').css("display", "none");
		$("#com_tel").focus();
  		return false;
	}//if end
	
 	// 8. 주소
	 let com_zipcode = $("#com_zipcode").val().trim();
	 if(com_zipcode == "") {
		 $('.addr_input').css("display","inline-block");
		 $("#com_zipcode").focus();
  		return false;
	 }//if end
	
	return true;
	
}//joinGcheck() end

	
	
	
	

</script>




<!-------------------- body start ---------------------->

     	<div class="jform">
		<form id = "form" method="post" action="<c:url value='/joinSproc.do'/>" onsubmit="return joinScheck()">
        <h1>판매자 회원가입</h1>
            <label for="address2" class="form-label mt-4">아이디</label>
        	<div class="textbox">
				<input type="text" id="p_id" name="p_id" oninput="checkId()">
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
	        	<input type="password" id="p_pwCheck" name="p_pwCheck" maxlength="15">
	        	<div>
               	<span class="p_pwCheck_input">비밀번호를 입력해주세요.</span>
               	<span class="p_pwCheck_johab">영문과 숫자조합 8~20자리로 입력해주세요.</span>
               	</div>
            </div>
     
            <label id="title">비밀번호 확인</label>
            <div class="textbox">
                <input type="password" id="p_pw" name="p_pw" maxlength="15" oninput="joincCheckPw()">
               	<div>
               	<span class="pw_input">비밀번호를 입력해주세요.</span>
	        	<span class="pwcheck_O">비밀번호가 일치합니다.</span>
	        	<span class="pwcheck_X">비밀번호가 일치하지 않습니다.</span>
	        	</div>
			</div>
			
			
			<label id="title">회사명</label>
			<div class="textbox">
                <input type="text" id="company" name="company" maxlength="40">
                <div>
               	<span class="company_input">회사명을 입력해주세요.</span>
	        	</div>
			</div>
     
     
            <label id="title">대표이름</label>
			<div class="textbox">
                <input type="text" id="director" name="director" maxlength="40">
                <div>
               	<span class="director_input">이름을 입력해주세요.</span>
	        	</div>
			</div>
			
			<label id="title">사업자번호</label>
			<div class="textbox">
                <input type="text" id="licence" name="licence" maxlength="40">
                <div>
               	<span class="licence_input">사업자번호를 입력해주세요.</span>
               	<span class="licence_check">사업자번호를 정확하게 입력해주세요. ex)000-00-00000</span>
	        	</div>
			</div>
			
	        <label id="title">은행정보</label>
            <div class="textbox">
                 <select id="bank" name="bank">
                 	<option value="0">은행선택</option>
                    <option value="KB국민">KB국민</option>
                    <option value="비씨">비씨</option>
                    <option value="신한">신한</option>
                    <option value="현대">현대</option>
                    <option value="삼성">삼성</option>
                    <option value="롯데">롯데</option>
                    <option value="외환">외환</option>
                    <option value="NH">NH</option>
                    <option value="하나">하나</option>
	             </select>
	        </div>
			<div class="textbox">
                <input type="text" id="bank_num" name="bank_num" maxlength="40" placeholder="계좌번호" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                <div>
               	<span class="bank_select">은행을 선택해주세요.</span>
               	<span class="bank_input">계좌번호를 입력해주세요.</span>
	        	</div>
			</div>
    
                    
            <label id="title">이메일</label>
			<div>
	            <input type="text" id="com_email" name="com_email" maxlength="30" oninput="checkEmail()">
	            <div>
	           	<span class="email_ok">이메일 사용이 가능합니다.</span>
	           	<span class="email_already">이미 사용중인 이메일입니다.</span>
	            <span class="email_input">이메일을 정확하게 입력해주세요. ex)example@example.com</span>
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
            

            <label id="title">전화번호</label>
			<div class="textbox">
	            <input type="text" id="com_tel" name="com_tel" maxlength="9" />
	            <div>
	           	<span class="tel_input">전화번호를 입력해주세요.</span>
	           	<span class="tel_check">전화번호를 형식에 맞게 입력해주세요. ex) 1234-5678</span>
	        	</div>
			</div>


            <label id="title">주소</label>
			<div class="addressbox">
                <input type="text" size="50" id="com_zipcode" name="com_zipcode" placeholder="우편번호" readonly/>
                <input type="button" id="com_zipcodeBtn" value="주소찾기" size="50" onclick="DaumPostcode()"/>
			</div>
			<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px; margin:-10px 0 20px 0; position:relative">
			  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
			</div>

			<div class="addressbox">
                <input type="text" size="50" id="com_addr1" name="com_addr1" placeholder="주소"/>
			</div>
			
			<div class="addressbox">
                <input type="text" size="50" id="com_addr2" name="com_addr2" placeholder="상세 주소"/>
                <div>
	           	<span class="addr_input">주소를 입력해주세요.</span>
	        	</div>
			</div>
			
			
            <br>
            <div>
            <input id="joinSbtn" type="submit" value="가입하기"/> 
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
                document.getElementById('com_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('com_addr1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#com_addr2').focus();
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