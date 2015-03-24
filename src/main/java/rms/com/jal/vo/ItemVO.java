package rms.com.jal.vo;

public class ItemVO {
	String group_code;
	String detail_code;
	String detail_code_name;
	String sort_seq;
	String val1;
	String val2;
	String val3;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	
	public String getGroup_code() {
		return group_code;
	}
	public void setGroup_code(String group_code) {
		this.group_code = group_code;
	}
	public String getDetail_code() {
		return detail_code;
	}
	public void setDetail_code(String detail_code) {
		this.detail_code = detail_code;
	}
	public String getDetail_code_name() {
		return detail_code_name;
	}
	public void setDetail_code_name(String detail_code_name) {
		this.detail_code_name = detail_code_name;
	}
	public String getSort_seq() {
		return sort_seq;
	}
	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}
	public String getVal1() {
		return val1;
	}
	public void setVal1(String val1) {
		this.val1 = val1;
	}
	public String getVal2() {
		return val2;
	}
	public void setVal2(String val2) {
		this.val2 = val2;
	}
	public String getVal3() {
		return val3;
	}
	public void setVal3(String val3) {
		this.val3 = val3;
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
		return "CodeVO [group_code=" + group_code + ", detail_code="
				+ detail_code + ", detail_code_name=" + detail_code_name
				+ ", sort_seq=" + sort_seq + ", val1=" + val1 + ", val2="
				+ val2 + ", val3=" + val3 + ", writer=" + writer
				+ ", write_date=" + write_date + ", modifier=" + modifier
				+ ", modi_date=" + modi_date + ", enable_tf=" + enable_tf
				+ ", version=" + version + "]";
	}
	
	
}
