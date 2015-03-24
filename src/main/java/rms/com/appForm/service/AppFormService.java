package rms.com.appForm.service;

import java.util.List;

import rms.com.appForm.vo.AppFormVO;


public interface AppFormService {

	
	/**
	 * 지원서양식 목록조회 검색
	 * 
	 * @author tykim
	 * @since 2014-05-23
	 * */
	public List<AppFormVO> getAppFormList(String searchValue, String searchKey) throws Exception;
	
	
	/**
	 * 셀렉트박스에 들어갈 지원서양식 리스트
	 * 
	 * @author tykim
	 * @since 2014-05-28
	 * */
	public List<AppFormVO> getSelectAppFormList() throws Exception;
	
	
	
	
	
	/**
	 * 지원서양식 명, 메모 등록
	 * 
	 * @author tykim
	 * @since 2014-05-26
	 * */
	public void insertAppForm(AppFormVO appFormVO) throws Exception;
	
	
	
	
	
}
