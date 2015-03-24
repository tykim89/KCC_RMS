package rms.com.appmanage.vo;

public class TestResultVO {

	private String test_code;
	private String test_code_name;
	private String app_user_no;
	private String test_score;
	private String writer;
	private String write_date;
	private String modifier;
	private String modi_date;
	private String enable_tf;
	private String version;
	private String rec_noti_no;
	
	
	public TestResultVO(String test_code, String test_code_name,
			String app_user_no, String test_score, String writer,
			String write_date, String modifier, String modi_date,
			String enable_tf, String version, String rec_noti_no) {
		super();
		this.test_code = test_code;
		this.test_code_name = test_code_name;
		this.app_user_no = app_user_no;
		this.test_score = test_score;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.rec_noti_no = rec_noti_no;
	}


	public TestResultVO() {
		super();
	}


	public String getTest_code() {
		return test_code;
	}


	public void setTest_code(String test_code) {
		this.test_code = test_code;
	}


	public String getTest_code_name() {
		return test_code_name;
	}


	public void setTest_code_name(String test_code_name) {
		this.test_code_name = test_code_name;
	}


	public String getApp_user_no() {
		return app_user_no;
	}


	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}


	public String getTest_score() {
		return test_score;
	}


	public void setTest_score(String test_score) {
		this.test_score = test_score;
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


	public String getRec_noti_no() {
		return rec_noti_no;
	}


	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}


	@Override
	public String toString() {
		return "TestResultVO [test_code=" + test_code + ", test_code_name="
				+ test_code_name + ", app_user_no=" + app_user_no
				+ ", test_score=" + test_score + ", writer=" + writer
				+ ", write_date=" + write_date + ", modifier=" + modifier
				+ ", modi_date=" + modi_date + ", enable_tf=" + enable_tf
				+ ", version=" + version + ", rec_noti_no=" + rec_noti_no + "]";
	}
	
	
	
	
}
