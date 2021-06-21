package controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.MemberBean;
import service.MemberServiceImpl;


@Controller
public class MemberAction {

	@Autowired
	private MemberServiceImpl memberService;

	// ID중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/member_idcheck.nhn", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception {
		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);

		return "member/idcheckResult";
	}

	/* 로그인 폼 뷰 */
	@RequestMapping(value = "/member_login.nhn")
	public String member_login() {
		return "member/member_login";
		// member 폴더의 member_login.jsp 뷰 페이지 실행
	}

	/* 비번찾기 폼 */
	@RequestMapping(value = "/pwd_find.nhn")
	public String pwd_find() {
		return "member/pwd_find";
		// member 폴더의 pwd_find.jsp 뷰 페이지 실행
	}

	/* 회원가입 폼 */
	@RequestMapping(value = "/member_join.nhn")
	public String member_join() {
		return "member/member_join";
		// member 폴더의 member_join.jsp 뷰 페이지 실행
	}

	
	/* 비번찾기 완료 */
	@RequestMapping(value = "/pwd_find_ok.nhn", method = RequestMethod.POST)
	public String pwd_find_ok(@ModelAttribute MemberBean mem, HttpServletResponse response, Model model)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		MemberBean member = memberService.findpwd(mem);

		if (member == null) {// 값이 없는 경우

			return "member/pwdResult";

		} else {

			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "giduck23@naver.com";
			String hostSMTPpwd = "0000"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "giduck23@naver.com";
			String fromName = "관리자";
			String subject = "비밀번호 찾기";

			// 받는 사람 E-Mail 주소
			String mail = member.getJoin_email();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
						+ member.getJoin_pwd() + "</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);
			}

			model.addAttribute("pwdok", "등록된 email을 확인 하세요~!!");
			return "member/pwd_find";

		}

	}

	// /* 회원 가입 저장 */
	// @RequestMapping(value = "/member_join_ok.nhn", method =
	// RequestMethod.POST)
	// public String member_join_ok(HttpServletRequest request,
	// HttpServletResponse response) throws Exception {
	// MemberBean m = new MemberBean();
	//
	// String uploadPath = request.getRealPath("upload");
	// int size = 10 * 1024 * 1024; // 10MB까지 업로드 가능
	//
	// MultipartRequest multi = new MultipartRequest(request, uploadPath, size,
	// "utf-8",
	// new DefaultFileRenamePolicy());
	//
	// String join_id = multi.getParameter("join_id").trim();// 회원아이디
	// String join_pwd = multi.getParameter("join_pwd1").trim();// 회원비번
	// String join_name = multi.getParameter("join_name").trim();// 회원이름
	// String join_zip1 = multi.getParameter("join_zip1").trim();
	// String join_addr1 = multi.getParameter("join_addr1").trim();
	// String join_addr2 = multi.getParameter("join_addr2").trim();
	// String join_tel1 = multi.getParameter("join_tel1").trim();
	// String join_tel2 = multi.getParameter("join_tel2").trim();
	// String join_tel3 = multi.getParameter("join_tel3").trim();
	// String join_tel = join_tel1 + "-" + join_tel2 + "-" + join_tel3;
	// String join_phone1 = multi.getParameter("join_phone1").trim();
	// String join_phone2 = multi.getParameter("join_phone2").trim();
	// String join_phone3 = multi.getParameter("join_phone3").trim();
	// String join_phone = join_phone1 + "-" + join_phone2 + "-" + join_phone3;
	// String join_mailid = multi.getParameter("join_mailid").trim();
	// String join_maildomain = multi.getParameter("join_maildomain").trim();
	// String join_email = join_mailid + "@" + join_maildomain;
	//
	// // 첨부 파일 받는 부분
	// m.setJoin_profile(multi.getFilesystemName((String)
	// multi.getFileNames().nextElement()));
	//
	// m.setJoin_id(join_id);
	// m.setJoin_pwd(join_pwd);
	// m.setJoin_name(join_name);
	// m.setJoin_zip1(join_zip1);
	// // m.setJoin_zip2(join_zip2);
	// m.setJoin_addr1(join_addr1);
	// m.setJoin_addr2(join_addr2);
	// m.setJoin_tel(join_tel);
	// m.setJoin_phone(join_phone);
	// m.setJoin_email(join_email);
	//
	// memberService.insertMember(m);
	//
	// return "redirct:member_login.nhn";
	// }

	/* 회원 가입 저장(fileupload) */
	@RequestMapping(value = "/member_join_ok.nhn", method = RequestMethod.POST)
	public String member_join_ok(@RequestParam("join_profile1") MultipartFile mf, 
								 MemberBean member,
								 HttpServletRequest request,
								 Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();

		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;
		
		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		
		file[1] = st.nextToken();		// 확장자	
		
		if(size > 100000){
			result=1;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") ){
			
			result=2;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
		}
		

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + filename));

		}

		String join_tel1 = request.getParameter("join_tel1").trim();
		String join_tel2 = request.getParameter("join_tel2").trim();
		String join_tel3 = request.getParameter("join_tel3").trim();
		String join_tel = join_tel1 + "-" + join_tel2 + "-" + join_tel3;
		String join_phone1 = request.getParameter("join_phone1").trim();
		String join_phone2 = request.getParameter("join_phone2").trim();
		String join_phone3 = request.getParameter("join_phone3").trim();
		String join_phone = join_phone1 + "-" + join_phone2 + "-" + join_phone3;
		String join_mailid = request.getParameter("join_mailid").trim();
		String join_maildomain = request.getParameter("join_maildomain").trim();
		String join_email = join_mailid + "@" + join_maildomain;

		member.setJoin_tel(join_tel);
		member.setJoin_phone(join_phone);
		member.setJoin_email(join_email);
		member.setJoin_profile(filename);

		memberService.insertMember(member);

		return "redirect:member_login.nhn";
	}

	
	/* 로그인 인증 */
	@RequestMapping(value = "/member_login_ok.nhn", method = RequestMethod.POST)
	public String member_login_ok(@RequestParam("id") String id, 
			                      @RequestParam("pwd") String pwd,
			                      HttpSession session, 
			                      Model model) throws Exception {
		int result=0;
		MemberBean m = memberService.userCheck(id);
		if (m == null) {	// 등록되지 않은 회원일때
			result = 1;
			model.addAttribute("result", result);
			
			return "member/loginResult";
			
		} else {			// 등록된 회원일때
			if (m.getJoin_pwd().equals(pwd)) {// 비번이 같을때
				session.setAttribute("id", id);

				String join_name = m.getJoin_name();
				String join_profile = m.getJoin_profile();

				model.addAttribute("join_name", join_name);
				model.addAttribute("join_profile", join_profile);

				return "member/main";
				
			} else {// 비번이 다를때
				result = 2;
				model.addAttribute("result", result);
				
				return "member/loginResult";				
			}
		}

	}

	/* 회원정보 수정 폼 */
	@RequestMapping(value = "/member_edit.nhn")
	public String member_edit(HttpSession session, Model m) throws Exception {

		String id = (String) session.getAttribute("id");

		MemberBean editm = memberService.userCheck(id);

		String join_tel = editm.getJoin_tel();
		StringTokenizer st01 = new StringTokenizer(join_tel, "-");
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 -를 기준으로 문자열을 파싱해준다.
		String join_tel1 = st01.nextToken();// 첫번째 전화번호 저장
		String join_tel2 = st01.nextToken(); // 두번째 전번 저장
		String join_tel3 = st01.nextToken();// 세번째 전번 저장

		String join_phone = editm.getJoin_phone();
		StringTokenizer st02 = new StringTokenizer(join_phone, "-");
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 -를 기준으로 문자열을 파싱해준다.
		String join_phone1 = st02.nextToken();// 첫번째 전화번호 저장
		String join_phone2 = st02.nextToken(); // 두번째 전번 저장
		String join_phone3 = st02.nextToken();// 세번째 전번 저장

		String join_email = editm.getJoin_email();
		StringTokenizer st03 = new StringTokenizer(join_email, "@");
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 @를 기준으로 문자열을 파싱해준다.
		String join_mailid = st03.nextToken();// 첫번째 전화번호 저장
		String join_maildomain = st03.nextToken(); // 두번째 전번 저장

		m.addAttribute("editm", editm);
		m.addAttribute("join_tel1", join_tel1);
		m.addAttribute("join_tel2", join_tel2);
		m.addAttribute("join_tel3", join_tel3);
		m.addAttribute("join_phone1", join_phone1);
		m.addAttribute("join_phone2", join_phone2);
		m.addAttribute("join_phone3", join_phone3);
		m.addAttribute("join_mailid", join_mailid);
		m.addAttribute("join_maildomain", join_maildomain);

		return "member/member_edit";
	}

	/* 회원정보 수정(cos) */
	// @RequestMapping(value = "/member_edit_ok.nhn", method =
	// RequestMethod.POST)
	// public String member_edit_ok(HttpServletRequest request,
	// HttpSession session,
	// Model mv) throws Exception {
	//
	// MemberBean member = new MemberBean();
	//
	// String uploadPath = request.getRealPath("upload");
	// int size = 10 * 1024 * 1024; // 10MB까지 업로드 가능
	//
	// MultipartRequest multi =
	// new MultipartRequest(request,
	// uploadPath,
	// size,
	// "utf-8",
	// new DefaultFileRenamePolicy());
	//
	// String id = (String) session.getAttribute("id");
	//
	// String join_pwd = multi.getParameter("join_pwd1").trim();
	// String join_name = multi.getParameter("join_name").trim();
	// String join_zip1 = multi.getParameter("join_zip1").trim();
	// // String join_zip2 = multi.getParameter("join_zip2").trim();
	// String join_addr1 = multi.getParameter("join_addr1").trim();
	// String join_addr2 = multi.getParameter("join_addr2").trim();
	// String join_tel1 = multi.getParameter("join_tel1").trim();
	// String join_tel2 = multi.getParameter("join_tel2").trim();
	// String join_tel3 = multi.getParameter("join_tel3").trim();
	// String join_tel = join_tel1 + "-" + join_tel2 + "-" + join_tel3;
	// String join_phone1 = multi.getParameter("join_phone1").trim();
	// String join_phone2 = multi.getParameter("join_phone2").trim();
	// String join_phone3 = multi.getParameter("join_phone3").trim();
	// String join_phone = join_phone1 + "-" + join_phone2 + "-" + join_phone3;
	// String join_mailid = multi.getParameter("join_mailid").trim();
	// String join_maildomain = multi.getParameter("join_maildomain").trim();
	// String join_email = join_mailid + "@" + join_maildomain;
	//
	// MemberBean editm = this.memberService.userCheck(id);
	// // 아이디를 기준으로 디비로 부터 회원정보를 가져옴
	//
	// // 첨부 파일 받는 부분
	// String join_profile = multi.getFilesystemName((String)
	// multi.getFileNames().nextElement());
	// if (join_profile == null) { // 첨부 파일이 수정되지 않으면
	// member.setJoin_profile(editm.getJoin_profile());
	// } else { // 첨부파일이 수정
	// member.setJoin_profile(join_profile);
	// }
	//
	// member.setJoin_id(id);
	// member.setJoin_pwd(join_pwd);
	// member.setJoin_name(join_name);
	// member.setJoin_zip1(join_zip1);
	// // member.setJoin_zip2(join_zip2);
	// member.setJoin_addr1(join_addr1);
	// member.setJoin_addr2(join_addr2);
	// member.setJoin_tel(join_tel);
	// member.setJoin_phone(join_phone);
	// member.setJoin_email(join_email);
	//
	// memberService.updateMember(member);// 수정 메서드 호출
	//
	// mv.addAttribute("join_name", member.getJoin_name());
	// mv.addAttribute("join_profile", member.getJoin_profile());
	//
	// return "member/main";
	// }

	
	/* 회원정보 수정(fileupload) */
	@RequestMapping(value = "/member_edit_ok.nhn", method = RequestMethod.POST)
	public String member_edit_ok(@RequestParam("join_profile1") MultipartFile mf, 
								 MemberBean member,
								 HttpServletRequest request, 
								 HttpSession session, 
								 Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();		
		
		String path = request.getRealPath("upload");
		
		int result=0;		
		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);
		
	if(filename != ""){	 // 첨부파일이 전송된 경우		
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		
		file[1] = st.nextToken();		// 확장자	
		
		if(size > 100000){
			result=1;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") ){
			
			result=2;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
		}	
		
	}
		
		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + filename));

		}		
		

		String id = (String) session.getAttribute("id");

		String join_tel1 = request.getParameter("join_tel1").trim();
		String join_tel2 = request.getParameter("join_tel2").trim();
		String join_tel3 = request.getParameter("join_tel3").trim();
		String join_tel = join_tel1 + "-" + join_tel2 + "-" + join_tel3;
		String join_phone1 = request.getParameter("join_phone1").trim();
		String join_phone2 = request.getParameter("join_phone2").trim();
		String join_phone3 = request.getParameter("join_phone3").trim();
		String join_phone = join_phone1 + "-" + join_phone2 + "-" + join_phone3;
		String join_mailid = request.getParameter("join_mailid").trim();
		String join_maildomain = request.getParameter("join_maildomain").trim();
		String join_email = join_mailid + "@" + join_maildomain;

		MemberBean editm = this.memberService.userCheck(id);		
		
		if (size > 0 ) { 			// 첨부 파일이 수정되면
			member.setJoin_profile(filename);			
		} else { 					// 첨부파일이 수정되지 않으면
			member.setJoin_profile(editm.getJoin_profile());
		}

		member.setJoin_id(id);
		member.setJoin_tel(join_tel);
		member.setJoin_phone(join_phone);
		member.setJoin_email(join_email);

		memberService.updateMember(member);// 수정 메서드 호출

		model.addAttribute("join_name", member.getJoin_name());
		model.addAttribute("join_profile", member.getJoin_profile());

		return "member/main";
	}

	/* 회원정보 삭제 폼 */
	@RequestMapping(value = "/member_del.nhn")
	public String member_del(HttpSession session, Model dm) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean deleteM = memberService.userCheck(id);
		dm.addAttribute("d_id", id);
		dm.addAttribute("d_name", deleteM.getJoin_name());

		return "member/member_del";
	}

	/* 회원정보 삭제 완료 */
	@RequestMapping(value = "/member_del_ok.nhn", method = RequestMethod.POST)
	public String member_del_ok(@RequestParam("pwd") String pass, 
							    @RequestParam("del_cont") String del_cont,
							    HttpSession session) throws Exception {

		String id = (String) session.getAttribute("id");
		MemberBean member = this.memberService.userCheck(id);

		if (!member.getJoin_pwd().equals(pass)) {

			return "member/deleteResult";
			
		} else {// 비번이 같은 경우
			
			String up = session.getServletContext().getRealPath("upload");
			String fname = member.getJoin_profile();
			System.out.println("up:"+up);
			
			// 디비에 저장된 기존 이진파일명을 가져옴
			if (fname != null) {// 기존 이진파일이 존재하면
				File delFile = new File(up +"/"+fname);
				delFile.delete();// 기존 이진파일을 삭제
			}
			MemberBean delm = new MemberBean();
			delm.setJoin_id(id);
			delm.setJoin_delcont(del_cont);

			memberService.deleteMember(delm);// 삭제 메서드 호출

			session.invalidate();	// 세션만료

			return "redirect:member_login.nhn";
		}
	}

	// 로그아웃
	@RequestMapping("member_logout.nhn")
	public String logout(HttpSession session) {
		session.invalidate();

		return "member/member_logout";
	}

}
