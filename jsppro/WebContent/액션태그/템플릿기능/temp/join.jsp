<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head><title>ȸ�� ������</title>
	<script>
	 function idcheck(){
		if(document.myform.id.value == ""){
			alert("ID�� �Է��ϼ���~~!!");
			document.myform.id.focus();
			return false;
		}else{
			window.open("http://www.naver.com", "check", 
				"width=100, height=150, menubar=yes");
		}
	 }

	 function postcode(){
		window.open("http://www.daum.net","win1",
						"width=100,height=150");
	 }

	 function move(){
		if(document.myform.jumin1.value.length == 6)
			document.myform.jumin2.focus();
	 }

	 function check(){
		if(document.myform.id.value == ""){
			alert("ID�� �Է��ϼ���~~!!");
			document.myform.id.focus();
			return false;
		}
		if(document.myform.irum.value == ""){
			alert("�̸��� �Է��ϼ���~~!!");
			document.myform.irum.focus();
			return false;
		}
		if(document.myform.pass.value == ""){
			alert("��й�ȣ�� �Է��ϼ���~~!!");
			document.myform.pass.focus();
			return false;
		}
		if(document.myform.jumin1.value == ""){
			alert("�ֹι�ȣ ���ڸ��� �Է��ϼ���~~!!");
			document.myform.jumin1.focus();
			return false;
		}
		if(document.myform.jumin1.value.length != 6){
			alert("�ֹι�ȣ ���ڸ� 6�ڸ��� ��Ȯ�ϰ� �Է��ϼ���~~!!");
			document.myform.jumin1.value="";
			document.myform.jumin1.focus();
			return false;
		}
		if(document.myform.jumin2.value == ""){
			alert("�ֹι�ȣ ���ڸ��� �Է��ϼ���~~!!");
			document.myform.jumin2.focus();
			return false;
		}
		if(document.myform.jumin2.value.length != 7){
			alert("�ֹι�ȣ ���ڸ� 7�ڸ��� ��Ȯ�ϰ� �Է��ϼ���~~!!");
			document.myform.jumin2.value="";
			document.myform.jumin2.focus();
			return false;
		}
		if(!juminCheck(myform.jumin1.value +										myform.jumin2.value)) {
			alert("�ùٸ� �ֹε�Ϲ�ȣ �ƴմϴ�.");
			document.myform.jumin1.value="";
			document.myform.jumin2.value="";
			myform.jumin1.focus();
			return false;
		}	
		if(document.myform.post1.value == ""){
			alert("�����ȣ ���ڸ��� �Է��ϼ���~~!!");
			document.myform.post1.focus();
			return false;
		}
		if(document.myform.post2.value == ""){
			alert("�����ȣ ���ڸ��� �Է��ϼ���~~!!");
			document.myform.post2.focus();
			return false;
		}
		if(document.myform.address.value == ""){
			alert("�ּҸ� �Է��ϼ���~~!!");
			document.myform.address.focus();
			return false;
		}
		if(document.myform.gender[0].checked ==  false &&
		   document.myform.gender[1].checked ==  false){
			alert("������ �����ϼ���");
			return false;
		}
	
		cnt=0;
		n1 = myform.hobby.length; //üũ�ڽ��� ����(n1=4)
		for(i=0; i<n1; i++){
			if(myform.hobby[i].checked == true)
				cnt++;
		}
		if(cnt < 2){
			alert("��̴� 2���̻� ���� �ϼ���~~!!");
			return false;
		}
		if(document.myform.intro.value == ""){
			alert("�ڱ�Ұ��� �Է��ϼ���~~!!");
			document.myform.intro.focus();
			return false;
		}		
		if(myform.job.options[1].selected == false &&
		   myform.job.options[2].selected == false &&
		   myform.job.options[3].selected == false ){	  
			alert("������ �����ϼ���");
			return false;
		}
	 }// check() end

// �ֹ� ��ȣ �˻�
function juminCheck(jumin) { //jumin ="8001011234567";
    var total = 0;
    var total2;
    total += parseInt(jumin.substr(0,1)) * 2;
    total += parseInt(jumin.substr(1,1)) * 3;
    total += parseInt(jumin.substr(2,1)) * 4;
    total += parseInt(jumin.substr(3,1)) * 5;
    total += parseInt(jumin.substr(4,1)) * 6;
    total += parseInt(jumin.substr(5,1)) * 7;
    total += parseInt(jumin.substr(6,1)) * 8;
    total += parseInt(jumin.substr(7,1)) * 9;
    total += parseInt(jumin.substr(8,1)) * 2;
    total += parseInt(jumin.substr(9,1)) * 3;
    total += parseInt(jumin.substr(10,1)) * 4;
    total += parseInt(jumin.substr(11,1)) * 5;

    total %= 11;// total = total % 11;
    total2 = 11 - total;
    if(total2 > 9)
        total2 = total2 % 10;

    if(total2 != parseInt(jumin.substr(12,1))) {
        return (false);
    }else{
        return (true);
	}
}
	</script>
	</head>
	<body onLoad="document.myform.id.focus()">
	<form name=myform method=get action=send.jsp 
		  onSubmit="return check()">
	ID : <input type=text size=15 name=id>
		 <input type=button value="�ߺ�Ȯ��" onclick="idcheck()"><br>
	�̸� : <input type=text name=irum><br>
	��й�ȣ : <input type=password name=pass><br>
	�ֹι�ȣ : <input type=text size=6 maxlength=6						      name=jumin1	onKeyup="move()">-
			   <input type=text size=7 maxlength=7		            name=jumin2><br>
	�����ȣ : <input type=text size=3 maxlength=3							  name=post1>-
			   <input type=text size=3 maxlength=3                  name=post2>
			   <input type=button value="����˻�"
					   onClick="postcode()"><br>
	�ּ� : <input type=text size=50 name=address> <br>	
	���� : <input type=radio name=gender value=m>����
		   <input type=radio name=gender value=f>���� <br>
	��� : <input type=checkbox name=hobby value="����"> ����
		   <input type=checkbox name=hobby value="����"> ����
		   <input type=checkbox name=hobby value="���"> ���
		   <input type=checkbox name=hobby value="����"> ���� <br>
	�ڱ�Ұ� :<textarea rows=10 cols=30 name=intro>�ڱ�Ұ� �Է¸� �Է� �ϼ���~!!</textarea> <br>
	���� : <select name=job>
				<option>--���� ����--</option>
				<option value="ȸ���">ȸ���</option>
				<option value="������">������</option>
				<option value="�л�">�л�</option>
		   </select> <br>
	���� ÷�� : <input type=file name=myfile> <br>	
	
	<input type=submit value="����">
	<input type=reset value="���">
	</form>

	</body>
</html>