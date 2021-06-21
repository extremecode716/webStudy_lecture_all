package sample04;

public class MessageBeanImpl implements MessageBean {
	private String name;
	private String greet;

	public MessageBeanImpl(String name, String greet) {
		this.name = name;		// 도깨비
		this.greet = greet;		// 안뇽
	}

	public void sayHello() {
		System.out.println(name + " ! " + greet);
	}
}