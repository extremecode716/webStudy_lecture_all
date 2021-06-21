package sample13;

import org.springframework.stereotype.Component;

@Component
public class ProductDaoImpl implements ProductDao {
	public Product getProduct(String name) {//name="짜장면"
		return new Product(name, 2500);
	}
}