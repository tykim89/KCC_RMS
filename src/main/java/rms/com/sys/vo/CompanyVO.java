package rms.com.sys.vo;

public class CompanyVO {
	String company_no;
	String company_name;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	int version;
	String enable_tf;
	String aff_no;
	String sort_seq;
	
	
	public String getCompany_no() {
		return company_no;
	}
	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
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
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public String getEnable_tf() {
		return enable_tf;
	}
	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}
	public String getAff_no() {
		return aff_no;
	}
	public void setAff_no(String aff_no) {
		this.aff_no = aff_no;
	}
	public String getSort_seq() {
		return sort_seq;
	}
	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}
	@Override
	public String toString() {
		return "CompanyVO [company_no=" + company_no + ", company_name="
				+ company_name + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", version=" + version + ", enable_tf="
				+ enable_tf + ", aff_no=" + aff_no + ", sort_seq=" + sort_seq
				+ "]";
	}
	
	
}

