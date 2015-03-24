package rms.com.qna.qnataker.vo;

import java.util.List;

public class QnaTakerVO {
	
	
	String admin_id;
	String admin_pw;
	String admin_div_code;
	String admin_name;
	String position_code;
	String admin_email_addr;
	String admin_phone_num;
	String admin_tel_num;
	String admin_autho_code;
	String img_att_file_code;
	String email_tf;
	String writer;
	String write_date;
	String modifier;
	String modi_date;
	String enable_tf;
	int version;
	String dep_no;
	String company_no;
	String branch_no;
	String detail_code_name;
	String dep_name;
	String company_name;
	String branch_name;
	String auth_name;
	
	public QnaTakerVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_div_code() {
		return admin_div_code;
	}

	public void setAdmin_div_code(String admin_div_code) {
		this.admin_div_code = admin_div_code;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getPosition_code() {
		return position_code;
	}

	public void setPosition_code(String position_code) {
		this.position_code = position_code;
	}

	public String getAdmin_email_addr() {
		return admin_email_addr;
	}

	public void setAdmin_email_addr(String admin_email_addr) {
		this.admin_email_addr = admin_email_addr;
	}

	public String getAdmin_phone_num() {
		return admin_phone_num;
	}

	public void setAdmin_phone_num(String admin_phone_num) {
		this.admin_phone_num = admin_phone_num;
	}

	public String getAdmin_tel_num() {
		return admin_tel_num;
	}

	public void setAdmin_tel_num(String admin_tel_num) {
		this.admin_tel_num = admin_tel_num;
	}

	public String getAdmin_autho_code() {
		return admin_autho_code;
	}

	public void setAdmin_autho_code(String admin_autho_code) {
		this.admin_autho_code = admin_autho_code;
	}

	public String getImg_att_file_code() {
		return img_att_file_code;
	}

	public void setImg_att_file_code(String img_att_file_code) {
		this.img_att_file_code = img_att_file_code;
	}

	public String getEmail_tf() {
		return email_tf;
	}

	public void setEmail_tf(String email_tf) {
		this.email_tf = email_tf;
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

	public String getDetail_code_name() {
		return detail_code_name;
	}

	public void setDetail_code_name(String detail_code_name) {
		this.detail_code_name = detail_code_name;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getAuth_name() {
		return auth_name;
	}

	public void setAuth_name(String auth_name) {
		this.auth_name = auth_name;
	}

	public QnaTakerVO(String admin_id, String admin_pw, String admin_div_code,
			String admin_name, String position_code, String admin_email_addr,
			String admin_phone_num, String admin_tel_num,
			String admin_autho_code, String img_att_file_code, String email_tf,
			String writer, String write_date, String modifier,
			String modi_date, String enable_tf, int version, String dep_no,
			String company_no, String branch_no, String detail_code_name,
			String dep_name, String company_name, String branch_name,
			String auth_name) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_div_code = admin_div_code;
		this.admin_name = admin_name;
		this.position_code = position_code;
		this.admin_email_addr = admin_email_addr;
		this.admin_phone_num = admin_phone_num;
		this.admin_tel_num = admin_tel_num;
		this.admin_autho_code = admin_autho_code;
		this.img_att_file_code = img_att_file_code;
		this.email_tf = email_tf;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.dep_no = dep_no;
		this.company_no = company_no;
		this.branch_no = branch_no;
		this.detail_code_name = detail_code_name;
		this.dep_name = dep_name;
		this.company_name = company_name;
		this.branch_name = branch_name;
		this.auth_name = auth_name;
	}

	@Override
	public String toString() {
		return "QnaTakerVO [admin_id=" + admin_id + ", admin_pw=" + admin_pw
				+ ", admin_div_code=" + admin_div_code + ", admin_name="
				+ admin_name + ", position_code=" + position_code
				+ ", admin_email_addr=" + admin_email_addr
				+ ", admin_phone_num=" + admin_phone_num + ", admin_tel_num="
				+ admin_tel_num + ", admin_autho_code=" + admin_autho_code
				+ ", img_att_file_code=" + img_att_file_code + ", email_tf="
				+ email_tf + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + ", dep_no=" + dep_no + ", company_no=" + company_no
				+ ", branch_no=" + branch_no + ", detail_code_name="
				+ detail_code_name + ", dep_name=" + dep_name
				+ ", company_name=" + company_name + ", branch_name="
				+ branch_name + ", auth_name=" + auth_name + "]";
	}
	

}
