package rms.com.qna.qnafrq.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class QnaFrqVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**다사용답변 번호*/	
	private String frq_answer_no;
	/**다사용답변 내용*/
	private String frq_answer_content;
	/**다사용답변 작성자*/
	private String writer;
	/**다사용답변 작성일*/
	private Timestamp write_date;
	/**다사용답변 수정자*/
	private String modifier;
	/**다사용답변 수정일*/
	private Timestamp modi_date;
	/**다사용답변 사용여부*/
	private String enable_tf;
	/**다사용답변 버전*/
	private int version;
	/**다사용답변 코드*/
	private String qna_type_code;
	
	private int num;

	public QnaFrqVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getFrq_answer_no() {
		return frq_answer_no;
	}

	public void setFrq_answer_no(String frq_answer_no) {
		this.frq_answer_no = frq_answer_no;
	}

	public String getFrq_answer_content() {
		return frq_answer_content;
	}

	public void setFrq_answer_content(String frq_answer_content) {
		this.frq_answer_content = frq_answer_content;
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

	public String getQna_type_code() {
		return qna_type_code;
	}

	public void setQna_type_code(String qna_type_code) {
		this.qna_type_code = qna_type_code;
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

	public QnaFrqVO(String frq_answer_no, String frq_answer_content,
			String writer, Timestamp write_date, String modifier,
			Timestamp modi_date, String enable_tf, int version,
			String qna_type_code, int num) {
		super();
		this.frq_answer_no = frq_answer_no;
		this.frq_answer_content = frq_answer_content;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.qna_type_code = qna_type_code;
		this.num = num;
	}

	@Override
	public String toString() {
		return "QnaFrqVO [frq_answer_no=" + frq_answer_no
				+ ", frq_answer_content=" + frq_answer_content + ", writer="
				+ writer + ", write_date=" + write_date + ", modifier="
				+ modifier + ", modi_date=" + modi_date + ", enable_tf="
				+ enable_tf + ", version=" + version + ", qna_type_code="
				+ qna_type_code + ", num=" + num + "]";
	}
	
}
