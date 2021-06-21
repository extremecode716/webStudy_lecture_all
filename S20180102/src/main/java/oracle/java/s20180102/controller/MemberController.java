package oracle.java.s20180102.controller;

import oracle.java.s20180102.RSA;
import oracle.java.s20180102.model.AccountingDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.LikeItDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.PayDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.model.WishDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.LikeItService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.PayService;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReservService;
import oracle.java.s20180102.service.ReviewService;
import oracle.java.s20180102.service.WishService;

import java.security.PrivateKey;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.helper.DataUtil;
//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	
	
	
/*-----------------------------------------------------------------------------------------
	[지영]
------------------------------------------------------------------------------------------*/


	@Autowired
	private WishService ws;
	@Autowired
	private LikeItService lis;
	@Autowired
	private ReservService ress;
	@Autowired
	private MemberService mbs;
	@Autowired
	private PayService ps;
	@Autowired
	private ReviewService revs;
	@Autowired
	private GServService gss;	
	@Autowired
	private QAService qs;
	@Autowired
	private GuideService gs;
	
	
	
/*    상세 상품 페이지  - 위시리스트 등록 여부 체크 	*/	
	@RequestMapping(value = "inWishList", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String inWishList(int gservNo, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		WishDto wsDto = new WishDto();
		wsDto.setMemberId(ID);
		wsDto.setGservNo(gservNo);
		ws.inWishList(wsDto);
		
		return "위시리스트에 등록된 상품입니다.";
	}

	
/* (회원) 프로필 관리 : 회원 탈퇴 */
	
	@RequestMapping(value="delMemberForm")
	public String delMemberForm(HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		MemberDto mbDto =  mbs.selMember(ID);
		model.addAttribute("mbDto", mbDto);
		
		return "delMemberForm";
		
	}
	
	@RequestMapping(value="delMemberPro")
	public String delMemberPro(HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		mbs.delMember(ID);
		session.setAttribute("ID", null);
		session.invalidate();
		return "redirect:main.do";
	}
	
	
/* (회원) 위시리스트 페이지 	*/	
	
	@RequestMapping(value="wishList")
	public String wishList(String currentPage, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");		
		PagingDto pdto = new PagingDto();
		int total = ws.totalWish(ID);
		Paging pg = new Paging(total, currentPage, 6);
		
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<TourCardDto> wishList = ws.selWishList(pdto);
		model.addAttribute("id", ID);
		model.addAttribute("wishList", wishList);
		model.addAttribute("pg",pg);

		
		return "wishList";
	}

	
	
/*    (회원)위시리스트 페이지 - 위시리스트 삭제	*/	
	
	@RequestMapping(value="delWishList")
	public String delWishList(int gservNo, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		WishDto wdto = new WishDto();
		wdto.setMemberId(ID);
		wdto.setGservNo(gservNo);
		ws.delWishList(wdto);
		
		return "forward:wishList.do";
	}
	
	
	
/*   좋아요 등록 	*/	
	@RequestMapping(value="inLikeItPro")
	public String writeLikeItPro(SearchDto sDto, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		LikeItDto liDto = new LikeItDto();
		liDto.setMemberId(ID);
		liDto.setGservNo(sDto.getGservNo());
		lis.inLikeIt(liDto);

		switch (sDto.getCall()) {
			case 1:
				return "forward:wishList.do";
			case 2:
				return "forward:search_Keyword.do";
			case 3:
				return "forward:main.do";
			default:
				return "forward:wishList.do";
		}
		
	}

	
	
/*   좋아요 삭제 	*/	
	@RequestMapping(value="delLikeItPro")
	public String delLikeItPro(SearchDto sDto, HttpSession session, Model model) {
		String ID = (String) session.getAttribute("ID");
		//String ID =  "abcd@naver.com";
		LikeItDto liDto = new LikeItDto();
		
		if(ID!=null) {			
			liDto.setMemberId(ID);
		}
		
		liDto.setGservNo(sDto.getGservNo());
		lis.delLikeIt(liDto);

		switch (sDto.getCall()) {
		case 1:
			return "forward:wishList.do";
		case 2:
			return "forward:search_Keyword.do";
		case 3:
			return "forward:main.do";
		case 4:
			return "forward:search_filter.do";
		default:
			return "forward:wishList.do";
		}
	}
	

/*   (회원) 예약 현황 	*/	
	@RequestMapping(value="reservation_member")
	public String reservation_member(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String currentPage = request.getParameter("currentPage");
		PagingDto pdto = new PagingDto();
		int total = ress.totalResv(ID);
		Paging pg = new Paging(total, currentPage, 4);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<ReservDto> reservList = ress.selReservList(pdto);

		model.addAttribute("list",reservList);
		model.addAttribute("pg",pg);
		model.addAttribute("total", total);

		return "reservation_member";
	}
	
	
/*   (회원) 예약 현황  - 예약 취소	*/	
	@RequestMapping(value="delResvPro")
	public String resvCancle(HttpServletRequest request, Model model) {
		String payCode = request.getParameter("payCode");		
		ress.resvCancel(payCode);

		// currentPage 보내줘야함.
		return "redirect:reservation_member.do";
		
	}
	

/*   상세 상품 페이지  - 예약 등록	*/	
	@RequestMapping(value="inResvPro")
	public String insertResvPro(ReservDto resvDto, HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		int p1 = (int)(Math.random()*100000);
		int p2 = (int)(Math.random()*100000);
		String payCode = "P_" + p1 + "_" + p2;
		resvDto.setMemberId(ID);
		resvDto.setPayCode(payCode);
		System.out.println(ID);
		if(ID!=null) {
			if(!ID.equals("")) {
				ress.inResv(resvDto);
				resvDto = ress.oneResv(payCode);
				TourCardDto tcDto = gss.oneTourCard(resvDto);
				model.addAttribute("resvDto", resvDto);
				model.addAttribute("tcDto", tcDto);
			}
		}
		return "insertResvPro";
	}
	
/*   (회원) 예약 현황  - 예약 수정 	*/	
	@RequestMapping(value="upResvForm")
	public String upResvForm(HttpServletRequest request, Model model) {
		String payCode = request.getParameter("payCode");
		ReservDto resvDto = ress.oneResv(payCode);
		TourCardDto tcDto = gss.oneTourCard(resvDto);
		
		//예약 가능 날짜 셋팅
		String day = tcDto.getGservDay();
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
		tcDto.setGservDay(okDay);
		
		// 예약 시작일 종료일 포맷 셋팅
		String minDate = tcDto.getGservSDate();
		String maxDate = tcDto.getGservEDate();
		minDate = minDate.replaceAll("-", "");
		maxDate = maxDate.replaceAll("-", "");
		tcDto.setGservSDate(minDate);
		tcDto.setGservEDate(maxDate);
		
		model.addAttribute("resvDto", resvDto);
		model.addAttribute("tcDto", tcDto);
		return "upResvForm";
	}
	
	
	@RequestMapping(value="upResvPro")
	public String upResvPro(ReservDto resvDto, Model model) {
		int reMemSize = resvDto.getReMemSize();
		Date tourDate = resvDto.getTourDate();
		resvDto = ress.oneResv(resvDto.getPayCode());
		resvDto.setReMemSize(reMemSize);
		resvDto.setTourDate(tourDate);
		ress.upResv(resvDto);
		
		// currentPage 보내줘야함.
		return "redirect:reservation_member.do";
	}

	
	
/*   (회원) 예약 현황 - 결제하기 	*/	
	@RequestMapping(value="inPayForm")
	public String payPage(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String payCode = request.getParameter("payCode");
		ReservDto rsvDto = ress.oneResv(payCode);
		TourCardDto tcDto = gss.oneTourCard(rsvDto);
		MemberDto mbDto = mbs.selMember(ID);
		model.addAttribute("resvDto", rsvDto);
		model.addAttribute("mbDto", mbDto);
		model.addAttribute("tcDto", tcDto);
		return "inPayForm";
	}

	@RequestMapping(value="pay_detail")
	public String pay_detail(String payCode, Model model) {
		
		PayDto pdto = ps.selOnePay(payCode);
		model.addAttribute("pDto", pdto);
		return "inPayPro";
	}
	
	@RequestMapping(value="inPayPro")
	public String inPayPro(PayDto pDto, Model model) {
		ReservDto resvDto = ress.oneResv(pDto.getPayCode());
		pDto.setMemberId(resvDto.getMemberId());
		pDto.setGservNo(resvDto.getGservNo());
		pDto.setPcomplete("n");
		if(pDto.getPay_method().equals("card")) {
			pDto.setPay_method("신용카드");
		} else if(pDto.getPay_method().equals("vbank")) {
			pDto.setPay_method("무통장입금");
		} else if(pDto.getPay_method().equals("trans")) {
			pDto.setPay_method("실시간 계좌이체");
		} else if(pDto.getPay_method().equals("phone")) {
			pDto.setPay_method("핸드폰 소액결제");
		}
		// 결제 정보 입력
		ps.inPay(pDto);
		
		// 예약 정보 업데이트(결제됨!)
		resvDto.setPay_yn("y");
		ress.upPay(resvDto);
		
		// 포인트 사용시 포인트 사용분 차감
		String usePoint = pDto.getDiscount();
		System.out.println("usePoint : " + usePoint);
		if(usePoint!=null) {
			if(!usePoint.equals("")) {
				mbs.downPoint(Integer.parseInt(usePoint), pDto.getMemberId()); 
			}
		}
		String approvNum = pDto.getApprovNum();
		model.addAttribute("pDto", pDto);
		model.addAttribute("approvNum",approvNum);
		return "inPayPro";
	}
	
/*   (회원) 투어 완료 	*/	
	@RequestMapping(value="successTour")
	public String successTour(String payCode, Model model) {
		// 예약확정, 투어완료 처리
		ReservDto resvDto = ress.oneResv(payCode);
		resvDto.setSuccess_yn("y");
		resvDto.setConfirm("y");
		ress.upResv(resvDto);
		
		// 미정산금액 ++
		int gno = resvDto.getGno();
		GuideDto gDto = gs.selOneGuide(gno);
		int totalCost = gDto.getTotalCost();
		totalCost = totalCost+Integer.parseInt(resvDto.getAmount());
		gDto.setTotalCost(totalCost);
		gs.upCostGuide(gDto);
		
		
		// 가이드 입금 기록
		AccountingDto acDto = new AccountingDto();
		acDto.setGno(gno);
		acDto.setInCost(Integer.parseInt(resvDto.getAmount()));
		acDto.setBalance(gDto.getTotalCost());
		gs.inCost(acDto);
		
		return "redirect:review_member.do";
	}

/*   (회원) 결제 내역 	*/	
	@RequestMapping(value="pay_member")
	public String pay_member(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String currentPage = request.getParameter("currentPage");
		PagingDto pdto = new PagingDto();
		int total = ps.total(ID);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<PayDto> payList = ps.selPayList(pdto);
		model.addAttribute("payList", payList);
		model.addAttribute("pg", pg);
		model.addAttribute("total",total);
		return "pay_member";
	}
	
/*   (회원) 후기 관리 	*/
	@RequestMapping(value="review_member")
	public String review_member(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		PagingDto pdto = new PagingDto();
		int total = ress.total_Complete(ID);
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<ReservDto> complete = ress.completeList(pdto);
		
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total",total);
		model.addAttribute("openReview",0);
		return "review_member";
	}

	
/*   (회원) 후기 관리 - 후기 등록 	*/
	@RequestMapping(value="inReviewForm")
	public String writeReview(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID =  "abcd@naver.com";
		String payCode = request.getParameter("payCode");
		MemberDto mbDto = mbs.selMember(ID);
		ReservDto rsvDto = ress.oneResv(payCode);
		
		model.addAttribute("rsvDto", rsvDto);
		model.addAttribute("nickName", mbDto.getNickName());
		model.addAttribute("memberId", ID);
		return "inReviewForm";
	}
	
/*   (회원) 후기 관리 - 후기 수정 	*/
	@RequestMapping(value="upReviewForm")
	public String updateReviewForm(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));
		String payCode = request.getParameter("payCode");
		
		ReviewDto revDto = new ReviewDto();
		revDto.setMemberId(ID);
		revDto.setGservNo(gservNo);
		revDto.setPayCode(payCode);
		revDto = revs.oneReview(revDto);
		model.addAttribute("revDto", revDto);
		return "upReviewForm";
	}

/*   (회원) 후기 관리 - 후기 삭제 	*/
	@RequestMapping(value="delReviewPro")
	public String delReviewPro(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));
		String payCode = request.getParameter("payCode");
		ReviewDto revDto = new ReviewDto();
		revDto.setGservNo(gservNo);
        revDto.setMemberId(ID);
        revDto.setPayCode(payCode);
		revDto = revs.oneReview(revDto);
		revs.delReview(revDto);
		
		// 후기 삭제시 포인트 차감
		mbs.downPoint(100, revDto.getMemberId());
	
		return "forward:review_member.do";
	}

	
	
	
/*   (회원) 후기 관리 - 후기 보기 	*/
	@RequestMapping(value="getReviewPro")
	public String getReviewPro(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));
		String payCode = request.getParameter("payCode");
		ReviewDto revDto = new ReviewDto();
		revDto.setGservNo(gservNo);
		revDto.setMemberId(ID);
		revDto.setPayCode(payCode);

		// 후기 선택
		revDto = revs.oneReview(revDto);
		
		// 후기 이미지 중 첫 번째 이미지 선택
		if(revDto.getRimg() != null) {
			String rImg = revDto.getRimg();
			String[] rImgs =rImg.split(",");
			revDto.setRimg(rImgs[0]);			
		}
		
		// 하나의 후기에 달린 후기 리스트 가져오기
		List<ReviewDto> revDtoList = revs.oneReviewList(revDto);  
		
		
		// 페이징
		String currentPage = request.getParameter("currentPage");
		int thisPage;
		if(currentPage==null) {
			thisPage=1;
		} else {
			thisPage=Integer.parseInt(currentPage);
		}
		
		PagingDto pdto = new PagingDto();
		int total = ress.total_Complete(ID);
		Paging pg = new Paging(total, currentPage);
		
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		
		// 후기 open event 조정
		List<ReservDto> complete = ress.completeList(pdto);	  
		int rn = Integer.parseInt(request.getParameter("rn"));
		complete.get(rn-1).setOpenReview(1);
		
		// response
		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total",total);
		
		model.addAttribute("revDto",revDto);
		model.addAttribute("revList", revDtoList);
		model.addAttribute("currentPage", thisPage);
		return "review_member";
	}
	
	
/*   (회원) 후기 관리 - 답글 등록 	*/
	@RequestMapping(value="inCmtPro")
	public String writeCommentPro(ReviewDto revDto, HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		int rn = Integer.parseInt(request.getParameter("rn"));
		revDto.setMemberId(ID);
		revs.inComment(revDto);
		return "forward:getReviewPro.do";
	}

/*   (회원) 후기 관리 - 답글 삭제 	*/
	@RequestMapping(value="delCmtPro")
	public String delCmtPro(HttpServletRequest request, Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		int gservNo = Integer.parseInt(request.getParameter("gservNo"));
		int rStep = Integer.parseInt(request.getParameter("rstep"));
		int rn = Integer.parseInt(request.getParameter("rn"));
		String payCode = request.getParameter("payCode");
		ReviewDto revDto = new ReviewDto();
		revDto.setGservNo(gservNo);
        revDto.setMemberId(ID);
        revDto.setPayCode(payCode);
		revDto = revs.oneReview(revDto);
		revDto.setRstep(rStep);
		revs.delComment(revDto);
		return "forward:getReviewPro.do";
	}


	@RequestMapping(value="inQAForm")
	public String inQAForm(QADto qaDto, Model model) {
		model.addAttribute("qaDto", qaDto);
		return "inQAForm";
	}
	
	@RequestMapping(value="inQAPro")
	public String inQAPro(QADto qaDto, Model model) {
		
		qs.inQA(qaDto);
		return "redirect:selQAPro.do";
	}
/*-----------------------------------------------------------------------------------------
	[ 경희씨 ]
------------------------------------------------------------------------------------------*/	
	
	//회원 정보 페이지
	@RequestMapping(value="user_info")
	public String user_infoForm(HttpServletRequest request,Model model) {
		String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		MemberDto mDto=mbs.selMember(ID);
		model.addAttribute("memberDto",mDto);
			
		return "user_info";
		
	}
	
	//회원 비밀번호 변경폼
	@RequestMapping(value="changePwForm")
	public String changePw(String memberId,Model model) {
		//String ID =  (String) request.getSession().getAttribute("ID");
		//String ID = "abcd@naver.com";
		model.addAttribute("memberId",memberId);
		return "changePwForm";
	}
	
	//회원 비밀번호 변경
	@RequestMapping(value="changePasswd", method=RequestMethod.POST)
	public String changePasswd(MemberDto memberDto, HttpServletRequest request, Model model)throws Exception { 
		    // 1. changePw 정확성  호출  정확 :1 , 오류 : 0

		int status1 = mbs.changePwConfirm(memberDto);	
		String pw = request.getParameter("npw");	
		if (status1 > 0)  {			
			memberDto.setPw(pw);
			// 2. changePw Sevice 호출
			int status2 = mbs.changePw(memberDto);
			memberDto = mbs.selMember(memberDto.getMemberId());
			if (status2 > 0)  {
				model.addAttribute("memberDto",memberDto);
				model.addAttribute("message","성공수정");
				return "user_info";
			} else {
				model.addAttribute("message"," 수정 실패");
				return "changePwForm";
			}
		
		} else {
			model.addAttribute("message","password 검증실패");
			return "changePwForm";
		}
	} 

	//회원정보 수정 폼 페이지
	@RequestMapping(value="updateForm")
	public String user_updateForm(String memberId,Model model) {
		MemberDto mDto=mbs.selMember(memberId);
		model.addAttribute("memberDto",mDto);
		return "user_updateForm";
	}
	
	/*  (회원) 로그인 do  */
	@RequestMapping(value="logIn", method=RequestMethod.POST)
	public String logIn(MemberDto mbDto, String encPw, String encId, HttpSession session, Model model) {
		
		System.out.println("encPw :" + encPw);
		System.out.println("encId :" + encId);
		
		//암호화된 아이디와 비밀번호를 복호화한다.
		try {
			String decId = RSA.decryptRsa((PrivateKey) session.getAttribute("__rsaPrivateKey__"), encId);
			String decPw = RSA.decryptRsa((PrivateKey) session.getAttribute("__rsaPrivateKey__"), encPw);
			
			mbDto.setMemberId(decId);
			mbDto.setPw(decPw);
		} catch (Exception e) {
			System.out.println("RSA 오류 : "+e.getMessage());
		}

		MemberDto mbDto2 = mbs.selMember(mbDto.getMemberId());

		if(mbDto2 !=null) {
			if(mbDto.getPw().equals(mbDto2.getPw())) {
				
				// 태욱 수정	
				if(mbDto2.getAuthority().equals("2")) {
					int gno = mbs.selgNo(mbDto.getMemberId());	
					GuideDto gDto = gs.selOneGuide(gno);
					if( gno > 0 ) {
						model.addAttribute("gno", Integer.toString(gno));
						session.setAttribute("guideChk", "1");
						session.setAttribute("gDto", gDto);
					}					
				}  else if (mbDto2.getAuthority().equals("3")) {
					session.setAttribute("managerChk", "1");
				}
				// 태욱 수정
				
				model.addAttribute("result","1");
				session.setAttribute("mbDto", mbDto2);
				session.setAttribute("loginChk", "1");
				model.addAttribute("ID", mbDto.getMemberId());
			} else {
				model.addAttribute("result","0");
			}
			return "loginCheck";
		} else {
			model.addAttribute("result","0");
			return "loginCheck";
		}

	}
	
	/* 로그아웃 */
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.setAttribute("ID", null);
		session.setAttribute("mbDto", null);
		session.setAttribute("gDto", null);
		session.setAttribute("gno", null);
		session.invalidate();
		return "logoutForm";
	}

	/*    회원가입 form 페이지  	*/
	@RequestMapping(value="joinForm")
	public String joinForm(Model model) {
		return"joinForm";
	}
		

	
	/*  @ResponseBody 로 어노테이션이 되어 있다면 메소드에서 리턴되는 값은 View 를 통해서 
	출력되지 않고 HTTP Response Body 에 직접 쓰여지게 됩니다.
	이때 쓰여지기 전에 리턴되는 데이터 타입에 따라 MessageConverter에서 변환이 이뤄진 후 쓰여지게 됩니다.
	*/
	
	@RequestMapping(value="fs")
	@ResponseBody
	public String findpassword(String memberId) {
		String count=mbs.fs(memberId);
		return count;
	}
	
	
	@RequestMapping(value="checkpsw")
	@ResponseBody
	public int checkpsw(String memberId, String pw) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberId", memberId);
		map.put("pw",       pw);
		
		int check=mbs.checkpsw(map);
		return check;
	}


/*-----------------------------------------------------------------------------------------
	소희
------------------------------------------------------------------------------------------*/

	@RequestMapping(value="selQAPro")
	public String selQAPro(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		String qAreply = request.getParameter("qAreply");
		
		if(qAreply==null) {
			System.out.println("qAreply == null");
		}else if(qAreply.equals("y")||qAreply.equals("n")) {
			System.out.println("이건 그냥 넘겨줘야함");
		} else { //전체보기 위하여
			System.out.println("??");
			qAreply=null;
		}
		
		PagingDto pdto = new PagingDto();
		pdto.setMemberId(ID);
		pdto.setReply_yn(qAreply);
		System.out.println("qAreply: " + qAreply);
		System.out.println("pdto:memberID : " + pdto.getMemberId());
		System.out.println("pdto:reply_yn : " + pdto.getReply_yn());
		//기본적으로는 ID로 전체 문의 개수 count
		//필터 적용시, 답변 여부 또한 확인해야함 
		
		int total = qs.selTotalQA(pdto);
		Paging pg = new Paging(total, currentPage);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		
		// String reply_yn, String write_period도 PagingDto가 받아줘야함
		// 일단은 null로 받았을 경우로 만들어놓자
		
		List<QADto> qAList = qs.selQAList(pdto);         //문의사항
		List<QADto> qAList_rpy = qs.selQAList_rpy(pdto); //이에 대한 답변
		
		model.addAttribute("pg", pg);
		model.addAttribute("ID", ID); //접속한 사람의 ID
		model.addAttribute("qAList", qAList);
		model.addAttribute("qAList_rpy", qAList_rpy);
		model.addAttribute("qAreply", qAreply);
		return "selQAForm3";
	}
	


/*-----------------------------------------------------------------------------------------
	태욱
------------------------------------------------------------------------------------------*/
	
		/*  (회원) 카카오 로그인 */
		@RequestMapping(value="kakaoLogIn")
		public String kakaoLogIn(MemberDto mbDto, HttpSession session, Model model) {

			MemberDto mbDto2 = mbs.selMember(mbDto.getMemberId());

			if(mbDto2 !=null) {
					// 태욱 수정	
					if(mbDto2.getAuthority().equals("2")) {
						int gno = mbs.selgNo(mbDto.getMemberId());	
						GuideDto gDto = gs.selOneGuide(gno);
						if( gno > 0 ) {
							model.addAttribute("gno", Integer.toString(gno));
							session.setAttribute("guideChk", "1");
							session.setAttribute("gDto", gDto);
						}					
					}  else if (mbDto2.getAuthority().equals("3")) {
						session.setAttribute("managerChk", "1");
					}
					// 태욱 수정
					
					model.addAttribute("result","1");
					session.setAttribute("mbDto", mbDto2);
					session.setAttribute("loginChk", "1");
					model.addAttribute("ID", mbDto.getMemberId());
					return "loginCheck";

				} else {
					model.addAttribute("result","0");
				}
					return "loginCheck";
			}
		}