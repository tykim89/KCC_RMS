package rms.com.appmanage.vo;

public class AppBoardVO {

	/** 채용공고 제목*/
	private String rec_noti_title;
	
	/** 지원자 번호 */
	private String app_user_no;
	
	/** 지원자이름 */
	private String app_user_name;
	
	/** 지원자 작성일 */
	private String write_date;
	
	/** 검토자이름 */
	private String admin_name;
	
	/** 검토결과*/
	private String check_res_code;
	
	/** 검토결과총건수 */
	private int countAll=0;
	
	/** 검토합격건수 */
	private int countPass=0;
	
	/** 계열명 */
	private String aff_name;
	
	/** 신입경력구분 */
	private String career_div_code;

	/** 지원분야명 */
	private String rec_field_name;

	/** 지원자 이메일 주소 */
	private String app_user_email_addr;
	
	/** 지원자 생년월일 */
	private String app_user_birth;
	
	/** 지원자 거주지역 */
	private String app_user_area;
	
	/** 검토의견 */
	private String check_comment;
	
	/** 채용전형항목단계*/
	private String step_item_code;
	
	/** 전형결과 */
	private String rec_res_code;
	
	/** 전형일정여부 */
	private String enable_tf;
	
	/** 채용시작일 */
	private String rec_start_date;
	
	/** 채용마감일 */
	private String rec_end_date;
	
	/** 채용진행상태 */
	private String state_code;

	/** 전형일정 내용*/
	private String rec_sch_content;
	
	/**페이징 처리*/
	private int num;

	
	private String rec_noti_no;
	
	
	
	public String getRec_noti_no() {
		return rec_noti_no;
	}

	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getApp_user_no() {
		return app_user_no;
	}

	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}

	public String getStep_item_code() {
		return step_item_code;
	}

	public void setStep_item_code(String step_item_code) {
		this.step_item_code = step_item_code;
	}

	public String getEnable_tf() {
		return enable_tf;
	}

	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}
	
	public String getAff_name() {
		return aff_name;
	}

	public void setAff_name(String aff_name) {
		this.aff_name = aff_name;
	}

	public String getRec_field_name() {
		return rec_field_name;
	}

	public void setRec_field_name(String rec_field_name) {
		this.rec_field_name = rec_field_name;
	}
	
	public String getRec_sch_content() {
		return rec_sch_content;
	}

	public void setRec_sch_content(String rec_sch_content) {
		this.rec_sch_content = rec_sch_content;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getApp_user_name() {
		return app_user_name;
	}

	public void setApp_user_name(String app_user_name) {
		this.app_user_name = app_user_name;
	}

	public String getApp_user_email_addr() {
		return app_user_email_addr;
	}

	public void setApp_user_email_addr(String app_user_email_addr) {
		this.app_user_email_addr = app_user_email_addr;
	}

	public String getApp_user_birth() {
		return app_user_birth;
	}

	public void setApp_user_birth(String app_user_birth) {
		this.app_user_birth = app_user_birth;
	}

	public String getApp_user_area() {
		return app_user_area;
	}

	public void setApp_user_area(String app_user_area) {
		this.app_user_area = app_user_area;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getRec_noti_title() {
		return rec_noti_title;
	}

	public void setRec_noti_title(String rec_noti_title) {
		this.rec_noti_title = rec_noti_title;
	}


	public String getCheck_res_code() {
		return check_res_code;
	}

	public void setCheck_res_code(String check_res_code) {
		this.check_res_code = check_res_code;
	}

	public String getCareer_div_code() {
		return career_div_code;
	}

	public void setCareer_div_code(String career_div_code) {
		this.career_div_code = career_div_code;
	}

	public String getCheck_comment() {
		return check_comment;
	}

	public void setCheck_comment(String check_comment) {
		this.check_comment = check_comment;
	}

	public String getRec_res_code() {
		return rec_res_code;
	}

	public void setRec_res_code(String rec_res_code) {
		this.rec_res_code = rec_res_code;
	}

	public String getRec_start_date() {
		return rec_start_date;
	}

	public void setRec_start_date(String rec_start_date) {
		this.rec_start_date = rec_start_date;
	}

	public String getRec_end_date() {
		return rec_end_date;
	}

	public void setRec_end_date(String rec_end_date) {
		this.rec_end_date = rec_end_date;
	}

	public String getState_code() {
		return state_code;
	}

	public void setState_code(String state_code) {
		this.state_code = state_code;
	}


	public int getCountAll() {
		return countAll;
	}

	public void setCountAll(int countAll) {
		this.countAll = countAll;
	}

	public int getCountPass() {
		return countPass;
	}

	public void setCountPass(int countPass) {
		this.countPass = countPass;
	}

	@Override
	public String toString() {
		return "AppBoardVO [rec_noti_title=" + rec_noti_title
				+ ", app_user_no=" + app_user_no + ", app_user_name="
				+ app_user_name + ", rec_sch_content=" + rec_sch_content + "]";
	}
	
	
	
	
}
