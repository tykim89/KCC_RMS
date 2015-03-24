package rms.com.appmanage.vo;

import java.sql.Timestamp;
import java.util.List;


public class RecResultVO {
	
	String rec_res_no;
	
	/** 지원자 번호*/
	List<String> appUserList;
	
	String app_user_no;
	
	String app_user_name;
	
	/** 작성일 */
	Timestamp write_date;
	
	/** 채용공고 번호 */
	String rec_noti_no;	
	
	String rec_noti_title;

	/** 전형단계항목 */
	String stepItemName;
	
	String stepItemCode;
	
	/** 전형결과 */
	String resultName;
	
	String resultCode;
	

	/** 수정자 */
	String modifier;
	
	String admin_id;
	
	/** 수정일 */
	Timestamp modi_date;
	
	/** 버전 */
	int version;
	
	/** 전형일정 */
	String rec_sch_content;
	
	

	public RecResultVO() {
		super();
	}

	public String getRec_res_no() {
		return rec_res_no;
	}

	public void setRec_res_no(String rec_res_no) {
		this.rec_res_no = rec_res_no;
	}
//	/** 지원자 번호 Get*/
	public List<String> getAppUserList() {
		return appUserList;
	}
//	/** 지원자 번호 Set*/
	public void setAppUserList(List<String> appUserList) {
		this.appUserList = appUserList;
	}

	
	public String getApp_user_name() {
		return app_user_name;
	}

	public void setApp_user_name(String app_user_name) {
		this.app_user_name = app_user_name;
	}

	public String getApp_user_no() {
		return app_user_no;
	}

	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public String getRec_noti_no() {
		return rec_noti_no;
	}

	
	public String getRec_noti_title() {
		return rec_noti_title;
	}

	public void setRec_noti_title(String rec_noti_title) {
		this.rec_noti_title = rec_noti_title;
	}

	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}

	public String getStepItemName() {
		return stepItemName;
	}

	public void setStepItemName(String stepItemName) {
		this.stepItemName = stepItemName;
	}

	public String getStepItemCode() {
		return stepItemCode;
	}

	public void setStepItemCode(String stepItemCode) {
		this.stepItemCode = stepItemCode;
	}

	public String getResultName() {
		return resultName;
	}

	public void setResultName(String resultName) {
		this.resultName = resultName;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	
	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public Timestamp getModi_date() {
		return modi_date;
	}

	public void setModi_date(Timestamp modi_date) {
		this.modi_date = modi_date;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getRec_sch_content() {
		return rec_sch_content;
	}

	public void setRec_sch_content(String rec_sch_content) {
		this.rec_sch_content = rec_sch_content;
	}


	public RecResultVO(String rec_res_no, List<String> appUserList,
			String app_user_no, Timestamp write_date, String rec_noti_no,
			String stepItemName, String stepItemCode, String resultName,
			String resultCode, String modifier, Timestamp modi_date,
			int version, String rec_sch_content) {
		super();
		this.rec_res_no = rec_res_no;
		this.appUserList = appUserList;
		this.app_user_no = app_user_no;
		this.write_date = write_date;
		this.rec_noti_no = rec_noti_no;
		this.stepItemName = stepItemName;
		this.stepItemCode = stepItemCode;
		this.resultName = resultName;
		this.resultCode = resultCode;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.version = version;
		this.rec_sch_content = rec_sch_content;
	}

	
	@Override
	public String toString() {
		return "RecResultVO [rec_res_no=" + rec_res_no + ", appUserList="
				+ appUserList + ", app_user_no=" + app_user_no
				+ ", write_date=" + write_date + ", rec_noti_no=" + rec_noti_no
				+ ", stepItemName=" + stepItemName + ", stepItemCode="
				+ stepItemCode + ", resultName=" + resultName + ", resultCode="
				+ resultCode + ", modifier=" + modifier + ", modi_date="
				+ modi_date + ", version=" + version + ", rec_sch_content="
				+ rec_sch_content + "]";
	}


	
	
}
