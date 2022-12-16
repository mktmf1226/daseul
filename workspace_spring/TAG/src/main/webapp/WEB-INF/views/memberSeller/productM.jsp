<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>
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


<div class="rightcontent" id="rightcontent" style="float:right; width:80%;"> 
	
	<div id="search" style="text-align: right; margin-bottom: 28px;">
		<form method="post" action="/mypageS/productsearch">
						<input type="text" id="pro_name" name="pro_name" value="${pro_name}" style="font-size:12px;" placeholder="상품명으로 검색">
						<input type="submit" id="btnSubmit" value="검색" style="display:none;">
							<label for="btnSubmit">
							<svg width="22" height="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<g clip-path="url(#clip0_429_9118)">
								<path d="M21 21L16.6569 16.6569M16.6569 16.6569C18.1046 15.2091 19 13.2091 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19C13.2091 19 15.2091 18.1046 16.6569 16.6569Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
								</g>
								<defs>
								<clipPath id="clip0_429_9118">
								<rect width="24" height="24" fill="white"/>
								</clipPath>
								</defs>
							</svg>
							</label>
		</form> 	
	</div><!-- search -->

	<table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed;" >
		<tr style=" border-bottom:1px solid black; font-size: 12px;">	
			<td style="padding:0 10px 5px 10px;"> 상품번호</td>
			<td style="padding:0 10px 5px 10px;"> 판매상태</td>
			<td colspan="5" style="padding:0 10px 5px 10px; width: 500px;"> 상품명</td>
			<td style="padding:0 10px 5px 10px;"> 판매가</td>
			<td style="padding-bottom:5px;">
				<button onclick="delbtn()" class="btn btn-outline-black btn-sm" style=" width: 80px;
																					    padding: 2px 2px 2px 2px;
																					    font-weight: 400;
																					    font-size: 10px;">
					선택 상품 삭제
				</button>
			</td>
		</tr>
		
		<c:if test="${empty productlist}"> 
			<tr>
				<td colspan="9" style="padding-top: 20px;">
					등록된 상품이 없습니다.
				</td>
			</tr>
		</c:if>
	
		
		<c:forEach var="row" items="${productlist}" varStatus="vs">
			<tr>
				<td style="border-bottom:1px solid #ededed;" > ${row.pro_no} </td>

				<td style="border-bottom:1px solid #ededed; padding-top: 10px;">
				    <label class="switch"> 
				       
						<c:choose>
							<c:when test="${row.status == 'N' }">
								<input type="checkbox" name="stauts" value="${row.pro_no}" style="display:inline-block;" style="vertical-align:top;" onclick="toggle(this)">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="stauts" value="${row.pro_no}" style="display:inline-block;" style="vertical-align:top;" onclick="toggle(this)" checked>
							</c:otherwise>					
						</c:choose>
					   	    
				        <span class="slider round"></span>
				    </label>
		
				</td> 

				<td colspan="5" style="border-bottom:1px solid #ededed; text-align: left; padding-left: 30px; word-break:break-all;">  
					<button name="detailbtn" class="detailbtn" onclick="detailbtn(this)" value="productMdetail${row.pro_no}">
						${row.pro_name}
					</button>
				</td> 
				

				<td style="border-bottom:1px solid #ededed;">
					<fmt:formatNumber value="${row.price}" pattern="#,###"/>
				</td> 
							
				<td style="border-bottom:1px solid #ededed;"> 
				    <input type="checkbox" name="status" id="checker${row.pro_no}" value="${row.pro_no}" onchange="chkbox(this)">
				    <label for="checker${row.pro_no}" style="padding-left:10px; padding-bottom:18px;"></label>
				</td>
	
			</tr>	
				
		<!-- 상세보기 -->
			<tr class="productdetail" style="display:none" id="productMdetail${row.pro_no}">
					<td style="display:none;"></td>
					<td style="display:none;"></td>
					<td colspan="9" > 
					
					<form name="productMdetail${row.pro_no}" method="post" enctype="multipart/form-data" action="/mypageS/productupdate">
						<input type="hidden" name="pro_no" value="${row.pro_no}">
					
						<div class="productMdetail" >
							<div style="width:30%; height:285px; overflow: hidden; float: left; margin:0 auto;">
							<img src="/storage/${row.postername}" style="width:100%; height:100%; object-fit:cover;">
							</div><!-- main image -->
							
							
							<div style="float:right;  width: 70%; height:300px; padding-left: 25px;"> 
						
								<input type="text" name="pro_name" id="pro_name${row.pro_no}" style=" font-weight:bold; 
														   			 font-size:25px; 
														   			 margin-top:-8px; 
														   			 width:100%; text-align:left; 
														   		     word-break:break-all;
														   			 background-color: transparent;
														   			 border:none;
														   			 margin-bottom: 10px;"
										value="${row.pro_name}" readonly="readonly">
								
								
								<div style="width:100%; text-align:left;">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 10px;">CATEGORY</span>
									<span style="vertical-align: middle; font-size: 13px;" id="categoryhide${row.pro_no}">&nbsp; 
										<c:choose>
											<c:when test="${row.category == 'C'}">의류</c:when>
											<c:when test="${row.category == 'M'}">음반</c:when>
											<c:when test="${row.category == 'P'}">포스터</c:when>
											<c:when test="${row.category == 'A'}">잡화</c:when>
										</c:choose>
									</span>
									
									<div id="categorybox${row.pro_no}" style="display:none; margin-left: 4px;"> 
										<input type="hidden" id="cate${row.pro_no}" value="${row.category}">
										<input type="checkbox" name="category" id="checkercategory${row.pro_no}c" value="C" onclick="NoMultiChkcategory(this)" style="display:none;">
											<label for="checkercategory${row.pro_no}c" style="margin-bottom: 0px;">의류</label>
										<input type="checkbox" name="category" id="checkercategory${row.pro_no}m" value="M" onclick="NoMultiChkcategory(this)" style="display:none;">
											<label for="checkercategory${row.pro_no}m" style="margin-bottom: 0px;">음반</label>
										<input type="checkbox" name="category" id="checkercategory${row.pro_no}p" value="P" onclick="NoMultiChkcategory(this)" style="display:none;">
											<label for="checkercategory${row.pro_no}p" style="margin-bottom: 0px;">포스터</label>
										<input type="checkbox" name="category" id="checkercategory${row.pro_no}a" value="A" onclick="NoMultiChkcategory(this)" style="display:none;">
											<label for="checkercategory${row.pro_no}a" style="margin-bottom: 0px;">잡화</label>	
													
									</div>
								</div>
			  					 		
								<div style="width:100%; text-align:left; margin-top: 7px;">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 50px;">SIZE</span>
									<span style="vertical-align: middle; font-size: 13px;" id="sizehide${row.pro_no}">&nbsp; ${row.size}</span>
									
									<div id="sizebox${row.pro_no}" style="display:none; margin-left: 3px;"> 
										<input type="hidden" id="si${row.pro_no}" value="${row.size}">
										<input type="checkbox" name="size" id="checkersize${row.pro_no}s" value="S" onclick="NoMultiChksize(this)" style="display:none;">
											<label for="checkersize${row.pro_no}s" style="margin-bottom: 0px;">S</label>
										<input type="checkbox" name="size" id="checkersize${row.pro_no}m" value="M" onclick="NoMultiChksize(this)" style="display:none;">
											<label for="checkersize${row.pro_no}m" style="margin-bottom: 0px; margin-left: 19px;">M</label>
										<input type="checkbox" name="size" id="checkersize${row.pro_no}l" value="L" onclick="NoMultiChksize(this)" style="display:none;">
											<label for="checkersize${row.pro_no}l" style="margin-bottom: 0px; margin-left: 16px;">L</label>
										<input type="checkbox" name="size" id="checkersize${row.pro_no}f" value="F" onclick="NoMultiChksize(this)" style="display:none;">
											<label for="checkersize${row.pro_no}f" style="margin-bottom: 0px; margin-left: 35px;">Free</label>	
									</div>
								</div>
								
								<div style="width:100%; text-align:left; margin-top: 7px;">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 38px;">COLOR</span>
									<input type="text" name="color" id="color${row.pro_no}" style=" vertical-align: middle; font-size: 13px;
														   			        background-color: transparent;
														   			        border:none;"
										value="${row.color}" readonly="readonly">
								</div>
								
								<div style="width:100%; text-align:left; margin-top: 7px;">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 58px;">가격</span>
									<input type="number" name="price" id="price${row.pro_no}" style=" vertical-align: middle; font-size: 13px;
														   			        background-color: transparent;
														   			        border:none;"
										value="${row.price}" readonly="readonly">
								</div>
								
								
								<div style="width:100%; text-align:left; margin-top: 7px;">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 26px;">총 판매량</span>
									<span style="vertical-align: middle; font-size: 13px;">&nbsp; ${row.sales}</span>
								</div>
								
								<div style="width:100%; text-align:left; margin-top: 7px;" id="afstock${row.pro_no}">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 26px;">현재 재고</span>
									<span style="vertical-align: middle; font-size: 13px;">&nbsp; ${row.afstock}</span>
								</div>
								
								<div style="width:100%; text-align:left; margin-top:5px; float:left; margin-bottom:5px; display:none;" id="stock${row.pro_no}" >
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 31px;">총 재고량</span>
									<input type="number" name="stock" id="stockinput${row.pro_no}" style=" vertical-align: middle; font-size: 13px;
																					   			      background-color: transparent;
																					   			      border:none;"
										value="${row.stock}" readonly="readonly">
								</div>
								
								<div style="width:100%; text-align:left; margin-top: 7px;">
									<span style="vertical-align: middle; font-size: 13px; font-weight: bold; margin-right: 41px;">등록일</span>
									<span style="vertical-align: middle; font-size: 13px;">&nbsp; ${row.regdate}</span>
								</div>
								
								<div style="width:100%; text-align:left; margin-top: 7px;">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g clip-path="url(#clip0_429_9297)">
										<path d="M19.0711 13.1421L13.4142 18.799C12.6332 19.58 11.3668 19.58 10.5858 18.799L4.92894 13.1421C2.97632 11.1895 2.97632 8.02369 4.92894 6.07106C6.88157 4.11844 10.0474 4.11844 12 6.07106C13.9526 4.11844 17.1185 4.11844 19.0711 6.07106C21.0237 8.02369 21.0237 11.1895 19.0711 13.1421Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
										</g>
										<defs>
										<clipPath id="clip0_429_9297">
										<rect width="24" height="24" fill="white"/>
										</clipPath>
										</defs>
									</svg>
									<span style="vertical-align: middle; font-size: 13px;">&nbsp; ${row.likecnt}</span>
									
										<input type="file" name="fileimg" id="fileimghide${row.pro_no}" style="display:none;"/>
											<label for="fileimghide${row.pro_no}" style="float: right; display:none;" id="fileimg${row.pro_no}">
												<img src="/images/icon/imageupload.png" style="width: 30px; height: 30px;"/>
											</label>
								</div>
							</div><!-- right content -->
							
							<div style="text-align:left; width: 100%; margin-top:32%; height: 300px; padding: 5px 10px 5px 10px; overflow-y:scroll; background-color: white;">
								<div id="edit${row.pro_no}">
									${row.edit}
								 </div>
								<div id="editupdate${row.pro_no}" style="display:none;">
									<textarea id="summernote${row.pro_no}" name="edit"> ${row.edit} </textarea>		
								</div>
							</div>
							
							
							
							
							<button type="button" class="btn btn-outline-black btn-sm" value="${row.pro_no}" id="updatebtn${row.pro_no}" onclick="updatebtn(this)"
									style=" width: 50px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 13px; margin-top: 15px;">
								수정
							</button>
							
							<button value="${row.pro_no}" type="submit" id="updateSavebtn${row.pro_no}" class="btn btn-outline-black btn-sm" 
									style=" display:none; width: 50px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 13px; margin-top: 15px;">
								저장
							</button>
							
							
							<button onclick="productdelete(this)" id="deletebtn${row.pro_no}" value="${row.pro_no}" type="button" class="btn btn-outline-black btn-sm" 
									style=" width: 50px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 13px; margin-top: 15px;">
								삭제
							</button>
							
							<button id="updateCancelbtn${row.pro_no}" type="button" onclick="updateCancelbtn()" class="btn btn-outline-black btn-sm"
									style="display:none; width: 50px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 13px; margin-top: 15px;">
								취소
							</button>
							
						</div> <!-- productMdetail -->
					</form> <!-- productdetail -->
					
					</td>
					<td style="display:none;"></td>
					<td style="display:none;"></td>
			</tr>
		</c:forEach>		
	</table>
	
	<div id="paging" style="text-align: center; margin-top: 20px;">
		<c:if test="${requestScope.count > 0}">
			<c:set var="pageCount" value="${requestScope.totalPage}" />
			<c:set var="startPage" value="${requestScope.startPage}" />
			<c:set var="endPage" value="${requestScope.endPage}" />
	
			<!-- endPage는 10단위이기에 총 페이지가 end 페이지보다 작으면 그 수를 대입한다 -->
			<!-- 즉, 만약 최종 페이지 수가 22라면 30까지 표시할 필요가 없으니 엔드 페이지 수를 22로 맞춘다 -->
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>
	
			<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
			<c:if test="${startPage > 1}">
				<a href="/mypageS/productM?pageNum=${startPage-1}">[이전]</a>
			</c:if>
	
			<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${pageNum == i}">
						<span style="font-weight: bold">${i}</span>
					</c:when>
					<c:when test="${pageNum != i}">
						<a href="/mypageS/productM?pageNum=${i}">${i}</a>
					</c:when>
				</c:choose>
			</c:forEach>
	
			<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
			<c:if test="${endPage < pageCount}">
				<a href="/mypageS/productM?pageNum=${startPage+10}">[다음]</a>
			</c:if>
		
		</c:if>
	 </div>	
					
		
</div><!-- rightcontent -->

</div><!-- float -->

<!-- 본문영역 -->
 
<script>
	
	//선택
	var chkArray = new Array();

	function chkbox(this1) {
        var vla = this1.value;
      
        if (this1.checked) {
        	chkArray.push(vla);
        } else {
            var index = chkArray.indexOf(vla);
            if (index > -1) {
            	chkArray.splice(index, 1);
            }
        }
        //alert(chkArray);
    } 
	
	// 선택삭제
	function delbtn(){
	
		if( chkArray.length < 1 ){
		    alert("삭제할 상품을 선택해주세요.");
		    return;
		}
				
		//배열객체를 JSON 포맷으로 변환
		var chkList = {
		   "chkList" : JSON.stringify(chkArray)
		}
		
		if(confirm('삭제된 상품은 복구되지 않습니다. \n그래도 삭제하시겠습니까?')){
			//chkList를 ajax를 통하여 전송
			$.ajax({
						 url     : "/mypageS/delete"
						,type    : "post"
						,data    : chkList
						,success : function(data) {
							alert('삭제되었습니다.');
							location.reload();
						}
						
			});//ajax end
		}else {
			return false;
		}//if end
		
	}//delbtn() end
	
	// on off
    function toggle(element) {
        var prono = element.value;
		//alert(prono);
		var status = "N";
		
		if (element.checked){
			status = "Y";
			//alert(prono+"##"+status);
		}else {
			status = "N";
		}//if end
		
		$.ajax({
			 url	 : "/mypageS/statusupdate"
			,type 	 : "post"
			,data 	 : {"pro_no":prono, "status":status}
			,success : function(data) {
				//alert('성공');
			}
		});//ajax end
    }//toggle end

    
	function detailbtn(this1) {
    	//alert(this1.value);
    	var divid = "#"+this1.value;
    	
    	
    	if( $(divid).css("display") == "none" ) {
    		$(divid).css("display","table-row");
    		$('.productdetail').not(divid).css('display', 'none');
    	}else {
    		$(divid).css("display","none");
    	}
    }//end
    	
    
    function updatebtn(this1){
    	//alert(this1.value);
    	var prono = this1.value;
    	//alert(prono);
    	
    	var updatebtn = "#updatebtn"+prono;  	        	//수정
    	var deletebtn = "#deletebtn"+prono; 		    	//삭제
    	var updateSavebtn = "#updateSavebtn"+prono;     	//저장
    	var updateCancelbtn = "#updateCancelbtn"+prono; 	//취소
    	$(updatebtn).css("display","none");
    	$(deletebtn).css("display","none");
    	$(updateSavebtn).css("display","inline");
    	$(updateCancelbtn).css("display","inline");
    	
    	var pro_name = "#pro_name"+prono;
    	$(pro_name).attr("readonly", false); 
    	$(pro_name).css("border-bottom","1px solid black");
    	$(pro_name).focus();
    	
    	var categoryhide = "#categoryhide"+prono; 
    	var categorybox = "#categorybox"+prono;
    	var cate = "#cate"+prono;
    	$(categoryhide).css('display','none');
		$(categorybox).css('display','inline');
		//alert($(cate).val());
		var checkercategory_c = "#checkercategory" + prono + "c";
		var checkercategory_m = "#checkercategory" + prono + "m";
		var checkercategory_p = "#checkercategory" + prono + "p";
		var checkercategory_a = "#checkercategory" + prono + "a";
		
		if( $(cate).val() == 'C' ) {
			$(checkercategory_c).attr("checked",true);
		} else if ( $(cate).val() == 'M' ) {
			$(checkercategory_m).attr("checked",true);
		} else if ( $(cate).val() == 'P' ) {
			$(checkercategory_p).attr("checked",true);
		} else {
			$(checkercategory_a).attr("checked",true);
		}
		
		var sizehide = "#sizehide"+prono;
		var sizebox = "#sizebox"+prono; 
		var si = "#si" + prono; 
		$(sizehide).css('display','none');
		$(sizebox).css('display','inline');
		
		var checkersize_s = "#checkersize" + prono + "s";
		var checkersize_m = "#checkersize" + prono + "m";
		var checkersize_l = "#checkersize" + prono + "l";
		var checkersize_f = "#checkersize" + prono + "f";
		
		if( $(si).val() == 'S' ) {
			$(checkersize_s).attr("checked",true);
		} else if ( $(si).val() == 'M' ) {
			$(checkersize_m).attr("checked",true);
		} else if ( $(si).val() == 'L' ) {
			$(checkersize_l).attr("checked",true);
		} else {
			$(checkersize_f).attr("checked",true);
		}
		
		var color = "#color"+prono;
		$(color).attr("readonly", false); 
    	$(color).css("border-bottom","1px solid black");
    	
    	var price = "#price"+prono;
		$(price).attr("readonly", false); 
    	$(price).css("border-bottom","1px solid black");
    	
    	var fileimg = "#fileimg"+prono;
    	$(fileimg).css('display','inline');
    	
		var afstock = "#afstock"+prono;
		var stock = "#stock"+prono;
		var stockinput = "#stockinput"+prono;
		$(afstock).css('display','none');
    	$(stock).css('display','inline');
    	$(stockinput).attr("readonly", false); 
    	$(stockinput).css("border-bottom","1px solid black");
    	
    	var editupdate = "#editupdate"+prono;
    	var edit = "#edit"+prono;
    	var summernote = "#summernote"+prono;
    	
    	$(edit).css("display","none");
    	$(editupdate).css("display","inline");
    
	  	  	//---------------------------------------------------------- summernote
	        $(summernote).summernote({
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
		              	$(summernote).summernote('insertImage', data.url);
		  			 }
		  			,error:function(request,status,error, data){
		              	            alert("Error");
		           	        }
		  		});
		  	}//end
		  //---------------------------------------------------------- summernote
    }//end
    
    function updateCancelbtn() {
    	location.reload();
	}// end
    
	function productdelete(this1){
		var prono = this1.value;
		//alert(prono);
		
		if(confirm("삭제된 상품은 복구되지 않습니다. \n진행할까요?")){

			$.ajax({
				 url	 : "/mypageS/productdelete"
				,type 	 : "post"
				,data 	 : {"pro_no":prono}
				,success : function(data) {
					alert('삭제되었습니다.');
					location.reload();
				}
			});//ajax end
			
		}//if end
	}//delete 
	
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
	
	
	

	
    
</script>


<%@ include file="../footer.jsp" %>