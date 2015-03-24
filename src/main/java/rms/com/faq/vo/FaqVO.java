package rms.com.faq.vo;

import java.util.Date;
import java.util.List;


public class FaqVO {
	
	private String no;
	private String faq_no;
	private String faq_type_code;
	private String faq_quest_content;
	private String faq_answer_content;	
	private String writer;
	private Date write_date;
	private String modifier;
	private Date modi_date;
	private String version;
	private String enable_tf;
	private String faq_type_name;



	public FaqVO(String no, String faq_no, String faq_type_code,
			String faq_quest_content, String faq_answer_content, String writer,
			Date write_date, String modifier, Date modi_date, String version,
			String enable_tf, String faq_type_name) {
		super();
		this.no = no;
		this.faq_no = faq_no;
		this.faq_type_code = faq_type_code;
		this.faq_quest_content = faq_quest_content;
		this.faq_answer_content = faq_answer_content;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.version = version;
		this.enable_tf = enable_tf;
		this.faq_type_name = faq_type_name;
	}




	public FaqVO() {
		super();
	}




	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	public Date getModi_date() {
		return modi_date;
	}

	public void setModi_date(Date modi_date) {
		this.modi_date = modi_date;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getFaq_no() {
		return faq_no;
	}


	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}


	public String getFaq_type_code() {
		return faq_type_code;
	}


	public void setFaq_type_code(String faq_type_code) {
		this.faq_type_code = faq_type_code;
	}


	public String getFaq_quest_content() {
		return faq_quest_content;
	}


	public void setFaq_quest_content(String faq_quest_content) {
		this.faq_quest_content = faq_quest_content;
	}


	public String getFaq_answer_content() {
		return faq_answer_content;
	}


	public void setFaq_answer_content(String faq_answer_content) {
		this.faq_answer_content = faq_answer_content;
	}


	public Date getWrite_date() {
		return write_date;
	}


	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getEnable_tf() {
		return enable_tf;
	}


	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}


	public String getFaq_type_name() {
		return faq_type_name;
	}


	public void setFaq_type_name(String faq_type_name) {
		this.faq_type_name = faq_type_name;
	}

	

	public String getNo() {
		return no;
	}




	public void setNo(String no) {
		this.no = no;
	}




	@Override
	public String toString() {
		return "FaqVO [faq_no=" + faq_no + ", faq_type_code=" + faq_type_code
				+ ", faq_quest_content=" + faq_quest_content
				+ ", faq_answer_content=" + faq_answer_content + ", writer="
				+ writer + ", write_date=" + write_date + ", modifier="
				+ modifier + ", modi_date=" + modi_date + ", version="
				+ version + ", enable_tf=" + enable_tf + ", faq_type_name="
				+ faq_type_name + "]";
	}


	
	

}
