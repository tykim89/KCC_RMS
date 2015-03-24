package rms.com.sys.vo;

public class CodeGroupVO {
	String group_code;
	String group_name;
	String val1_comment;
	String val2_comment;
	String val3_comment;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	String sort_seq;
	
	public String getGroup_code() {
		return group_code;
	}
	public void setGroup_code(String group_code) {
		this.group_code = group_code;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
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
	
	
	public String getVal1_comment() {
		return val1_comment;
	}
	public void setVal1_comment(String val1_comment) {
		this.val1_comment = val1_comment;
	}
	public String getVal2_comment() {
		return val2_comment;
	}
	public void setVal2_comment(String val2_comment) {
		this.val2_comment = val2_comment;
	}
	public String getVal3_comment() {
		return val3_comment;
	}
	public void setVal3_comment(String val3_comment) {
		this.val3_comment = val3_comment;
	}	
	public String getSort_seq() {
		return sort_seq;
	}
	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}
	@Override
	public String toString() {
		return "CodeGroupVO [group_code=" + group_code + ", group_name="
				+ group_name + ", val1_comment=" + val1_comment
				+ ", val2_comment=" + val2_comment + ", val3_comment="
				+ val3_comment + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + ", sort_seq=" + sort_seq + "]";
	}	
}
