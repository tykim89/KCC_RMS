package rms.com.check.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.check.vo.AssignedUserVO;
import rms.com.check.vo.CheckAssignVO;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForAdminVO;
import rms.com.check.vo.PagingForRecResVO;
import rms.com.sys.vo.AdminVO;


@Repository("checkAssignDAO")
public class CheckAssignDAO extends EgovComAbstractDAO{
	protected static final Log LOG = LogFactory
			.getLog(CheckAssignDAO.class);
	/**
	 * 진행중인 채용공고 가져오기
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<CheckAssignVO> getRecFieldList() throws Exception{
		return (List<CheckAssignVO>)list("checkAssignDAO.getRecFieldAction", null);
	}
	
	/**
	 * 채용공고에 맞는 지원자를 할당받은 검토자 리스트 가져오기
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<AdminVO> getUserListByRecField(String recFieldNo) {
		return (List<AdminVO>)list("checkAssignDAO.getChkUserListByRecFieldAction", recFieldNo);
	}
	
	/**
	 * 기본 검토자 ID를 유지하기 위해 Admin_id 리스트 저장
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<String> getStringByCheckUsrList(String recFieldNo) {
		return (List<String>)list("checkAssignDAO.getStringByCheckUsrListAction", recFieldNo);
	}
	
	/**
	 * 채용공고 눌렀을 때, 채용공고에 지원한 지원자 보여주기
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<AssignedUserVO> getBaseUserList(HashMap<String, Object> targetMap) throws Exception{
		
		return (List<AssignedUserVO>)list("checkAssignDAO.getBaseUserListAction", targetMap);
	}
	
	/**
	 * 검토자가 할당 받은 지원자리스트
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<AssignedUserVO> getDetailAssignList(HashMap<String, Object> targetMap) throws Exception{
		return (List<AssignedUserVO>) list("checkAssignDAO.getDetailAssignAction", targetMap);
	}
	
	/**
	 * 검토자가 할당 받은 지원자 리스트를 
	 * 구분자로 만들기
	 * 
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<String> getAssignUsrTarget(HashMap<String, Object> targetMap) throws Exception{
		return (List<String>) list("checkAssignDAO.getAssignUsrTargetAction", targetMap);
	}
	
	/**
	 * 해당 채용공고에 검토자가 할당하지 않은 지원자 리스트
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<AssignedUserVO> getDetailUnassignList(Map<String, Object> condition) throws Exception{
		
		return (List<AssignedUserVO>)list("checkAssignDAO.getDetailUnassignAction", condition);
	}
	
	/**
	 * 전체 검토자ID 가져오기
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<String> getAllChkUsrList() throws Exception{
		return (List<String>) list("checkAssignDAO.getAllChkUsrListAction", null);
	}
	
	/**
	 * 검토자 PopUp창에 필요한 검토자 리스트 가져오기 
	 * @author	선재희
	 * @since 	2014-06-21
	 */
	public List<AdminVO> getchkUsrList(PagingForAdminVO pagingVO) throws Exception{
		return (List<AdminVO>) list("checkAssignDAO.getchkUsrListAction", pagingVO);
	}
	
	public List<AssignedUserVO> getAddUnassignedUsr(Map<String, Object> condition) throws Exception{
		
		return (List<AssignedUserVO>)list("checkAssignDAO.getAddUnassignedUsrAction", condition);
	}
	
	public List<AssignedUserVO> getAddAssignedUsr(Map<String, Object> modifyCondition) throws Exception{
		return (List<AssignedUserVO>)list("checkAssignDAO.getAddAssignedUsrAction", modifyCondition);
	}
	
	public List<AssignedUserVO> getRemoveUnassignedUsr(Map<String, Object> condition) throws Exception{
		
		return (List<AssignedUserVO>)list("checkAssignDAO.getRemoveUnassignedUsrAction", condition);
	}
	
	public List<AssignedUserVO> getRemoveAssignedUsr(Map<String, Object> modifyCondition) throws Exception{
		return (List<AssignedUserVO>)list("checkAssignDAO.getRemoveAssignedUsrAction", modifyCondition);
	}
	
	public List<AdminVO> getCompanyList() throws Exception{
		return (List<AdminVO>) list("checkAssignDAO.getCompanyAction", null);
	}
	
	public List<AdminVO> getDeptList() throws Exception{
		return (List<AdminVO>) list("checkAssignDAO.getDeptAction", null);
	}
	
	public List<AdminVO> getPositionList() throws Exception{
		return (List<AdminVO>) list("checkAssignDAO.getPositionAction", null);
	}
	
	public List<AdminVO> getadminList(AdminVO adminVO) throws Exception{
		return (List<AdminVO>) list("checkAssignDAO.getAdminListAction", adminVO);
	}
	public int insertCheckUserList(Map<String, Object> condition) throws Exception{
		return (int) update("checkAssignDAO.getUserListByRecFieldAction", condition);
	}
	
	public List<AdminVO> getCheckUserListByRecField (String recFieldNo) throws Exception{
		return (List<AdminVO>) list("checkAssignDAO.getCheckUserListByRecField", recFieldNo);
	}
	
	public List<String> getCheckUserListByRecFieldAction (String recFieldNo) throws Exception{
		return (List<String>) list("checkAssignDAO.getCheckUserListByRecFieldAction", null);
	}
	
	
	public List<CheckResVO> getAppUserInfoList(Map<String, Object> condition) throws Exception{
		return (List<CheckResVO>) list("checkAssignDAO.userInfoListAction", condition);
	}
	
	
	
	public int countUnassign(String adminTarget) throws Exception{
		return (Integer) selectByPk("checkAssignDAO.countUnassignAction", adminTarget);
	}
	
	public int countAssign(String adminTarget) throws Exception{
		return (Integer) selectByPk("checkAssignDAO.countAssignAction", adminTarget);
	}
	
	public int updateCheckAssgin(List<CheckResVO> userInfoList) throws Exception{
		int cnt=0;
		
		for(CheckResVO obj : userInfoList)
		{
			update("checkAssignDAO.updateCheckAssginAction", obj);
			cnt ++;
		}
		return cnt;
	}
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
   public int selectSampleListTotCnt(PagingForAdminVO pagingVO) throws Exception{
	   return (Integer)getSqlMapClientTemplate().queryForObject("checkAssignDAO.selectSampleListTotCnt", pagingVO);
   }
   /**
	 * 해당공고별 검토자 리스트 조회
	 * @param 채용공고번호
	 * @return 채용공고에 해당하는 검토자 목록
	 * @exception
	 */
  public List<AdminVO> getCheckerListByNotiDao(String rec_noti_no) throws Exception{
	   return list("checkAssignDAO.getCheckerListbyNotiAction", rec_noti_no);
  }
  /**
	 * 해당공고별 검토자 삭제
	 * @param rec_noti_no, admin_id
	 * @return 삭제 결과
	 * @exception
	 */
	public int deleteCheckUserByRec(HashMap<String, Object> deleteTargetMap) throws Exception{
		   return update("checkAssignDAO.deleteCheckerByNotiAction", deleteTargetMap);
	}
	
	/**
	 * 해당공고별 할당받은 검토자 검색
	 * @param rec_noti_no, admin_id
	 * @return 할당받은 검토자 리스트
	 * @exception
	 */
	public List<String> checkCheckerList(HashMap<String, Object> deleteTargetMap) throws Exception{
		   return (List<String>) list("checkAssignDAO.checkCheckerAction", deleteTargetMap);
	}
	/**
	 * 할당된 지원자 리스트 초기화
	 * @param 
	 * @return 
	 * @exception
	 */
	public int deleteAppUserByRes(HashMap<String, Object> deleteTargetMap) throws Exception{
		   return update("checkAssignDAO.deleteResAction", deleteTargetMap);
	}
	
	/**
	 * 할당된 지원자 리스트 초기화
	 * @param 
	 * @return 
	 * @exception
	 */
	public int insertAppUserByRes(HashMap<String, Object> insertTargetMap) throws Exception{
		   return update("checkAssignDAO.insertCheckResAction", insertTargetMap);
	}
	
	/**
	 * 삭제할 할당 지원자와 검토자 값 가져오기
	 * @param rec_noti_no, admin_id
	 * @return 
	 * @exception
	 */
	public List<CheckResVO> getCheckResInfo(HashMap<String, Object> targetMap) throws Exception{
		   return (List<CheckResVO>) list("checkAssignDAO.getCheckResInfoAction", targetMap);
	}
	
	/**
	 * 지원자를 가지고 있는 검토자 삭제
	 * @param checkResVO, rec_noti_no
	 * @return 
	 * @exception
	 */
	public int deleteCheckerByUser(HashMap<String, Object> targetMap) throws Exception{
		LOG.info("DAOOOOOOOOOOOOO");
		return update("checkAssignDAO.deleteCheckResAction", targetMap);
	}
	
}
