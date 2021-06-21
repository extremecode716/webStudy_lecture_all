<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.footer{
		background-color: lightGray;
		text-align: center;
	}
	.footer-list {
		width:300px;
		display: inline-block;
	}
	#footRow {
		padding-left: 60px;
	}
	.footer-sns {
		margin-top: 30px;	
	}
	
	a {
		color: black;
	}

</style>
</head>
<body>
<footer class='footer' id='footer'>
			<div style="height: 60px">
			</div>
			<table id="footTable" style="margin: auto">
				<tr>
					<th>ABOUT</th>
					<th id="footRow">HELP</th>
				</tr>
				<tr>
					<td><a data-turbolinks='false' href='introduce.do'>서비스 소개</a></td>
					<td id="footRow"><a data-turbolinks='false' href='contentUs.do'>고객 센터</a></td>	
				</tr>
				<tr>
					<td><a data-turbolinks='false' href='aboutUs.do'>회사 소개</a></td>
					<td id="footRow"><a data-turbolinks='false' href='fna.do'>자주 묻는 질문</a></td>	
				</tr>
				<tr>
					<td><a data-turbolinks='false' href='licensee.do'>사업자정보</a></td>
					<td id="footRow"><a data-turbolinks='false' href='termsOfUse.do'>이용약관</a></td>	
									
				</tr>
				<tr>
					<td></td>
					<td id="footRow"><a data-turbolinks='false' href='privacy.do'>개인정보 취급방침</a></td>	
									
				</tr>
			</table>
							
			<div class='footer-sns'>
				<a href='https://www.facebook.com' target='_blank'> <img
					alt='페이스북' width='50px'
					src='${pageContext.request.contextPath}/items/facebook1.png'
					>
				</a> 
				<a href='https://instagram.com' target='_blank'> <img
					alt='인스타그램' width="50px"
					src='${pageContext.request.contextPath}/items/instagram.png'
					>
				</a> 
				<a href='http://blog.naver.com' target='_blank'> <img
					alt='네이버'  width='50px'
					src='${pageContext.request.contextPath}/items/naver.png'
					>
				</a> 
			</div>
			<center>
					<img src="${pageContext.request.contextPath}/items/footer.png" style="width: 600px;">
			</center>
	</footer>
</body>
</html>