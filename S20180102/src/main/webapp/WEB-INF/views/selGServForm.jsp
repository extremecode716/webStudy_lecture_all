<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../../js/jquery.js"></script> -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="js/timedropper.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/timedropper.css">
<script type="text/javascript">
	function selchange(){
	    $('#areaSelect2').find('option').each(function(){
	        $(this).remove();
	        console.log("remove");
	    });
	    $('#areaSelect2').append("<option value=''>SELECT</option>");
	    var itemCode = $('#areaSelect').val();
		console.log(itemCode);
	    if(itemCode !=''){
	        	
	        $.ajax({
	            type : 'POST',
	            url  : '<%=context%>/rest/selArea.do',
	            data : {itemCode : itemCode},
	            dataType: 'json',
	            success:function(data){
	                if(data==null){
	                    data = 0;
	                }
	                for(var i = 0; i < data.length; i++){
	                    $('#areaSelect2').append("<option value='"+data[i]['itemCode']+"'>"+data[i]['itemName']+"</option>");
	                }
	            }
	        });
	       
	    }
	}
	$(function(){
		var days = "<c:out value="${gsDto.gservDay}"/>";
		var dayArray = days.split(',');
		for(i = 0; i <= dayArray.length; i++){
			var x = dayArray[i];
			$('#'+x).attr("checked", true);	
		}
		var gSub = "<c:out value="${gsDto.gservSub}"/>";
		console.log(gSub);
		
			$('input[value='+gSub+']').attr("checked", true);
		
		$('#deletebtn').click(function(){
			if (confirm("정말 삭제하시겠습니까?? \n삭제하시면 복구할 수 없습니다.") == true){    //확인
			    location.href="delServ.do?gservNo=${gsDto.gservNo}";
			}else{   //취소
			    return;
			}
		});
	})
	
	
	function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
	one_char = str.charAt(i);
		if(escape(one_char).length > 4){
		    rbyte += 2;                                         //한글2Byte
		} else{
		    rbyte++;                                            //영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
		    rlen = i+1;                                          //return할 문자열 갯수
		}
	}

	if(rbyte > maxByte){
	    alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	    str2 = str.substr(0,rlen);                                  //문자열 자르기
	    obj.value = str2;
	    fnChkByte(obj, maxByte);
	}else{
	    document.getElementById('byteInfo').innerText = rbyte;
	}
}
	
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b24a9183b89e5f123d2fb212ebf6e317&libraries=services"></script>
<style type="text/css">
.btn {
	padding: 2px 6px;
}
label.btn span {
	font-size: 1.5em;
}

label input[type="radio"] ~ i.fa.fa-circle-o {
	color: #c8c8c8;
	display: inline;
}

label input[type="radio"] ~ i.fa.fa-dot-circle-o {
	display: none;
}

label input[type="radio"]:checked ~ i.fa.fa-circle-o {
	display: none;
}

label input[type="radio"]:checked ~ i.fa.fa-dot-circle-o {
	color: #7AA3CC;
	display: inline;
}

label:hover input[type="radio"] ~ i.fa {
	color: #7AA3CC;
}

label input[type="checkbox"] ~ i.fa.fa-square-o {
	color: #c8c8c8;
	display: inline;
}

label input[type="checkbox"] ~ i.fa.fa-check-square-o {
	display: none;
}

label input[type="checkbox"]:checked ~ i.fa.fa-square-o {
	display: none;
}

label input[type="checkbox"]:checked ~ i.fa.fa-check-square-o {
	color: #7AA3CC;
	display: inline;
}

label:hover input[type="checkbox"] ~ i.fa {
	color: #7AA3CC;
}

div[data-toggle="buttons"] label.active {
	color: #7AA3CC;
}

div[data-toggle="buttons"] label {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: normal;
	line-height: 2em;
	text-align: left;
	white-space: nowrap;
	vertical-align: top;
	cursor: pointer;
	background-color: none;
	border: 0px solid #c8c8c8;
	border-radius: 3px;
	color: #c8c8c8;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

div[data-toggle="buttons"] label:hover {
	color: #7AA3CC;
}

div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active
	{
	-webkit-box-shadow: none;
	box-shadow: none;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
} 

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
} 

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display {  /* 이미지가 표시될 지역 */
  margin-bottom: 5px;
}

@media(min-width: 768px) { 
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}

.filebox .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
  display: inline-block;
  width: 54px;
  padding: 2px;
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
}

.filebox .upload-display img {  /* 추가될 이미지 */
  display: block;
  max-width: 100%;
  width: 100% \9;
  height: auto;
}
</style>
</head>
<body style="background-color: #eaeaea">
<div class="container" style="background-color: white; padding: 30px">
<form action="selGServPro.do" method="post" enctype="multipart/form-data">
	<c:set var="gs" value="${gsDto}"></c:set>
		<div style="margin-top: 50px; margin-bottom: 20px">
				<h4>
					<b>상품명</b>
				</h4>
		</div>
			<input type="text" name="gservTitle"
				   required="required" class="form-control" value="${gs.gservTitle }"> 
			<input type="hidden" name="gno" value="${gs.gno }"> 
			<input type="hidden" name="gservNo" value="${gs.gservNo }">
			<hr> 	
		<table>
				<tr>
					<td><h5><b>가이드 지역</b></h5></td>
				</tr>
				<tr>
					<td><select name="gservAreaG" id="areaSelect" value=""
							    style="min-width: 200px;" class="form-control"
								onchange="selchange()" required="required">
							<option value="01">지역</option>
							<option value="01">서울</option>
							<option value="02">부산</option>
							<option value="03">인천</option>
							<option value="04">대구</option>
							<option value="05">대전</option>
							<option value="06">광주</option>
							<option value="07">울산</option>
							<option value="08">강원</option>
							<option value="09">경기</option>
							<option value="10">충북</option>
							<option value="11">충남</option>
							<option value="12">경남</option>
							<option value="13">경북</option>
							<option value="14">전북</option>
							<option value="15">전남</option>
							<option value="16">제주</option>
					</select></td>
					<td><select name="gservArea" id="areaSelect2"
							    style="min-width: 200px;" class="form-control"
								required="required">
							<option value="${gs.gservArea}">SELECT</option>
					</select></td>
				</tr>
				
		<tr>
					<td><h6><b>서비스 개시일*</b></h6></td>
					<td><h6><b>서비스 종료일*</b></h6></td>
					<td></td>
		</tr>
		<tr>
					<td><input title="서비스개시일" type="date" name="gservSDate"
							   style="min-width: 200px;" class="form-control" value=""
							   required="required"></td>
					<td><input title="서비스종료일" type="date" name="gservEDate"
							   style="min-width: 200px;" class="form-control" value=""
							   required="required"></td>
		</tr>
	</table>
		<div style="margin-top: 30px">			
				<h5><b>서비스 가능 요일</b></h5>
		</div>
		<div class="row" style="margin-left: 20px; margin-top: 20px">
				<div class="btn-group btn-group col-lg-8" style="padding-left: 0px;"
					data-toggle="buttons">
					<label class="btn"> <input type="checkbox" name="days"
						value="D1" id="D1" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>일</span>
					</label> <label class="btn"> <input type="checkbox" name="days"
						value="D2" id="D2" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>월</span>
					</label> <label class="btn"> <input type="checkbox" name="days"
						value="D3" id="D3" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>화</span>
					</label> <label class="btn"> <input type="checkbox" name="days"
						value="D4" id="D4" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>수</span>
					</label> <label class="btn"> <input type="checkbox" name="days"
						value="D5" id="D5" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>목</span>
					</label> <label class="btn"> <input type="checkbox" name="days"
						value="D6" id="D6" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>금</span>
					</label> <label class="btn"> <input type="checkbox" name="days"
						value="D7" id="D7" style="display: none;"><i
						class="fa fa-square-o fa-2x"></i><i
						class="fa fa-check-square-o fa-2x"></i><span>토</span>
					</label>
				</div>
			</div>
			
	  	<hr>
		<div style="margin: 50px 0px">
		<h5><b>상품 소개</b></h5><br>
				<small>모든 글은 4000바이트를 초과하여 입력하실 수 없습니다.*</small>
				<textarea name="gservIntro" rows="60" cols="140" required="required"
						  style="margin-left: 10px; height: 400px; padding: 20px"
						  placeholder="상품소개를 작성해주세요."
						  onKeyUp="javascript:fnChkByte(this,'4000')"
						  >${cDtoList[0].gservIntro }</textarea>
		</div>
		<hr>
			<table style="width: 700px">
					<tr>
						<td>만나는 장소</td>
						<td>픽업시간</td>
					</tr>
		<!-- 지도 -->
					<tr>
						<td><input type="text" value="" id="keyword" placeholder="장소검색" 
							style="display: inline-block; width: 70%"
							class="form-control">
						<input type="button" value="검색" onclick="searchPlaces()"
							style="display:inline-block; width:20%" class="btn-info form-control">
						</td>
						<td><input type="text" id="alarm" name="pickUpTime"  value="${gs.pickUpTime }" 
							style="min-width: 200px;" class="form-control">
						</td>
					</tr>
			</table>
		<input type="hidden" name="pickUpLoc" id="pickUpLoc" value="${gs.gservGps }" required="required">	
    
        <br>
       			<span style="float:right; margin-bottom: 20px;">
					<input type="file" name="pickUpImg" value="${cDtoList[0].imgSrc }"><br>
					<small>구체적인 픽업 장소 사진을 업로드하여 주세요.</small>
				</span>
		<!-- 지도 -->
				<div id="map" style="width: 100%; height: 300px;"
					 class="form-control"></div>
				<span style="color:red;"><small>*지도 상에서 정확한 픽업 위치를 표시해주세요</small></span>
				<input type="hidden" name="gservOrder" value="0">
		<hr>
		
		<div style="margin-top: 50px; margin-bottom: 70px">
			<h5><b>코스 등록</b></h5>
			<small>*진행되는 코스를 자세히 소개해주세요</small>
			<br>	
		</div>	
		<table id="TblAttach" class="table table-striped"
					style="margin-top: 10px; text-align: center">
					<tr>
						<th>#</th>
						<th>장소</th>
						<th>소개</th>
						<th>이미지</th>
						<th></th>
					</tr>
					<%
						int num = 1;
					%>
			<c:forEach var="cDto" items="${cDtoList }">
			<c:if test="${cDto.gservOrder!=0}">
			<tr>
					<td><%=num%><input type="hidden" name="gservOrder" value="<%=num%>"></td>
					<%num++; %>
					<td><input type="text" name="introTitle" class="form-control" value="${cDto.introTitle }"></td>
					<td><textarea rows="5" cols="50" name="gservIntro" required="required" class="form-control" onKeyUp="javascript:fnChkByte(this,'4000')"
						>${cDto.gservIntro }</textarea>
					</td>
					<td>
						<div class="filebox preview-image">
							<div class="upload-display"><div class="upload-thumb-wrap"><img src="${pageContext.request.contextPath}/images/${cDto.imgSrc }" class="upload-thumb"></div></div> 
							<input type="text" class="upload-name" value="${cDto.imgSrc }" disabled="disabled" >
							<input type="hidden" name="imgSrc" value="${cDto.imgSrc }"> 
							<label for="input-file<%=num%>">File</label> 
							<input type="file" id="input-file<%=num%>" name="imgfile" class="upload-hidden"> 
						</div>
    				</td>
					<td><input type="button" name="addServ" style="font-size: 12px"
							class="btn" onclick="addItem()" value="+">
							<input type="button" name="fixServ" class="btn"
							  style="font-size: 12px" value="X" onclick="delItem()"></td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
			<div style="margin: 60px 0px">
			<h5><b>상품유형</b></h5>
			<br>
			<br>
			</div>
			<div class="row">
				<div class="btn-group btn-group-vertical col-lg-2"
					data-toggle="buttons">
					<label class="btn"> <input type="radio" name="gservSub"
						value="1001" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>명소</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1002" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>음식</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1003" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>이색투어</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1004" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>문화</span><br>
					</label>
				</div>
				<div class="btn-group btn-group-vertical col-lg-2"
					data-toggle="buttons">
					<label class="btn"> <input type="radio" name="gservSub"
						value="1005" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>자연</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1006" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>액티비티</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1007" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>야경</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1008" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>쇼핑</span><br>
					</label>
				</div>
				<div class="btn-group btn-group-vertical col-lg-2"
					data-toggle="buttons">
					<label class="btn"> <input type="radio" name="gservSub"
						value="1009" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>힐링</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1010" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>체험</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="1011" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>축제</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="2001" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>가족여행</span><br>
					</label>
				</div>
				<div class="btn-group btn-group-vertical col-lg-2"
					data-toggle="buttons">
					<label class="btn"> <input type="radio" name="gservSub"
						value="2002" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>단체여행</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="3001" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>바다</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="3002" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>산</span>
					</label> <label class="btn"> <input type="radio" name="gservSub"
						value="4001" class="form-control" style="display: none;"><i
						class="fa fa-circle-o fa-2x"></i><i
						class="fa fa-dot-circle-o fa-2x"></i><span>기차</span>
					</label>
				</div>
			</div>
			<hr>
			<br>
			<br>
			<h5><b>세부 사항</b></h5>
		<br>
						<table style="width: 50%;">
					<tr>
						<th>가격</th>
					</tr>
					<tr>
						<td><input type="text" name="gservPrice" id="gservPrice"
							value="${gs.gservPrice}" class="form-control"></td>
					</tr>
					<tr>
						<th>최소인원</th>
						<th>최대인원</th>
					</tr>
					<tr>
						<td><input type="number" name="memSizeMin" id="memSizeMin"
							value="${gs.memSizeMin }" required="required"
							style="float: right;"
							class="form-control"></td>
						<td><input type="number" name="memSizeMax" id="memSizeMax"
							value="${gs.memSizeMax }" required="required"
							style="float: right;"
							class="form-control"></td>
					</tr>
					<tr>
						<th>가능언어</th>
						<th>소요시간</th>
					</tr>
					<tr>
						<td><input type="text" name="gservLang" id="gservLang"
							value="${gs.gservLang }" class="form-control"></td>
						<td><input type="number" name="gservLeadTime"
							id="gservLeadTime" value="${gs.gservLeadTime }"
							style="float: right;"
							class="form-control"></td>
					</tr>
					<tr>
						<th>TAG</th>
					</tr>
					<tr>
						<td colspan="2">
							<input type="text" value="${gs.servTag}" name="servTag" class="form-control">	
						</td>
					</tr>
				</table>
			<br>
			<hr>
			<div style="display: inline-block; width: 45%; margin: 15px 0px">
			<span><b>가격포함사항</b></span>
			<textarea rows="10" cols="10" name="pinclude" required="required"
					   class="form-control" style="margin-top:15px"
					   onKeyUp="javascript:fnChkByte(this,'4000')"
					   >${gs.pinclude}</textarea>
			</div>	
			<div style="display: inline-block; width: 45%; margin: 15px 0px">
			<span><b>가격불포함사항</b></span>
			 <textarea rows="10" cols="10" name="notPInclude" required="required"
					  class="form-control" style="margin-top:15px"
					  onKeyUp="javascript:fnChkByte(this,'4000')"
					 >${gs.notPInclude}</textarea>
			</div>	
			<div style="display: inline-block; width: 100%; margin: 15px 0px">
			<span><b>주의사항</b></span>
			<textarea rows="10" cols="10" name="caution" required="required"
					  class="form-control" style="margin-top:15px"
					  onKeyUp="javascript:fnChkByte(this,'4000')"
					>${gs.caution}</textarea>
			</div>	
			<hr>
			<h5><b>노출여부</b></h5> 
			<small style="color:red">*노출시키지 않으시면 상품이 회원들에게 노출되지 않습니다.</small>
			<br>
			<select name="gservLock" class="form-control" style="width: 100px; margin-top: 15px">
					<option value="Y">Y</option>
					<option value="N">N</option>
			</select>
			<hr>
			<div style="margin-top: 50px; margin-bottom: 50px">
				<input type="submit" onclick="chk()" id="submit" value="수정"
						class="btn btn-info form-control">
				<input type="button" value="삭제" id="deletebtn" class="form-control">
			</div>
	</form>
</div>

</body>
<script type="text/javascript">
	var num = <%=num%>;
	function addItem() {
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length;      // 테이블(TR) row 개수
	      newTr = lo_table.insertRow(row_index);
	      newTr.idName = row_index;
	 	  
	      newTd=newTr.insertCell(0);
	      newTd.innerHTML= "<td>"+num+"<input type='hidden' name='gservOrder' value="+num+"></td>";
	      num++;
	      newTd=newTr.insertCell(1);
	      newTd.innerHTML= '<td><input type="text" name="introTitle" value=""><td>';
	      newTd=newTr.insertCell(2);
	      newTd.innerHTML= '<td><textarea rows="3" cols="50" name="gservIntro" required="required" class="form-control"></textarea></td>';
	      
	      newTd=newTr.insertCell(3);
	      newTd.innerHTML= '<td><div class="filebox preview-image"><input type="text name="imgSrc" class="upload-name" value="파일선택" disabled="disabled" ><input type="hidden" name="imgSrc"><label for="input-file'+num+'">File</label><input type="file" id="input-file'+num+'" name="imgfile" class="upload-hidden"></div></td>';
	      newTd=newTr.insertCell(4);
	      newTd.innerHTML= '<td><input type="button" name="addServ" class="btn btn-default" onclick="addItem()" value="+"><input type="button" name="fixServ" class="btn btn-default margin10" value="X" onclick="delItem()"></td>';
		  
	      var fileTarget = $('.filebox .upload-hidden'); 
			fileTarget.on('change', function(){ // 값이 변경되면 
				if(window.FileReader){ // modern browser 
					var filename = $(this)[0].files[0].name; 
				} else { // old IE 
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				} 
				// 추출한 파일명 삽입 
				$(this).siblings('.upload-name').val(filename); 
			});
			//preview image 
			var imgTarget = $('.preview-image .upload-hidden'); 
			imgTarget.on('change', function(){ 
				var parent = $(this).parent(); 
				parent.children('.upload-display').remove(); 
				
				if(window.FileReader){ 
					//image 파일만 
					if (!$(this)[0].files[0].type.match(/image\//)) return; 
						var reader = new FileReader(); 
						reader.onload = function(e){ 
							var src = e.target.result; parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
					} 
					reader.readAsDataURL($(this)[0].files[0]); 
				} else { 
					$(this)[0].select(); 
					$(this)[0].blur(); 
					var imgSrc = document.selection.createRange().text; 
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
					
					var img = $(this).siblings('.upload-display').find('img'); 
					img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
					} 
				});
	      
	
	
	}
	function delItem(){
		  num--;
	      var lo_table = document.getElementById("TblAttach");
	      var row_index = lo_table.rows.length-1;      // 테이블(TR) row 개수
	 
	      if(row_index > 1) lo_table.deleteRow(row_index);    
	}

</script>
<script type="text/javascript">
			var container = document.getElementById('map');
			var options = {
				center: new daum.maps.LatLng(${gs.gservGps}),
				level: 3
			};
	
			var map = new daum.maps.Map(container, options);
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(${gs.gservGps}); 
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places();
			
			// 키워드로 장소를 검색합니다
			searchPlaces();
			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

			    var keyword = document.getElementById('keyword').value;

			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        return false;
			    }

			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB);
			    return false;
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === daum.maps.services.Status.OK) {

			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);

			        // 페이지 번호를 표출합니다
			        //displayPagination(pagination);

			    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

			        alert('검색 결과가 존재하지 않습니다.');
			        return;

			    } else if (status === daum.maps.services.Status.ERROR) {

			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;

			    }
			}
			
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {

			    var bounds = new daum.maps.LatLngBounds()
			    
			    // 지도에 표시되고 있는 마커를 제거합니다
			    //marker.setMap(null);
			    
			    for ( var i=0; i<places.length; i++ ) {

			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);
			            
			            

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
			    }

			    
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	
				// 클릭한 위도, 경도 정보를 가져옵니다 
				var latlng = mouseEvent.latLng;
	
				// 마커 위치를 클릭한 위치로 옮깁니다
				marker.setPosition(latlng);
	
				var message = latlng.getLat() + ',';
				message += latlng.getLng();
	
				var resultDiv = document.getElementById('pickUpLoc');
				resultDiv.value = message;
	
			});
			
			$( "#alarm" ).timeDropper();
			
			
			$(document).ready(function(){ 
				var fileTarget = $('.filebox .upload-hidden'); 
				fileTarget.on('change', function(){ // 값이 변경되면 
					if(window.FileReader){ // modern browser 
						var filename = $(this)[0].files[0].name;
						$(this).css("background-color", "#ff0000");
					} else { // old IE 
						var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
						$(this).css("background-color", "#ff0000");
					} 
					// 추출한 파일명 삽입 
					$(this).siblings('.upload-name').val(filename); 
				});
				
			}); 

			//preview image 
			var imgTarget = $('.preview-image .upload-hidden'); 
			imgTarget.on('change', function(){ 
				var parent = $(this).parent(); 
				parent.children('.upload-display').remove(); 
				
				if(window.FileReader){ 
					//image 파일만 
					if (!$(this)[0].files[0].type.match(/image\//)) return; 
						var reader = new FileReader(); 
						reader.onload = function(e){ 
							var src = e.target.result; parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
					} 
					reader.readAsDataURL($(this)[0].files[0]); 
				} else { 
					$(this)[0].select(); 
					$(this)[0].blur(); 
					var imgSrc = document.selection.createRange().text; 
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
					
					var img = $(this).siblings('.upload-display').find('img'); 
					img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
					} 
				});
			
	</script>
</html>