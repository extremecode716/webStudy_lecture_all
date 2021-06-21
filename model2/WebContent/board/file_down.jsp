<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>

<%
   String fileName = request.getParameter("file_name");
   System.out.println("fileName="+fileName);

   String savePath = "boardupload";
   ServletContext context = getServletContext();
   String sDownloadPath = context.getRealPath(savePath);
   String sFilePath = sDownloadPath + "\\" + fileName;
   System.out.println("sFilePath="+sFilePath);
   
   // jsp에서 OutputStream 사용시 IllegalStateException 해결법 : 2줄 추가
   out.clear();
   out = pageContext.pushBody();
   
   try{
   		byte b[] = new byte[4096];
   		File oFile = new File(sFilePath);

   		FileInputStream in = new FileInputStream(sFilePath);

   		String sMimeType = getServletContext().getMimeType(sFilePath);
   		System.out.println("sMimeType>>>"+sMimeType );

   		// 다운로드 파일의 파일형식(마임타입) 설정
   		// octet-stream은 8비트로 된 일련의 데이터를 뜻합니다. 지정되지 않은 파일 형식을 의미합니다. 
   		if(sMimeType == null) sMimeType = "application/octet-stream";

   		response.setContentType(sMimeType);

   		// 한글 파일명 처리 : 한글 파일명이 깨지는 것을 방지해 준다.
   		String sEncoding = new String(fileName.getBytes("utf-8"),"8859_1");

   		// 다운로드 파일 헤드 지정
   		response.setHeader("Content-Disposition", "attachment; filename= " +  sEncoding);
   
   		// 출력 스트림 생성 : 위의 15, 16라인과 충돌발생함.
   		ServletOutputStream out2 = response.getOutputStream();
   		int numRead;

   		// 바이트 배열b의 0번 부터 numRead번 까지 브라우저로 출력
   		while((numRead = in.read(b, 0, b.length)) != -1) {
    		out2.write(b, 0, numRead);
   		}
   		out2.flush(); 
   		out2.close();
   		in.close();
   		
   }catch(Exception e){
	   e.printStackTrace();
   }

%>
