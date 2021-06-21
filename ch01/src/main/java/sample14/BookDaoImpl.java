package sample14;

import org.springframework.stereotype.Component;

@Component
public class BookDaoImpl implements BookDao {
	public Book getBook(String title) {
		return new Book(title, 25000);
	}
}