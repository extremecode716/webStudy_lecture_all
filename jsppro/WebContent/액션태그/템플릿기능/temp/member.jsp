<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
	<head><title>�� �±�</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
	<script>

	//ID �ߺ� �˻�
	function idcheck(){
		var uid=document.myform.id.value;
		if(uid == ""){
			alert("ID�� �Է� �ϼ���");
			document.myform.id.focus();
		}else{
			var ref="idcheck.jsp?id="+uid;
			window.open(ref,"mywin","width=300,height=200");
		}
	}

	// �����ȣ �˻�
	function postfind(){
		window.open("post.jsp","post",
		"width=400,height=500");
	}

	//�̸��� �Է�
	function input(){
		i=myform.site.selectedIndex;//�ɼ��� �ε��� ��ȣ ����.
		document.myform.mail02.value=
		document.myform.site.options[i].value;
	}

	// �ֹι�ȣ ���ڸ��� ��Ŀ�� �̵�
	function move(){
		if(document.myform.jumin1.value.length==6)
			document.myform.jumin2.focus();
	}

    // ��ȿ�� �˻�
	function check(){
		var na=document.myform;

		// ��� 2���̻� ����
		var n=0;
		if(na.hobby[0].checked)
		   n++;
		if(na.hobby[1].checked)
		   n++;
		if(na.hobby[2].checked)
		   n++;
		if(na.hobby[3].checked)
		   n++;

		// �ڵ��� ��ȣ ���ڸ� ����
		i=myform.hp1.selectedIndex;

		// ���� ����
		j=myform.job.selectedIndex;

		if(na.id.value == ""){
			alert("ID�� �Է� �ϼ���");
			na.id.focus();
			return false;
		}else if(na.pass.value == ""){
			alert("��й�ȣ�� �Է� �ϼ���");
			na.pass.focus();
			return false;
		}else if(na.name.value == ""){
			alert("�̸��� �Է� �ϼ���");
			na.name.focus();
			return false;
		}else if(na.mail01.value == ""){
			alert("email�ּ� ���ڸ��� �Է� �ϼ���");
			na.mail01.focus();
			return false;
		}else if(na.mail02.value == ""){
			alert("email�ּ� ���ڸ��� �Է� �ϼ���");
			na.mail02.focus();
			return false;
		}else if(na.jumin1.value == ""){
			alert("�ֹι�ȣ ���ڸ� �Է�");
			na.jumin1.focus();
			return false;
		}else if(na.jumin1.value.length != 6){
			alert("�ֹι�ȣ ���ڸ� 6�ڸ��Է�");
			na.jumin1.value="";
			na.jumin1.focus();
			return false;
		}else if(na.jumin2.value == ""){
			alert("�ֹι�ȣ ���ڸ� �Է�");
			na.jumin2.focus();
			return false;
		}else if(na.jumin2.value.length != 7){
			alert("�ֹι�ȣ ���ڸ� 7�ڸ��Է�");
			na.jumin2.value="";
			na.jumin2.focus();
			return false;
		}else if(!juminCheck(na.jumin1.value +		                 na.jumin2.value)) {
			alert("�ֹε�Ϲ�ȣ�� �߸��Ǿ����ϴ�.");
			na.jumin1.value="";
			na.jumin2.value="";
            na.jumin1.focus();
			return false;
		}else if(na.gender[0].checked == false &&
			     na.gender[1].checked == false){
			alert("������ ���� �ϼ���");
			return false;
		}else if(n < 2){
			alert("��̴� 2���̻� �����ϼ���");
			return false;
		}else if(na.tel1.value == ""){
			alert("��ȭ��ȣ ���ڸ� �Է�");
			return false;
		}else if(na.tel2.value == ""){
			alert("��ȭ��ȣ �߰��ڸ� �Է�");
			return false;
		}else if(na.tel3.value == ""){
			alert("��ȭ��ȣ ���ڸ� �Է�");
			return false;
		}else if(i == 0){
			alert("�ڵ��� ���ڸ��� ���� �ϼ���");
			return false;
		}else if(na.hp2.value == ""){
			alert("�ڵ��� �߰��ڸ��� ���� �ϼ���");
			return false;
		}else if(na.hp3.value == ""){
			alert("�ڵ��� ���ڸ��� ���� �ϼ���");
			return false;
		}else if(na.post1.value == ""){
			alert("�����ȣ ���ڸ��� �Է��ϼ���");
			return false;
		}else if(na.post2.value == ""){
			alert("�����ȣ ���ڸ��� �Է��ϼ���");
			return false;
		}else if(na.address.value == ""){
			alert("�ּҸ� �Է� �ϼ���");
			return false;
		}else if(na.intro.value == ""){
			alert("�ڱ� �Ұ��� �Է� �ϼ���");
			return false;
		}else if(j == 0){
			alert("������ ���� �ϼ���");
			return false;
		}
	}//end check()

	// �ֹι�ȣ �˻�
	function juminCheck(jumin) {
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

    total %= 11;
    total2 = 11 - total;
    if(total2 > 9)
        total2 = total2 % 10;

    if(total2 != parseInt(jumin.substr(12,1))) {
        return (false);
    }
    else
        return (true);

}
	</script>
	 </head>
	<body>
	<form onSubmit="return check()"
		name=myform method=post action=member.jsp>

    ID : <input type=text size=10					        name=id>
		 <input type=button value="ID�ߺ��˻�"           onclick="idcheck()"><br><br>
	��й�ȣ: <input type=password name=pass			       size=10><br><br>
	�̸�: <input type=text name="name"					size=10><br><br>
    �̸���:<input type=text name=mail01>@
	       <input type=text name=mail02>
		   <select name=site onChange="input()">
			    <option value="">�����Է�
				<option value="naver.com">���̹�
				<option value="daum.net">����
				<option value="nate.com">����Ʈ
		   </select><br><br>
    �ֹι�ȣ:<input type=text size=6						onKeyup="move()"							maxlength=6 name=jumin1>-
		     <input type=text size=7				maxlength=7 name=jumin2><br><br>
    ����:<input type=radio name=gender value=m>
		  ����
		 <input type=radio name=gender value=f>����<br><br>
	���:<input type=checkbox name=hobby>����
	     <input type=checkbox name=hobby>�
		 <input type=checkbox name=hobby>����
		 <input type=checkbox name=hobby>�ٵ�
		 <br><br>
	��ȭ��ȣ:<input type=text size=4							maxlength=4 name=tel1>-
			 <input type=text size=4					maxlength=4 name=tel2>-
			 <input type=text size=4					maxlength=4 name=tel3>
				<br><br>
	�ڵ���:<select name=hp1>
				<option>��ȣ����</option>
				<option selected>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>	
		   </select>-
		   <input type=text size=4						maxlength=4 name=hp2>-   
		   <input type=text size=4						maxlength=4 name=hp3>
			<br><br>
	�����ȣ:<input type=text size=3						maxlength=3 name=post1>-
		     <input type=text size=3				maxlength=3 name=post2> 
			 <input type=button 
			  value="����˻�"
			  onclick="postfind()"><br><br>
	�ּ�:<input type=text size=50						name=address><br><br>	�ڱ�Ұ�:<textarea rows=5 cols=35							name=intro></textarea><br><br>
	����:<select name=job>
			<option>����
			<option>ȸ���
			<option>������
			<option>�л�
			<option>�ֺ�
		 </select><br><br>
    <input type=image src="u_bt06.gif">
	<input type=submit value="ȸ������">
	<input type=reset value="���">
			 
	</form>  
	</body>
</html>
