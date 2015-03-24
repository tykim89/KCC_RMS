package rms.com.appdoc.vo;

import java.sql.Timestamp;

public class AppContentVO {
	 
	 private String  aff_no;
	 private String rec_field_no;
	 private String rec_noti_no;
	 private String  app_user_no;
	 private String app_form_no;
	 private String  app_list_code;
	 private String  app_item_no;	
	 
	 //구분자 사용해서 app_list_code랑 app_item_no 사용하는부분.
	 private String key;
	 private String code;
	 private String num;
	 
	 // 여기서부터 입사지원서 내용부분.
	 private String  app_item_content_no;
	 private String app_item_content;
	 private String writer;
	 private String  modifier;
	 private Timestamp write_date;
	 private Timestamp modi_date;
	 private String enable_tf;
	 private int version;
	 private String list_no;
	 
	 //항목 이름
	 private String app_item_name;
	 
	 //희망 순위 
	 private String branch_name;
	 private String priority;
	 
	public AppContentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAff_no() {
		return aff_no;
	}

	public void setAff_no(String aff_no) {
		this.aff_no = aff_no;
	}

	public String getRec_field_no() {
		return rec_field_no;
	}

	public void setRec_field_no(String rec_field_no) {
		this.rec_field_no = rec_field_no;
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

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getApp_item_content_no() {
		return app_item_content_no;
	}

	public void setApp_item_content_no(String app_item_content_no) {
		this.app_item_content_no = app_item_content_no;
	}

	public String getApp_item_content() {
		return app_item_content;
	}

	public void setApp_item_content(String app_item_content) {
		this.app_item_content = app_item_content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public Timestamp getModi_date() {
		return modi_date;
	}

	public void setModi_date(Timestamp modi_date) {
		this.modi_date = modi_date;
	}

	public String getEnable_tf() {
		return enable_tf;
	}

	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getList_no() {
		return list_no;
	}

	public void setList_no(String list_no) {
		this.list_no = list_no;
	}

	public String getApp_item_name() {
		return app_item_name;
	}

	public void setApp_item_name(String app_item_name) {
		this.app_item_name = app_item_name;
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

	public AppContentVO(String aff_no, String rec_field_no, String rec_noti_no,
			String app_user_no, String app_form_no, String app_list_code,
			String app_item_no, String key, String code, String num,
			String app_item_content_no, String app_item_content, String writer,
			String modifier, Timestamp write_date, Timestamp modi_date,
			String enable_tf, int version, String list_no,
			String app_item_name, String branch_name, String priority) {
		super();
		this.aff_no = aff_no;
		this.rec_field_no = rec_field_no;
		this.rec_noti_no = rec_noti_no;
		this.app_user_no = app_user_no;
		this.app_form_no = app_form_no;
		this.app_list_code = app_list_code;
		this.app_item_no = app_item_no;
		this.key = key;
		this.code = code;
		this.num = num;
		this.app_item_content_no = app_item_content_no;
		this.app_item_content = app_item_content;
		this.writer = writer;
		this.modifier = modifier;
		this.write_date = write_date;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.list_no = list_no;
		this.app_item_name = app_item_name;
		this.branch_name = branch_name;
		this.priority = priority;
	}

	@Override
	public String toString() {
		return "AppContentVO [aff_no=" + aff_no + ", rec_field_no="
				+ rec_field_no + ", rec_noti_no=" + rec_noti_no
				+ ", app_user_no=" + app_user_no + ", app_form_no="
				+ app_form_no + ", app_list_code=" + app_list_code
				+ ", app_item_no=" + app_item_no + ", key=" + key + ", code="
				+ code + ", num=" + num + ", app_item_content_no="
				+ app_item_content_no + ", app_item_content="
				+ app_item_content + ", writer=" + writer + ", modifier="
				+ modifier + ", write_date=" + write_date + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + ", list_no=" + list_no + ", app_item_name="
				+ app_item_name + ", branch_name=" + branch_name
				+ ", priority=" + priority + "]";
	}
	 
	

}
