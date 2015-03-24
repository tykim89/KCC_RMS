package rms.com.sys.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import rms.com.sys.service.UserService;
import rms.com.sys.vo.AdminVO;
import rms.com.sys.vo.BranchVO;
import rms.com.sys.vo.CompanyVO;
import rms.com.sys.vo.DefaultVO;
import rms.com.sys.vo.DeptVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	/***/
	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	/** 아이디 찾기
	 * @param AdminVO
	 * */
	@Override
	public String findIdService(AdminVO inputAdminVO) throws Exception{
		
		return userDAO.findIdDao(inputAdminVO);
	}
	/** 비밀번호 초기화
	 * @param AdminVO
	 * */
	@Override
	public int pwInitService(AdminVO inputAdminVO) throws Exception {
		return userDAO.pwInitDao(inputAdminVO);
	}
	/** 계정등록
	 * @param AdminVO
	 * */
	@Override
	public int addUserService(AdminVO inputAdminVO) throws Exception {
		return userDAO.addUserDao(inputAdminVO);
	}
	/** 중복확인
	 * @param admin_id
	 * */
	@Override
	public int checkOverlapService(String admin_id) throws Exception {
		return userDAO.checkOverlapDao(admin_id);
	}
	/** 기등록확인
	 * @param AdminVO
	 * */
	@Override
	public int checkPreUserService(AdminVO inputAdminVO) throws Exception {
		return userDAO.cehckPreUserDao(inputAdminVO);
	}
	/** 계정정보 수정
	 * @param AdminVO
	 * */
	@Override
	public int modiUserByAdminService(AdminVO inputAdminVO) throws Exception {
	
			return userDAO.modiUserByAdminDao(inputAdminVO);
		
	}
	/** 개인정보 수정
	 * @param AdminVO
	 * */
	@Override
	public int modiUserByUserService(AdminVO inputAdminVO) throws Exception {
		return userDAO.modiUserByUserDao(inputAdminVO);
	}
	/** 계정삭제
	 * @param AdminVO
	 * */
	@Override
	public int deleteUserService(AdminVO inputAdminVO) throws Exception {
		return userDAO.deleteUserDao(inputAdminVO);
	}
	/** 계정목록 조회
	 * @param AdminVO
	 * */
	@Override
	public List<AdminVO> getUserListService(DefaultVO pagingVO)
			throws Exception {
		return userDAO.getUserListDao(pagingVO);
	}
	/** 계정상세 조회
	 * @param AdminVO
	 * */
	@Override
	public AdminVO getUserDetailService(String admin_id) throws Exception {
		return userDAO.getUserDetailDao(admin_id);
	}
	@Override
	public List<CompanyVO> getCompanyListService() throws Exception {
		return userDAO.getCompanyListDao();
	}
	@Override
	public List<BranchVO> getBranchListService() throws Exception {
		return userDAO.getBranchListDao();
	}
	@Override
	public List<DeptVO> getDeptListService() throws Exception {
		return userDAO.getDeptListDao();
	}	
	 /**
		 * 글 총 갯수를 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return 글 총 갯수
		 * @exception
		 */
		@Override
	public int selectSampleListTotCnt(DefaultVO pagingVO) throws Exception {
			return userDAO.selectSampleListTotCnt(pagingVO);
	}

}
