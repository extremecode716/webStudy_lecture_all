package service;

public class ActionForward {
	
	private boolean redirect; //forwarding 방법 설정
	private String path;      //forwarding path설정
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

}
