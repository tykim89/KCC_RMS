package rms.com.sys.service;

import java.util.List;

import rms.com.sys.vo.AdminVO;
import rms.com.sys.vo.BranchVO;
import rms.com.sys.vo.CompanyVO;
import rms.com.sys.vo.DefaultVO;
import rms.com.sys.vo.DeptVO;
/**
 * @author lds
 *
 */
public interface UserService{
	/**
	 * ID찾기
	 * */
	public String findIdService(AdminVO inputAdminVO) throws Exception;
	/**
	 *  pw초기화
	 * */
	public int pwInitService(AdminVO inputAdminVO) throws Exception;
	/**
	 * 계정등록
	 * */
	public int addUserService(AdminVO inputAdminVO) throws Exception;
	/**
	 * 중복확인
	 * */
	public int checkOverlapService(String admin_id) throws Exception;
	/**
	 * 기등록확인
	 * */
	public int checkPreUserService(AdminVO inputAdminVO) throws Exception;
	/**
	 * 계정정보 수정
	 * */
	public int modiUserByAdminService(AdminVO inputAdminVO) throws Exception;
	/**
	 * 개인정보 수정
	 * */
	public int modiUserByUserService(AdminVO inputAdminVO) throws Exception;
	/**
	 * 계정 삭제
	 * */
	public int deleteUserService(AdminVO inputAdminVO) throws Exception;
	/**
	 * 계정목록 조회
	 * */
	public List<AdminVO> getUserListService(DefaultVO pagingVO) throws Exception;
	/**
	 * 계정상세조회
	 * */
	public AdminVO getUserDetailService(String admin_id) throws Exception;
	/**회사목록조회
	 * */
	public List<CompanyVO> getCompanyListService()throws Exception;
	/**지사목록조회
	 * */
	public List<BranchVO> getBranchListService()throws Exception;
	/**부서목록조회
	 * */
	public List<DeptVO> getDeptListService()throws Exception;
	/**페이징 위한 검색목록 총 갯수
	 * *?
	 */
	public int selectSampleListTotCnt(DefaultVO pagingVO) throws Exception;
}
