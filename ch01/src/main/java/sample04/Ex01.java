package sample04;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
		ApplicationContext ac = new FileSystemXmlApplicationContext("beans01.xml");
		MessageBean mb = (MessageBean) ac.getBean("mb2");
		mb.sayHello();
	}
}