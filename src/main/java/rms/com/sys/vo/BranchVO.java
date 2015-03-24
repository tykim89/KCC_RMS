package rms.com.sys.vo;

public class BranchVO {
	String branch_no;
	String company_no;
	String branch_name;
	String branch_div_code;
	String branch_road_addr;
	String branch_road_addr_detail;
	String sort_seq;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	
	public String getBranch_no() {
		return branch_no;
	}
	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
	}
	public String getCompany_no() {
		return company_no;
	}
	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_div_code() {
		return branch_div_code;
	}
	public void setBranch_div_code(String branch_div_code) {
		this.branch_div_code = branch_div_code;
	}
	public String getBranch_road_addr() {
		return branch_road_addr;
	}
	public void setBranch_road_addr(String branch_road_addr) {
		this.branch_road_addr = branch_road_addr;
	}
	public String getBranch_road_addr_detail() {
		return branch_road_addr_detail;
	}
	public void setBranch_road_addr_detail(String branch_road_addr_detail) {
		this.branch_road_addr_detail = branch_road_addr_detail;
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
		return "BranchVO [branch_no=" + branch_no + ", company_no="
				+ company_no + ", branch_name=" + branch_name
				+ ", branch_div_code=" + branch_div_code
				+ ", branch_road_addr=" + branch_road_addr
				+ ", branch_road_addr_detail=" + branch_road_addr_detail
				+ ", sort_seq=" + sort_seq + ", writer=" + writer
				+ ", write_date=" + write_date + ", modifier=" + modifier
				+ ", modi_date=" + modi_date + ", enable_tf=" + enable_tf
				+ ", version=" + version + "]";
	}
	
	
}
