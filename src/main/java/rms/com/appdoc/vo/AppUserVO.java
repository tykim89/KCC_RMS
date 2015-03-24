package rms.com.appdoc.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class AppUserVO {
	
	   private String app_user_no;
	   
	   private String app_user_name;
	   
	   private String app_user_email_addr;
	   
	   private String app_user_pw;
	   
	   private Timestamp write_date;
	   
	   private String modifier;
	   
	   private String enable_tf;
	   
	   private int version;
	   
	   private String rec_noti_no;

	   private String final_submit_tf;
	   
	   
	   /**사진첨부파일*/
	   private MultipartFile imageFile;
	   private String att_file_no;
	   private String att_file_name;
	   private String att_file_orig_name;
	   private String att_file_save_path;
	   private String att_file_extention;
	   
	   
		public AppUserVO() {
			super();
		}

		public AppUserVO(String app_user_no, String app_user_name,
				String app_user_email_addr, String app_user_pw,
				Timestamp write_date, String modifier, String enable_tf,
				int version, String rec_noti_no, String final_submit_tf,
				MultipartFile imageFile, String att_file_no,
				String att_file_name, String att_file_orig_name,
				String att_file_save_path, String att_file_extention) {
			super();
			this.app_user_no = app_user_no;
			this.app_user_name = app_user_name;
			this.app_user_email_addr = app_user_email_addr;
			this.app_user_pw = app_user_pw;
			this.write_date = write_date;
			this.modifier = modifier;
			this.enable_tf = enable_tf;
			this.version = version;
			this.rec_noti_no = rec_noti_no;
			this.final_submit_tf = final_submit_tf;
			this.imageFile = imageFile;
			this.att_file_no = att_file_no;
			this.att_file_name = att_file_name;
			this.att_file_orig_name = att_file_orig_name;
			this.att_file_save_path = att_file_save_path;
			this.att_file_extention = att_file_extention;
		}


		public String getApp_user_no() {
			return app_user_no;
		}

		public void setApp_user_no(String app_user_no) {
			this.app_user_no = app_user_no;
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

		public String getApp_user_pw() {
			return app_user_pw;
		}

		public void setApp_user_pw(String app_user_pw) {
			this.app_user_pw = app_user_pw;
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

		public String getRec_noti_no() {
			return rec_noti_no;
		}

		public void setRec_noti_no(String rec_noti_no) {
			this.rec_noti_no = rec_noti_no;
		}

		public String getFinal_submit_tf() {
			return final_submit_tf;
		}

		public void setFinal_submit_tf(String final_submit_tf) {
			this.final_submit_tf = final_submit_tf;
		}

		public MultipartFile getImageFile() {
			return imageFile;
		}

		public void setImageFile(MultipartFile imageFile) {
			this.imageFile = imageFile;
		}

		public String getAtt_file_no() {
			return att_file_no;
		}

		public void setAtt_file_no(String att_file_no) {
			this.att_file_no = att_file_no;
		}

		public String getAtt_file_save_path() {
			return att_file_save_path;
		}

		public void setAtt_file_save_path(String att_file_save_path) {
			this.att_file_save_path = att_file_save_path;
		}


		public String getAtt_file_name() {
			return att_file_name;
		}


		public void setAtt_file_name(String att_file_name) {
			this.att_file_name = att_file_name;
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
		
		
		
		@Override
		public String toString() {
			return "AppUserVO [app_user_no=" + app_user_no + ", app_user_name="
					+ app_user_name + ", app_user_email_addr="
					+ app_user_email_addr + ", app_user_pw=" + app_user_pw
					+ ", write_date=" + write_date + ", modifier=" + modifier
					+ ", enable_tf=" + enable_tf + ", version=" + version
					+ ", rec_noti_no=" + rec_noti_no + ", final_submit_tf="
					+ final_submit_tf + ", imageFile=" + imageFile
					+ ", att_file_no=" + att_file_no + ", att_file_name="
					+ att_file_name + ", att_file_orig_name="
					+ att_file_orig_name + ", att_file_save_path="
					+ att_file_save_path + ", att_file_extention="
					+ att_file_extention + "]";
		}

		
		

	   

}
