package myspring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import myspring.model.Board;
import myspring.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	// 글작성 폼
	@RequestMapping("boardform.do")
	public String boardform() {
		return "board/boardform";
	}
	
	// 글작성
	@RequestMapping("boardwrite.do")
	public String boardwrite(Board board, Model model) {
		
		int result = service.insert(board);
		System.out.println("result:"+ result);
		
		model.addAttribute("result", result);
		
		return "board/insertresult";
	}
	
	// 글목록
	@RequestMapping("boardlist.do")
	public String boardlist(Model model) {
		
		List<Board> list = service.getBoardList();
		System.out.println("list:" + list);
		
		model.addAttribute("list", list);
		
		return "board/boardlist";
	}
	
	// 상세페이지 : 조회수 1증가 + 상세정보 구하기
	@RequestMapping("boardcontent.do")
	public String boardcontent(int no, Model model) {
		
		service.updatecount(no);				// 조회수 1증가
		Board board = service.getBoard(no);		// 상세정보 구하기
		String content = board.getContent().replace("\n", "<br>");
		
		model.addAttribute("board", board);
		model.addAttribute("content", content);
		
		return "board/boardcontent";
	}
	
	// 수정 폼
	@RequestMapping("boardupdateform.do")
	public String boardupdateform(int no, Model model) {
		
		Board board = service.getBoard(no);		// 상세정보 구하기
		model.addAttribute("board", board);
		
		return "board/boardupdateform";
	}
	
	
}
