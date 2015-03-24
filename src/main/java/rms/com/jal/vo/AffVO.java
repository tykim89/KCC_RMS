package rms.com.jal.vo;

public class AffVO {
	String aff_no;
	String aff_name;
	String biz_name;
	String sort_seq;
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
	public String getAff_name() {
		return aff_name;
	}
	public void setAff_name(String aff_name) {
		this.aff_name = aff_name;
	}
	public String getBiz_name() {
		return biz_name;
	}
	public void setBiz_name(String biz_name) {
		this.biz_name = biz_name;
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
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "AffVO [aff_no=" + aff_no + ", aff_name=" + aff_name
				+ ", biz_name=" + biz_name + ", sort_seq=" + sort_seq
				+ ", writer=" + writer + ", write_date=" + write_date
				+ ", modifier=" + modifier + ", modi_date=" + modi_date
				+ ", enable_tf=" + enable_tf + ", version=" + version + "]";
	}
	
	
}
