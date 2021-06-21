package sample09;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("/sample09/beans09.xml");
		MessageBean mb = (MessageBean) ac.getBean("mb");
		mb.sayHello();
	}
}