<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="header.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
//				document.getElementById('join_zip1').value = data.postcode1;
				document.getElementById('post').value = data.zonecode;
				document.getElementById('address').value = data.address;				
			}
		}).open();
	}
</script>
</head>
<body>

<form method="post" action="member.jsp">
<table border=1 width=600 align=center>
	<caption>회원가입폼</caption>
	<tr><th>ID</th>
		<td><input type=text id="id" name="id" autofocus="autofocus">
		    <input type="button" value="ID중복검사">
		</td>
	</tr>
	<tr><th>비밀번호</th>
		<td><input type=password id="passwd" name="passwd"></td>
	</tr>
	<tr><th>성명</th>
		<td><input type=text id="name" name="name"></td>
	</tr>
	<tr><th>주민번호</th>
		<td><input type=text id="jumin1" name="jumin1" size=6 maxlength=6>-
		    <input type=text id="jumin2" name="jumin2" size=7 maxlength=7>
	</tr>
	<tr><th>E-Mail</th>
		<td><input type=text size=10 name="mailid">@
		    <input type=text size=10 name="domain">
		    <select name="sel">
				<option value="">직접입력</option>
				<option value="naver.com">네이버</option>
				<option value="daum.net">다음</option>
				<option value="nate.com">네이트</option>
				<option value="gmail.com" selected>구글</option>
		    </select>
		</td>
	</tr>
	<tr><th>전화번호</th>
		<td><input type=text size=4 maxlength=4>-
		    <input type=text size=4 maxlength=4>-
		    <input type=text size=4 maxlength=4>
		</td>
	</tr>
	<tr><th>핸드폰</th>
	    <td><select>
	    		<option>번호선택</option>
	    		<option>010</option>
	    		<option>011</option>
	    		<option>016</option>
	    		<option>018</option>
	    		<option>019</option>
	        </select>-	
	        <input type=text size=4 maxlength=4>-
	        <input type=text size=4 maxlength=4>    
	    </td>
	</tr>
	<tr><th>우편번호</th>
		<td><input type=text size=5 maxlength=5 id="post">
		    <input type="button" value="우편 검색" onClick="openDaumPostcode()">
		</td>
	</tr>
	<tr><th>주소</th>
		<td><input type=text size=70 id="address"></td>
	</tr>
	<tr><th>성별</th>
		<td><input type=radio name="gender" value="남자">남자
			<input type=radio name="gender" value="여자" checked>여자		
		</td>
	</tr>
	<tr><th>취미</th>
		<td><input type="checkbox" name="hobby" value="공부" checked>공부
			<input type="checkbox" name="hobby" value="게임" checked="checked">게임
			<input type="checkbox" name="hobby" value="등산">등산
			<input type="checkbox" name="hobby" value="낚시">낚시
			<input type="checkbox" name="hobby" value="쇼핑">쇼핑
		</td>
	</tr>
	<tr><th>자기소개</th>
		<td><textarea rows="5" cols="70" placeholder="자기소개를 100자 이내로 입력하세요."></textarea>
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="회원가입">
			<input type="reset" value="취소">
		</td>	
	</tr>
</table>
</form>

</body>
</html>


<%@ include file="footer.jsp" %>
