package oracle.java.s20180102.controller;


import oracle.java.s20180102.RSA;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.MsgDto;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.model.WishDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.MsgService;
import oracle.java.s20180102.service.NoticeService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReviewService;
import oracle.java.s20180102.service.SearchService;
import oracle.java.s20180102.service.WishService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	@Autowired
	private GServService gss;
	@Autowired
	private WishService ws;
	@Autowired
	private MemberService mbs;
	@Autowired
	private GuideService gs;
	@Autowired
	private NoticeService ns;
	@Autowired
	private ReviewService revs;
	@Autowired
	private SearchService ss;
	@Autowired
	private QAService qs;
	@Autowired
	private MsgService msg;
	@Autowired
	private JavaMailSender mailSender;  // Spring F/W
	

/**--------------------------------------------------------------
 	  지영
----------------------------------------------------------------*/

	
	/*    메인 페이지  	*/
	@RequestMapping(value="main")
	public String main(String currentPage, HttpSession session, Model model) {
		String ID =  (String)session.getAttribute("ID");
		// 관리자 추천 상품 가져오기!
		List<TourCardDto> tcDto = gss.selRecommendGserv(ID);
		
		// 인기 가이드 10명 가져오기!!!
		List<GuideDto> gDto = gs.selPopularGuide();
		
		// 신규 후기 list 가져오기
		PagingDto pdto = new PagingDto();
		int total = revs.totalReview();
		Paging pg = new Paging(total, currentPage, 3);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());		
		List<ReviewDto> rDto =  revs.selReviewList(pdto);
		
		// 후기 이미지 셋팅
		if(rDto.size()!=0) {
			for(int i=0; i<rDto.size(); i++) {
				if(rDto.get(i).getRimg()!=null) {		
					String[] rimage = rDto.get(i).getRimg().split(",");
					rDto.get(i).setRimgs(rimage);
					rDto.get(i).setRimg(rimage[0]);
				} 
			}
		}
		
		model.addAttribute("tcDto", tcDto);
		model.addAttribute("gDto", gDto);
		model.addAttribute("rDto", rDto);
		return "main";
	}
	
	@RequestMapping(value="inGServ")
	public String inGServ(HttpSession session, Model model) {
		String id = (String) session.getAttribute("ID");
		String gno = (String) session.getAttribute("gno");
		int result = 0;
		
		if(id==null || id.equals("")) {
			// 로그아웃 상태
			result = 0; 
		} else if (gno==null || gno.equals("")) {
			// 로그인 상태지만 가이드가 아님
			result = 1;
		} else {
			// 가이드임
			model.addAttribute("gno",gno);
			result = 2;
		}
		model.addAttribute("result", result);
		return "goGServ";
	}
		
	/*    상세 상품 페이지  	*/
		@RequestMapping(value="tour_detail")
		public String tour_detail(int gservNo, String currentPage, HttpSession session, Model model) {
			String ID =  (String) session.getAttribute("ID");
			GServDto gsDto = gss.oneGServ(gservNo);
			List<ContentsDto> cDtoList = gss.selCont(gservNo);
			
			//예약 가능 날짜 셋팅
			String day = gsDto.getGservDay();
			String[] days = day.split("D");
			String getDay = "1,2,3,4,5,6,7";
			for(int i=0; i<days.length; i++) {
				getDay = getDay.replace(days[i],""); 
			}
			days = getDay.split(",");
			
			int k=0;
			
			if(days[0] == null || days[0].equals("")) {
				k=1;
			}
			String okDay = "";
			for(int i=k;i<days.length; i++) {
				if(i==k) {
					okDay = "day != " + days[i];
				} else {
					okDay +=" && day != " + days[i];
				}
			}
			okDay = okDay.replaceAll("7", "0"); // 일요일 셋팅
			okDay = okDay.replaceAll("day !=  &&", ""); // null값 처리
			gsDto.setGservDay(okDay);
			
			// 예약 시작일 종료일 포맷 셋팅
			String minDate = gsDto.getGservSDate();
			String maxDate = gsDto.getGservEDate();
			minDate = minDate.replaceAll("-", "");
			maxDate = maxDate.replaceAll("-", "");
			gsDto.setGservSDate(minDate);
			gsDto.setGservEDate(maxDate);
			
			// 위시리스트 등록 여부
			WishDto wdto = new WishDto();
			wdto.setGservNo(gservNo);
			wdto.setMemberId(ID);
			int wishCheck = ws.wishCheck(wdto);
			
			// 가이드 info 가져오기
			int gno = gsDto.getGno();
			GuideDto gDto = gs.selOneGuide(gno);
			
			// 상품별 후기 가져오기
			PagingDto pdto = new PagingDto();
			int total = revs.totalGservNoRevs(gservNo);
			Paging pg = new Paging(total, currentPage);
			pdto.setStart(pg.getStart());		
			pdto.setEnd(pg.getEnd());		
			pdto.setGservNo(gservNo);
			List<ReviewDto> revDtoList = revs.selGsevNoList(pdto);
			
			// 후기 이미지 셋팅
			if(revDtoList.size()!=0) {
				for(int i=0; i<revDtoList.size(); i++) {
					if(revDtoList.get(i).getRimg()!=null) {		
						String[] rimage = revDtoList.get(i).getRimg().split(",");
						revDtoList.get(i).setRimgs(rimage);
						revDtoList.get(i).setRimg(rimage[0]);
					} 
				}
			}
			model.addAttribute("wishCheck", wishCheck);
			model.addAttribute("gsDto", gsDto);
			model.addAttribute("gDto", gDto);
			model.addAttribute("cDtoList", cDtoList);
			model.addAttribute("revDtoList", revDtoList);
			model.addAttribute("totalRevs", total);
			return "tour_detail";
		}
		
		
		@RequestMapping(value="msgForm")
		public String msgForm(String search, String talker, String currentPage, HttpSession session, Model model) {
			String id = (String) session.getAttribute("ID");
			
			
			//회원이 보내거나 받은 메시지 total
			int total = msg.totalMsg(id);
			
			//회원이 보내거나 받은 메시지 List
			Paging pg = new Paging(total, currentPage, 5);
			PagingDto pdto = new PagingDto();
			pdto.setStart(pg.getStart());
			pdto.setEnd(pg.getEnd());
			pdto.setMemberId(id);
			pdto.setSend_receive("send");
			
			List<MsgDto> sendDto = msg.selMsg(pdto); // 보낸 메시지
			pdto.setSend_receive("receive");
			List<MsgDto> receiveDto = msg.selMsg(pdto); // 받은 메시지
			List<MsgDto> msgDto = null;
			
			if(talker == null || talker.equals("")) {
				if(receiveDto.size()!=0 || sendDto.size()!=0) {
					if(receiveDto.size()==0) {
						talker = sendDto.get(0).getMsgReceiver();
					} else {
						talker = receiveDto.get(0).getMsgSender();
					}
					pdto.setQaReceiver(talker);      // 대화 상대 셋팅
					total = msg.totalMsgTalk(pdto);  // 한 상대와의 총 메시지 수
					currentPage = null;
					pg = new Paging(total, currentPage);
					pdto.setStart(pg.getStart());
					pdto.setEnd(pg.getEnd());
					pdto.setMemberId(id);
					pdto.setTalker(talker);           // 대화 상대 셋팅
					msgDto = msg.selMsgTalk(pdto);    // 한 상대와의 총 메시지 리스트
				}
			} else {
				if(receiveDto.size()!=0 || sendDto.size()!=0) {
					pdto.setQaReceiver(talker);      // 대화 상대 셋팅
					total = msg.totalMsgTalk(pdto);  // 한 상대와의 총 메시지 수
					currentPage = null;
					pg = new Paging(total, currentPage);
					pdto.setStart(pg.getStart());
					pdto.setEnd(pg.getEnd());
					pdto.setMemberId(id);
					pdto.setTalker(talker);           // 대화 상대 셋팅
					// talker을 입력했을 시 그동안 있었던 대화들을 봤다고 가정함. (check: n -> 'y')
					msg.upMsgCheck(pdto);
					msgDto = msg.selMsgTalk(pdto);    // 한 상대와의 총 메시지 리스트
					
				}
				// 대화상대 프로필 가져오기
				MemberDto talkerDto = mbs.selMember(talker);
				model.addAttribute("talkerDto", talkerDto);
			}
			List<MemberDto> mbDto = null;
			// 대화상대 검색 시
			if(search !=null) {
				if(!search.equals("")) {
					mbDto = mbs.searchMember(search);
					System.out.println("mbDto.size()"+mbDto.size());
				}
			}
			
			model.addAttribute("mbDto",mbDto);
			model.addAttribute("talker", talker);
			model.addAttribute("msgDto", msgDto);
			model.addAttribute("receiveDto", receiveDto);
			model.addAttribute("sendDto", sendDto);
			return "msgForm";
		} 
		
		@RequestMapping(value="inMsgTalk")
		public String inMsgTalk(MsgDto msgDto, Model model) {
			msg.inMsgTalk(msgDto);
			model.addAttribute("talker", msgDto.getMsgReceiver());
			return "redirect:msgForm.do";
		}
		
		@RequestMapping(value="getKeyword")
		@ResponseBody
		public List<SearchDto> getKeyword() {
			//인기검색어를 가져온다!
			List<SearchDto> hotKeyword = ss.hotKeyword();
			return hotKeyword;
		}

		@RequestMapping(value="getNewMessage")
		@ResponseBody
		public int getNewMessage(HttpSession session) {
			// 새로온 메시지 check
			String ID = (String)session.getAttribute("ID");
			int newMsgCheck = msg.getNewMsgCnt(ID);
			return newMsgCheck;
		}
		
		@RequestMapping(value="getRSA")
		@ResponseBody
		public Map<String, String> getRSA(HttpSession session){
			RSA rsa = RSA.getEncKey();
			Map<String, String> map = new HashMap<>();
			map.put("publicKeyModulus", rsa.getPublicKeyModulus());
			map.put("publicKeyExponent", rsa.getPublicKeyExponent());
			session.setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());
			return map;
		}

		
		
	// 태욱 --------------------------------------------------------------------------------
		
		@RequestMapping("author_detail")
		public String author_detail(int gno, HttpServletRequest request, Model model) {

			String ID = (String) request.getSession().getAttribute("ID");
			PagingDto pDto = new PagingDto();
			int total = gss.total(gno);
			pDto.setGno(gno);
			pDto.setMemberId(ID);
			
			// Paging null 처리
			 String nowPage = request.getParameter("currentPage");
			 int currentPage;
					if(nowPage !=null) {
						if(nowPage.equals("")) {
							currentPage = 1;
						} else {
						  currentPage = Integer.parseInt(nowPage); 
						}
					} else {
						currentPage = 1;
					} 
			
			Paging pg = new Paging(total, "1", 5);
			pDto.setStart(pg.getStart());
			pDto.setEnd(pg.getEnd());
			List<TourCardDto> tcDto = ss.selGPage(pDto);
			GuideDto gDto = gs.selOneGuide(gno);
			
			
			// 해당 가이드의 후기 리스트 가져오기
			pDto = new PagingDto();
			pDto.setGno(gno);
			int total1 = revs.totalRevsGno(gno);
			pg = new Paging(total1, nowPage, 3);
			pDto.setStart(pg.getStart());
			pDto.setEnd(pg.getEnd());
			
			List<ReviewDto> revDtoList = revs.selgnoReviewList(pDto);
			
			// 후기 이미지를 문자열 배열형식의 리스트로 저장
			List <String[]> rImgList = new ArrayList<String[]>();
				for (int i = 0; i < revDtoList.size(); i++) {
					if(revDtoList.get(i).getRimg() != null) {
						rImgList.add(revDtoList.get(i).getRimg().split(","));
					} 
				}				
			
			// 후기 이미지 중 첫 번째 이미지 선택
			for (int i = 0; i < revDtoList.size(); i++) {
				if(revDtoList.get(i).getRimg() != null) {
					String rImg = revDtoList.get(i).getRimg();
					String[] rImgs =rImg.split(",");
					revDtoList.get(i).setRimg(rImgs[0]);			
				}
			}
			
			model.addAttribute("total", total);
			model.addAttribute("rImgList", rImgList);
			model.addAttribute("pg", pg);
			model.addAttribute("revDto", revDtoList);
			model.addAttribute("gDto", gDto);
			model.addAttribute("tcDto", tcDto);
		 	model.addAttribute("currentPage", currentPage);
		 	
			return "author_detail";
		 	
		}
		
//-----------------------------------------------------------------
// 	  경희
//----------------------------------------------------------------

		
		/*  회사소개 페이지  */
		@RequestMapping(value="aboutUs")
		public String aboutUs() {
			return "aboutUs";
		}
				
		/*  개인정보취급방식   */
		@RequestMapping(value="privacy")
		public String privacy() {
			return "privacy";
		}
		
		
		/* 사업자 정보확인 */
		@RequestMapping(value="licensee")
		public String licensee() {
			return "licensee";
		}
		
		/* FAQ  */
		@RequestMapping(value="fna")
		public String fna(){
			return "fna";
		}

		/* F&A 문의하기  form*/
		@RequestMapping(value="fnaForm")
		public String fnaForm() {
			return "fnaForm";
		}
		
		/* F&A 문의하기 */
		@RequestMapping(value="fnaQuestion",method=RequestMethod.POST )
		public String fnaQuestion(@ModelAttribute QADto qaDto, Model model) {
			
			List<MemberDto> managerList = mbs.selManager();		
			for(int i=0; i<managerList.size(); i++) {
				qaDto.setQaReceiver(managerList.get(i).getMemberId());   //관리자 ID
				qs.inQA(qaDto);
			}
			
			return "redirect:selQAPro.do";
		}
		
		/* 이용약관  */
		@RequestMapping(value="termsOfUse")
		public String termsOfUse() {
			return "termsOfUse";
		}
		
		/* 고객센터 */
		@RequestMapping(value="contentUs")
		public String contentUs() {
			return "contentUs";
		}
		
		/* 서비스소개 */
		@RequestMapping(value="introduce")
		public String introduce() {
			return "introduce";
		}						
			
		/* (회원) 비밀번호 찾기 Form */
		@RequestMapping(value="pswFindForm")
		public String pswFindForm() {
			return "pswFindForm";
		}	

		
		//mailSending 
		@RequestMapping(value="mailTransport")
		public String mailTransport(HttpServletRequest request,Model model) {

			String memberId= request.getParameter("ID");            //받는사람 아이디(이메일)
			String toMail= request.getParameter("ID");              //받는사람 이메일주소
			String setFrom="asparagus4486@gmail.com";				//발신email 
			String title="Follow Me 임시비밀번호 입니다.";         		// 제목
			
			try {
				 MimeMessage message= mailSender.createMimeMessage();
				 MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
				 messageHelper.setFrom(setFrom);
				 messageHelper.setTo(toMail);
				 messageHelper.setSubject(title);
				 
				 String tempPsw= (int)(Math.random() * 999999) + 1 + "";
				 
				 messageHelper.setText("이메일을 성공적으로 전송했습니다. 임시비밀번호로 로그인하세요\r\n" + 
				 		"		로그인 후 비밀번호 변경을 잊지마세요! "
				 		+ ""
				 		+ "임시비밀번호 :  "+ tempPsw);  //메일내용
				 
				 mailSender.send(message);
				 
				 model.addAttribute("check",1);
			     MemberDto mbDto = new MemberDto();
			     mbDto.setMemberId(memberId);
			     mbDto.setPw(tempPsw);
				 mbs.changePw(mbDto);  //db에 비밀번호 임시비밀번호로 업데이트
			
			} catch (Exception e) {
				System.out.println(e);
				model.addAttribute("check",2);
			}
			return "redirect:main.do";
		}
			

		//가이드 등록폼
		@RequestMapping(value="g_joinForm")
		public String g_joinForm() {
			return "g_joinForm";
		}
			
		
		@RequestMapping(value="getNotice")
		public String getNotice(int noticeNo) {
			switch (noticeNo) {
			case 1:
				return "notice01";
			case 2:
				return "notice02";
			case 3:
				return "notice03";
			case 4:
				return "notice04";
			case 5:
				return "notice05";
			case 6:
				return "notice06";
			default:
				return "redirect:notice.do";
			}
		}
		
/*    전체 공지사항  소희: notice랑 noticeDetail 두개에요!	*/////////////////////////////////////
		
		@RequestMapping(value="notice") //전체 공지사항
		public String notice(HttpServletRequest request, Model model) {
			String ID = (String) request.getSession().getAttribute("ID");
			String currentPage = request.getParameter("currentPage");
		    PagingDto pdto = new PagingDto();
			//공지 게시글의 총 개수
			int total = ns.total_CompleteForNotice(); 
			
			Paging pg = new Paging(total, currentPage, 15); //10개씩 보여주는거 너무 적지?
			pdto.setStart(pg.getStart());
			pdto.setEnd(pg.getEnd());
			//공지 게시글 리스트
			List<NoticeDto> noticeList = ns.selNoticeList(pdto);
			
			model.addAttribute("pg", pg);
			model.addAttribute("ID", ID);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("noticeList", noticeList);
			
			return "noticeForm_All";
		}		

		@RequestMapping(value="noticeDetail") //전체 공지사항에서 제목 눌러서 들어가는 페이지(내용 열람)
		public String noticeDetail(HttpServletRequest request, Model model) {
			int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
			NoticeDto ndto = new NoticeDto();
			
			//해당 noticeNo를 가진 공지사항을 dto로 받아옵니다!
			ndto = ns.selNoticeDetail(noticeNo); //조회수도 1 올려줌
					
			model.addAttribute("noticeDto",ndto);
			return "noticeForm_Detail";
		}
		
////////////////////////////////////////////////////////////////////////////////////////////////////		
		
		
		
		
}