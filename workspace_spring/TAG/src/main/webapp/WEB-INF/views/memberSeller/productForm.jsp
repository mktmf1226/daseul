<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../header.jsp" %>
<%@ include file="summernote_ssi.jsp" %>


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
				<li class="side_liT" style="color:lightgreen;"> PRODUCT </li>
					<li>&nbsp;<a href="/mypageS/create" style="color:black; font-size: 12px;" class="fontS">  - 상품등록 &nbsp;</a></li>
					<li>&nbsp;<a href="/mypageS/productM" style="color:black; font-size: 12px;" class="fontS">  - 상품관리 &nbsp;</a></li>
		<br>	
				<li class="side_liT"> ORDER </li>
					<li>&nbsp;<a href="/mypageS/orderM" style="color:black; font-size: 12px;" class="fontS"> - 주문관리 &nbsp;</a></li>	
		<br>	
				<li class="side_liT"> QnA </li>
					<li>&nbsp;<a href="/mypageS/qna" style="color:black; font-size: 12px;" class="fontS"> - 답변대기 &nbsp;</a></li>
					<li>&nbsp;<a href="/mypageS/answer" style="color:black; font-size: 12px;" class="fontS"> - 답변완료 &nbsp;</a></li>
		<br>			
				<li style="font-size: 12px; font-weight: 400; color: #bcbcbc;" class="fontS"> <a> 회원정보수정 </a> </li>
			</ul>
		</div><!-- stickyC -->
	 </div><!-- stickyP -->
</div><!-- "leftcontent" -->



<div class="rightcontent" style="float:right; width:80%;"> 
	<form method="post" action="/mypageS/productProc" name="productForm" onsubmit="return productCheck()" enctype="multipart/form-data">
	
		<input type="hidden" name="p_id" value="${s_p_id}"><!-- 세션아이디 -->

		<select name="c_no" id="c_no" style="width:100%;">
			<option selected value="-">해당 공연을 선택해주세요.</option>
			<c:forEach var="row" items="${concertlist}" varStatus="vs"> 
				<option value="${row.c_no}">[${row.date}] &nbsp; ${row.title} </option>
			</c:forEach>
		</select>
			<span class="productck" id="cnock">&nbsp;공연 선택은 필수입니다&nbsp;</span>

		<p style="margin-top:20px; font-size:13px;">상품명</p>
			<input type="text" name="pro_name" id="pro_name" style="width:100%;"/>
			<span class="productck" id="pronameck" style="margin-top:5px;">&nbsp;상품명을 작성해주세요&nbsp;</span>
	
	<br>
		<div style="display:inline-block; width:35%; padding-top:20px;">
			<table class="cktable">
				<tr>
					<td> 
					    <input type="checkbox" name="category" id="checker1" value="C" onclick="NoMultiChkcategory(this)"><label for="checker1">의류</label>
					</td>
					<td>    
					    <input type="checkbox" name="category" id="checker2" value="P" onclick="NoMultiChkcategory(this)"><label for="checker2">포스터</label>
					</td>
					<td>   
					    <input type="checkbox" name="category" id="checker3" value="M" onclick="NoMultiChkcategory(this)"><label for="checker3">음반</label>
					</td>
					<td>   
					    <input type="checkbox" name="category" id="checker4" value="A" onclick="NoMultiChkcategory(this)"><label for="checker4">잡화</label>
					</td>
				</tr>
				<tr>
					<td>
					    <input type="checkbox" name="size" id="checker5" value="S" onclick="NoMultiChksize(this)"><label for="checker5">S</label>
					</td>
					<td>    
					    <input type="checkbox" name="size" id="checker6" value="M" onclick="NoMultiChksize(this)"><label for="checker6">M</label>
					</td>
					<td>    
					    <input type="checkbox" name="size" id="checker7" value="L" onclick="NoMultiChksize(this)"><label for="checker7">L</label>
					</td>
					<td>    
					    <input type="checkbox" name="size" id="checker8" value="F" onclick="NoMultiChksize(this)"><label for="checker8">Free</label>
					</td>
				</tr>
			</table>
				<span class="productck" id="categoryck">&nbsp;상품의 <strong>카테고리</strong>를 선택해주세요&nbsp;</span>
				<span class="productck" id="sizeck">&nbsp;상품의 <strong>사이즈</strong>를 선택해주세요&nbsp;</span>
		</div> <!-- 체크박스 -->
		
		
		
		<div style="display:inline-block; width:64%; padding:10px 0 20px 0;">
			<table class="inptable" style="font-size:13px; width:100%;">  
				<tr>
					<td style="padding: 0 10px 0 0;">
						<p style="margin-top:15px;">색상</p>
						<input type="text" name="color" id="color" size="15"/>
					</td>	
					<td style="padding: 0 10px 0 0;">
						<p style="margin-top:15px;">가격</p>
						<input type="number" name="price" id="price" style="text-align:right; width: 150px;"/>
					</td>		
					<td style="padding: 0 10px 0 0;">
						<p style="margin-top:15px;">재고</p>
						<input type="number" name="stock" id="stock" style="text-align:right; width: 150px;"/>
					</td>	
					<td style="vertical-align:bottom; padding: 0 20px 0 20px;">
						<input type="file" name="fileimg" id="fileimg" style="display:none;"/>
						<label for="fileimg">
							<img src="/images/icon/imageupload.png" style="width: 30px; height: 30px; margin-bottom:-10px;"/>
						</label>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-top:5px;">
						<span class="productck" id="colorck" style="text-align:left;">&nbsp;상품의 <strong>색상</strong>을 작성해주세요&nbsp;</span>
						<span class="productck" id="priceck" style="margin-left:165px;">&nbsp;상품의 <strong>가격</strong>을 작성해주세요&nbsp;</span>
						<span class="productck" id="stockck" style="margin-left:331px;">&nbsp;상품의 <strong>재고 총 수량</strong>을 작성해주세요&nbsp;</span>
						<span class="productck" id="fileck" style="float: right;">&nbsp;상품의 <strong>대표 이미지</strong>를 등록해주세요&nbsp;</span>
					</td>
				</tr>
			</table>	
					
		 </div>	<!-- 정렬용 -->
	
	<br><br>
		
		    <textarea id="summernote" name="edit"></textarea>		   
<br>	
			<button type="submit" value="등록" style="float:right" class="btn btn-outline-black btn-sm">등록</button>
		
	</form>
</div><!-- rightcontent -->

</div><!-- float -->

<!-- 본문영역 -->

     
<script>
	$(document).ready(function(){
		$("#c_no").focus();
	});
	
	//유효성
	function productCheck() {
		if( $("#c_no").val() == "-"){
			$("#c_no").focus();
			$("#cnock").css("display","inline-block");
			return false;
		}else {
			$("#cnock").css("display","none");
		}
		
		
		if ($("#pro_name").val().length == 0) {
			$("#pro_name").focus();
			$("#pronameck").css("display","inline-block");
			return false;
		}else {
			$("#pronameck").css("display","none");
		}
		
		if (!$("input:checked[Name='category']").is(":checked")){ 
			$("#c_no").focus();
			$("#categoryck").css("display","inline-block");
			return false;
		}else {
			$("#categoryck").css("display","none");
		}
		
		if (!$("input:checked[Name='size']").is(":checked")){ 
			$("#c_no").focus();
			$("#sizeck").css("display","inline-block");
			return false;
		}else {
			$("#sizeck").css("display","none");
		}
		
		if ($("#color").val().length == 0) {
			$("#color").focus();
			$("#colorck").css("display","inline-block");
			return false;
		}else {
			$("#colorck").css("display","none");
		}
		
		if ($("#price").val().length == 0) {
			$("#price").focus();
			$("#priceck").css("display","inline-block");
			return false;
		}else {
			$("#priceck").css("display","none");
		}
		
		if ($("#stock").val().length == 0) {
			$("#stock").focus();
			$("#stockck").css("display","inline-block");
			return false;
		}else {
			$("#stockck").css("display","none");
		}
		
		if($('#fileimg').val() == "") {
		    $("#stock").focus();
		    $("#fileck").css("display","inline-block");
		    return false;
		}else {
			$("#fileck").css("display","none");
		}
		
		
		return true;
	}//productCheck() end
	
	// 체크박스 중복불가 
	function NoMultiChkcategory(chk){
		  var obj = document.getElementsByName("category");
		   for(var i=0; i<obj.length; i++){
		     if(obj[i] != chk){
		       obj[i].checked = false;
		     }
		   }//카테고리
	}//NoMultiChk() END

	function NoMultiChksize(chk){
		  var obj = document.getElementsByName("size");
		   for(var i=0; i<obj.length; i++){
		     if(obj[i] != chk){
		       obj[i].checked = false;
		     }
		   }//사이즈
	}//NoMultiChksize() END	
	
	
//----------------------------------------------------------------------- SUMMERNOTE 

	  // summernote
      $('#summernote').summernote({
        //placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 400,
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
		    ['insert',['picture','link','video']],
		    ['view',['codeview']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        lang: "ko-KR",	
      	//여기 부분이 이미지를 첨부하는 부분 
		callbacks: {	
			onImageUpload : function(files) {
				uploadSummernoteImageFile(files[0],this);
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		}//callback end 
	});//end
	
	// 이미지업로드로직
	function uploadSummernoteImageFile(file, editor) {
		var data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	$('#summernote').summernote('insertImage', data.url);
			 }
			,error:function(request,status,error, data){
            	            alert("Error");
         	        }
		});
	}//end
	
</script>
  
  
<%@ include file="../footer.jsp" %>