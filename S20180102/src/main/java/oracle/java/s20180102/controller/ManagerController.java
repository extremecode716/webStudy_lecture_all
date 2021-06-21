package oracle.java.s20180102.controller;

import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.ReviewDto;
import oracle.java.s20180102.service.GServService;
import oracle.java.s20180102.service.GuideService;
import oracle.java.s20180102.service.MemberService;
import oracle.java.s20180102.service.NoticeService;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.PayService;
import oracle.java.s20180102.service.QAService;
import oracle.java.s20180102.service.ReservService;
import oracle.java.s20180102.service.ReviewService;
import oracle.java.s20180102.service.WishService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.rosuda.JRI.REXP;
//import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagerController {

	@Autowired
	private ReviewService revs;
	@Autowired
	private NoticeService ns;
	@Autowired
	private MemberService mbs;
	@Autowired
	private GuideService gs;
	@Autowired
	private GServService gss;
	@Autowired
	private QAService qs;
	@Autowired
	private ReservService ress;

	
/*--------------------------------------------------------------------------------------------------------------
	[ 지영 ]
--------------------------------------------------------------------------------------------------------------*/
/*	@RequestMapping(value="inRecommendForm")
	public String inRecommendForm(String currentPage, Model model) {
		int total = gss.total();
		Paging pg = new Paging(total, currentPage);
		GServDto gsDto = new GServDto();
		gsDto.setStart(pg.getStart());
		gsDto.setEnd(pg.getEnd());
		List<GServDto> list = gss.selGServ(gsDto);
		
		model.addAttribute("gsDtoList", list);
		return "inRecommendForm";
	}*/
	
	
	
/*--------------------------------------------------------------------------------------------------------------
	[ 경희 ]
--------------------------------------------------------------------------------------------------------------*/	
	
	//회원 리스트 페이지
	@RequestMapping(value="mb_List")
	public String list(HttpServletRequest reqeust,Model model) {
		String currentPage = reqeust.getParameter("currentPage");
		int total=mbs.totalMember();	
		Paging pg = new Paging(total, currentPage);
			PagingDto pDto=new PagingDto();
			pDto.setStart(pg.getStart());
			pDto.setEnd(pg.getEnd());
			
		List<MemberDto> list= mbs.selMemberList(pDto);
		
		model.addAttribute("list", list);
		model.addAttribute("pg",pg);
		return "mb_List";
	}
		
	//회원 리스트 회원디테일정보
	@RequestMapping(value="mb_info")
	public String mb_info(String memberId,Model model) {
		
		MemberDto mbDto = mbs.selMember(memberId);	
		model.addAttribute("memberDto",mbDto);
		
		return "mb_info";
	}
	
	//가이드 리스트 
	@RequestMapping(value="gd_manager")
	public String g_list(HttpServletRequest request,Model model) {
		String currentPage = request.getParameter("currentPage");
		int total=gs.totalGuide();
			
			Paging pg=new Paging(total,currentPage);
				PagingDto pDto= new PagingDto();
					pDto.setStart(pg.getStart());
					pDto.setEnd(pg.getEnd());
					
				List<GuideDto> g_list=gs.g_list(pDto);
				
				model.addAttribute("g_list",g_list);
				model.addAttribute("pg",pg);
			return "g_list";
	}
	
	//가이드 리스트 디테일정보
	@RequestMapping(value="g_info")
	public String g_info(String memberId,Model model) {
		
		GuideDto g_dto=gs.g_info(memberId);			
		model.addAttribute("g_dto",g_dto);			
		
		return "g_info";		
	}
	
	
/*--------------------------------------------------------------------------------------------------------------
	[ 우경 ]
--------------------------------------------------------------------------------------------------------------*/



	@RequestMapping(value = "writeNoticeForm")
	public String writeNoticeForm(Model model) {
		return "writeNoticeForm";
	}


	@RequestMapping(value = "selNoticeDetail")
	public String selNoticeDetail(int noticeNo, Model model) {
		NoticeDto nDto = ns.selNoticeDetail(noticeNo);
		model.addAttribute("nDto", nDto);	
		return "selNoticeDetail";
	}
	
	// 공지사항 삭제
	@RequestMapping(value="delNotice")
	public String delNotice(int noticeNo) {
		ns.delNotice(noticeNo);
		return "redirect:noticeList.do";
	}


	// (관리자) 후기 관리 	
	@RequestMapping(value="review_manager")
	public String review_manager(HttpServletRequest request, String searchKey, Model model) {
			String currentPage = request.getParameter("currentPage");
			PagingDto pdto = new PagingDto();
			
			// 검색 전
			if(searchKey == null || searchKey.equals("")) {
				int total = revs.totalReview();
				Paging pg = new Paging(total, currentPage);
				pdto.setStart(pg.getStart());
				pdto.setEnd(pg.getEnd());
				List<ReviewDto> rDto = revs.selReviewList(pdto);
				model.addAttribute("pg", pg);
				model.addAttribute("total", total);
				model.addAttribute("list", rDto);
			} 
			// 검색 후
			else {
				int total = revs.total_CompleteM(searchKey);
				pdto.setSearch(searchKey);
				List<ReviewDto> complete = revs.completeListM(searchKey);
				model.addAttribute("list", complete);
				model.addAttribute("total",total);
				model.addAttribute("searchKey", searchKey);
				model.addAttribute("pg", 1);
			}

			return "review_manager";
	}
	
	// 후기 삭제
	@RequestMapping(value="delReviewM")
	public String delReviewM(ReviewDto revDto, String searchKey) {
		
		revs.delReview(revDto);
		return "forward:review_manager.do";
	}

	@RequestMapping(value = "writeReviewPro")
	public String writeReviewPro(ReviewDto revDto, HttpServletRequest request, Model model) {
		revs.inReview(revDto);
		return "redirect:review_manager.do";
	}

	@RequestMapping(value = "noticeList")
	public String noticeList(HttpServletRequest request, Model model) {
		String ID = (String) request.getSession().getAttribute("ID");
		String currentPage = request.getParameter("currentPage");

		PagingDto pdto = new PagingDto();
		int total = ns.total_CompleteForNotice();
		Paging pg = new Paging(total, currentPage);
		pdto.setMemberId(ID);
		pdto.setStart(pg.getStart());
		pdto.setEnd(pg.getEnd());
		List<NoticeDto> complete = ns.selNoticeList(pdto);

		model.addAttribute("list", complete);
		model.addAttribute("pg", pg);
		model.addAttribute("total", total);
		return "noticeList";
	}

/*--------------------------------------------------------------------------------------------------------------
	[ 태욱 ]
--------------------------------------------------------------------------------------------------------------*/	
		@RequestMapping(value="service_manager")
		public String service_manager(String searchServ, GServDto gsDto, String currentPage, Model model) {
			int total = 0;
				gsDto.setGno(0);
				gsDto.setGservNo(0);
				System.out.println("searchServ = "+searchServ);
			if (searchServ != null && !searchServ.equals("")) {
				if (searchServ.length() == 5) {
					total = gss.total(Integer.parseInt(searchServ));
					gsDto.setGno(Integer.parseInt(searchServ));
					System.out.println("gsDto.getgno in Controller = "+gsDto.getGno());
				} else if(searchServ.length() > 5){
					gsDto.setGservNo(Integer.parseInt(searchServ));
					total = gss.total(Integer.parseInt(searchServ));
					System.out.println("gsDto.getgserv in Controller = "+gsDto.getGservNo());
				}
			}else {
				total = gss.total();
			}
//			System.out.println("total=>" + total);
//			System.out.println("currentPage=>" + currentPage);
			Paging pg = new Paging(total, currentPage);
//			System.out.println("pg.getStart() = " + pg.getStart());
//			System.out.println("pg.getEnd() = " + pg.getEnd());
			gsDto.setStart(pg.getStart());
			gsDto.setEnd(pg.getEnd());
			/*if(searchServ!=null) {
			gsDto.setgno(Integer.parseInt(searchServ));
			}*/
			List<GServDto> list = gss.selGServ(gsDto);
			model.addAttribute("list", list);
			System.out.println("list.length = " + list.size());
			model.addAttribute("pg",pg);
			model.addAttribute("searchServ", searchServ);
			
			return "service_manager";
		}

/*--------------------------------------------------------------------------------------------------------------
	[ 소희 ]
--------------------------------------------------------------------------------------------------------------*/	
		
			@RequestMapping(value = "QA_manager_detail") // 관리자 QA_detail (각 QnA별 열람가능)
			public String QA_manager_detail(HttpServletRequest request, Model model) {
				String ID = (String) request.getSession().getAttribute("ID");
				int qanumber = Integer.parseInt(request.getParameter("qaNumber"));
				/* 문의사항 번호를 가지고 간다.. qastep=0인 것만 게시판에서 보여주었음 */
				PagingDto pdto = new PagingDto();
				pdto.setQaNumber(qanumber);
				pdto.setStart(1);
				pdto.setEnd(10); //의미없음 어차피 항상 1개만 출력됨
				
				// QA List(재활용.. 출력은 1개의 QADto)
				QADto qAList = qs.selQAdetail(pdto);
				// 해당 QA에 대해 이미 존재하는 답변
				List<QADto> qAList_rpy = qs.selQAList3_rpy(pdto);
				
				model.addAttribute("qADto",qAList);
				model.addAttribute("qADto_rpy",qAList_rpy);
				model.addAttribute("ID", ID); // 접속한 사람의 ID
				//System.out.println("qADto_rpy"+qAList_rpy.get(0).getqAcontent());
				return "selQA_managerForm_detail"; //detail Form
			}
			
			
			@RequestMapping(value="QA_manager") //관리자 QnA
			public String QA_manager(HttpServletRequest request, Model model) {
				String ID = (String) request.getSession().getAttribute("ID");
				String currentPage = request.getParameter("currentPage");
				//필터링 --> 답변여부
				String qAreply = request.getParameter("qAreply");
				if(qAreply==null) {
					System.out.println("qAreply == null");
				}else if(qAreply.equals("y")||qAreply.equals("n")) {
					System.out.println("이건 그냥 넘겨줘야함");
				}else { //전체보기 위하여
					qAreply=null;
				}
				PagingDto pdto = new PagingDto();
				pdto.setMemberId(ID);
				pdto.setReply_yn(qAreply);
				int total = qs.selTotalQA_manager(pdto); //총 개수
				Paging pg = new Paging(total, currentPage, 20);
				pdto.setStart(pg.getStart());
				pdto.setEnd(pg.getEnd());
				//QA List
				List<QADto> qAList = qs.selQAList3(pdto);
				
				model.addAttribute("pg", pg);
				model.addAttribute("ID", ID); //접속한 사람의 ID
				model.addAttribute("qAList", qAList);
				model.addAttribute("qAreply", qAreply);
				
				return "selQA_managerForm"; //보여주는 페이지
			}
							
			
}