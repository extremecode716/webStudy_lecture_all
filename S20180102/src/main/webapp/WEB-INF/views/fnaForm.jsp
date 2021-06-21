<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	
	function chk(){
		
		if(!frm.qaTitle.value){
			alert("제목을 입력해주세요");
			return false;
		}
		if(!frm.qaContent.value){
			alert("문의사항을 입력해주세요");
			return false;
		}else{
			
			location.href="fnaQuestion.do?memberId="+qaTitle+qaContent;
		}
	}


</script>

<body>
<div class="container">
	<center>
		<h2 style="margin: 30px">관리자에게 문의하기</h2>
		<hr style="margin: 30px">
		<form action="fnaQuestion.do" method=POST >
			<table style="width: 60%">
				<tr>
					<th>아이디</th>
					<td><input name="memberId" value="${sessionScope.ID}" readonly="readonly" size="48.5"
						       class="form-control" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="qaTitle"  size="48.5"
						 class="form-control" required="required" onclick="chk()" /></td>
				</tr>

				<tr>
					<th>문의내용</th>
					<td><textarea name="qaContent"  rows="8"
							cols="50" class="form-control" required="required" onclick="chk()"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="문의하기" class="btn btn-info btn-block" style="height: 40px; margin-top: 20px;" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</div>
</body>
</html>