package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.NoticeDao;
import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nsDao;
	@Override
	public List<NoticeDto> selNoticeList(PagingDto pagingDto) {
		// TODO Auto-generated method stub
		return nsDao.selNoticeList(pagingDto);
	}
	@Override
	public int total_CompleteForNotice() {
		// TODO Auto-generated method stub
		return nsDao.total_CompleteForNotice();
	}

	@Override
	public void inNotice(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		nsDao.inNotice(noticeDto);
	}
	
	@Override
	public void delNotice(int noticeNo) {
		// TODO Auto-generated method stub
		nsDao.delNotice(noticeNo);
	}

	@Override
	public NoticeDto selNoticeDetail(int noticeNo) {
		return nsDao.selNoticeDetail(noticeNo);
	}

	@Override
	public int total_CompleteForNoticeDetail() {
		return nsDao.total_CompleteForNoticeDetail();
	}
	
	@Override
	public List<NoticeDto> selNoticeListDetail(NoticeDto noticeDto) {
		return nsDao.selNoticeListDetail(noticeDto);
	}
	@Override
	public void upNotice(NoticeDto nDto) {
		nsDao.upNotice(nDto);
	}

}
