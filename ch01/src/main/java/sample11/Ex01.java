package sample11;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import sample11.model.Product;
import sample11.service.ProductService;

public class Ex01 {
	public static void main(String[] args) {
		ApplicationContext ac = new GenericXmlApplicationContext("/sample11/beans11.xml");
		ProductService ps = (ProductService) ac.getBean("ps");
		Product product = ps.getProduct();
		System.out.println(product);
	}
}