package rms.com.check.service;

import java.util.List;


import rms.com.check.vo.AssignedUserVO;
import rms.com.check.vo.CheckAssignVO;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForAdminVO;
import rms.com.check.vo.PagingForRecResVO;
import rms.com.sys.vo.AdminVO;

public interface CheckAssignService {
	
	/**
	 * 진행중인 채용공고 리스트 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-02
	 */
	public List<CheckAssignVO> getRecField() throws Exception;
	
	/**
	 * 선택된 채용공고에 검토를 맡은 검토자 리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-20
	 */
	public List<AdminVO> getUserListByRecField(String recFieldNo) throws Exception;
	
	/**
	 * 검토자 아이디를 담은 리스트를 구분자 지어 놓기
	 * 
	 * @author 선재희
	 * @since 2014-06-21
	 */
	public String getStringByCheckUsrList(String recFieldNo) throws Exception;
	
	/**
	 * 채용공고 눌렀을 때, 채용공고에 지원한 지원자 보여주기
	 * 
	 * @author 선재희
	 * @since 2014-06-21
	 */
	public List<AssignedUserVO> getBaseUserList(String recFieldNo, String targetString, String admin_id) throws Exception;
	
	/**
	 * 검토자에 할당된 지원자 리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-20
	 */
	public List<AssignedUserVO> getDetailAssignList(String adminTarget, String rec_noti_no) throws Exception;
	
	/**
	 * 검토자에 할당된 지원자 리스트
	 * 구분자 지어서 스트링으로 받아오기
	 * 
	 * @author 선재희
	 * @since 2014-06-20
	 */
	public String getAssignUsrTarget(String adminTarget, String rec_noti_no) throws Exception;
	
	/**
	 * 검토자 추가버튼을 눌렀을 때 서비스
	 * 
	 * @author 선재희
	 * @since 2014-06-23
	 */
	public List<AdminVO> basicAdminListService(PagingForAdminVO pagingVO) throws Exception;
	
	/**
	 * 모든 검토자ID 리스트 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-23
	 */
	public List<String> getAllChkUsrList() throws Exception;
	
	/**
	 * 검색조건에 맞는 검토자리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-23
	 */
	public List<AdminVO> adminListService(AdminVO adminVO) throws Exception;

	/**
	 * 해당 채용공고의 미할당된 지원자 가져오기
	 * 추가버튼 눌렀을 때, 미할당된 지원자 리스트 변화
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public List<AssignedUserVO> getAddUnassignedUsrList(String recFieldNo, String modifyTarget, String adminTarget) throws Exception;
	
	/**
	 * 해당 채용공고의 미할당된 지원자 가져오기
	 * 제거버튼 눌렀을 때, 미할당된 지원자 리스트 변화
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public List<AssignedUserVO> getRemoveUnassignedUsrList(String recFieldNo, String modifyTarget) throws Exception;
	
	/**
	 * 할당된 지원자 보여주기
	 * 추가버튼 눌렀을 때, 할당된 지원자 리스트 변화
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public List<AssignedUserVO> getAddAssignedUsrList(String modifyTarget) throws Exception;
	
	/**
	 * 할당된 지원자 보여주기
	 * 제거버튼 눌렀을 때, 할당된 지원자 리스트 변화
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public List<AssignedUserVO> getRemoveAssignedUsrList(String modiTarget) throws Exception;
	
	/**
	 * 구분자 제거
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public List<String> divdeUserTarget(String modifyTarget) throws Exception;
	
	/**
	 * 전체리스트에서 특정리스트 빼기
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public List<String> substractTarget(String checkUsrTarget) throws Exception;
	
	/**
	 * 리스트를 스트링타입으로 바꾸기
	 * 
	 * @author 선재희
	 * @since 2014-06-03
	 */
	public String makeStringbyList(List<String> target) throws Exception;
	
	/**
	 * 회사 리스트 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-10
	 */
	public List<AdminVO> getCompany() throws Exception;
	
	/**
	 * 채용공고별검토자 테이블에 검토자 정보 insert
	 * 
	 * @author 선재희
	 * @since 2014-06-24
	 */
	public int insertCheckUserList(String adminTarget, String recFieldNo, String writer) throws Exception;
	
	/**
	 * 검토자리스트 Ajax에 담을 리스트 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-24
	 */
	public List<AdminVO> getCheckUserListByRecField(String recFieldNo) throws Exception;
	
	/**
	 * 가지고 다닐 검토자 ID 리스트 
	 * 
	 * @author 선재희
	 * @since 2014-06-24
	 */
	public String findCheckUserByRecField(String recFieldNo) throws Exception;
	
	public List<AdminVO> getDept() throws Exception;
	
	public List<AdminVO> getPosition() throws Exception;
	
	
	
	public List<CheckResVO> getAppUserInfo(List<String> userList) throws Exception;
	
	public int updateCheckAssginService(String addTarget, String checkUsrTarget) throws Exception;
	
	
	
	public int countUnassignList(String adminTarget) throws Exception;
	
	public int countAssignList(String adminTarget) throws Exception;
	
	public List<AssignedUserVO> getDetailUnassignList(String recFieldNo, String adminTarget) throws Exception;
	/**
	 * 페이징 번호 받아오기
	 * 
	 * @author 선재희
	 * @since 2014-06-18
	 */
	public int selectSampleListTotCnt(PagingForAdminVO pagingVO) throws Exception;
	/**
	 *채용공고별 검토자 목록 조회
	 * @author 이동선
	 * @since 2014-06-25
	 */
	public List<AdminVO> getCheckerListByNotiService(String rec_noti_no) throws Exception;
	/**
	 *채용공고별 검토자 삭제
	 * @author 이동선
	 * @since 2014-06-25
	 */
	public int deleteCheckerByNoti(String rec_noti_no, String deleteTarget) throws Exception;
	
	/**
	 *해당공고별 할당받은 검토자 검색
	 * @author 이동선
	 * @since 2014-06-25
	 */
	public List<String> checkCheckerList(String rec_noti_no, String deleteTarget) throws Exception;
	
	public int deleteCheckAppByRes(String rec_noti_no, String admin_id) throws Exception;
	
	public int insertCheckAppByRes(CheckResVO inputCheckResVO, String insertTarget)throws Exception;
	
	/**
	 * 할당받은 지원자, 검토자 정보 검색
	 * @author 선재희
	 * @since 2014-06-27
	 */
	public List<CheckResVO> getCheckResInfo(String rec_noti_no, String adminTarget)throws Exception;
	
	/**
	 * 지원자를 가지고 있는 검토자 삭제
	 * @author 선재희
	 * @since 2014-06-27
	 */
	public int deleteCheckRes(String rec_noti, String deleteTarget)throws Exception;
}
