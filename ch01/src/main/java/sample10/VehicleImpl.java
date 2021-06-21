package sample10;

public class VehicleImpl implements Vehicle {
	private String name;
	private String rider;
	private Outputer out;

	public void setName(String name) {
		this.name = name;					// name="대박이"
	}

	public void setRider(String rider) {
		this.rider = rider;					// rider="비행기"
	}

	public void setOut(Outputer out) {
		this.out = out;						// out=out
	}

	public void rider() {
		String msg = name + "(이)가 " + rider + "을(를) 탄다";
		System.out.println(msg);
		out.output(msg);
	}
}