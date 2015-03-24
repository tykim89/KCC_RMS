package rms.com.recNotice.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RecNoticeVO {
	
	private int no;
	private String rec_noti_no;
	private String rec_field_name;
	private String career_div_code;
	private String career_div_name;
	private String rec_prog_name;
	private String app_form_name;
	private Date rec_start_date;
	private Date rec_end_date;
	private Date announce_date;
	private Date check_start_date;
	private Date check_end_date;
	private String rec_noti_title;
	private String rec_noti_content;
	
	/* 첨부파일*/
	private String att_file_no;
	private String att_file_orig_name;
	private String att_file_name;
	private String att_file_size;
	private String att_file_save_path;
	private MultipartFile file;

	
	private String rec_year;
	private String state_code;
	private String hubmain_view_tf;
	private String main_view_tf;
	private String front_view_tf;
	private String hits;
	private String rec_field_no;
	private String aff_no;
	private String rec_prog_no;
	private String app_form_no;
	private String writer;
	private Date write_date;
	private String modifier;
	private Date modi_date;
	private String enable_tf;
	private String version;
	private List<String> recFieldList;
	
	/* 진행 상태 */
	private String ing;
	


	public RecNoticeVO(int no, String rec_noti_no, String rec_field_name,
			String career_div_code, String career_div_name,
			String rec_prog_name, String app_form_name, Date rec_start_date,
			Date rec_end_date, Date announce_date, Date check_start_date,
			Date check_end_date, String rec_noti_title,
			String rec_noti_content, String att_file_no,
			String att_file_orig_name, String att_file_name,
			String att_file_size, String att_file_save_path,
			MultipartFile file, String rec_year, String state_code,
			String hubmain_view_tf, String main_view_tf, String front_view_tf,
			String hits, String rec_field_no, String aff_no,
			String rec_prog_no, String app_form_no, String writer,
			Date write_date, String modifier, Date modi_date, String enable_tf,
			String version, List<String> recFieldList, String ing) {
		super();
		this.no = no;
		this.rec_noti_no = rec_noti_no;
		this.rec_field_name = rec_field_name;
		this.career_div_code = career_div_code;
		this.career_div_name = career_div_name;
		this.rec_prog_name = rec_prog_name;
		this.app_form_name = app_form_name;
		this.rec_start_date = rec_start_date;
		this.rec_end_date = rec_end_date;
		this.announce_date = announce_date;
		this.check_start_date = check_start_date;
		this.check_end_date = check_end_date;
		this.rec_noti_title = rec_noti_title;
		this.rec_noti_content = rec_noti_content;
		this.att_file_no = att_file_no;
		this.att_file_orig_name = att_file_orig_name;
		this.att_file_name = att_file_name;
		this.att_file_size = att_file_size;
		this.att_file_save_path = att_file_save_path;
		this.file = file;
		this.rec_year = rec_year;
		this.state_code = state_code;
		this.hubmain_view_tf = hubmain_view_tf;
		this.main_view_tf = main_view_tf;
		this.front_view_tf = front_view_tf;
		this.hits = hits;
		this.rec_field_no = rec_field_no;
		this.aff_no = aff_no;
		this.rec_prog_no = rec_prog_no;
		this.app_form_no = app_form_no;
		this.writer = writer;
		this.write_date = write_date;
		this.modifier = modifier;
		this.modi_date = modi_date;
		this.enable_tf = enable_tf;
		this.version = version;
		this.recFieldList = recFieldList;
		this.ing = ing;
	}


	public RecNoticeVO() {
		super();
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getRec_noti_no() {
		return rec_noti_no;
	}


	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}


	public String getRec_field_name() {
		return rec_field_name;
	}


	public void setRec_field_name(String rec_field_name) {
		this.rec_field_name = rec_field_name;
	}


	public String getCareer_div_code() {
		return career_div_code;
	}


	public void setCareer_div_code(String career_div_code) {
		this.career_div_code = career_div_code;
	}


	public String getRec_prog_name() {
		return rec_prog_name;
	}


	public void setRec_prog_name(String rec_prog_name) {
		this.rec_prog_name = rec_prog_name;
	}


	public String getApp_form_name() {
		return app_form_name;
	}


	public void setApp_form_name(String app_form_name) {
		this.app_form_name = app_form_name;
	}


	public Date getRec_start_date() {
		return rec_start_date;
	}


	public void setRec_start_date(Date rec_start_date) {
		this.rec_start_date = rec_start_date;
	}


	public Date getRec_end_date() {
		return rec_end_date;
	}


	public void setRec_end_date(Date rec_end_date) {
		this.rec_end_date = rec_end_date;
	}


	public Date getAnnounce_date() {
		return announce_date;
	}


	public void setAnnounce_date(Date announce_date) {
		this.announce_date = announce_date;
	}


	public Date getCheck_start_date() {
		return check_start_date;
	}


	public void setCheck_start_date(Date check_start_date) {
		this.check_start_date = check_start_date;
	}


	public Date getCheck_end_date() {
		return check_end_date;
	}


	public void setCheck_end_date(Date check_end_date) {
		this.check_end_date = check_end_date;
	}


	public String getRec_noti_title() {
		return rec_noti_title;
	}


	public void setRec_noti_title(String rec_noti_title) {
		this.rec_noti_title = rec_noti_title;
	}


	public String getRec_noti_content() {
		return rec_noti_content;
	}


	public void setRec_noti_content(String rec_noti_content) {
		this.rec_noti_content = rec_noti_content;
	}


	public String getAtt_file_no() {
		return att_file_no;
	}


	public void setAtt_file_no(String att_file_no) {
		this.att_file_no = att_file_no;
	}


	public String getatt_file_orig_name() {
		return att_file_orig_name;
	}


	public void setatt_file_orig_name(String att_file_orig_name) {
		this.att_file_orig_name = att_file_orig_name;
	}


	public String getAtt_file_size() {
		return att_file_size;
	}


	public void setAtt_file_size(String att_file_size) {
		this.att_file_size = att_file_size;
	}


	public String getRec_year() {
		return rec_year;
	}


	public void setRec_year(String rec_year) {
		this.rec_year = rec_year;
	}


	public String getState_code() {
		return state_code;
	}


	public void setState_code(String state_code) {
		this.state_code = state_code;
	}


	public String getHubmain_view_tf() {
		return hubmain_view_tf;
	}


	public void setHubmain_view_tf(String hubmain_view_tf) {
		this.hubmain_view_tf = hubmain_view_tf;
	}


	public String getMain_view_tf() {
		return main_view_tf;
	}


	public void setMain_view_tf(String main_view_tf) {
		this.main_view_tf = main_view_tf;
	}


	public String getFront_view_tf() {
		return front_view_tf;
	}


	public void setFront_view_tf(String front_view_tf) {
		this.front_view_tf = front_view_tf;
	}


	public String getHits() {
		return hits;
	}


	public void setHits(String hits) {
		this.hits = hits;
	}


	public String getRec_field_no() {
		return rec_field_no;
	}


	public void setRec_field_no(String rec_field_no) {
		this.rec_field_no = rec_field_no;
	}


	public String getAff_no() {
		return aff_no;
	}


	public void setAff_no(String aff_no) {
		this.aff_no = aff_no;
	}


	public String getRec_prog_no() {
		return rec_prog_no;
	}


	public void setRec_prog_no(String rec_prog_no) {
		this.rec_prog_no = rec_prog_no;
	}


	public String getApp_form_no() {
		return app_form_no;
	}


	public void setApp_form_no(String app_form_no) {
		this.app_form_no = app_form_no;
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


	public List<String> getRecFieldList() {
		return recFieldList;
	}


	public void setRecFieldList(List<String> recFieldList) {
		this.recFieldList = recFieldList;
	}


	public String getIng() {
		return ing;
	}


	public void setIng(String ing) {
		this.ing = ing;
	}


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}


	public String getAtt_file_orig_name() {
		return att_file_orig_name;
	}


	public void setAtt_file_orig_name(String att_file_orig_name) {
		this.att_file_orig_name = att_file_orig_name;
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


	public String getCareer_div_name() {
		return career_div_name;
	}


	public void setCareer_div_name(String career_div_name) {
		this.career_div_name = career_div_name;
	}



	
	

}