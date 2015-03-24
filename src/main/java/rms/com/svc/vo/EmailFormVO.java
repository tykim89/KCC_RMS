package rms.com.svc.vo;

public class EmailFormVO {
	String email_form_no;
	String email_form_name;
	String email_form_content;
	String writer;
	String wirte_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	
	public String getEmail_form_no() {
		return email_form_no;
	}
	public void setEmail_form_no(String email_form_no) {
		this.email_form_no = email_form_no;
	}
	public String getEmail_form_name() {
		return email_form_name;
	}
	public void setEmail_form_name(String email_form_name) {
		this.email_form_name = email_form_name;
	}
	public String getEmail_form_content() {
		return email_form_content;
	}
	public void setEmail_form_content(String email_form_content) {
		this.email_form_content = email_form_content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWirte_date() {
		return wirte_date;
	}
	public void setWirte_date(String wirte_date) {
		this.wirte_date = wirte_date;
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
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "EmailFormVO [email_form_no=" + email_form_no
				+ ", email_form_name=" + email_form_name
				+ ", email_form_content=" + email_form_content + ", writer="
				+ writer + ", wirte_date=" + wirte_date + ", modifier="
				+ modifier + ", modi_date=" + modi_date + ", enable_tf="
				+ enable_tf + ", version=" + version + "]";
	}
	
	
}
