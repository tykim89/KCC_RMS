package rms.com.appmanage.service;

import java.util.List;

import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.qna.qnafrq.vo.DefaultVO;

public interface AppBoardService {
	
	/**
	    * 전체 입사지원서 리스트 조회 
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppBoardVO> allUserListService(AppUserSearchVO pagingVO) throws Exception;
	
	
	/**
	    * 검색조건에 해당하는 입사지원서 리스트 조회 
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppBoardVO> userListService(AppUserSearchVO appUserSearchVO) throws Exception;
	
	
	/**
	    * 전체 채용공고 가져오기
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppUserSearchVO> recNotiService() throws Exception;
	
	/**
	    * 전체 지원분야 가져오기
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppUserSearchVO> recFieldService() throws Exception;
	
	/**
	    * 신입경력구분 가져오기
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppUserSearchVO> careerDivService() throws Exception;
	
	/**
	    * 전형단계항목코드 가져오기
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppUserSearchVO> recStepService() throws Exception;
	
	/**
	    * 전형결과 코드 가져오기
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<AppUserSearchVO> recResService() throws Exception;
	
	/**
	    * 선택된 지원분야 가져오기
	    * 
	    * @author 선재희
	    * @since 2014-05-14
	    * */
	public List<String> selectField(String selectTarget) throws Exception;
	
	
	/**
	 * 글 총 갯수를 조회한다.
	 * 
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 */
	public int selectSampleListTotCnt(AppUserSearchVO pagingVO) throws Exception;

	public int selectListTotCnt(AppUserSearchVO pagingVO) throws Exception;

}
