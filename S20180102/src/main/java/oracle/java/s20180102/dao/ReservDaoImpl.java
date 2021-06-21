package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReservDto;

@Repository
public class ReservDaoImpl implements ReservDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ReservDto> selReservList(PagingDto pdto) {
		return session.selectList("selReservList",pdto);
	}

	@Override
	public int totalResv(String ID) {
		return session.selectOne("totalResv",ID);
	}

	@Override
	public ReservDto oneResv(String payCode) {
		return session.selectOne("oneResv",payCode);
	}

	@Override
	public int total_Complete(String ID) {
		return session.selectOne("total_Complete",ID);
	}

	@Override
	public List<ReservDto> completeList(PagingDto pdto) {
		return session.selectList("completeList",pdto);
	}

	@Override
	public void resvCancel(String payCode) {
		session.update("resvCancel", payCode);		
	}

	@Override
	public void inResv(ReservDto resvDto) {
		session.insert("inResv", resvDto);
	}

	@Override
	public void upResv(ReservDto resvDto) {
		session.update("upResv", resvDto);
	}

	@Override
	public void upPay(ReservDto resvDto) {
		session.update("upPay", resvDto);
	}

	@Override
	 public int updateConfirm(ReservDto resDto) {
	 		if(resDto.getConfirm().equals("Y")) {
	 			return session.update("upConfirmY", resDto);
	 		} else if(resDto.getConfirm().equals("N")){
	 			return session.update("upConfirmN", resDto);
	 		}
	 		return 0;
	 	}

	@Override
	public List<ReservDto> selDaliyResv(ReservDto resvDto) {
		return session.selectList("selDaliyResv", resvDto);
	}
	

	@Override
	public List<ReservDto> completeListG(PagingDto pdto) {
		return session.selectList("completeListG",pdto);
	}

	@Override
	public int total_CompleteG(String ID) {
		return session.selectOne("total_CompleteG",ID);
	}

	@Override
	public List<ReservDto> completeListM(PagingDto pdto) {
		return session.selectList("completeListM",pdto);
	}

	@Override
	public int total_CompleteM(String search) {
		return session.selectOne("total_CompleteM",search);
	}
}
