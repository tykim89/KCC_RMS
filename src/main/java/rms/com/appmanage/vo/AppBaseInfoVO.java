package rms.com.appmanage.vo;

public class AppBaseInfoVO {
	
	private String app_user_name;
	private String rec_field_name;
	private String list_no;
	private String rec_noti_title;
	private String career_div_code;
	private String branch_name;
	private String priority;
	private String app_user_email_addr;
	private String app_user_no;
	private String rec_noti_no;
	
	
	public String getApp_user_name() {
		return app_user_name;
	}
	public void setApp_user_name(String app_user_name) {
		this.app_user_name = app_user_name;
	}
	public String getRec_field_name() {
		return rec_field_name;
	}
	public void setRec_field_name(String rec_field_name) {
		this.rec_field_name = rec_field_name;
	}
	public String getList_no() {
		return list_no;
	}
	public void setList_no(String list_no) {
		this.list_no = list_no;
	}
	public String getRec_noti_title() {
		return rec_noti_title;
	}
	public void setRec_noti_title(String rec_noti_title) {
		this.rec_noti_title = rec_noti_title;
	}
	public String getCareer_div_code() {
		return career_div_code;
	}
	public void setCareer_div_code(String career_div_code) {
		this.career_div_code = career_div_code;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	
	
	public String getApp_user_email_addr() {
		return app_user_email_addr;
	}
	public void setApp_user_email_addr(String app_user_email_addr) {
		this.app_user_email_addr = app_user_email_addr;
	}
	public String getApp_user_no() {
		return app_user_no;
	}
	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}
	public String getRec_noti_no() {
		return rec_noti_no;
	}
	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}
	@Override
	public String toString() {
		return "AppBaseInfoVO [app_user_name=" + app_user_name
				+ ", rec_field_name=" + rec_field_name + ", list_no=" + list_no
				+ ", rec_noti_title=" + rec_noti_title + ", career_div_code="
				+ career_div_code + ", branch_name=" + branch_name
				+ ", priority=" + priority + ", app_user_email_addr="
				+ app_user_email_addr + ", app_user_no=" + app_user_no
				+ ", rec_noti_no=" + rec_noti_no + "]";
	}
	
	
	
}
