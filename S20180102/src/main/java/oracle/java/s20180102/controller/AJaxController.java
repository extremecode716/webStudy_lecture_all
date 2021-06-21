package oracle.java.s20180102.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.SearchService;

@RestController
@RequestMapping("/shCon")
public class AJaxController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private MemberService mbs;
	
	@Autowired
	private SearchService ss;
	
	@Autowired
	private QAService qs;

	//받아온 답글을 저장하고, 밑에 붙여서 다시 보여주도록 함
	
	@RequestMapping("/writeQA")
	public QADto writeQA(QADto qadto) {
		qadto.setQaTitle("답변에는 제목 안만들거야");
		qadto.setQaComplete("n");
		
		// 값을 새로 Insert한다
		qs.insertQA_guide(qadto);
		// 답변 미완료 <-> 완료
		qadto.setQaStep(0);
		QADto rootQA = qs.selOneQA(qadto);
		if(rootQA.getMemberId() == qadto.getMemberId()) {
			// 내가 다시 답변하면 n
			rootQA.setQaComplete("n");
			qs.upComplete(rootQA);
		} else {
			// 다른 사람이 답변하면 y
			rootQA.setQaComplete("y");
			qs.upComplete(rootQA);
		}
	
		return qadto;
	}
	
	@RequestMapping("/corrQA")
	public int corrQA(QADto qadto) {
		if(qadto.getQaContent()!=null) { //corrClick2  
		
			//받아온 내용으로 update
			qs.updateQaContent(qadto);
			return 1;
		}else { //corrClick
			return 0;
		}
	}
	
	@RequestMapping("/delQA")
	public int delQA(QADto qadto) {
		//qaNumber와 qaStep으로 QA를 지운다
		qs.delQA_member(qadto);
		return 0;
	}
	
	  @RequestMapping(value="kakaoLogin")
		public MemberDto kakaoLogin(MemberDto mbDto) {
			int checkId = Integer.parseInt(mbs.fs(mbDto.getMemberId()));
			MemberDto mbDto2 = new MemberDto();
			if(checkId==0) {
				  // 파일 어드레스
				  String url = mbDto.getMimg();
				  // 다운로드 디렉토리
				  String downDir = uploadPath;
				  // 다운로드 호출
				  String mimg = fileUrlDownload(url, downDir);
				  mbDto.setMimg(mimg);
				
				  int insert =  mbs.inMemberKakao(mbDto);
				if(insert > 0) {
					mbDto2 = mbs.selMember(mbDto.getMemberId());
			} else {
					System.out.println("정보입력실패");
				}
			}
			return mbDto;
		}
	  
	  public static String fileUrlReadAndDownload(String fileAddress, String localFileName, String downloadDir) {
			  OutputStream outStream = null;
			  URLConnection uCon = null;
			  String fileName = "";
			  InputStream is = null;
			  try {

			   System.out.println("-------Download Start------");

			   URL Url;
			   byte[] buf;
			   int byteRead;
			   int byteWritten = 0;
			   Url = new URL(fileAddress);
			   outStream = new BufferedOutputStream(new FileOutputStream(downloadDir + "\\" + localFileName));
			    
			   uCon = Url.openConnection();
			   is = uCon.getInputStream();
			   buf = new byte[4000];
			   while ((byteRead = is.read(buf)) != -1) {
			    outStream.write(buf, 0, byteRead);
			    byteWritten += byteRead;
			   }

			   System.out.println("Download Successfully.");
			   System.out.println("File name : " + localFileName);
			   System.out.println("of bytes  : " + byteWritten);
			   System.out.println("-------Download End--------");
			   fileName = localFileName;
			  } catch (Exception e) {
			   e.printStackTrace();
			  } finally {
			   try {
			    is.close();
			    outStream.close();
			   } catch (IOException e) {
			    e.printStackTrace();
			   }
			  }
			  return fileName;
	}


		public static String fileUrlDownload(String fileAddress, String downloadDir) {
			  String getName ="";
			  int slashIndex = fileAddress.lastIndexOf('/');
			  int periodIndex = fileAddress.lastIndexOf('.');
			  
			  // 파일 어드레스에서 마지막에 있는 파일이름을 취득
			  String fileName = fileAddress.substring(slashIndex + 1);
			  UUID uid = UUID.randomUUID();

			  String savedName = uid.toString() + "_" + fileName;
			  if (periodIndex >= 1 && slashIndex >= 0
			    && slashIndex < fileAddress.length() - 1) {
				 getName = fileUrlReadAndDownload(fileAddress, savedName, downloadDir);
			  } else {
			   System.err.println("path or file name NG.");
			  }
			  return getName;
		}
	
}