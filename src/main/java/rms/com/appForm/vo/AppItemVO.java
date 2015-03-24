package rms.com.appForm.vo;

public class AppItemVO {

	private String app_list_code;
	private String app_item_no;
	private String app_item_name;
	private String ness_tf;
	private String data_type;
	private String text_limit;
	private String valid_check_tf;
	private String encry_tf;
	private String sort_seq;
	private String writer;
	private String write_date;
	private String modifier;
	private String modi_date;
	private String enable_tf;
	private String version;
	private String detail_div_code;
	
	
	public AppItemVO(String app_list_code, String app_item_no,
			String app_item_name, String ness_tf, String data_type,
			String text_limit, String valid_check_tf, String encry_tf,
			String sort_seq, String writer, String write_date, String modifier,
			String modi_date, String enable_tf, String version,
			String detail_div_code) {
		super();
		this.app_list_code = app_list_code;
		this.app_item_no = app_item_no;
		this.app_item_name = app_item_name;
		this.ness_tf = ness_tf;
		this.data_type = data_type;
		this.text_limit = text_limit;
		this.valid_check_tf = valid_check_tf;
		this.encry_tf = encry_tf;
		this.sort_seq = sort_seq;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.detail_div_code = detail_div_code;
	}


	public AppItemVO() {
		super();
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


	public String getData_type() {
		return data_type;
	}


	public void setData_type(String data_type) {
		this.data_type = data_type;
	}


	public String getText_limit() {
		return text_limit;
	}


	public void setText_limit(String text_limit) {
		this.text_limit = text_limit;
	}


	public String getValid_check_tf() {
		return valid_check_tf;
	}


	public void setValid_check_tf(String valid_check_tf) {
		this.valid_check_tf = valid_check_tf;
	}


	public String getEncry_tf() {
		return encry_tf;
	}


	public void setEncry_tf(String encry_tf) {
		this.encry_tf = encry_tf;
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


	public String getWrite_date() {
		return write_date;
	}


	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}


	public String getModifier() {
		return modifier;
	}


	public void setModifier(String modifier) {
		this.modifier = modifier;
	}


	public String getModi_date() {
		return modi_date;
	}


	public void setModi_date(String modi_date) {
		this.modi_date = modi_date;
	}


	public String getEnable_tf() {
		return enable_tf;
	}


	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}


	public String getVersion() {
		return version;
	}


	public void setVersion(String version) {
		this.version = version;
	}


	public String getDetail_div_code() {
		return detail_div_code;
	}


	public void setDetail_div_code(String detail_div_code) {
		this.detail_div_code = detail_div_code;
	}


	@Override
	public String toString() {
		return "AppItemVO [app_list_code=" + app_list_code + ", app_item_no="
				+ app_item_no + ", app_item_name=" + app_item_name
				+ ", ness_tf=" + ness_tf + ", data_type=" + data_type
				+ ", text_limit=" + text_limit + ", valid_check_tf="
				+ valid_check_tf + ", encry_tf=" + encry_tf + ", sort_seq="
				+ sort_seq + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + ", detail_div_code=" + detail_div_code + "]";
	}
	
	
	

	
	
}
