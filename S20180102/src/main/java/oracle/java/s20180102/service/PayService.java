package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.PayDto;
@Service
public interface PayService {

	int total(String iD);
	List<PayDto> selPayList(PagingDto pdto);                                   // 한 회원의 결제 정보 리스트
	void inPay(PayDto pDto);                    							   // 결제시
	PayDto selOnePay(String payCode);                                          // 하나의 결제 정보 가져오기

	
	//List<PayDto> selPayList(int GservNo);                                  // 가이드 상품별 결제 정보 리스트
	//List<PayDto> selPayList(String Id, String startDate, String endDate);  // 기간별 결제 정보 리스트
	//int delPayList(String Paycode);                                        // 환불시
	//int inPay(PayDto payDto);                                              // 결제시

}