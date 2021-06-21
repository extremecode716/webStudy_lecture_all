package sample05;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Ex01 {
	public static void main(String[] args) {
		ApplicationContext ac = new FileSystemXmlApplicationContext("beans02.xml");
		Vehicle vh = (Vehicle) ac.getBean("vh");
		vh.ride("철수");
	}
}