package sample06;

public class VehicleImpl implements Vehicle {
	private String name;
	private String rider;

	public VehicleImpl(String name, String rider) {
		this.name = name;		// 철수
		this.rider = rider;		// 자전거
	}

	public void ride() {
		System.out.println(name + "(이)가 " + rider + "(을)를 탄다");
	}
}