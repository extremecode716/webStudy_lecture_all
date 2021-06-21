package oracle.java.s20180102.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.service.Paging;
import oracle.java.s20180102.service.SearchService;


@Controller
public class SearchController {

 @Autowired
  	private SearchService ss;

 @RequestMapping(value="search_filter")
 	public String search_filter(HttpServletRequest request, Model model) {
	 	
		
	 SearchDto sDto = new SearchDto();
	 // 파라메터 셋팅 start
	 String keyword = "";
	  
	 // 지역 필터 셋팅 - AND 검색
	 String areaCode = request.getParameter("areaCode");
	 System.out.println("areaCode : " + areaCode);		 
	 if(areaCode==null || areaCode.equals("")) {	
		 System.out.println("area = NULL");
	 } else {
		 sDto.setAreaCode(areaCode);
		 keyword += "&areaCode="+ areaCode;
	 }
	 
	 // 테마 필터 셋팅 - OR 검색
	 String[] gservSub = request.getParameterValues("gservSub"); 
	 String servTag = null;
	 
	 if(gservSub == null || gservSub.equals("")) {
		 System.out.println("gservSub = NULL");
	 } else {
		 for (int i=0; i<gservSub.length; i++) {
			 if(i==0) {
				 servTag = "'%" + gservSub[0] + "%'";
				 keyword += "&gservSub=" + gservSub[0];
			 } else {
				 servTag += "OR servTag Like '%" + gservSub[i] +"%'";
				 keyword += "&gservSub=" + gservSub[i];
			 }
		 }
		 System.out.println("servTag : " + servTag);		 
		 sDto.setServTag(servTag);
	 }
	 
	 // 요일 필터 셋팅 - OR 검색
	 String[] gservDays = request.getParameterValues("gservDay");
	 String gservDay = null;
	 if(gservDays == null || gservDays.equals("")) {
		 System.out.println("gservDay = NULL");
	 } else {
		 for (int i=0; i<gservDays.length; i++) {
			 if(i==0) {
				 gservDay =  "'%" + gservDays[0] + "%'";
				 keyword += "&gservDay="+ gservDays[0];
			 } else {
				 gservDay += "OR gservDay Like '%" + gservDays[i] +"%'";
				 keyword += "&gservDay="+ gservDays[i];
			 }
		 }
		 System.out.println("gservDay : " + gservDay);		 
		 sDto.setGservDay(gservDay);
	 }

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
			
	
	// 필터에 맞는 상품 총 개수
	String ID =  (String) request.getSession().getAttribute("ID");
	int total = ss.total_filter(sDto); 
	System.out.println("total : " + total);
		Paging pg = new Paging(total, nowPage);
		if(ID != null ) {
			sDto.setMemberId(ID);
		}
		
	// order 선택
	 String order = request.getParameter("order");
		// 정렬 null 처리
		if(order==null) { 
			order = "gservCreDate";
		}

		if(order !=null) {
			// 내림차순 설정
			if( order.equals("likeIt") || order.equals("rvCnt")) {
					order += " desc";
			}
			// 나머지는 오름차순
			sDto.setOrder(order);
		} 
	sDto.setStart(pg.getStart());
	sDto.setEnd(pg.getEnd());
	
	
	// 필터에 맞는 상품 리스트
	List<TourCardDto> tcDto = ss.filterList(sDto); 


		// order desc 삭제후 전송
		order = order.replace(" desc","");
		if(keyword!=null) {
			if(!keyword.equals("")) {					
				model.addAttribute("keyword",keyword);
			}
		}
		model.addAttribute("order", order);
		model.addAttribute("id", ID);
		model.addAttribute("tcDto", tcDto);
		model.addAttribute("pg",pg);
	 	model.addAttribute("currentPage", currentPage); 
	 	
	 return "search_filter";
 }
 
 @RequestMapping(value="search_Keyword")
    public String search_Keyword(HttpServletRequest request,Model model) {

		
	 String ID =  (String) request.getSession().getAttribute("ID");
	 String keyword = request.getParameter("keyword");
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
			
			
		/* String[] keywords = keyword.split(" ");
		 for(int i=0; i<keywords.length; i++) {
			 if(i==0) {
				 keyword = keywords[0];
			 } else {
				 keyword += "%" + keywords[i];
			 }
		 }*/ // 공백 검색 --- 향후 보안점
	 
			
			
		// order 선택
		String order = request.getParameter("order");

		// 검색 sql을 위한 setting
		 SearchDto sDto = new SearchDto();
		 sDto.setGservArea(keyword);
		 sDto.setServTag(keyword);
		 sDto.setGservTitle(keyword);
		 sDto.setGservSub(keyword);
		 sDto.setGservPrice(keyword);
		 sDto.setGservDay(keyword);
		 sDto.setNickName(keyword);     
		 sDto.setAreaCode(keyword);
		 
		 if(keyword!=null) {
			if(!keyword.equals("")) {
				ss.inKeyWord(keyword);
			}
		 }

			
		 int total = ss.total_keyword(sDto); // 키워드에 맞는 상품 총 개수
			Paging pg = new Paging(total, nowPage);
			if(ID != null ) {
				sDto.setMemberId(ID);
			}
			// 정렬 null 처리
			if(order==null) { 
				order = "gservCreDate";
			}

			if(order !=null) {
				// 내림차순 설정
				if( order.equals("likeIt") || order.equals("rvCnt")) {
						order += " desc";
				}
				// 나머지는 오름차순
				sDto.setOrder(order);
			} 
			sDto.setStart(pg.getStart());
			sDto.setEnd(pg.getEnd());
			
			List<TourCardDto> tcDto = ss.keywordList(sDto); // 키워드에 맞는 상품 리스트

			// order desc 삭제후 전송
			order = order.replace(" desc","");
			model.addAttribute("order", order);
			model.addAttribute("tcDto", tcDto);
			model.addAttribute("pg",pg);
			
			if(keyword!=null) {
				if(!keyword.equals("")) {					
					model.addAttribute("keyword",keyword);
				}
			}
		 	model.addAttribute("currentPage", currentPage); 
		 	
	 return "search_Keyword";
 }
 
}