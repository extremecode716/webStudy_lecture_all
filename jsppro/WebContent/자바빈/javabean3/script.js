function inputCheck(){
	var userinput = eval("document.regForm");

	if(userinput.id.value==""){
		alert("아이디를 입력하세요.");
		userinput.id.focus();
		return false;
	}
	if(userinput.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		userinput.passwd.focus();
		return false;
	}
	if(userinput.repasswd.value==""){
		alert("비밀번호를 재 입력하세요.");
		userinput.repasswd.focus();
		return false;
	}
	if(userinput.name.value==""){
		alert("이름을 입력하세요.");
		userinput.name.focus();
		return false;
	}
	if(userinput.email.value==""){
		alert("이메일을 입력하세요.");
		userinput.email.focus();
		return false;
	}
	if(userinput.phone.value==""){
		alert("연락처를 입력해 주세요");
		userinput.phone.focus();
		return false;
	}
	
	if(userinput.passwd.value != userinput.repasswd.value){
		alert("비밀번호가 일치하지 않습니다");
		userinput.repasswd.focus();
		return false;
	}
}