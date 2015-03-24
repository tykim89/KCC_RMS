package rms.com.appdoc.vo;

public class AppItemContentVO {
	String app_form_no;
	String app_list_code;
	String app_list_code_name;
	String app_item_no;
	String app_item_name;
	String app_item_content;
	String rec_noti_no;
	String app_user_no;
	String list_no;
	
	
	
	public String getList_no() {
		return list_no;
	}
	public void setList_no(String list_no) {
		this.list_no = list_no;
	}
	public String getApp_form_no() {
		return app_form_no;
	}
	public void setApp_form_no(String app_form_no) {
		this.app_form_no = app_form_no;
	}
	public String getApp_list_code() {
		return app_list_code;
	}
	public void setApp_list_code(String app_list_code) {
		this.app_list_code = app_list_code;
	}
	public String getApp_item_no() {
		return app_item_no;
	}
	public void setApp_item_no(String app_item_no) {
		this.app_item_no = app_item_no;
	}
	public String getApp_item_name() {
		return app_item_name;
	}
	public void setApp_item_name(String app_item_name) {
		this.app_item_name = app_item_name;
	}
	public String getApp_item_content() {
		return app_item_content;
	}
	public void setApp_item_content(String app_item_content) {
		this.app_item_content = app_item_content;
	}
	public String getRec_noti_no() {
		return rec_noti_no;
	}
	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}
	public String getApp_user_no() {
		return app_user_no;
	}
	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}
	
	
	public String getApp_list_code_name() {
		return app_list_code_name;
	}
	public void setApp_list_code_name(String app_list_code_name) {
		this.app_list_code_name = app_list_code_name;
	}
	
	@Override
	public String toString() {
		return "AppItemContentVO [app_form_no=" + app_form_no
				+ ", app_list_code=" + app_list_code + ", app_list_code_name="
				+ app_list_code_name + ", app_item_no=" + app_item_no
				+ ", app_item_name=" + app_item_name + ", app_item_content="
				+ app_item_content + ", rec_noti_no=" + rec_noti_no
				+ ", app_user_no=" + app_user_no + ", list_no=" + list_no + "]";
	}
	
}
