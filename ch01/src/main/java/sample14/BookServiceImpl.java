package sample14;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDao bd;

	public Book getBook() {
		return bd.getBook("바람과 함께 사라지다");
	}
}