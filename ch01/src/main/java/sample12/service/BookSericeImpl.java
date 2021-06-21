package sample12.service;

import sample12.dao.BookDao;
import sample12.model.Book;

public class BookSericeImpl implements BookService {
	private BookDao bd;

	public void setBd(BookDao bd) {
		this.bd = bd;
	}

	public Book getBook() {
		return bd.getBook("대박인생");
	}
}