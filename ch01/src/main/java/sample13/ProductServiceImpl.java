package sample13;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pd;

	public Product getProduct() {
		return pd.getProduct("짜장면");
	}
}