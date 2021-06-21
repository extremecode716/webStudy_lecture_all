package sample07;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
		ApplicationContext ac =
				 new ClassPathXmlApplicationContext("/sample07/beans07.xml");
//				 new GenericXmlApplicationContext("/sample07/beans07.xml");
		MessageBean mb = (MessageBean) ac.getBean("mb");
		mb.sayHello();
	}
}
