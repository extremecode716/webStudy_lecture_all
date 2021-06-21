package oracle.java.s20180102.controller;


import oracle.java.s20180102.MakeExcel;
import oracle.java.s20180102.model.AccountingDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.MsgDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.MsgService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReservService;
import oracle.java.s20180102.service.ReviewService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GuideController {
	@Autowired
	private GServService gss;
	@Autowired
	private QAService qs;
	@Autowired
	private ReservService ress;
	@Autowired
	private GuideService gs;
	@Autowired
	private MemberService mbs;
	@Autowired
	private MsgService msg;
	@Autowired
	private ReviewService revs;

/*-----------------------------------------------------------------------------------------
	태욱
------------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="pay_guidePro")
	public String pay_guidePro(HttpSession session, GuideDto gDto, String cost, Model model) {
		String gno = session.getAttribute("gno")+"";
		// 남은잔액(totalcost) 차감
		gDto.setGno(Integer.parseInt(gno));
		gDto.setTotalCost(gDto.getTotalCost()-Integer.parseInt(cost));
		System.out.println("들어옴!");
		gs.upCostGuide(gDto);
		
		// 지급 기록 작성
		AccountingDto acDto = new AccountingDto();
		acDto.setGno(Integer.parseInt(gno));
		acDto.setPaymentCost(Integer.parseInt(cost));
		acDto.setBalance(gDto.getTotalCost());
		gs.inAccounting(acDto);
		
		GServDto gsDto = new GServDto();
		gsDto.setGno(gDto.getGno());
		List<GServDto> list = gss.selPayGuide(gsDto);
		model.addAttribute("payGlist", list);
		model.addAttribute("gno", gDto.getGno());
		return "pay_guide";
	}
	
	
	@RequestMapping(value="service_guide")
	public String service_guide(HttpSession session, GServDto gsDto, String currentPage, Model model) {
		int total = 0;
		String gno = session.getAttribute("gno")+"";
		if(gno!=null) {
			total = gss.total(Integer.parseInt(gno)); 
		}else {
			total = gss.total();
		}
		Paging pg = new Paging(total, currentPage);
		gsDto.setStart(pg.getStart());
		gsDto.setEnd(pg.getEnd());
		gsDto.setGno(Integer.parseInt(gno));
		List<GServDto> list = gss.selGServ(gsDto);
		model.addAttribute("list", list);
		model.addAttribute("pg",pg);
		
		return "service_guide";
	}
	
	@RequestMapping(value="selGServForm")
	public String selGservForm(String gservNo, Model model) {
		GServDto gsDto = gss.oneGServ(Integer.parseInt(gservNo));
		//System.out.println("gsDto = " + gsDto);
		List<ContentsDto> cDtoList = gss.selCont(Integer.parseInt(gservNo));
		//System.out.println("cDtoList = " + cDtoList);
		model.addAttribute("gsDto", gsDto);
		model.addAttribute("cDtoList", cDtoList);
		return "selGServForm";
	}
	
	@RequestMapping(value="inGServForm")
	public String inGservForm(HttpSession session, Model model) {
		String gno = session.getAttribute("gno")+"";
		GServDto gsDto = new GServDto();
		int gservNo = gss.selGServNo(Integer.parseInt(gno));
		gsDto.setGno(Integer.parseInt(gno));
		gsDto.setGservNo(gservNo);
		model.addAttribute("gsDto", gsDto);
		return "inGServForm";
	}
	
	@RequestMapping(value="tourDiary")
	public String tourDiary(HttpSession session, Model model) {
		String gno = session.getAttribute("gno")+"";
		List<GServDto> gsDtolist = gss.selGServRes(Integer.parseInt(gno));
		for(int i= 0; i < gsDtolist.size(); i++) {
			String[] pt = gsDtolist.get(i).getPickUpTime().split(":");
			int lt = Integer.parseInt(gsDtolist.get(i).getGservLeadTime());
			int sum = Integer.parseInt(pt[0])+lt;
			String endTime = Integer.toString(sum);
			endTime = endTime + ":00";
			gsDtolist.get(i).setEndTime(endTime);
		}
		
		model.addAttribute("gsList", gsDtolist);
		return "tourDiary";
	}
	
	@RequestMapping(value="confirmResForm")
	public String confirmResForm(ReservDto resvDto, Model model) {
		
		List<ReservDto> revDtoList = ress.selDaliyResv(resvDto);
		int total = 0;
		for(int i=0; i<revDtoList.size(); i++) {
			total += revDtoList.get(i).getReMemSize();
		}
		model.addAttribute("totalMember", total); // 총 인원
		model.addAttribute("revDto", revDtoList);
		return "confirmResForm";
	}
	
	
	@RequestMapping(value="confirmResPro")
	public String confirmResPro(ReservDto resDto , Model model) {
		
		int result = 0;
		GServDto gservDto = gss.oneGServ(resDto.getGservNo());
		
		// 예약 확정/취소 메시지
		List<ReservDto> resvDtoList = ress.selDaliyResv(resDto);
		MsgDto msgDto = new MsgDto();
		for(int i=0; i<resvDtoList.size(); i++) {
			if(resvDtoList.get(i).getConfirm().equals("n")) {
				result = ress.updateConfirm(resDto);
				msgDto.setMsgSender(resvDtoList.get(i).getGno()+"");
				msgDto.setMsgReceiver(resvDtoList.get(i).getMemberId());
				
				if(resDto.getConfirm().equals("Y")) {
					String content = "("+resDto.getTourDate()+") 예약하신 ["+gservDto.getGservTitle()+"] 상품의 예약이 확정되었습니다.";
					msgDto.setMsgContent(content);
				} else if(resDto.getConfirm().equals("N")) {
					String content = "("+resDto.getTourDate()+") 예약하신 ["+gservDto.getGservTitle()+"] 상품의 예약이 취소되었습니다.";
					msgDto.setMsgContent(content);
				}
				msg.inMsgResv(msgDto);
			}
		}

		model.addAttribute("result", result);
		return "confirmResPro";
	}
	
	@RequestMapping(value="pay_guide")
	public String pay_guide(HttpSession session, GServDto gsDto, String aPage, String gPage, Model model) {
		String gno = (String)session.getAttribute("gno");
		gsDto.setGno(Integer.parseInt(gno));

		// 매출 내역 수
		int total = gss.selPayGuideTotal(gsDto);
		Paging pg2 = new Paging(total, gPage);
		gsDto.setStart(pg2.getStart());
		gsDto.setEnd(pg2.getEnd());
		
		// 리스트 리턴
		List<GServDto> list = gss.selPayGuide(gsDto);
		
		// 정산 내역 수
		total = gs.selTotalAcc(Integer.parseInt(gno));
		Paging pg = new Paging(total, aPage);
		// 페이징Dto에 저장
		PagingDto pgDto = new PagingDto();
		pgDto.setStart(pg.getStart());
		pgDto.setEnd(pg.getEnd());
		pgDto.setGno(Integer.parseInt(gno));
		
		// 페이징Dto를 이용해서 리스트 리턴
		List<AccountingDto> aList = gs.selAccounting(pgDto);
		
		model.addAttribute("pg2", pg2);
		model.addAttribute("pg", pg);
		model.addAttribute("aList", aList);
		model.addAttribute("payGlist", list);
		model.addAttribute("gservNo", gsDto.getGservNo());
		return "pay_guide";
	}

	
	@RequestMapping(value="pay_guideForm")
	public String pay_guideForm(HttpSession session, Model model) {
		String gno = (String)session.getAttribute("gno");
		GuideDto gDto = gs.selOneGuide(Integer.parseInt(gno));
		
		model.addAttribute("gDto", gDto);
		
		return "pay_guideForm";
	}
	

/*-----------------------------------------------------------------------------------------
	소희
------------------------------------------------------------------------------------------*/

	
	@RequestMapping(value = "selGuideQAPro")
	public String selGuideQAPro(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");
		String qAreply = request.getParameter("qAreply"); 
		String gservTitle = request.getParameter("gservTitle");
		
		if(qAreply==null) {
			System.out.println("qAreply == null");
		}else if(qAreply.equals("y")||qAreply.equals("n")) {
			System.out.println("이건 그냥 넘겨줘야함");
		}else { //전체보기 위하여
			qAreply=null;
		}
		
		if(gservTitle==null) {
			System.out.println("gservTitle == null");
		}else if(gservTitle.length()>1){ //전체보기 위하여
			System.out.println("제목을 가져가는 경우");
		}else {
			gservTitle=null;
		}
		
		PagingDto pdto = new PagingDto();
		//작성자가 아닌.. 쓴 사람(누구에서 작성했나)으로 들어가야함!!
		pdto.setQaReceiver(ID);
		pdto.setReply_yn(qAreply);
		pdto.setGservTitle(gservTitle);
		
		//selQAPro에서 썼던 method와 동일
		int total = qs.selTotalQA(pdto);
		
		//해당 ID를 가진 Guide가 제공하는 gservice의 목록(select 박스에서 이용) -->gservTitle만 저장하도록 코딩(0109 / 11:55)
		List<GServDto> gservList = gss.selGServList(ID);	//문의사항
		
		Paging pg = new Paging(total, currentPage);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		
		// String reply_yn, String gservTitle도 PagingDto가 받아줘야함
		// 일단은 null로 받았을 경우로 만들어놓자
		List<QADto> qAGuideList = qs.selQAList2(pdto); //selQAPro와 동일하게 하려했으나 그냥 새로 만들기로 함
		List<QADto> qAGuideList_rpy = qs.selQAList2_rpy(pdto); //selQAPro와 동일하게 하려했으나 그냥 새로 만들기로 함
		

		
		model.addAttribute("qAreply", qAreply);
		model.addAttribute("gservTitle", gservTitle);
		model.addAttribute("pg", pg);
		model.addAttribute("ID", ID);
		
		// 줄바꿈 처리
		for(int i=0; i<qAGuideList.size(); i++) {
			qAGuideList.get(i).getQaContent().replaceAll("\r\n", "<br>");
		}
		for(int i=0; i<qAGuideList_rpy.size(); i++) {
			qAGuideList_rpy.get(i).getQaContent().replaceAll("\r\n", "<br>");
		}
		
		model.addAttribute("gservList", gservList);
		model.addAttribute("qaGuideList", qAGuideList);
		model.addAttribute("qaGuideList_rpy", qAGuideList_rpy);
		
		//답변여부, 상품명
		return "selGuideQAForm";
	}
	
	// 추가 부분
	
	@RequestMapping(value= "delServ")
	public String delServ(int gservNo, Model model) {
		gss.delServ(gservNo);
		return "redirect:service_guide.do";
	}
	
/*-----------------------------------------------------------------------------------------
	지영
------------------------------------------------------------------------------------------*/	
	
/* 가이드 프로필 */
	@RequestMapping(value="profile_guide")
	public String profile_guide(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		GuideDto gDto = gs.g_info(ID);
		MemberDto mbDto = mbs.selMember(ID);
		
		model.addAttribute("gDto", gDto);
		model.addAttribute("mbDto", mbDto);
		return "profile_guide";
	}

/*가이드 프로필 수정*/
	@RequestMapping(value="upGuideForm")
	public String upGuideForm(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		GuideDto gDto = gs.g_info(ID);
				
		model.addAttribute("gDto", gDto);
		return "upGuideForm";
	}
	

/*정산 엑셀 다운*/
	@RequestMapping("downExcel")
    public void listExcel(HttpServletRequest request, HttpServletResponse response, GServDto gsDto, ModelMap modelMap, Model model) throws Exception, Exception {
		         
        // 그냥 평소에 마이바티스에서 데이터 뽑는 방법으로 데이터를 가져온다.
		gsDto.setStart(0);
		gsDto.setEnd(1000000);
		 List<GServDto> dataList = gss.selPayGuide(gsDto);
        // 받은 데이터를 맵에 담는다.
        Map<String, Object> beans = new HashMap<String, Object>();
        beans.put("dataList", dataList);
        // 엑셀 다운로드 메소드가 담겨 있는 객체
        MakeExcel me = new MakeExcel();
        me.download(request, response, beans, "Sales history" , "temp.xlsx", "");
        
        model.addAttribute("gno", gsDto.getGno());
    }
	
/*-----------------------------------------------------------------------------------------
	경희
------------------------------------------------------------------------------------------*/	
	
	//   가이드 탈퇴    form
	@RequestMapping(value="delGuideForm")
	public String g_deleteForm(HttpSession session ,Model model) {
		String memberId = (String) session.getAttribute("ID");
		GuideDto gDto=gs.g_info(memberId);
		MemberDto mbDto = mbs.selMember(memberId);
		model.addAttribute("gDto",gDto);
		model.addAttribute("mbDto",mbDto);
		return "g_deleteForm";
	}
	
	//   가이드 탈퇴
	@RequestMapping(value="g_delete")
	public String g_delete(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("ID");
		GuideDto gDto=gs.g_info(memberId);
		gs.delGuide(gDto);
		return "redirect:main.do";
	}
			
	//kakaoID 중복체크
	@RequestMapping(value="kakaofs")
	@ResponseBody
	public String kakaofs(String kakaoId) {
		System.out.println(kakaoId);
		int count=gs.kakaofs(kakaoId);
		System.out.println(count);
		return count+"";
	}

	
/*--------------------------------------------------------------------------------------------------------------
	[ 우경 ]
--------------------------------------------------------------------------------------------------------------*/
//	   (가이드) 후기 관리 	
	@RequestMapping(value="review_guide")
	public String review_manager(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		int gno = Integer.parseInt(request.getSession().getAttribute("gno")+""); 
		String currentPage = request.getParameter("currentPage");
		String gservNo1 = request.getParameter("gservNo");
		List<GServDto> gsDto = gss.selGServList(ID);
		List<ReviewDto> revDtoList = null;
		if(gservNo1==null || gservNo1.equals("")) {
			int total = revs.totalRevsGno(gno);
			PagingDto pDto = new PagingDto();
			Paging pg = new Paging(total, currentPage);
			pDto.setStart(pg.getStart());
			pDto.setEnd(pg.getEnd());
			pDto.setGno(gno);
			revDtoList = revs.selgnoReviewList(pDto); 
		} else {
			int gservNo = Integer.parseInt(gservNo1);
			int total = revs.totalGservNoRevs(gservNo);
			PagingDto pDto = new PagingDto();
			Paging pg = new Paging(total, currentPage);
			pDto.setStart(pg.getStart());
			pDto.setEnd(pg.getEnd());
			pDto.setGservNo(gservNo);
			revDtoList = revs.selGsevNoList(pDto);
			model.addAttribute("gservNo", gservNo);
		}
		
		
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
		
		model.addAttribute("gsDto", gsDto);
		model.addAttribute("rDto", revDtoList);
		return "review_guide";
	}
	
	@RequestMapping(value="inCmtGuidePro")
	public String inCmtGuidePro(ReviewDto revDto, HttpSession session, Model model) {
		String ID =  (String)session.getAttribute("ID");
		revDto.setMemberId(ID);
		MemberDto mDto = mbs.selMember(ID);
		revDto.setNickName(mDto.getNickName());
		revs.inComment(revDto);
		
		model.addAttribute("gservNo", revDto.getGservNo());
		return "redirect:review_guide.do";
	}

	@RequestMapping(value="delCmtGuidePro")
	public String delCmtGuidePro(ReviewDto revDto, HttpSession session, Model model) {
		revs.delComment(revDto);
		model.addAttribute("gservNo", revDto.getGservNo());
		return "redirect:review_guide.do";
	}


}