package rms.com.appForm.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.appForm.vo.AppFormVO;


@Repository("appFormDAO")
public class AppFormDAO extends EgovComAbstractDAO{

	
	/**
	 * 지원서양식 목록조회 검색
	 * 
	 * @author tykim
	 * @since 2014-05-23
	 * */
	public List<AppFormVO> AppFormList(String searchValue, String searchKey) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("searchValue", searchValue);
		map.put("searchKey", searchKey);
		
		return list("appFormList", map);
		
	}
	
	
	/**
	 * 셀렉트박스에 들어갈 지원서양식 리스트
	 * 
	 * @author tykim
	 * @since 2014-05-28
	 * */
	public List<AppFormVO> SelectAppFormList() throws Exception {
		return list("selectAppFormList", null);
	}

	
	
	
	/**
	 * 지원서양식 명, 메모 등록
	 * 
	 * @author tykim
	 * @since 2014-05-26
	 * */
	public void AppFormInsert(AppFormVO appFormVO) throws Exception {
		update("appFormInsert", appFormVO);
	}
	
	
	
	
	
}
