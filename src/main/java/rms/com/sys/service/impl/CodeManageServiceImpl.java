package rms.com.sys.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.sys.controller.CodeManageController;
import rms.com.sys.service.CodeManageService;
import rms.com.sys.vo.CodeDetailVO;
import rms.com.sys.vo.CodeGroupVO;

@Service("codeManageService")
public class CodeManageServiceImpl implements CodeManageService{

	@Resource(name="codeManageDAO")
	CodeManageDAO codeManageDAO;
	
	protected static final Log LOG = LogFactory.getLog(CodeManageServiceImpl.class);
	
	@Override
	public List<CodeGroupVO> getCodeGroupListService() throws Exception {
		return codeManageDAO.getCodeGroupListDao();
	}

	@Override
	public int addCodeGroupService(CodeGroupVO inputCodeGroupVO)
			throws Exception {
		int result = 0;
		
		if(codeManageDAO.groupCodeOverlapCheckDao(inputCodeGroupVO.getGroup_code())!=1)
		{
			result = codeManageDAO.addCodeGroupDao(inputCodeGroupVO);
		}
		
		return result;
	}

	@Override
	public int modiCodeGroupService(CodeGroupVO inputCodeGroupVO)
			throws Exception {
		return codeManageDAO.modiCodeGroupDao(inputCodeGroupVO);
	}

	@Override
	public int deleteCodeGroupService(String checkedValue, String modifier) throws Exception {
		List<String> groupCodeList = this.checkedValueToList(checkedValue);
		 HashMap<String, Object> deleteTarget = new HashMap<String, Object>();
		 deleteTarget.put("groupCodeList", groupCodeList);
		 deleteTarget.put("modifier", modifier);
		return codeManageDAO.deleteCodeGroupDao(deleteTarget);
	}

	@Override
	public int addCodeDetailService(CodeDetailVO inputCodeDetailVO)
			throws Exception {
		int result = 0;
		if(codeManageDAO.detailCodeOverlapCheckDao(inputCodeDetailVO.getDetail_code())!=1)
		{
			result = codeManageDAO.addCodeDetailDao(inputCodeDetailVO);
		}
		else
		{
			LOG.info("[코드상세]코드중복으로 삽입불가");
		}
		return result;
	}

	@Override
	public List<CodeDetailVO> getCodeDetailListService(String group_code) throws Exception {
		return codeManageDAO.getCodeDetailListDao(group_code);
	}

	@Override
	public int modiCodeDetailService(CodeDetailVO inputCodeDetailVO)
			throws Exception {
		return codeManageDAO.modiCodeDetailDao(inputCodeDetailVO);
	}

	@Override
	public int deleteCodeDetailService(String checkedValue, String modifier) throws Exception {
		List<String> detailCodeList = this.checkedValueToList(checkedValue);
		HashMap<String, Object> deleteTarget = new HashMap<String, Object>();
		deleteTarget.put("detailCodeList", detailCodeList);
		deleteTarget.put("modifier", modifier);
		return codeManageDAO.deleteCodeDetailDao(deleteTarget);
	}
	
	public List<String> checkedValueToList(String checkedValue) throws Exception{
		List<String> targetList = new ArrayList<String>();
	    for (String str : checkedValue.split("\\|"))
	    {
	    	targetList.add(str);
	    }
	    return targetList;
	}
	public List<String> checkUnderItem(String checkedValue)throws Exception{
		List<String> groupCodeList = this.checkedValueToList(checkedValue);
		return codeManageDAO.checkItemExist(groupCodeList);
	}
}
