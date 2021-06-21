package jspbook.ch10;

// ch10 예제에서 사용할 데이터를 생성하기 위한 클래스
public class Product {

	// 상품 목록을 보관할 배열
	private String[] productList = {"item1","item2","item3","item4","item5"};
	
	// 예제에서 사용하기 위한 간단한 변수 설정
	private int num1 = 10;
	private int num2 = 20;
	
	public int getNum1() {
		return num1;
	}

	public int getNum2() {
		return num2;
	}

	public String[] getProductList() {
		return productList;
	}
}