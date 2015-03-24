package rms.com.appForm.vo;

public class AppFormVO {

	private String app_form_no;
	private String app_form_name;
	private String app_form_memo;
	private String writer;
	private String write_date;
	private String modifier;
	private String modi_date;
	private String enable_tf;
	private String version;
	
	
	
	public AppFormVO(String app_form_no, String app_form_name,
			String app_form_memo, String writer, String write_date,
			String modifier, String modi_date, String enable_tf, String version) {
		super();
		this.app_form_no = app_form_no;
		this.app_form_name = app_form_name;
		this.app_form_memo = app_form_memo;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
	}


	public AppFormVO() {
		super();
	}


	public String getApp_form_no() {
		return app_form_no;
	}


	public void setApp_form_no(String app_form_no) {
		this.app_form_no = app_form_no;
	}


	public String getApp_form_name() {
		return app_form_name;
	}


	public void setApp_form_name(String app_form_name) {
		this.app_form_name = app_form_name;
	}


	public String getApp_form_memo() {
		return app_form_memo;
	}


	public void setApp_form_memo(String app_form_memo) {
		this.app_form_memo = app_form_memo;
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

	
	

	@Override
	public String toString() {
		return "AppFormVO [app_form_no=" + app_form_no + ", app_form_name="
				+ app_form_name + ", app_form_memo=" + app_form_memo
				+ ", writer=" + writer + ", write_date=" + write_date
				+ ", modifier=" + modifier + ", modi_date=" + modi_date
				+ ", enable_tf=" + enable_tf + ", version=" + version + "]";
	}

	
	
	
	
}
