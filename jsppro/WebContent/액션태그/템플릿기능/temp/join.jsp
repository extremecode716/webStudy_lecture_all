<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head><title>회원 가입폼</title>
	<script>
	 function idcheck(){
		if(document.myform.id.value == ""){
			alert("ID를 입력하세요~~!!");
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
			alert("ID를 입력하세요~~!!");
			document.myform.id.focus();
			return false;
		}
		if(document.myform.irum.value == ""){
			alert("이름을 입력하세요~~!!");
			document.myform.irum.focus();
			return false;
		}
		if(document.myform.pass.value == ""){
			alert("비밀번호를 입력하세요~~!!");
			document.myform.pass.focus();
			return false;
		}
		if(document.myform.jumin1.value == ""){
			alert("주민번호 앞자리를 입력하세요~~!!");
			document.myform.jumin1.focus();
			return false;
		}
		if(document.myform.jumin1.value.length != 6){
			alert("주민번호 앞자리 6자리를 정확하게 입력하세요~~!!");
			document.myform.jumin1.value="";
			document.myform.jumin1.focus();
			return false;
		}
		if(document.myform.jumin2.value == ""){
			alert("주민번호 뒷자리를 입력하세요~~!!");
			document.myform.jumin2.focus();
			return false;
		}
		if(document.myform.jumin2.value.length != 7){
			alert("주민번호 뒷자리 7자리를 정확하게 입력하세요~~!!");
			document.myform.jumin2.value="";
			document.myform.jumin2.focus();
			return false;
		}
		if(!juminCheck(myform.jumin1.value +										myform.jumin2.value)) {
			alert("올바른 주민등록번호 아닙니다.");
			document.myform.jumin1.value="";
			document.myform.jumin2.value="";
			myform.jumin1.focus();
			return false;
		}	
		if(document.myform.post1.value == ""){
			alert("우편번호 앞자리를 입력하세요~~!!");
			document.myform.post1.focus();
			return false;
		}
		if(document.myform.post2.value == ""){
			alert("우편번호 뒷자리를 입력하세요~~!!");
			document.myform.post2.focus();
			return false;
		}
		if(document.myform.address.value == ""){
			alert("주소를 입력하세요~~!!");
			document.myform.address.focus();
			return false;
		}
		if(document.myform.gender[0].checked ==  false &&
		   document.myform.gender[1].checked ==  false){
			alert("성별을 선택하세요");
			return false;
		}
	
		cnt=0;
		n1 = myform.hobby.length; //체크박스의 갯수(n1=4)
		for(i=0; i<n1; i++){
			if(myform.hobby[i].checked == true)
				cnt++;
		}
		if(cnt < 2){
			alert("취미는 2개이상 선택 하세요~~!!");
			return false;
		}
		if(document.myform.intro.value == ""){
			alert("자기소개를 입력하세요~~!!");
			document.myform.intro.focus();
			return false;
		}		
		if(myform.job.options[1].selected == false &&
		   myform.job.options[2].selected == false &&
		   myform.job.options[3].selected == false ){	  
			alert("직업을 선택하세요");
			return false;
		}
	 }// check() end

// 주민 번호 검사
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
		 <input type=button value="중복확인" onclick="idcheck()"><br>
	이름 : <input type=text name=irum><br>
	비밀번호 : <input type=password name=pass><br>
	주민번호 : <input type=text size=6 maxlength=6						      name=jumin1	onKeyup="move()">-
			   <input type=text size=7 maxlength=7		            name=jumin2><br>
	우편번호 : <input type=text size=3 maxlength=3							  name=post1>-
			   <input type=text size=3 maxlength=3                  name=post2>
			   <input type=button value="우편검색"
					   onClick="postcode()"><br>
	주소 : <input type=text size=50 name=address> <br>	
	성별 : <input type=radio name=gender value=m>남자
		   <input type=radio name=gender value=f>여자 <br>
	취미 : <input type=checkbox name=hobby value="공부"> 공부
		   <input type=checkbox name=hobby value="게임"> 게임
		   <input type=checkbox name=hobby value="등산"> 등산
		   <input type=checkbox name=hobby value="낚시"> 낚시 <br>
	자기소개 :<textarea rows=10 cols=30 name=intro>자기소개 입력를 입력 하세요~!!</textarea> <br>
	직업 : <select name=job>
				<option>--직업 선택--</option>
				<option value="회사원">회사원</option>
				<option value="공무원">공무원</option>
				<option value="학생">학생</option>
		   </select> <br>
	파일 첨부 : <input type=file name=myfile> <br>	
	
	<input type=submit value="가입">
	<input type=reset value="취소">
	</form>

	</body>
</html>