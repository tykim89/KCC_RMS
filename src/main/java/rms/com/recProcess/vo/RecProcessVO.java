package rms.com.recProcess.vo;

import java.util.List;

public class RecProcessVO {

	private int no;
	private String rec_prog_no;
	private String rec_prog_name;
	private String writer;
	private String write_date;
	private String modifier;
	private String modi_date;
	private String enable_tf; 
	private String version;
	private String rec_prog_memo;
	private String step_item_list;

	

	public RecProcessVO(int no, String rec_prog_no, String rec_prog_name,
			String writer, String write_date, String modifier,
			String modi_date, String enable_tf, String version,
			String rec_prog_memo, String step_item_list) {
		super();
		this.no = no;
		this.rec_prog_no = rec_prog_no;
		this.rec_prog_name = rec_prog_name;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.rec_prog_memo = rec_prog_memo;
		this.step_item_list = step_item_list;
	}


	public RecProcessVO() {
		super();
	}

	
	

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getRec_prog_no() {
		return rec_prog_no;
	}


	public void setRec_prog_no(String rec_prog_no) {
		this.rec_prog_no = rec_prog_no;
	}


	public String getRec_prog_name() {
		return rec_prog_name;
	}


	public void setRec_prog_name(String rec_prog_name) {
		this.rec_prog_name = rec_prog_name;
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


	public String getRec_prog_memo() {
		return rec_prog_memo;
	}


	public void setRec_prog_memo(String rec_prog_memo) {
		this.rec_prog_memo = rec_prog_memo;
	}
	

	public String getStep_item_list() {
		return step_item_list;
	}


	public void setStep_item_list(String step_item_list) {
		this.step_item_list = step_item_list;
	}


	@Override
	public String toString() {
		return "RecProcessVO [rec_prog_no=" + rec_prog_no + ", rec_prog_name="
				+ rec_prog_name + ", writer=" + writer + ", write_date="
				+ write_date + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", enable_tf=" + enable_tf + ", version="
				+ version + ", rec_prog_memo=" + rec_prog_memo
				+ ", step_item_list=" + step_item_list + "]";
	}


	
	
	
}
