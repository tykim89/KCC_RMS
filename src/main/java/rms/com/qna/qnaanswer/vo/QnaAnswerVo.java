package rms.com.qna.qnaanswer.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class QnaAnswerVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	   private String qna_quest_no;
	
	   private String qna_answer_no;
	   
	   private String qna_answer_title;
	   
	   private String qna_answer_content;
	   
	   private int qna_answer_hits;
	   
	   private String writer;
	   
	   private Timestamp write_date;
	   
	   private String modifier;
	   
	   private Timestamp modi_date;
	   
	   private String enable_tf;
	   
	   private int version;

	public QnaAnswerVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getQna_quest_no() {
		return qna_quest_no;
	}

	public void setQna_quest_no(String qna_quest_no) {
		this.qna_quest_no = qna_quest_no;
	}

	public String getQna_answer_no() {
		return qna_answer_no;
	}

	public void setQna_answer_no(String qna_answer_no) {
		this.qna_answer_no = qna_answer_no;
	}

	public String getQna_answer_title() {
		return qna_answer_title;
	}

	public void setQna_answer_title(String qna_answer_title) {
		this.qna_answer_title = qna_answer_title;
	}

	public String getQna_answer_content() {
		return qna_answer_content;
	}

	public void setQna_answer_content(String qna_answer_content) {
		this.qna_answer_content = qna_answer_content;
	}

	public int getQna_answer_hits() {
		return qna_answer_hits;
	}

	public void setQna_answer_hits(int qna_answer_hits) {
		this.qna_answer_hits = qna_answer_hits;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public QnaAnswerVo(String qna_quest_no, String qna_answer_no,
			String qna_answer_title, String qna_answer_content,
			int qna_answer_hits, String writer, Timestamp write_date,
			String modifier, Timestamp modi_date, String enable_tf, int version) {
		super();
		this.qna_quest_no = qna_quest_no;
		this.qna_answer_no = qna_answer_no;
		this.qna_answer_title = qna_answer_title;
		this.qna_answer_content = qna_answer_content;
		this.qna_answer_hits = qna_answer_hits;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
	}

	@Override
	public String toString() {
		return "QnaAnswerVo [qna_quest_no=" + qna_quest_no + ", qna_answer_no="
				+ qna_answer_no + ", qna_answer_title=" + qna_answer_title
				+ ", qna_answer_content=" + qna_answer_content
				+ ", qna_answer_hits=" + qna_answer_hits + ", writer=" + writer
				+ ", write_date=" + write_date + ", modifier=" + modifier
				+ ", modi_date=" + modi_date + ", enable_tf=" + enable_tf
				+ ", version=" + version + "]";
	}

	
}
