package sample09;

public class MessageBeanImpl implements MessageBean {
	private String name;
	private String greet;
	private Outputer output;

	public void setName(String name) {
		this.name = name;					// name="홍길동"
	}

	public void setGreet(String greet) {
		this.greet = greet;					// greet="Hello !"
	}
	// Outputer output = new FileOutputer()
	public void setOutput(Outputer output) {
		this.output = output;				// output=out
	}

	public void sayHello() {
		String msg = name + "님 " + greet;
		System.out.println(msg);
		output.output(msg);
	}
}


