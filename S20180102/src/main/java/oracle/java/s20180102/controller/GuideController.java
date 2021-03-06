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
	??????
------------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="pay_guidePro")
	public String pay_guidePro(HttpSession session, GuideDto gDto, String cost, Model model) {
		String gno = session.getAttribute("gno")+"";
		// ????????????(totalcost) ??????
		gDto.setGno(Integer.parseInt(gno));
		gDto.setTotalCost(gDto.getTotalCost()-Integer.parseInt(cost));
		System.out.println("?????????!");
		gs.upCostGuide(gDto);
		
		// ?????? ?????? ??????
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
		model.addAttribute("totalMember", total); // ??? ??????
		model.addAttribute("revDto", revDtoList);
		return "confirmResForm";
	}
	
	
	@RequestMapping(value="confirmResPro")
	public String confirmResPro(ReservDto resDto , Model model) {
		
		int result = 0;
		GServDto gservDto = gss.oneGServ(resDto.getGservNo());
		
		// ?????? ??????/?????? ?????????
		List<ReservDto> resvDtoList = ress.selDaliyResv(resDto);
		MsgDto msgDto = new MsgDto();
		for(int i=0; i<resvDtoList.size(); i++) {
			if(resvDtoList.get(i).getConfirm().equals("n")) {
				result = ress.updateConfirm(resDto);
				msgDto.setMsgSender(resvDtoList.get(i).getGno()+"");
				msgDto.setMsgReceiver(resvDtoList.get(i).getMemberId());
				
				if(resDto.getConfirm().equals("Y")) {
					String content = "("+resDto.getTourDate()+") ???????????? ["+gservDto.getGservTitle()+"] ????????? ????????? ?????????????????????.";
					msgDto.setMsgContent(content);
				} else if(resDto.getConfirm().equals("N")) {
					String content = "("+resDto.getTourDate()+") ???????????? ["+gservDto.getGservTitle()+"] ????????? ????????? ?????????????????????.";
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

		// ?????? ?????? ???
		int total = gss.selPayGuideTotal(gsDto);
		Paging pg2 = new Paging(total, gPage);
		gsDto.setStart(pg2.getStart());
		gsDto.setEnd(pg2.getEnd());
		
		// ????????? ??????
		List<GServDto> list = gss.selPayGuide(gsDto);
		
		// ?????? ?????? ???
		total = gs.selTotalAcc(Integer.parseInt(gno));
		Paging pg = new Paging(total, aPage);
		// ?????????Dto??? ??????
		PagingDto pgDto = new PagingDto();
		pgDto.setStart(pg.getStart());
		pgDto.setEnd(pg.getEnd());
		pgDto.setGno(Integer.parseInt(gno));
		
		// ?????????Dto??? ???????????? ????????? ??????
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
	??????
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
			System.out.println("?????? ?????? ???????????????");
		}else { //???????????? ?????????
			qAreply=null;
		}
		
		if(gservTitle==null) {
			System.out.println("gservTitle == null");
		}else if(gservTitle.length()>1){ //???????????? ?????????
			System.out.println("????????? ???????????? ??????");
		}else {
			gservTitle=null;
		}
		
		PagingDto pdto = new PagingDto();
		//???????????? ??????.. ??? ??????(???????????? ????????????)?????? ???????????????!!
		pdto.setQaReceiver(ID);
		pdto.setReply_yn(qAreply);
		pdto.setGservTitle(gservTitle);
		
		//selQAPro?????? ?????? method??? ??????
		int total = qs.selTotalQA(pdto);
		
		//?????? ID??? ?????? Guide??? ???????????? gservice??? ??????(select ???????????? ??????) -->gservTitle??? ??????????????? ??????(0109 / 11:55)
		List<GServDto> gservList = gss.selGServList(ID);	//????????????
		
		Paging pg = new Paging(total, currentPage);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		
		// String reply_yn, String gservTitle??? PagingDto??? ???????????????
		// ????????? null??? ????????? ????????? ???????????????
		List<QADto> qAGuideList = qs.selQAList2(pdto); //selQAPro??? ???????????? ??????????????? ?????? ?????? ???????????? ???
		List<QADto> qAGuideList_rpy = qs.selQAList2_rpy(pdto); //selQAPro??? ???????????? ??????????????? ?????? ?????? ???????????? ???
		

		
		model.addAttribute("qAreply", qAreply);
		model.addAttribute("gservTitle", gservTitle);
		model.addAttribute("pg", pg);
		model.addAttribute("ID", ID);
		
		// ????????? ??????
		for(int i=0; i<qAGuideList.size(); i++) {
			qAGuideList.get(i).getQaContent().replaceAll("\r\n", "<br>");
		}
		for(int i=0; i<qAGuideList_rpy.size(); i++) {
			qAGuideList_rpy.get(i).getQaContent().replaceAll("\r\n", "<br>");
		}
		
		model.addAttribute("gservList", gservList);
		model.addAttribute("qaGuideList", qAGuideList);
		model.addAttribute("qaGuideList_rpy", qAGuideList_rpy);
		
		//????????????, ?????????
		return "selGuideQAForm";
	}
	
	// ?????? ??????
	
	@RequestMapping(value= "delServ")
	public String delServ(int gservNo, Model model) {
		gss.delServ(gservNo);
		return "redirect:service_guide.do";
	}
	
/*-----------------------------------------------------------------------------------------
	??????
------------------------------------------------------------------------------------------*/	
	
/* ????????? ????????? */
	@RequestMapping(value="profile_guide")
	public String profile_guide(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		GuideDto gDto = gs.g_info(ID);
		MemberDto mbDto = mbs.selMember(ID);
		
		model.addAttribute("gDto", gDto);
		model.addAttribute("mbDto", mbDto);
		return "profile_guide";
	}

/*????????? ????????? ??????*/
	@RequestMapping(value="upGuideForm")
	public String upGuideForm(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		GuideDto gDto = gs.g_info(ID);
				
		model.addAttribute("gDto", gDto);
		return "upGuideForm";
	}
	

/*?????? ?????? ??????*/
	@RequestMapping("downExcel")
    public void listExcel(HttpServletRequest request, HttpServletResponse response, GServDto gsDto, ModelMap modelMap, Model model) throws Exception, Exception {
		         
        // ?????? ????????? ????????????????????? ????????? ?????? ???????????? ???????????? ????????????.
		gsDto.setStart(0);
		gsDto.setEnd(1000000);
		 List<GServDto> dataList = gss.selPayGuide(gsDto);
        // ?????? ???????????? ?????? ?????????.
        Map<String, Object> beans = new HashMap<String, Object>();
        beans.put("dataList", dataList);
        // ?????? ???????????? ???????????? ?????? ?????? ??????
        MakeExcel me = new MakeExcel();
        me.download(request, response, beans, "Sales history" , "temp.xlsx", "");
        
        model.addAttribute("gno", gsDto.getGno());
    }
	
/*-----------------------------------------------------------------------------------------
	??????
------------------------------------------------------------------------------------------*/	
	
	//   ????????? ??????    form
	@RequestMapping(value="delGuideForm")
	public String g_deleteForm(HttpSession session ,Model model) {
		String memberId = (String) session.getAttribute("ID");
		GuideDto gDto=gs.g_info(memberId);
		MemberDto mbDto = mbs.selMember(memberId);
		model.addAttribute("gDto",gDto);
		model.addAttribute("mbDto",mbDto);
		return "g_deleteForm";
	}
	
	//   ????????? ??????
	@RequestMapping(value="g_delete")
	public String g_delete(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("ID");
		GuideDto gDto=gs.g_info(memberId);
		gs.delGuide(gDto);
		return "redirect:main.do";
	}
			
	//kakaoID ????????????
	@RequestMapping(value="kakaofs")
	@ResponseBody
	public String kakaofs(String kakaoId) {
		System.out.println(kakaoId);
		int count=gs.kakaofs(kakaoId);
		System.out.println(count);
		return count+"";
	}

	
/*--------------------------------------------------------------------------------------------------------------
	[ ?????? ]
--------------------------------------------------------------------------------------------------------------*/
//	   (?????????) ?????? ?????? 	
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
		
		
		// ?????? ???????????? ????????? ??????????????? ???????????? ??????
		List <String[]> rImgList = new ArrayList<String[]>();
			for (int i = 0; i < revDtoList.size(); i++) {
				if(revDtoList.get(i).getRimg() != null) {
					rImgList.add(revDtoList.get(i).getRimg().split(","));
				} 
			}				
		
		// ?????? ????????? ??? ??? ?????? ????????? ??????
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