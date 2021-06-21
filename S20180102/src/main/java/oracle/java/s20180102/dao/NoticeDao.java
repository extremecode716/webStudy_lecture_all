package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.service.Paging;

public interface NoticeDao {
	List<NoticeDto> selNoticeList(PagingDto pagingDto);// 공지사항 조회
	void inNotice(NoticeDto noticeDto);  // 공지사항 등록
	void upNotice(NoticeDto nDto);       // 공지사항 수정
	void delNotice(int noticeNo);        // 공지사항 삭제
	int total_CompleteForNotice();
	NoticeDto selNoticeDetail(int noticeNo);
	int total_CompleteForNoticeDetail();
	List<NoticeDto> selNoticeListDetail(NoticeDto noticeDto);
	
	
}