<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
	<head><title>폼 태그</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
	<script>

	//ID 중복 검사
	function idcheck(){
		var uid=document.myform.id.value;
		if(uid == ""){
			alert("ID를 입력 하세요");
			document.myform.id.focus();
		}else{
			var ref="idcheck.jsp?id="+uid;
			window.open(ref,"mywin","width=300,height=200");
		}
	}

	// 우편번호 검색
	function postfind(){
		window.open("post.jsp","post",
		"width=400,height=500");
	}

	//이메일 입력
	function input(){
		i=myform.site.selectedIndex;//옵션의 인덱스 번호 구함.
		document.myform.mail02.value=
		document.myform.site.options[i].value;
	}

	// 주민번호 뒷자리로 포커스 이동
	function move(){
		if(document.myform.jumin1.value.length==6)
			document.myform.jumin2.focus();
	}

    // 유효성 검사
	function check(){
		var na=document.myform;

		// 취미 2개이상 선택
		var n=0;
		if(na.hobby[0].checked)
		   n++;
		if(na.hobby[1].checked)
		   n++;
		if(na.hobby[2].checked)
		   n++;
		if(na.hobby[3].checked)
		   n++;

		// 핸드폰 번호 앞자리 선택
		i=myform.hp1.selectedIndex;

		// 직업 선택
		j=myform.job.selectedIndex;

		if(na.id.value == ""){
			alert("ID를 입력 하세요");
			na.id.focus();
			return false;
		}else if(na.pass.value == ""){
			alert("비밀번호를 입력 하세요");
			na.pass.focus();
			return false;
		}else if(na.name.value == ""){
			alert("이름을 입력 하세요");
			na.name.focus();
			return false;
		}else if(na.mail01.value == ""){
			alert("email주소 앞자리를 입력 하세요");
			na.mail01.focus();
			return false;
		}else if(na.mail02.value == ""){
			alert("email주소 뒷자리를 입력 하세요");
			na.mail02.focus();
			return false;
		}else if(na.jumin1.value == ""){
			alert("주민번호 앞자리 입력");
			na.jumin1.focus();
			return false;
		}else if(na.jumin1.value.length != 6){
			alert("주민번호 앞자리 6자리입력");
			na.jumin1.value="";
			na.jumin1.focus();
			return false;
		}else if(na.jumin2.value == ""){
			alert("주민번호 뒷자리 입력");
			na.jumin2.focus();
			return false;
		}else if(na.jumin2.value.length != 7){
			alert("주민번호 뒷자리 7자리입력");
			na.jumin2.value="";
			na.jumin2.focus();
			return false;
		}else if(!juminCheck(na.jumin1.value +		                 na.jumin2.value)) {
			alert("주민등록번호가 잘못되었습니다.");
			na.jumin1.value="";
			na.jumin2.value="";
            na.jumin1.focus();
			return false;
		}else if(na.gender[0].checked == false &&
			     na.gender[1].checked == false){
			alert("성별을 선택 하세요");
			return false;
		}else if(n < 2){
			alert("취미는 2개이상 선택하세요");
			return false;
		}else if(na.tel1.value == ""){
			alert("전화번호 앞자리 입력");
			return false;
		}else if(na.tel2.value == ""){
			alert("전화번호 중간자리 입력");
			return false;
		}else if(na.tel3.value == ""){
			alert("전화번호 끝자리 입력");
			return false;
		}else if(i == 0){
			alert("핸드폰 앞자리를 선택 하세요");
			return false;
		}else if(na.hp2.value == ""){
			alert("핸드폰 중간자리를 선택 하세요");
			return false;
		}else if(na.hp3.value == ""){
			alert("핸드폰 끝자리를 선택 하세요");
			return false;
		}else if(na.post1.value == ""){
			alert("우편번호 앞자리를 입력하세요");
			return false;
		}else if(na.post2.value == ""){
			alert("우편번호 뒷자리를 입력하세요");
			return false;
		}else if(na.address.value == ""){
			alert("주소를 입력 하세요");
			return false;
		}else if(na.intro.value == ""){
			alert("자기 소개를 입력 하세요");
			return false;
		}else if(j == 0){
			alert("직업을 선택 하세요");
			return false;
		}
	}//end check()

	// 주민번호 검사
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
		 <input type=button value="ID중복검사"           onclick="idcheck()"><br><br>
	비밀번호: <input type=password name=pass			       size=10><br><br>
	이름: <input type=text name="name"					size=10><br><br>
    이메일:<input type=text name=mail01>@
	       <input type=text name=mail02>
		   <select name=site onChange="input()">
			    <option value="">직접입력
				<option value="naver.com">네이버
				<option value="daum.net">다음
				<option value="nate.com">네이트
		   </select><br><br>
    주민번호:<input type=text size=6						onKeyup="move()"							maxlength=6 name=jumin1>-
		     <input type=text size=7				maxlength=7 name=jumin2><br><br>
    성별:<input type=radio name=gender value=m>
		  남자
		 <input type=radio name=gender value=f>여자<br><br>
	취미:<input type=checkbox name=hobby>게임
	     <input type=checkbox name=hobby>운동
		 <input type=checkbox name=hobby>공부
		 <input type=checkbox name=hobby>바둑
		 <br><br>
	전화번호:<input type=text size=4							maxlength=4 name=tel1>-
			 <input type=text size=4					maxlength=4 name=tel2>-
			 <input type=text size=4					maxlength=4 name=tel3>
				<br><br>
	핸드폰:<select name=hp1>
				<option>번호선택</option>
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
	우편번호:<input type=text size=3						maxlength=3 name=post1>-
		     <input type=text size=3				maxlength=3 name=post2> 
			 <input type=button 
			  value="우편검색"
			  onclick="postfind()"><br><br>
	주소:<input type=text size=50						name=address><br><br>	자기소개:<textarea rows=5 cols=35							name=intro></textarea><br><br>
	직업:<select name=job>
			<option>선택
			<option>회사원
			<option>공무원
			<option>학생
			<option>주부
		 </select><br><br>
    <input type=image src="u_bt06.gif">
	<input type=submit value="회원가입">
	<input type=reset value="취소">
			 
	</form>  
	</body>
</html>
