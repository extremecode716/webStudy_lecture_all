package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.NoticeDto;
import oracle.java.s20180102.model.PagingDto;
@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSession session;

	@Override
	public int total_CompleteForNotice() {
		return session.selectOne("totalNotc");
	}

	@Override
	public List<NoticeDto> selNoticeList(PagingDto pagingDto) {
		return session.selectList("selNoticeList", pagingDto);
	}
	
	@Override
	public void inNotice(NoticeDto noticeDto) {
		session.insert("inNotice",noticeDto);
	}
	
	@Override
	public void delNotice(int noticeNo) {
		session.delete("delNotice",noticeNo);
	}


	@Override
	public NoticeDto selNoticeDetail(int noticeNo) {
		session.update("upNReadCount", noticeNo);
		return session.selectOne("selNoticeDetail", noticeNo);
	}
	
	@Override
	public int total_CompleteForNoticeDetail() {
		// TODO Auto-generated method stub
		return session.selectOne("totalNotcDetail");
	}
	
	@Override
	public List<NoticeDto> selNoticeListDetail(NoticeDto noticeDto) {
		return session.selectList("selNoticeDetail", noticeDto);
	}

	@Override
	public void upNotice(NoticeDto nDto) {
		session.update("upNotice", nDto);
	}


}
