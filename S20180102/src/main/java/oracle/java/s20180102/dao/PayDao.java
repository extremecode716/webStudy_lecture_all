package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.PayDto;

public interface PayDao {

	int total(String iD);                           // 회원별 총 결제내역 개수
	List<PayDto> selPayList(PagingDto pdto);        // 회원별 결제내역 리스트
	void inPay(PayDto pDto);                        // 결제시
	PayDto selOnePay(String payCode);               // 하나의 결제 내역 가져오기


	//List<PayDto> selPayList(int GservNo);                                  // 가이드 상품별 결제 정보 리스트
	//List<PayDto> selPayList(String Id, String startDate, String endDate);  // 기간별 결제 정보 리스트

	//int delPayList(String Paycode);                                        // 환불시
	//int inPay(PayDto payDto);                                              // 결제시

}