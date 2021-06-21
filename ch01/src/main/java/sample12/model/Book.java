package sample12.model;

public class Book {
	private String title;
	private int price;

	public Book(String title, int price) {
		this.title = title;			// title="대박인생"
		this.price = price;         // price=20000
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String toString() {
		return "책[제목:" + title + ", 가격:" + price + "]";
	}
}