<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath=request.getRealPath("upload");
	System.out.println("path="+uploadPath);	

	int size = 10*1024*1024; // 10MB //정처기홈페이지 사진 50KB
	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath, // 업로드 디렉토리
							size,  // 최대 업로드 파일의 크기(Byte)
							"utf-8", // 인코딩 타입 설정
				new DefaultFileRenamePolicy()); // 중복 문제 해결

		name=multi.getParameter("name");
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();
		
//	    String file1 = "fileName1";
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1); // 서버에 업로드된 첨부파일명 ex) test1.jpg
		origfilename1= multi.getOriginalFileName(file1); // 사용자가 업로드한 파일명 ex) test.jpg

// 	    String file2 = "fileName2";		
		String file2 =(String)files.nextElement();
		filename2=multi.getFilesystemName(file2);
		origfilename2=multi.getOriginalFileName(file2);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="subject" value="<%=subject%>">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="filename2" value="<%=filename2%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
	<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
