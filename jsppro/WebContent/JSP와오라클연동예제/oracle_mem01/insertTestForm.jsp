<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head><title>���ڵ� ����(�߰�)����</title>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script>
	$(document).ready(function(){
		$("form").submit(function(){
			if($("#id").val()==""){
				alert("ID�� �Է� �ϼ���");
				$("#id").focus();
				return false;
			}
			if($("#passwd").val()==""){
				alert("��й�ȣ�� �Է� �ϼ���");
				$("#passwd").focus();
				return false;
			}
			if($("#name").val()==""){
				alert("�̸��� �Է� �ϼ���");
				$("#name").focus();
				return false;
			}
		});
		
	});
</script>
</head>

<body>
  <h2>member1 ���̺� ���ڵ����(�߰�)����</h2>

  <FORM METHOD="post" ACTION="insertTest.jsp">
    ���̵� : <INPUT TYPE="text" NAME="id" id="id"><p>
    �н����� : <INPUT TYPE="password" NAME="passwd" id="passwd"><p>
    �̸�:<INPUT TYPE="text" NAME="name" id="name"><p>
    <INPUT TYPE="submit" VALUE="������">
  </FORM>

</body>
</html>