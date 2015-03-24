package rms.com.appmanage.service;

import java.util.HashMap;
import java.util.List;

import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppUserDetailVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appmanage.vo.AppBaseInfoVO;
import rms.com.appmanage.vo.AppInfoVO;

public interface AppBoardDetailService {
	
	/**
	 * 입사지원서 상세조회
	 * 
	 * @author 선재희
	 * @since 2014-07-02
	 * @param app_user_id
	 * @return AppUserDetailVO
	 * @throws Exception
	 */
	AppUserDetailVO getAppUserInfoDetail(String app_user_id) throws Exception;
	
	
	AppUserVO getAppUserId(String app_user_id) throws Exception;
	
	/**
	 * 입사지원서 수정
	 * 
	 * @author 선재희
	 * @since 2014-07-02
	 * @param userInfoList, value
	 * @return int
	 * @throws Exception
	 */
	int updateAppUserResumeOfPsInfo(List<AppInfoVO> appInfoList, String app_user_no, String app_list_code) throws Exception;
	
	/**
	 * 구분자 나누기
	 * 
	 * @author 선재희
	 * @since 2014-07-03
	 * @param modifyTarget
	 * @return
	 * @throws Exception
	 */
	public List<String> divdeUserTarget(String modifyTarget) throws Exception;

	/**
	 * 테스트뭐냐그거
	 * 
	 * @author 선재희
	 * @since 2014-07-03
	 * @param modifyTarget
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, List<List<AppItemContentVO>>> getAppUserDetailService(AppInfoVO inputAppInfoVO, List<AppItemContentVO> formItemList)throws Exception;
	/**
	 * @author 이동선
	 * @param	app_user_no(지원자번호)
	 * @return	양식별 구성사항 목록
	 * */
	public List<AppItemContentVO> getFormItemList(String app_user_no)throws Exception;
	
    /**
     * 지원자 사진 가져오기
     * 
     * @author tykim
     * @return 
     * @since 2014-07-08
     * */
	public AppUserVO getImage(String app_user_no) throws Exception;
	
	/**
	 * 지원자의 기본정보 로드
	 */
	public AppBaseInfoVO getAppBaseInfoService(String app_user_no)throws Exception;
}
