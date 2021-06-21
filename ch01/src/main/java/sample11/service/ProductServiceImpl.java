package sample11.service;

import sample11.dao.ProductDao;
import sample11.model.Product;

public class ProductServiceImpl implements ProductService {
	private ProductDao pd;

	public void setPd(ProductDao pd) {
		this.pd = pd;
	}

	public Product getProduct() {
		return pd.getProduct("라면");
	}
}