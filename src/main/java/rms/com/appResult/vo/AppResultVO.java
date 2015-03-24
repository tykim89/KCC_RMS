package rms.com.appResult.vo;

import java.sql.Timestamp;

public class AppResultVO {
	   
	   private String rec_res_no;
	   
	   private String app_user_no;
	   
	   private String rec_noti_no;
	   
	   private String rec_res_code;
	  
	   private String step_item_code;
	   
	   private String rec_sch_content;

	public AppResultVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getRec_res_no() {
		return rec_res_no;
	}

	public void setRec_res_no(String rec_res_no) {
		this.rec_res_no = rec_res_no;
	}

	public String getApp_user_no() {
		return app_user_no;
	}

	public void setApp_user_no(String app_user_no) {
		this.app_user_no = app_user_no;
	}

	public String getRec_noti_no() {
		return rec_noti_no;
	}

	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}

	public String getRec_res_code() {
		return rec_res_code;
	}

	public void setRec_res_code(String rec_res_code) {
		this.rec_res_code = rec_res_code;
	}

	public String getStep_item_code() {
		return step_item_code;
	}

	public void setStep_item_code(String step_item_code) {
		this.step_item_code = step_item_code;
	}

	public String getRec_sch_content() {
		return rec_sch_content;
	}

	public void setRec_sch_content(String rec_sch_content) {
		this.rec_sch_content = rec_sch_content;
	}

	public AppResultVO(String rec_res_no, String app_user_no,
			String rec_noti_no, String rec_res_code, String step_item_code,
			String rec_sch_content) {
		super();
		this.rec_res_no = rec_res_no;
		this.app_user_no = app_user_no;
		this.rec_noti_no = rec_noti_no;
		this.rec_res_code = rec_res_code;
		this.step_item_code = step_item_code;
		this.rec_sch_content = rec_sch_content;
	}

	@Override
	public String toString() {
		return "AppResultVO [rec_res_no=" + rec_res_no + ", app_user_no="
				+ app_user_no + ", rec_noti_no=" + rec_noti_no
				+ ", rec_res_code=" + rec_res_code + ", step_item_code="
				+ step_item_code + ", rec_sch_content=" + rec_sch_content + "]";
	}
	   

}
