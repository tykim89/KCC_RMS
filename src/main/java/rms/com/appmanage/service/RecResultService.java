package rms.com.appmanage.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.RecResultVO;
import rms.com.sys.vo.AdminVO;

public interface RecResultService {
	
	/**
	 * 전형항목단계/전형결과 화면 띄우기 
	 * 
	 * @author 선재희
	 * @since 2014-05-26
	 */
	public List<String> actionStepItemService(String app_user_no) throws Exception;
	
	/**
	 * 전형결과 데이터 가져 오기
	 * 
	 * @author 선재희
	 * @since 2014-05-27
	 */
	public List<String> actionRecResultService() throws Exception;
	
	/**
	 * 지원자 구분자 없애기
	 * 
	 * @author 선재희
	 * @param selectUsrTarget 
	 * @since 2014-05-26
	 */
	public List<String> checkUser(String selectUsrTarget) throws Exception;
	
	/**
	 * 전형단계항목, 전형결과 구분자 없애기
	 */
	public List<String> checkResult(String updateResultTarget) throws Exception;
	
	/**
	 * 해당 지원자의 전형단계항목, 전형결과 등록/수정 
	 */
	public int updateResult(RecResultVO recResultVO) throws Exception;
	
	/**
	 * 전형일정 등록/수정
	 * */
	public void updateRecSch(RecResultVO recResultVO, AdminVO adminVO, HttpSession session) throws Exception;
	
	/**
	 * 전형일정 조회
	 * @param resultVO
	 * @return
	 * @throws Exception
	 */
	public RecResultVO getScheContent(RecResultVO resultVO) throws Exception;
	
	/**
	 * 전형일정 수정, 삭제
	 * 
	 */
	public int updateScheContent(RecResultVO resultVO) throws Exception;
	
	
}
