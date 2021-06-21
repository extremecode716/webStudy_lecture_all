package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.PayDto;

@Repository
public class PayDaoImpl implements PayDao{
	@Autowired
	private SqlSession session;

	@Override
	public int total(String iD) {
		// TODO Auto-generated method stub
		return session.selectOne("totalPay", iD);
	}

	@Override
	public List<PayDto> selPayList(PagingDto pdto) {
		return session.selectList("selPayList", pdto);
	}

	@Override
	public void inPay(PayDto pDto) {
		session.insert("inPay",pDto);
	}

	@Override
	public PayDto selOnePay(String payCode) {
		return session.selectOne("selOnePay", payCode);
	}
	
}