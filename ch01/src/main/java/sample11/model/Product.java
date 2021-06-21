package sample11.model;

public class Product {
	private String name;
	private int price;

	public Product(String name, int price) {
		this.name = name;			// name="라면"
		this.price = price;			// price=2000
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String toString() {
		return "제품[이름:" + name + ", 가격:" + price + "]";
	}
}