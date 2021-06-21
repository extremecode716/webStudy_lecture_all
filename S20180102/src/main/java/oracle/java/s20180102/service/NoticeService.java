package oracle.java.s20180102.service;


import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;

@Service
public interface NoticeService {
	NoticeDto selNoticeDetail(int noticeNo);               // 공지사항 내역
	void inNotice(NoticeDto noticeDto);                    // 공지사항 등록
	void upNotice(NoticeDto nDto);                         // 공지사항 수정
	void delNotice(int noticeNo);                          // 공지사항 삭제
	 
	int total_CompleteForNotice();                             // (?)
	List<NoticeDto> selNoticeListDetail(NoticeDto noticeDto);  // (?)
	int total_CompleteForNoticeDetail();                       // (?)
	List<NoticeDto> selNoticeList(PagingDto pagingDto);    // 공지사항 조회
	
	
	
}