package rms.com.qna.qnaboard.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import rms.com.qna.qnafrq.vo.DefaultVO;

public class QnaVO extends DefaultVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	/**QNA 번호*/	
	private String qna_quest_no;	
	/**QNA 제목*/	
	private String qna_quest_title;     
	/**QNA 내용*/	
	private String qna_quest_content;   
	/**QNA 조회수*/	
	private int qna_quest_hits;
	/**QNA 비밀글여부*/	
	private String qna_quest_scr_tf;   
	/**QNA 작성자*/	
	private String writer; 
	/**QNA 작성일*/	
	private Timestamp write_date;
	/**QNA 수정자*/	
	private String modifier;
	/**QNA 수정일*/
	private Timestamp modi_date;
	/**QNA 활용여부*/
	private String enable_tf; 
	/**QNA 버전*/	
	private int version;
	/**QNA 비밀번호*/
	private String qna_quest_pw;    
	/**QNA 질문유형코드*/
	private String qna_type_code;
	/**QNA 답변개수*/
	private int reple_cnt;
	/**QNA 작성자 이메일 주소*/	
	private String writer_email;
	
	private int num;

	public QnaVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getQna_quest_no() {
		return qna_quest_no;
	}

	public void setQna_quest_no(String qna_quest_no) {
		this.qna_quest_no = qna_quest_no;
	}

	public String getQna_quest_title() {
		return qna_quest_title;
	}

	public void setQna_quest_title(String qna_quest_title) {
		this.qna_quest_title = qna_quest_title;
	}

	public String getQna_quest_content() {
		return qna_quest_content;
	}

	public void setQna_quest_content(String qna_quest_content) {
		this.qna_quest_content = qna_quest_content;
	}

	public int getQna_quest_hits() {
		return qna_quest_hits;
	}

	public void setQna_quest_hits(int qna_quest_hits) {
		this.qna_quest_hits = qna_quest_hits;
	}

	public String getQna_quest_scr_tf() {
		return qna_quest_scr_tf;
	}

	public void setQna_quest_scr_tf(String qna_quest_scr_tf) {
		this.qna_quest_scr_tf = qna_quest_scr_tf;
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

	public String getQna_quest_pw() {
		return qna_quest_pw;
	}

	public void setQna_quest_pw(String qna_quest_pw) {
		this.qna_quest_pw = qna_quest_pw;
	}

	public String getQna_type_code() {
		return qna_type_code;
	}

	public void setQna_type_code(String qna_type_code) {
		this.qna_type_code = qna_type_code;
	}

	public int getReple_cnt() {
		return reple_cnt;
	}

	public void setReple_cnt(int reple_cnt) {
		this.reple_cnt = reple_cnt;
	}

	public String getWriter_email() {
		return writer_email;
	}

	public void setWriter_email(String writer_email) {
		this.writer_email = writer_email;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public QnaVO(String qna_quest_no, String qna_quest_title,
			String qna_quest_content, int qna_quest_hits,
			String qna_quest_scr_tf, String writer, Timestamp write_date,
			String modifier, Timestamp modi_date, String enable_tf,
			int version, String qna_quest_pw, String qna_type_code,
			int reple_cnt, String writer_email, int num) {
		super();
		this.qna_quest_no = qna_quest_no;
		this.qna_quest_title = qna_quest_title;
		this.qna_quest_content = qna_quest_content;
		this.qna_quest_hits = qna_quest_hits;
		this.qna_quest_scr_tf = qna_quest_scr_tf;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.qna_quest_pw = qna_quest_pw;
		this.qna_type_code = qna_type_code;
		this.reple_cnt = reple_cnt;
		this.writer_email = writer_email;
		this.num = num;
	}

	@Override
	public String toString() {
		return "QnaVO [qna_quest_no=" + qna_quest_no + ", qna_quest_title="
				+ qna_quest_title + ", qna_quest_content=" + qna_quest_content
				+ ", qna_quest_hits=" + qna_quest_hits + ", qna_quest_scr_tf="
				+ qna_quest_scr_tf + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + ", qna_quest_pw=" + qna_quest_pw
				+ ", qna_type_code=" + qna_type_code + ", reple_cnt="
				+ reple_cnt + ", writer_email=" + writer_email + ", num=" + num
				+ "]";
	}
	
	
}
