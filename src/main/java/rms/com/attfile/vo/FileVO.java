package rms.com.attfile.vo;

public class FileVO {

	private String att_file_no;
	private String att_file_name;
	private String att_file_save_path;
	private String att_file_size;
	private String writer;
	private String write_date;
	private String modifier;
	private String modi_date;
	private String enable_tf;
	private String version;
	private String att_file_orig_name;
	private String att_file_extention;
	private String fileInfo;
	


	public FileVO(String att_file_no, String att_file_name,
			String att_file_save_path, String att_file_size, String writer,
			String write_date, String modifier, String modi_date,
			String enable_tf, String version, String att_file_orig_name,
			String att_file_extention, String fileInfo) {
		super();
		this.att_file_no = att_file_no;
		this.att_file_name = att_file_name;
		this.att_file_save_path = att_file_save_path;
		this.att_file_size = att_file_size;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.att_file_orig_name = att_file_orig_name;
		this.att_file_extention = att_file_extention;
		this.fileInfo = fileInfo;
	}


	public FileVO() {
		super();
	}


	public String getAtt_file_no() {
		return att_file_no;
	}


	public void setAtt_file_no(String att_file_no) {
		this.att_file_no = att_file_no;
	}


	public String getAtt_file_name() {
		return att_file_name;
	}


	public void setAtt_file_name(String att_file_name) {
		this.att_file_name = att_file_name;
	}


	public String getAtt_file_save_path() {
		return att_file_save_path;
	}


	public void setAtt_file_save_path(String att_file_save_path) {
		this.att_file_save_path = att_file_save_path;
	}


	public String getAtt_file_size() {
		return att_file_size;
	}


	public void setAtt_file_size(String att_file_size) {
		this.att_file_size = att_file_size;
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


	public String getAtt_file_orig_name() {
		return att_file_orig_name;
	}


	public void setAtt_file_orig_name(String att_file_orig_name) {
		this.att_file_orig_name = att_file_orig_name;
	}


	public String getAtt_file_extention() {
		return att_file_extention;
	}


	public void setAtt_file_extention(String att_file_extention) {
		this.att_file_extention = att_file_extention;
	}


	public String getFileInfo() {
		return fileInfo;
	}


	public void setFileInfo(String fileInfo) {
		this.fileInfo = fileInfo;
	}


	
	
	
	
}
