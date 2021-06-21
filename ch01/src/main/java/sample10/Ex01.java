package sample10;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("/sample10/beans10.xml");
		Vehicle vh = (Vehicle) ac.getBean("vh");
		vh.rider();
	}
}
