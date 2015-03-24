package rms.com.sys.service;

import java.util.List;

import rms.com.sys.vo.CodeDetailVO;
import rms.com.sys.vo.CodeGroupVO;

public interface CodeManageService {
	/**
	 * 코드그룹 조회
	 * @author lds
	 * @param null
	 * @return 코드그룹 목록
	 * */
	public List<CodeGroupVO> getCodeGroupListService()throws Exception;
	/**
	 * 코드그룹 삽입
	 * @author lds
	 * @param CodeGroupVO
	 * @return 반영된 row count
	 * */
	public int addCodeGroupService(CodeGroupVO inputCodeGroupVO)throws Exception;
	/**
	 * 코드그룹 수정
	 * @author lds
	 * @param CodeGroupVO
	 * @return 반영된 row count
	 * */
	public int modiCodeGroupService(CodeGroupVO inputCodeGroupVO)throws Exception;
	/**
	 * 코드그룹 삭제(enable false)
	 * @author lds
	 * @param group_code
	 * @return 반영된 row count
	 * */
	public int deleteCodeGroupService(String checkedValue, String modifier)throws Exception;
	/**
	 * 코드상세 삽입
	 * @author lds
	 * @param inputCodeDetailVO
	 * @return 반영된 row count
	 * */
	public int addCodeDetailService(CodeDetailVO inputCodeDetailVO)throws Exception;
	/**
	 * 코드상세 목록 조회
	 * @author lds
	 * @param null
	 * @return 코드상세 목록
	 * */
	public List<CodeDetailVO> getCodeDetailListService(String group_code)throws Exception;
	/**
	 * 코드상세 정보 수정 service
	 * @author lds
	 * @param inputCodeDetailVO
	 * @return 반영된 row count
	 * */
	public int modiCodeDetailService(CodeDetailVO inputCodeDetailVO)throws Exception;
	
	public int deleteCodeDetailService(String checkedValue, String modifier)throws Exception;
	
	public List<String> checkUnderItem(String checkedValue)throws Exception;
}
