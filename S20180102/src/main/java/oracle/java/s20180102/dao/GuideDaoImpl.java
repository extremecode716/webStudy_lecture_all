package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.AccountingDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.service.GuideService;

@Repository
public class GuideDaoImpl implements GuideDao {
	@Autowired
	private SqlSession session;
	@Override
	public int totalGuide() {
		return session.selectOne("totalGuide");
	}
	
	@Override
	public List<GuideDto> g_list(PagingDto pDto) {
		return session.selectList("g_list",pDto);
	}

	@Override
	public GuideDto g_info(String memberId) {
		return session.selectOne("g_info",memberId);
	}

	@Override
	public void upGuide(GuideDto gDto) {
		session.update("upGuide", gDto);
	}
	@Override
	public GuideDto selOneGuide(int gNo) {
		// TODO Auto-generated method stub
		return session.selectOne("selgNoToGuide", gNo);
	}
	@Override
	public int upCostGuide(GuideDto gDto) {
		// TODO Auto-generated method stub
		return session.update("upCostGuide", gDto);
	}

	@Override
	public List<GuideDto> selPopularGuide() {		
		return session.selectList("selPopularGuide");
	}

	@Override
	public void delGuide(GuideDto gDto) {
		session.delete("delGuide", gDto);
	}

	@Override
	public int kakaofs(String kakaoId) {
		return session.selectOne(kakaoId);
	}

	@Override
	public void g_join(GuideDto gDto) {
		session.insert("g_join",gDto);
	}

	@Override
	public void inAccounting(AccountingDto acDto) {
		session.insert("inAccounting", acDto);
	}

	@Override
	public void inCost(AccountingDto acDto) {
		session.insert("inCost", acDto);
	}
	@Override
	public List<AccountingDto> selAccounting(PagingDto pgDto) {
		return session.selectList("selAccounting", pgDto);
	}
	@Override
	public int selTotalAcc(int gno) {
		return session.selectOne("selTotalAcc", gno);
	}

}
