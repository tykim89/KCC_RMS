package rms.com.appmanage.vo;

public class AppInfoVO {
	private String app_item_content;
	private String app_user_no;
	private String key;
	private String app_list_code;
	private String rec_noti_no;
	
	
	public String getApp_item_content() {
		return app_item_content;
	}
	public void setApp_item_content(String app_item_content) {
		this.app_item_content = app_item_content;
	}
	public String getApp_user_no() {
		return app_user_no;
	}
	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getApp_list_code() {
		return app_list_code;
	}
	public void setApp_list_code(String app_list_code) {
		this.app_list_code = app_list_code;
	}	
	
	public String getRec_noti_no() {
		return rec_noti_no;
	}
	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}
	@Override
	public String toString() {
		return "AppInfoVO [app_item_content=" + app_item_content
				+ ", app_user_no=" + app_user_no + ", key=" + key
				+ ", app_list_code=" + app_list_code + ", rec_noti_no="
				+ rec_noti_no + "]";
	}
	
	
	
}
