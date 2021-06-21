package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.PayDao;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.PayDto;


@Service
public class PayServiceImpl implements PayService{
	@Autowired
	private PayDao pDao;

	@Override
	public int total(String iD) {
		return pDao.total(iD);
	}

	@Override
	public List<PayDto> selPayList(PagingDto pdto) {
		return pDao.selPayList(pdto);
	}

	@Override
	public void inPay(PayDto pDto) {
			pDao.inPay(pDto);
	}

	@Override
	public PayDto selOnePay(String payCode) {
		return pDao.selOnePay(payCode);
	}



	
}