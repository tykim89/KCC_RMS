package rms.com.qna.qnafrq.vo;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;

public class DefaultVO implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**  
	 * @Class Name : SampleDefaultVO.java
	 * @Description : SampleDefaultVO Class
	 * @Modification Information  
	 * @
	 * @  수정일      수정자              수정내용
	 * @ ---------   ---------   -------------------------------
	 * @ 2009.03.16           최초생성
	 * 
	 * @author 개발프레임웍크 실행환경 개발팀
	 * @since 2009. 03.16
	 * @version 1.0
	 * @see
	 * 
	 *  Copyright (C) by MOPAS All right reserved.
	 */
	
	
	
		/** 검색조건 */
	    private String searchCondition = "";
	    
	    /** 검색Keyword */
	    private String searchKeyword = "";
	    
	    /** 검색사용여부 */
	    private String searchUseYn = "";
	    
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

	    
	    /** --------------------------------------*/
	    /** 검색조건 변수*/
		private String rec_year;
		private String career_div_code;
		private String state_code;
		private List<String> recFieldList =null;
		private String rec_field_name;
	    
		public DefaultVO() {
			super();
			// TODO Auto-generated constructor stub
		}

		public String getSearchCondition() {
			return searchCondition;
		}

		public void setSearchCondition(String searchCondition) {
			this.searchCondition = searchCondition;
		}

		public String getSearchKeyword() {
			return searchKeyword;
		}

		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}

		public String getSearchUseYn() {
			return searchUseYn;
		}

		public void setSearchUseYn(String searchUseYn) {
			this.searchUseYn = searchUseYn;
		}

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
	

		public String getRec_year() {
			return rec_year;
		}

		public void setRec_year(String rec_year) {
			this.rec_year = rec_year;
		}

		public String getCareer_div_code() {
			return career_div_code;
		}

		public void setCareer_div_code(String career_div_code) {
			this.career_div_code = career_div_code;
		}

		public String getState_code() {
			return state_code;
		}

		public void setState_code(String state_code) {
			this.state_code = state_code;
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


		public DefaultVO(String searchCondition, String searchKeyword,
				String searchUseYn, int pageIndex, int pageUnit, int pageSize,
				int firstIndex, int lastIndex, int recordCountPerPage,
				String rec_year, String career_div_code, String state_code,
				List<String> recFieldList, String rec_field_name) {
			super();
			this.searchCondition = searchCondition;
			this.searchKeyword = searchKeyword;
			this.searchUseYn = searchUseYn;
			this.pageIndex = pageIndex;
			this.pageUnit = pageUnit;
			this.pageSize = pageSize;
			this.firstIndex = firstIndex;
			this.lastIndex = lastIndex;
			this.recordCountPerPage = recordCountPerPage;
			this.rec_year = rec_year;
			this.career_div_code = career_div_code;
			this.state_code = state_code;
			this.recFieldList = recFieldList;
			this.rec_field_name = rec_field_name;
		}

		
		@Override
		public String toString() {
			return "DefaultVO [searchCondition=" + searchCondition
					+ ", searchKeyword=" + searchKeyword + ", searchUseYn="
					+ searchUseYn + ", pageIndex=" + pageIndex + ", pageUnit="
					+ pageUnit + ", pageSize=" + pageSize + ", firstIndex="
					+ firstIndex + ", lastIndex=" + lastIndex
					+ ", recordCountPerPage=" + recordCountPerPage
					+ ", rec_year=" + rec_year + ", career_div_code="
					+ career_div_code + ", state_code=" + state_code
					+ ", recFieldList=" + recFieldList + ", rec_field_name="
					+ rec_field_name + "]";
		}


		
		
}
