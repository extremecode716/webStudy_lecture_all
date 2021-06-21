package sample11.dao;

import sample11.model.Product;

public interface ProductDao {
	Product getProduct(String name);
}