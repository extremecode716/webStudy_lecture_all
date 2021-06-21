package sample12.dao;

import sample12.model.Book;

public class BookDaoImpl implements BookDao {
	public Book getBook(String title) { //  title="대박인생"
		return new Book(title, 20000);
	}
}