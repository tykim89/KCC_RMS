package rms.com.check.service;

import java.util.List;

import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForRecResVO;
import rms.com.jal.vo.RecFieldVO;
import rms.com.recNotice.vo.RecNoticeVO;
import rms.com.sys.vo.CodeDetailVO;

public interface CheckResultService {

	/**
	 * 진행중인 채용공고 리스트 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-13
	 */
	public List<RecFieldVO> getRecField() throws Exception;
	
	/**
	 * 신입경력구분코드 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-13
	 */
	public List<CodeDetailVO> getCareerDiv() throws Exception;
	
	/**
	 * 검토결과코드 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-13
	 */
	public List<CodeDetailVO> getCheckRes() throws Exception;
	
	/**
	 * 할당받은 지원자 리스트 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-13
	 */
	public List<CheckResVO> getAppUserList(PagingForRecResVO pagingVO) throws Exception;
	
	/**
	 * 페이징 번호 받아오기
	 * 
	 * @author 선재희
	 * @since 2014-06-18
	 */
	public int selectSampleListTotCnt(PagingForRecResVO pagingVO) throws Exception;
	/**
	 * 로그인한 검토자의 해당되는 채용공고목록 가져오기
	 * 
	 * @author 이동선
	 * @since 2014-06-23
	 */
	public List<RecNoticeVO> getRecNotiListForAdmin(String admin_id) throws Exception;
	/**
	 * 검토결과 등록/수정
	 * 
	 * @author 이동선
	 * @since 2014-06-23
	 */
	public int updateCheckResult(String appUserString, CheckResVO inputCheckResVO)throws Exception;
	/**
	 *검토자별 보류순위 조회
	 *@author 이동선
	 *
	 * */
	public List<CheckResVO> getholdrankingByCheckerService(String admin_id, String rec_noti_no)throws Exception;
	/**
	 *검토자리스트 엑셀변환목록 조회
	 *@author 이동선
	 *
	 * */
	public List<CheckResVO> getReportToExcelService(PagingForRecResVO pagingVO)throws Exception;
	
	public List<String> checkedValueToList(String currentHoldRanking)throws Exception;
	
	/**
	 * 보류순위 갱신
	 * */
	public int renewHoldRanking(String holdRanking, CheckResVO chkResVO)throws Exception;
	
	/**
	 * 코멘트 등록/수정
	 * */
	public int updateCheckComment(CheckResVO chkVO)throws Exception;
	/**
	 * 코멘트 조회
	 * */
	public CheckResVO getCheckComment(CheckResVO chkVO)throws Exception;
}
