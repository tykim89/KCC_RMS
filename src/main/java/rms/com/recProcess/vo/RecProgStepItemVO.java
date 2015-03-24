package rms.com.recProcess.vo;

public class RecProgStepItemVO {
	
	private String rec_prog_no;
	private String step_item_code;
	private String step_seq;
	private String writer;
	private String write_date;
	private String modifier;
	private String modi_date;
	private String enable_tf;
	private String version;
	
	
	public RecProgStepItemVO(String rec_prog_no, String step_item_code,
			String step_seq, String writer, String write_date, String modifier,
			String modi_date, String enable_tf, String version) {
		super();
		this.rec_prog_no = rec_prog_no;
		this.step_item_code = step_item_code;
		this.step_seq = step_seq;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
	}

	public RecProgStepItemVO() {
		super();
	}

	public String getRec_prog_no() {
		return rec_prog_no;
	}

	public void setRec_prog_no(String rec_prog_no) {
		this.rec_prog_no = rec_prog_no;
	}

	public String getStep_item_code() {
		return step_item_code;
	}

	public void setStep_item_code(String step_item_code) {
		this.step_item_code = step_item_code;
	}

	public String getStep_seq() {
		return step_seq;
	}

	public void setStep_seq(String step_seq) {
		this.step_seq = step_seq;
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

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	
	
	@Override
	public String toString() {
		return "RecProgStepItemVO [rec_prog_no=" + rec_prog_no
				+ ", step_item_code=" + step_item_code + ", step_seq="
				+ step_seq + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + "]";
	}
	
	
	

}
