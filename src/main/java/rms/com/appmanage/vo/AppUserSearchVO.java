package rms.com.appmanage.vo;

import java.io.Serializable;
import java.util.List;

public class AppUserSearchVO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * @Class Name : SampleDefaultVO.java
	 * @Description : SampleDefaultVO Class
	 * @Modification Information @ @ 수정일 수정자 수정내용 @ --------- ---------
	 *               ------------------------------- @ 2009.03.16 최초생성
	 * 
	 * @author 개발프레임웍크 실행환경 개발팀
	 * @since 2009. 03.16
	 * @version 1.0
	 * @see Copyright (C) by MOPAS All right reserved.
	 */

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;

	
	
	/*///////////////////*/
	/*/// 검 색 조 건 ///*/
	/*///////////////////*/
	
	/** 지원분야 */
	private List<String> recFieldList;

	/** 지원분야 */
	private String rec_field_name;

	/** 신입경력구분 코드 */
	private String career_div_code;

	/** 신입경력구분 이름 */
	private String career_div_name;

	/** 전형단계항목 코드 */
	private String rec_step_code;

	/** 전형단계항목 이름 */
	private String rec_step_name;

	/** 전형결과항목 코드 */
	private String rec_res_code;

	/** 전형결과항목 이름 */
	private String rec_res_name;

	/** 지원자 이름 */
	private String app_user_name;

	/** 지원자 번호 */
	private String app_user_no;

	/** 채용공고 제목 */
	private String rec_noti_title;
	
	/** 채용공고 번호 */
	private String rec_noti_no;

	/** 입사지원일시 시작일 */
	private String start_date;

	/** 입사지원일시 종료일 */
	private String end_date;

	/** 거주지역 */
	private String area;

	/** 일정여부 */
	private String enable_tf;

	/** 조건 selectKey */
	private String searchKey;

	/** 조건값 selectValue */
	private String searchValue;
	

	
	
	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<String> getRecFieldList() {
		return recFieldList;
	}

	public void setRecFieldList(List<String> recFieldList) {
		this.recFieldList = recFieldList;
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

	public String getCareer_div_name() {
		return career_div_name;
	}

	public void setCareer_div_name(String career_div_name) {
		this.career_div_name = career_div_name;
	}

	public String getRec_step_code() {
		return rec_step_code;
	}

	public void setRec_step_code(String rec_step_code) {
		this.rec_step_code = rec_step_code;
	}

	public String getRec_step_name() {
		return rec_step_name;
	}

	public void setRec_step_name(String rec_step_name) {
		this.rec_step_name = rec_step_name;
	}

	public String getRec_res_code() {
		return rec_res_code;
	}

	public void setRec_res_code(String rec_res_code) {
		this.rec_res_code = rec_res_code;
	}

	public String getRec_res_name() {
		return rec_res_name;
	}

	public void setRec_res_name(String rec_res_name) {
		this.rec_res_name = rec_res_name;
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

	public String getRec_noti_title() {
		return rec_noti_title;
	}

	public String getRec_noti_no() {
		return rec_noti_no;
	}

	public void setRec_noti_no(String rec_noti_no) {
		this.rec_noti_no = rec_noti_no;
	}

	public void setRec_noti_title(String rec_noti_title) {
		this.rec_noti_title = rec_noti_title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getEnable_tf() {
		return enable_tf;
	}

	public void setEnable_tf(String enable_tf) {
		this.enable_tf = enable_tf;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

}
