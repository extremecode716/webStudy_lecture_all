package sample15;

public class Book {
	private String title;
	private int price;

	public Book(String title, int price) {
		this.title = title;					// title="바람과 함께 사라지다"
		this.price = price;					// price=25000
	}

	public String toString() {
		return "책[제목:" + title + ", 가격:" + price + "]";
	}
}