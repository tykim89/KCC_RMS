package rms.com.sys.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.sys.vo.AdminVO;
import rms.com.sys.vo.BranchVO;
import rms.com.sys.vo.CompanyVO;
import rms.com.sys.vo.DefaultVO;
import rms.com.sys.vo.DeptVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


@Repository("userDAO")
public class UserDAO extends EgovComAbstractDAO{
	protected static final Log LOG = LogFactory.getLog(UserDAO.class);
	/**아이디 찾기 DAO
	 * */
	public String findIdDao(AdminVO inputAdminVO){
		return (String)selectByPk("userDAO.findIdAction", inputAdminVO);
	}
	/**비밀번호 초기화 DAO
	 * */
	public int pwInitDao(AdminVO inputAdminVO){
		return update("userDAO.pwInitAction", inputAdminVO);
	}
	/**계정등록 DAO
	 * */
	public int addUserDao(AdminVO inputAdminVO){
		return update("userDAO.addUserAction", inputAdminVO);
	}
	/**아이디 중복검사 DAO
	 * */
	public int checkOverlapDao(String admin_id){
		return (Integer) selectByPk("userDAO.checkOverlapAction", admin_id);
	}
	/**사용자 기등록 여부검사 DAO
	 * */
	public int cehckPreUserDao(AdminVO inputAdminVO){
		return (Integer)selectByPk("userDAO.checkPreUserAction", inputAdminVO);
	}
	/**관리자에의한 계정 수정 DAO
	 * */
	public int modiUserByAdminDao(AdminVO inputAdminVO){
		return update("userDAO.modiUserByAdminAction", inputAdminVO);
	}
	/**사용자에의한 개인정보 수정 DAO
	 * */
	public int modiUserByUserDao(AdminVO inputAdminVO){
		return update("userDAO.modiUserByUserAction", inputAdminVO);
	}
	/**계정 삭제 DAO
	 * */
	public int deleteUserDao(AdminVO inputAdminVO){
		return update("userDAO.deleteUserAction", inputAdminVO);
	}
	/**계정 검색 목록 조회 DAO
	 * */
	public List<AdminVO> getUserListDao(DefaultVO pagingVO){
	
		return list("userDAO.getUserListAction", pagingVO);
	}
	/**계정 상세 정보 조회 DAO
	 * */
	public AdminVO getUserDetailDao(String admin_id){
		return (AdminVO)selectByPk("userDAO.getUserDetailAction", admin_id);
	}
	/**회사 목록 조회 DAO
	 * */
	public List<CompanyVO> getCompanyListDao(){
		return list("userDAO.getCompanyListAction", null);
	}
	/**지사 목록 조회 DAO
	 * */
	public List<BranchVO> getBranchListDao(){
		return list("userDAO.getBranchListAction", null);
	}
	/**부서 목록 조회 DAO
	 * */
	public List<DeptVO> getDeptListDao(){
		return list("userDAO.getDeptListAction", null);
	}
	public int checkVersionDao(String admin_id){
		return (Integer) selectByPk("userDAO.checkVersionAction", admin_id);
	}
	 /**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(DefaultVO pagingVO) {
		return (Integer)getSqlMapClientTemplate().queryForObject("userDAO.selectSampleListTotCnt", pagingVO);
	}

}
