package sample08;

public class MessageBeanImpl implements MessageBean {
	private String name;
	private String greet;

	public MessageBeanImpl(String name) {
		this.name = name;	// 돌쇠
	}

	public void setGreet(String greet) {
		this.greet = greet;	// 안뇽
	}

	public void syaHello() {
		System.out.println(name + " ! " + greet);
	}
}