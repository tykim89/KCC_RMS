package rms.com.check.vo;

public class AssignedUserVO {
	String app_user_no;
	
	String app_user_name;
	
	String app_user_birth;
	
	int cnt;
	
	public String getApp_user_no() {
		return app_user_no;
	}
	
	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}
	
	public String getApp_user_name() {
		return app_user_name;
	}
	
	public void setApp_user_name(String app_user_name) {
		this.app_user_name = app_user_name;
	}
	
	public String getApp_user_birth() {
		return app_user_birth;
	}
	
	public void setApp_user_birth(String app_user_birth) {
		this.app_user_birth = app_user_birth;
	}

	@Override
	public String toString() {
		return "AssignedUserVO [app_user_no=" + app_user_no
				+ ", app_user_name=" + app_user_name + ", app_user_birth="
				+ app_user_birth + ", cnt=" + cnt + "]";
	}
	
	
}
