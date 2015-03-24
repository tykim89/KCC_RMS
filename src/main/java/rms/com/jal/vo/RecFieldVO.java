package rms.com.jal.vo;

public class RecFieldVO {
	String aff_no;
	String rec_field_no;
	String rec_field_code;
	String sort_seq;
	String rec_field_name;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	
	
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
	public String getRec_field_code() {
		return rec_field_code;
	}
	public void setRec_field_code(String rec_field_code) {
		this.rec_field_code = rec_field_code;
	}
	public String getSort_seq() {
		return sort_seq;
	}
	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}
	public String getRec_field_name() {
		return rec_field_name;
	}
	public void setRec_field_name(String rec_field_name) {
		this.rec_field_name = rec_field_name;
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
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "RecFieldVO [aff_no=" + aff_no + ", rec_field_no="
				+ rec_field_no + ", rec_field_code=" + rec_field_code
				+ ", sort_seq=" + sort_seq + ", rec_field_name="
				+ rec_field_name + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + "]";
	}
	
	
}
