<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
<%@ page import="java.util.ArrayList" %>    
<%@ page import="java.util.*" %>    
    
<!-- 스크립틀릿 태그(Scriptlet Tag) -->
<%
	// 기본 자료형 변수
	int i = 30;
	double d = 3.14;
	char c1 = 'A';
	char c2 = '자';
	boolean b1 = true;
	boolean b2 = false;
	
	// 참조형 변수
	// 1. 클래스
	String str1 = "JSP";
	String str2 = new String("JSP");
	
	// 2. 배열
	String[] str = {"자바","JSP","오라클","웹표준","파이썬"};
	
	for(String s : str){
		out.println(s+"\t");
	}
	out.println("<br>");
	
	for(String s : str){
%>		
		<%=s%> <br>
<%	}	
	
	// 3. 인터페이스 : List
	List list = new ArrayList();		// 업캐스팅
	list.add(50);
	list.add(42.195);
	list.add(true);
	list.add('A');
	list.add("JSP");
	
	for(int j=0; j<list.size(); j++){
		out.println(list.get(j)+"\t");
	}
%>

<br>
<!-- 표현식 태그 -->
출력 : <%="출력 성공" %> <br>
연산결과 : <%=1+2+3+4+5+6+7+8+9+10 %> <br>
i = <%=i %> <br>
d = <%=d %> <br>
c1 = <%=c1 %> <br>
c2 = <%=c2 %> <br>
b1 = <%=b1 %> <br>
b2 = <%=b2 %> <br>
str1 = <%=str1 %> <br>
str2 = <%=str2 %> <br>

