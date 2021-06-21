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
	
	.memberNav {
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
	#mNav {
		display: inline-block; 
		margin-left: 30px;
		margin-top: 11px;
	}
</style>
</head>
<body>
<div class="bar">
	<center>
	<div class="memberNav">
		<ul style="padding:0">
			<li style="display: inline-block;"><a href="user_info.do" class="tap1">프로필관리</a></li>
			<li id="mNav" ><a href="wishList.do" class="tap1">위시리스트</a></li>
			<li id="mNav"><a href="reservation_member.do" class="tap1">예약 현황</a></li>
			<li id="mNav"><a href="pay_member.do" class="tap1">결제내역</a></li>
			<li id="mNav"><a href="review_member.do" class="tap1">후기관리</a></li>
			<li id="mNav"><a href="selQAPro.do" class="tap1">문의사항</a></li>
		</ul>	
	</div>
	</center>
</div>

</body>
</html>