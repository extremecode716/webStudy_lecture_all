package sample07;

public class MesageBeanImpl implements MessageBean {
	private String name;		// property
	private String greet;

	public void setName(String name) {
		this.name = name;		// 길동
	}

	public void setGreet(String greet) {
		this.greet = greet;		// 안녕
	}

	public void sayHello() {
		System.out.println(name + " !! " + greet);
	}
}