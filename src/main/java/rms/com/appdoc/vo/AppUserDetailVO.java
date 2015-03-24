package rms.com.appdoc.vo;

public class AppUserDetailVO {

	/** 지원자 기본 정보 */
	private String rec_field_name;
	private String career_div_code;
	private String rec_noti_title;
	private String app_user_no;
	private String app_user_name;
	private String app_user_email_addr;
	
	private String eng_name;
	private String birth_day;
	private String phone_num;
	private String post_num;
	private String addr;
	private String addr_detail;
	private String study_div;
	private String school_name;
	private String gender;
	private String tel_num;
	
	private String list_no;
	private String app_item_content;
	private String key;
	
	private String modifier;
	private int version;
	
	
	
	
	public String getList_no() {
		return list_no;
	}
	public void setList_no(String list_no) {
		this.list_no = list_no;
	}
	
	
	public String getApp_item_content() {
		return app_item_content;
	}
	public void setApp_item_content(String app_item_content) {
		this.app_item_content = app_item_content;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getRec_field_name() {
		return rec_field_name;
	}
	public void setRec_field_name(String rec_field_name) {
		this.rec_field_name = rec_field_name;
	}
	public String getCareer_div_code() {
		return career_div_code;
	}
	public void setCareer_div_code(String career_div_code) {
		this.career_div_code = career_div_code;
	}
	public String getRec_noti_title() {
		return rec_noti_title;
	}
	public void setRec_noti_title(String rec_noti_title) {
		this.rec_noti_title = rec_noti_title;
	}
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
	
	
	public String getApp_user_email_addr() {
		return app_user_email_addr;
	}
	public void setApp_user_email_addr(String app_user_email_addr) {
		this.app_user_email_addr = app_user_email_addr;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getPost_num() {
		return post_num;
	}
	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getStudy_div() {
		return study_div;
	}
	public void setStudy_div(String study_div) {
		this.study_div = study_div;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getTel_num() {
		return tel_num;
	}
	public void setTel_num(String tel_num) {
		this.tel_num = tel_num;
	}
	@Override
	public String toString() {
		return "AppUserDetailVO [rec_field_name=" + rec_field_name
				+ ", career_div_code=" + career_div_code + ", rec_noti_title="
				+ rec_noti_title + ", app_user_no=" + app_user_no
				+ ", app_user_name=" + app_user_name + ", app_user_email_addr="
				+ app_user_email_addr + ", eng_name=" + eng_name
				+ ", birth_day=" + birth_day + ", phone_num=" + phone_num
				+ ", post_num=" + post_num + ", addr=" + addr
				+ ", addr_detail=" + addr_detail + ", study_div=" + study_div
				+ ", school_name=" + school_name + "]";
	}
	
	
}
