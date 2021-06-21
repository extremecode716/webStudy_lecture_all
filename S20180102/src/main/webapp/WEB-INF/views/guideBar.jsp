<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.bar {
		width:100%;
		height:50px;
		padding: 0;
		background-color: rgb(61,183,204);
		box-sizing: border-box;
		display: block;
	}
	
	.guideNav {
		display: inline-block;
	}
	li {
		list-style: none;
	}
	
	.tap1:hover {
		background-color: #005766;
		color:  white;
		text-decoration: none;
	}
	.tap1 {
		text-decoration: none;
		color: white;
		padding: 13px 15px 16px 15px;
	}
	#gNav {
		display: inline-block; 
		margin-left: 30px;
		margin-top: 11px;
	}
</style>
</head>
<body>
<div class="bar">
<center>
	<div class="guideNav">
		<ul style="padding:0">
			<li style="display: inline-block;"><a href="profile_guide.do" class="tap1">프로필관리</a></li>
			<li id="gNav"><a href="tourDiary.do" class="tap1">투어일정관리</a></li>
			<li id="gNav"><a href="service_guide.do" class="tap1">상품관리</a></li>
			<li id="gNav"><a href="review_guide.do" class="tap1">후기관리</a></li>
			<li id="gNav"><a href="pay_guide.do" class="tap1">정산관리</a></li>			
			<li id="gNav"><a href="selGuideQAPro.do" class="tap1">문의사항</a></li>
		</ul>
	</div>
</center>
</div>
</body>
</html>