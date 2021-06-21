package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer__Bean;
import model.Customer_comment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.Customer__DAOImpl;

//import model.BbsBean;

@Controller
public class Customer__Action {

	private Customer__DAOImpl customerS;

//	public void setcustomerS(Customer__DAOImpl customerS) {
//		this.customerS = customerS;
//	}// setter DI설정

	public void setCustomerS(Customer__DAOImpl customerS) {
		this.customerS = customerS;
	}

	/* 게시판 글쓰기 폼 */
	@RequestMapping(value = "/customer_write.pix")
	public String board_write() {
		return "customer/customer_write";
	}

	/* 게시판 저장 */
	@RequestMapping(value = "/customer_write_ok.pix", method = RequestMethod.POST)
	public String customer_write_ok(@ModelAttribute Customer__Bean board, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = "";

		
		//아이디 널체크
		if (request.getSession() != null 
				&& request.getSession().getAttribute("id") != null
				&& request.getSession().getAttribute("id") != ""){
				id = request.getSession().getAttribute("id").toString(); 
				}


		// 세션이 없는 경우
			if(session == null 
	   		    || session.getAttribute("id") == null
			    || session.getAttribute("id") == "")
			{
				out.println("<script>");
				out.println("alert('로그인된 정보가 없습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		
		id = session.getAttribute("id").toString();

		board.setMember_id(id);
		customerS.customerinsert(board/*매개변수=주소값전달*/);// 저장 메서드 호출

//		response.sendRedirect("board_list.nhn");
		// 게시물 목록으로 이동
		System.out.println("게시판 저장완료");
		return "redirect:/customer_list.pix";
		
//		return null;
	} 

	/* 게시판 목록 */
	@RequestMapping(value = "/customer_list.pix")
	public ModelAndView board_list(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int page = 1;
		int limit = 10; // 한 화면에 출력할 레코드수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		/* int listcount=this.customerS.getListCount(); */// 총 리스트 수를 받아옴.
		int listcount = customerS.getListCount();
		System.out.println("리스트 받아올 준비중");

		
		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		List<Customer__Bean> boardlist = customerS.getCusList(page); // 리스트를 받아옴.

		
		System.out.println("리스트를 받아옴");
		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		ModelAndView boardListM = new ModelAndView("customer/customer_list");
		boardListM.addObject("page", page);
		boardListM.addObject("maxpage", maxpage);
		boardListM.addObject("startpage", startpage);
		boardListM.addObject("endpage", endpage);
		boardListM.addObject("listcount", listcount);
		boardListM.addObject("boardlist", boardlist);		
		
		return boardListM;
	}

	/* 게시판 내용보기,삭제폼,수정폼,답변글폼 */
	@RequestMapping(value = "/customer_cont.pix")
	public ModelAndView board_cont(@RequestParam("customer_no") int customer_no,
								   @RequestParam("page") String page,
								   @RequestParam("state") String state,
			HttpServletResponse response) throws Exception {

		System.out.println("폼cont폼등장");
		
		int com_count=0;//댓글 개수를 저장하기위한 변수

//		int board_num = Integer.parseInt(request.getParameter("board_num"));
		// 글번호           형변환을 시켜야함
//		int page = Integer.parseInt(request.getParameter("page"));
		// 쪽번호
//		String state = request.getParameter("state");
		// 구분값 저장. 내용보기 cont,수정폼 edit,삭제폼 del,답변글폼 reply

		// BoardDAOImpl bd=new BoardDAOImpl();

		if (state.equals("cont")) {// 내용보기일때만
//			this.customerS.boardHit(board_num);// 조회수 증가
			this.customerS.customerHit(customer_no);
			com_count=this.customerS.getComCount(customer_no); //댓글갯수
		}
			
		/* BoardBean board=this.customerS.getBoardCont(board_num); */
		Customer__Bean board = customerS.getCusCont(customer_no);
		List<Customer_comment> clist=this.customerS.getComList(customer_no);
		//해당 방명록 번호에 해당하는 댓글 목록을 가져온다.
		
		
		ModelAndView contM = new ModelAndView();//DB
		contM.addObject("bcont", board); // Key , vlaue
		contM.addObject("page", page);		
		contM.addObject("com_count",com_count);//댓글 개수를 저장
		contM.addObject("clist",clist);//댓글목록을 저장
		
		System.out.println("와라와라");

		if (state.equals("cont")) {// 내용보기일때
			contM.setViewName("customer/customer_cont");// 내용보기 페이지 설정
	//		String board_cont = board.getBoard_content().replace("\n", "<br/>");
			// 글내용중 엔터키 친부분을 웹상에 보이게 할때 다음줄로 개행
	//		contM.addObject("board_cont", board_cont);
		} else if (state.equals("edit")) {// 수정폼
			contM.setViewName("customer/customer_edit");
		}
		return contM;
	}
	
	/*댓글 저장*/
	@RequestMapping(value="/comment_ok.pix")
	public String com_ok(@ModelAttribute Customer_comment co,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page ) throws Exception {
			
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		HttpSession session = request.getSession();
		String id = "";

		
		//아이디 널체크
		if (request.getSession() != null 
				&& request.getSession().getAttribute("id") != null
				&& request.getSession().getAttribute("id") != ""){
				id = request.getSession().getAttribute("id").toString(); 
				}

		// 세션이 없는 경우
			if(session == null 
	   		    || session.getAttribute("id") == null
			    || session.getAttribute("id") == "")
			{
				out.println("<script>");
				out.println("alert('로그인된 정보가 없습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
			}


			co.setMember_id(id);
		
		System.out.println("나와라라라라라ㅏㅏㅏ111111111");
		System.out.println(co.getCustomer_comment());
		System.out.println(co.getCustomer_comment_no());
		System.out.println(co.getCustomer_name());
		System.out.println(co.getCustomer_no());
		System.out.println(co.getMember_id());
		
		
		if(co.getCustomer_comment().length() > 200){
			out.println("<script>");
			out.println("alert('댓글을 200자 초과를 못합니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		}else{
			this.customerS.Cominsert(co);//댓글 저장
			System.out.println("나와라라22222222222");
			
			System.out.println(co.getCustomer_no());
			System.out.println(page);
			
			/*return "redirect:/customer_cont.pix?customer_no="+co.getCustomer_no()+
					"&state=cont" +"&page" +page ;*/
			return "redirect:/customer_cont.pix?customer_no="+co.getCustomer_no()+
					"&state=cont" +"&page=" +page;
			//get 방식으로 *.do?g_no=번호값&state=cont 2개의 피라미터
			//값을 넘김
		}
		return null;
	}
	
	/*댓글 삭제*/
	@RequestMapping(value="/cus_del_ok.pix")
	public String com_del_ok(
			@RequestParam("customer_comment_no") int customer_comment_no,
			@RequestParam("customer_no") int customer_no,
			@RequestParam("state") String state,
			@RequestParam("page") int page){	
		this.customerS.Comdel(customer_comment_no);//댓글 삭제
		return "redirect:/customer_cont.pix?customer_no="+customer_no+"&state="+state+"&page="+page;
	}
	

	/* 게시판 수정 */
	@RequestMapping(value = "/customer_edit_ok.pix", method = RequestMethod.POST)
	public String board_edit_ok(@ModelAttribute Customer__Bean b,
			HttpServletResponse response, HttpServletRequest request,
			@RequestParam("page") int page) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		
		String id = "";

		
		//아이디 널체크
		if (request.getSession() != null 
				&& request.getSession().getAttribute("id") != null
				&& request.getSession().getAttribute("id") != ""){
				id = request.getSession().getAttribute("id").toString(); 
				}

		// 세션이 없는 경우
			if(session == null 
	   		    || session.getAttribute("id") == null
			    || session.getAttribute("id") == "")
			{
				out.println("<script>");
				out.println("alert('로그인된 정보가 없습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
			}

		
		System.out.println("1 수정");
		System.out.println("1=" +b.getCustomer_name());
		System.out.println("2=" +b.getCustomer_content());
		System.out.println("3=" +b.getCustomer_no());
		System.out.println("4=" +b.getMember_id());		
		
		// 아이디 빈에 저장
		b.setMember_id(id);
		
		Customer__Bean db = this.customerS.getCusCont(b.getCustomer_no());
		// 디비에 저장된 아이디 가져옴.
		System.out.println("2222222수정");
		
		// 센터아이디와 디비안의 아이디를 비교중
		if (!db.getMember_id().equals(b.getMember_id())) {
			out.println("<script>");
			out.println("alert('등록자만 수정가능합니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			this.customerS.customeredit(b);// 수정
			System.out.println("수정333333333");
			return "redirect:/customer_cont.pix?customer_no="+b.getCustomer_no()+"&page=" + page+
					"&state=cont";
		}
		return null;
	}

	/* 게시판 삭제 */
	@RequestMapping(value = "/customer_del_ok.pix")
	public String board_del_ok(@RequestParam("customer_no") int customer_no,
							   @RequestParam("page") int page,
 			HttpServletResponse response,HttpServletRequest request) throws Exception {
		    
		System.out.println("어서와 삭제는 처음이지?");
		
		response.setContentType("text/html;charset=UTF-8");
		
		Customer__Bean board = customerS.getCusCont(customer_no);
		// 번호에 해당하는 디비 정보를 가져온다.
		
		System.out.println(customer_no+"가져왔니");
		
		//아이디값 구해오기 , request를 쓰기위해선 위에서 HttpServletRequest request 설정 필요
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = "";

		
		//아이디 널체크
		if (request.getSession() != null 
				&& request.getSession().getAttribute("id") != null
				&& request.getSession().getAttribute("id") != ""){
				id = request.getSession().getAttribute("id").toString(); 
				}


		// 세션이 없는 경우
			if(session == null 
	   		    || session.getAttribute("id") == null
			    || session.getAttribute("id") == "")
			{
				out.println("<script>");
				out.println("alert('로그인된 정보가 없습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		
		System.out.println("삭제준비");
		this.customerS.fcomdel(customer_no); // 댓글삭제
		System.out.println("댓글삭제완료1");
		this.customerS.fcomdel(customer_no); // 본문삭제
		System.out.println("본문삭제완료2");

		//DB안의 ID값과 강제 부여한 ID값을 비교하기
			if (!board.getMember_id().equals(id)) {
					out.println("<script>");
					out.println("alert('아이디가 다릅니다!')");
					out.println("history.go(-1)");
					out.println("</script>");
					return null;
					
				}else if(board.getMember_id().equals(id)) {
			// this.customerS.boardDelete(board_num); 			
			customerS.customerdelete(customer_no);
			
			System.out.println("경고창");
			
			out.println("<script>");
			out.println("alert('삭제합니다.')");
			out.println("</script>");
			
			// 글번호를 기준으로 삭제
//			response.sendRedirect("board_list.nhn?page=" + page);
			// 삭제후 게시물 목록으로 이동			
			return "redirect:/customer_list.pix?page=" + page;
			}
		return null;
	}
	
}

