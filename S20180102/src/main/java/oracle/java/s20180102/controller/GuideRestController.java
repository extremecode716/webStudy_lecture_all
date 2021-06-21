package oracle.java.s20180102.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.service.GServService;


@RestController
@RequestMapping("/rest")
public class GuideRestController {
	 @Autowired
	 private GServService gss;
	 
	 @RequestMapping("/selArea")
	  public List<CodeSetDto> selArea(String itemCode) {
		System.out.println("@RestController selArea  START");
		System.out.println("Controller in itemCode : " + itemCode);
		List<CodeSetDto> codeSetList = gss.selCodeSet(itemCode);
		System.out.println("codeSetList : "+codeSetList);
		return codeSetList;
		}
	 
	 @RequestMapping("/upLock")
	 public int upLock(String lock) {
		 
		 GServDto gsDto = new GServDto();
		 String gservLock = lock.substring(8); 
		 System.out.println("gservLock = "+gservLock);
		 String gservNo = lock.substring(0, 8);	
		 System.out.println("gservNo = " +gservNo);
		 gsDto.setGservNo(Integer.parseInt(gservNo));
		 gsDto.setGservLock(gservLock);
		 int result = gss.upLock(gsDto);
		 return result;
	 }
	 
	 // 추가수정;
	 @RequestMapping("/upMainView")
	 public int upMainView(String mainView) {
		 
		 GServDto gsDto = new GServDto();
		 String mainView2 = mainView.substring(8); 
		 System.out.println("mainView = "+mainView2);
		 String gservNo = mainView.substring(0, 8);	
		 System.out.println("gservNo = " +gservNo);
		 gsDto.setGservNo(Integer.parseInt(gservNo));
		 gsDto.setMainView(mainView2);
		 int result = gss.upMainView(gsDto);
		 return result;
	 }
	 
}
