package rms.com.appdoc.vo;

import java.sql.Timestamp;

public class AppWishBranchVO {
	
	
	  private String rec_noti_no;
	  
	  private String app_user_no;
	  
	  private String company_name;
	  
	  private String branch_no;
	   
	   private String branch_name;
	   
	   private String branch_div_code;
	   
	   private Timestamp write_date;
	   
	   private String modifier;
	   
	   private Timestamp modi_date;
	   
	   private int version;
	   
	   private String company_no;
	   
	   private String sort_seq;

	public AppWishBranchVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getRec_noti_no() {
		return rec_noti_no;
	}

	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}

	public String getApp_user_no() {
		return app_user_no;
	}

	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getBranch_no() {
		return branch_no;
	}

	public void setBranch_no(String branch_no) {
		this.branch_no = branch_no;
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

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public Timestamp getModi_date() {
		return modi_date;
	}

	public void setModi_date(Timestamp modi_date) {
		this.modi_date = modi_date;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getCompany_no() {
		return company_no;
	}

	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}

	public String getSort_seq() {
		return sort_seq;
	}

	public void setSort_seq(String sort_seq) {
		this.sort_seq = sort_seq;
	}

	public AppWishBranchVO(String rec_noti_no, String app_user_no,
			String company_name, String branch_no, String branch_name,
			String branch_div_code, Timestamp write_date, String modifier,
			Timestamp modi_date, int version, String company_no, String sort_seq) {
		super();
		this.rec_noti_no = rec_noti_no;
		this.app_user_no = app_user_no;
		this.company_name = company_name;
		this.branch_no = branch_no;
		this.branch_name = branch_name;
		this.branch_div_code = branch_div_code;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.version = version;
		this.company_no = company_no;
		this.sort_seq = sort_seq;
	}

	@Override
	public String toString() {
		return "AppWishBranchVO [rec_noti_no=" + rec_noti_no + ", app_user_no="
				+ app_user_no + ", company_name=" + company_name
				+ ", branch_no=" + branch_no + ", branch_name=" + branch_name
				+ ", branch_div_code=" + branch_div_code + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", version=" + version + ", company_no="
				+ company_no + ", sort_seq=" + sort_seq + "]";
	}


}
