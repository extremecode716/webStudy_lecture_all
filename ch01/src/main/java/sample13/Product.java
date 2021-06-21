package sample13;

public class Product {
	private String name;
	private int price;

	public Product(String name, int price) {
		this.name = name;			// name="짜장명"
		this.price = price;			// price=2500
	}

	public String toString() {
		return "제품[이름:" + name + ", 기격:" + price + "]";
	}
}