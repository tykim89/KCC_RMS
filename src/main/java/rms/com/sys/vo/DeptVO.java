package rms.com.sys.vo;

public class DeptVO {
	String dep_no;
	String company_no;
	String branch_no;
	String dep_name;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	public String getDep_no() {
		return dep_no;
	}
	public void setDep_no(String dep_no) {
		this.dep_no = dep_no;
	}
	public String getCompany_no() {
		return company_no;
	}
	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}
	public String getBranch_no() {
		return branch_no;
	}
	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
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
		return "DeptVO [dep_no=" + dep_no + ", company_no=" + company_no
				+ ", branch_no=" + branch_no + ", dep_name=" + dep_name
				+ ", writer=" + writer + ", write_date=" + write_date
				+ ", modifier=" + modifier + ", modi_date=" + modi_date
				+ ", enable_tf=" + enable_tf + ", version=" + version + "]";
	}
	
	
}
