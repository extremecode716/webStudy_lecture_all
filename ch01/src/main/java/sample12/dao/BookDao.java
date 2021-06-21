package sample12.dao;

import sample12.model.Book;

public interface BookDao {
	Book getBook(String title);
}