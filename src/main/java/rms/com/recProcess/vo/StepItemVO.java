package rms.com.recProcess.vo;

import java.util.Date;
import java.util.List;

public class StepItemVO {

	private String group_code;
	private String detail_code;
	private String detail_code_name;
	private String sort_seq;
	private String writer;
	private Date write_date;
	private String modifier;
	private Date modi_date;
	private String enable_tf;
	private String version;
	private List<String> progStepList;
	private List<String> progStepList_2;
	


	public StepItemVO(String group_code, String detail_code,
			String detail_code_name, String sort_seq, String writer,
			Date write_date, String modifier, Date modi_date, String enable_tf,
			String version, List<String> progStepList,
			List<String> progStepList_2) {
		super();
		this.group_code = group_code;
		this.detail_code = detail_code;
		this.detail_code_name = detail_code_name;
		this.sort_seq = sort_seq;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.progStepList = progStepList;
		this.progStepList_2 = progStepList_2;
	}

	public StepItemVO() {
		super();
	}

	public String getGroup_code() {
		return group_code;
	}

	public void setGroup_code(String group_code) {
		this.group_code = group_code;
	}

	public String getDetail_code() {
		return detail_code;
	}

	public void setDetail_code(String detail_code) {
		this.detail_code = detail_code;
	}

	public String getDetail_code_name() {
		return detail_code_name;
	}

	public void setDetail_code_name(String detail_code_name) {
		this.detail_code_name = detail_code_name;
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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
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

	public List<String> getProgStepList() {
		return progStepList;
	}

	public void setProgStepList(List<String> progStepList) {
		this.progStepList = progStepList;
	}

	
	public List<String> getProgStepList_2() {
		return progStepList_2;
	}

	public void setProgStepList_2(List<String> progStepList_2) {
		this.progStepList_2 = progStepList_2;
	}

	
	@Override
	public String toString() {
		return "StepItemVO [group_code=" + group_code + ", detail_code="
				+ detail_code + ", detail_code_name=" + detail_code_name
				+ ", sort_seq=" + sort_seq + ", writer=" + writer
				+ ", write_date=" + write_date + ", modifier=" + modifier
				+ ", modi_date=" + modi_date + ", enable_tf=" + enable_tf
				+ ", version=" + version + ", progStepList=" + progStepList
				+ ", progStepList_2=" + progStepList_2 + "]";
	}

	
	
	
	
	
}
