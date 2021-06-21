<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header_detail.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:15px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color: rgb(61,183,204);}



</style>
<script type="text/javascript">
	$(document).ready(function(){	
		document.getElementById("theTime").valueAsDate = new Date();
	});
	$(document).ready(function(){
	 	$('input[name=rstar]').val(5);
		$( ".star_rating a" ).click(function() {
		     $(this).parent().children("a").removeClass("on");
		     $(this).addClass("on").prevAll("a").addClass("on");		     
			 $('input[name=rstar]').val($(".on").size());
		     return false;
		});
	});
</script>
</head>
<body>
<jsp:include page="memberBar.jsp"></jsp:include>
<div class="container">
<form action="upReviewPro.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="memberId" value="${revDto.memberId }">
	<input type="hidden" name="gservNo" value="${revDto.gservNo }">	
	<input type="hidden" name="rgroup" value="${revDto.rgroup }">	
	<input type="hidden" name="payCode" value="${revDto.payCode }">	
	<table style="margin: auto; margin-top: 30px;">
		<caption style="caption-side: top">
		   [ ${revDto.gservTitle } ] 후기 수정
		</caption>
		<tr>
			<td colspan="2" style='color:gray'>TITLE 
			<br><input type="text" class="form-control" name = "rtitle" id = "rTitle" 
					   value ="${revDto.rtitle}" required="required" autofocus="autofocus">
				</td>
		</tr>
		<tr>
			<td></td>
			<td style="width: 200px; color: gray;">
			Nickname <input type="text" class="form-control" name="nickName" value="${revDto.nickName }" 
							readonly="readonly">
			Date <input type="date" class="form-control" id="theTime" disabled="disabled">
			</td>
		</tr>	
		<tr>
			<td><p class="star_rating">
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				    <a href="#" class="on">★</a>
				</p><input type="hidden" name="rstar"></td>
			<td style="width: 200px; color: gray">
			Images
			<div class="custom-file">
  				<input type="file" class="custom-file-input" id="file" name="images" multiple="multiple" id="rimg">
 				<label class="custom-file-label" for="file">Choose file</label>
			</div>
  			<span  style="color: red; font-size: 11px"> 후기 이미지를 업로드해주세요!</span>
			</td>
		
		</tr>
		<tr>
			<td colspan="2">
				<textarea rows="14" name="rcontent" id = "rContent" cols="90"  style="border-radius: 0.5em; 
						  padding: 30px">${revDto.rcontent}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top: 20px">
			<input type="submit" class="btn btn-info" 
				   style="width:100%" value="후기 수정">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>