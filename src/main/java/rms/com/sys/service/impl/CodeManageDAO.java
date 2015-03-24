package rms.com.sys.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.sys.vo.CodeDetailVO;
import rms.com.sys.vo.CodeGroupVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("codeManageDAO")
public class CodeManageDAO extends EgovComAbstractDAO{
	
	protected static final Log LOG = LogFactory.getLog(CodeManageDAO.class);
	
	public List<CodeGroupVO> getCodeGroupListDao()throws Exception{
		return list("codeManageDAO.getCodeGroupListAction", null);
	}
	
	public int groupCodeOverlapCheckDao(String group_code)throws Exception{
		return (Integer) selectByPk("codeManageDAO.addCodeGroupAction.checkOverlap", group_code);
	}
	
	public int addCodeGroupDao(CodeGroupVO inputCodeGroupVO)throws Exception{
		return update("codeManageDAO.addCodeGroupAction", inputCodeGroupVO);
	}
	
	public int modiCodeGroupDao(CodeGroupVO inputCodeGroupVO)throws Exception{
		return update("codeManageDAO.modiCodeGroupAction", inputCodeGroupVO);
	}
	
	public int deleteCodeGroupDao(HashMap<String, Object> deleteTarget)throws Exception{
		
		return update("codeManageDAO.deleteCodeGroupAction", deleteTarget);
	}
	
	public List<String> checkItemExist(List<String> groupCodeList)throws Exception{
		return list("codeManageDAO.deleteCodeGroupAction.checkItemExist", groupCodeList);
	}
	
	public int addCodeDetailDao(CodeDetailVO inputCodeDetailVO)throws Exception{
		return update("codeManageDAO.addCodeDetailAction", inputCodeDetailVO);
	}
	
	public int detailCodeOverlapCheckDao(String detail_code)throws Exception{
		return (Integer) selectByPk("codeManageDAO.addCodeDetailAction.checkCodeOverlap", detail_code);
	}
	
	public List<CodeDetailVO> getCodeDetailListDao(String group_code)throws Exception{
		return list("codeManageDAO.getCodeDetailAction", group_code);
	}
	/**코드상세 수정
	 * 코드상세 정보 수정을 위한 DAO
	 * @author lds
	 * @param inputCodeDetailVO
	 * @return 반영된 row count
	 * */
	public int modiCodeDetailDao(CodeDetailVO inputCodeDetailVO)throws Exception{
		return update("codeManageDAO.modiCodeDetailAction", inputCodeDetailVO);
	}
	/**코드상세 삭제(enable false)
	 * 코드상세 정보 삭제를 위한 DAO
	 * @author lds
	 * @param 삭제할 코드상세 리스트
	 * @return 반영된 row count
	 * */
	public int deleteCodeDetailDao(HashMap<String, Object> deleteTarget)throws Exception{
		return update("codeManageDAO.deleteCodeDetailAction", deleteTarget);
	}
}
