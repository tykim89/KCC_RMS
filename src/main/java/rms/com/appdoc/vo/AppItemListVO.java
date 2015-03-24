package rms.com.appdoc.vo;

import java.sql.Timestamp;

public class AppItemListVO {
		   
	   private String app_list_code;
	   private String app_item_no;
	   private String app_item_name;
	   private String ness_tf;
	   private String text_limit;
	   private String sort_seq;
	   private String writer;
	   private Timestamp write_date;
	   private String modifier;
	   private Timestamp modi_date;
	   private String enable_tf;
	   private int version;
	   private String detail_div_code;
	   
	   public AppItemListVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getNess_tf() {
		return ness_tf;
	}
	public void setNess_tf(String ness_tf) {
		this.ness_tf = ness_tf;
	}
	public String getText_limit() {
		return text_limit;
	}
	public void setText_limit(String text_limit) {
		this.text_limit = text_limit;
	}
	public String getSort_seq() {
		return sort_seq;
	}
	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
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
	public String getDetail_div_code() {
		return detail_div_code;
	}
	public void setDetail_div_code(String detail_div_code) {
		this.detail_div_code = detail_div_code;
	}
	
	public AppItemListVO(String app_list_code, String app_item_no,
			String app_item_name, String ness_tf, String text_limit,
			String sort_seq, String writer, Timestamp write_date,
			String modifier, Timestamp modi_date, String enable_tf,
			int version, String detail_div_code) {
		super();
		this.app_list_code = app_list_code;
		this.app_item_no = app_item_no;
		this.app_item_name = app_item_name;
		this.ness_tf = ness_tf;
		this.text_limit = text_limit;
		this.sort_seq = sort_seq;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.detail_div_code = detail_div_code;
	}
	
	@Override
	public String toString() {
		return "AppItemListVO [app_list_code=" + app_list_code
				+ ", app_item_no=" + app_item_no + ", app_item_name="
				+ app_item_name + ", ness_tf=" + ness_tf + ", text_limit="
				+ text_limit + ", sort_seq=" + sort_seq + ", writer=" + writer
				+ ", write_date=" + write_date + ", modifier=" + modifier
				+ ", modi_date=" + modi_date + ", enable_tf=" + enable_tf
				+ ", version=" + version + ", detail_div_code="
				+ detail_div_code + "]";
	}
	   
	
	

}
