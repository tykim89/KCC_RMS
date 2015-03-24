package rms.com.check.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.appmanage.vo.AppBoardVO;
import rms.com.check.controller.CheckAssignController;
import rms.com.check.service.CheckAssignService;
import rms.com.check.vo.AssignedUserVO;
import rms.com.check.vo.CheckAssignVO;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForAdminVO;
import rms.com.sys.vo.AdminVO;

@Service("checkAssignService")
public class CheckAssignServiceImpl implements CheckAssignService {

	protected static final Log LOG = LogFactory
			.getLog(CheckAssignServiceImpl.class);
	
	@Resource(name="checkAssignDAO")
	CheckAssignDAO checkAssignDAO;
	
	@Override
	public List<CheckAssignVO> getRecField() throws Exception {
		
		return checkAssignDAO.getRecFieldList();
	}
	
	@Override
	public List<AdminVO> getUserListByRecField(String recFieldNo) throws Exception {
		return checkAssignDAO.getUserListByRecField(recFieldNo);
	}
	
	@Override
	public String getStringByCheckUsrList(String recFieldNo) throws Exception {
		String checkUsrTarget = "";
		List<String> list = checkAssignDAO.getStringByCheckUsrList(recFieldNo);
		checkUsrTarget = makeStringbyList(list);
		
		return checkUsrTarget;
	}

	
	@Override
	public List<AssignedUserVO> getBaseUserList(String recFieldNo, String targetString, String admin_id) throws Exception {
		List<String> targetList = divdeUserTarget(targetString);		
		HashMap<String, Object> targetMap = new HashMap<String, Object>();
		targetMap.put("rec_noti_no", recFieldNo);
		targetMap.put("admin_id", admin_id);
		targetMap.put("targetList", targetList);
		
		return checkAssignDAO.getBaseUserList(targetMap);
	}
	
	@Override
	public List<AssignedUserVO> getDetailAssignList(String adminTarget, String rec_noti_no) throws Exception {
		
		HashMap<String, Object> targetMap = new HashMap<String, Object>();
		targetMap.put("adminTarget", adminTarget);
		targetMap.put("rec_noti_no", rec_noti_no);
		return checkAssignDAO.getDetailAssignList(targetMap);
	}
	
	@Override
	public String getAssignUsrTarget(String adminTarget, String rec_noti_no) throws Exception {
		String appUserTarget = "";
		HashMap<String, Object> targetMap = new HashMap<String, Object>();
		targetMap.put("adminTarget", adminTarget);
		targetMap.put("rec_noti_no", rec_noti_no);
		List<String> list = checkAssignDAO.getAssignUsrTarget(targetMap);
		appUserTarget = makeStringbyList(list);
		return appUserTarget;
	}
	
	@Override
	public List<AssignedUserVO> getDetailUnassignList(String recFieldNo, String adminTarget) throws Exception {
		Map<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("recFieldNo", recFieldNo);
		condition.put("adminTarget", adminTarget);
		
		return checkAssignDAO.getDetailUnassignList(condition);
	}
	
	@Override
	public List<AdminVO> basicAdminListService(PagingForAdminVO pagingVO) throws Exception {
		
	
		return checkAssignDAO.getchkUsrList(pagingVO);
	}
	
	@Override
	public List<String> getAllChkUsrList() throws Exception{
		return checkAssignDAO.getAllChkUsrList();
	}
	
	@Override
	public List<AssignedUserVO> getAddUnassignedUsrList(String recFieldNo, String modifyTarget, String adminTarget)throws Exception {
		
		List<String> modifyTargetList = null;
		if(modifyTarget != null && !modifyTarget.equals(""))
		{
			modifyTargetList = this.divdeUserTarget(modifyTarget);
		}
		
		Map<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("recFieldNo", recFieldNo);
		condition.put("adminTarget", adminTarget);
		condition.put("list", modifyTargetList);
		
		return checkAssignDAO.getAddUnassignedUsr(condition);
	}
	
	@Override
	public List<AssignedUserVO> getAddAssignedUsrList(String modifyTarget) throws Exception {
		
		List<String> modifyTargetList = null;
		if(modifyTarget != null && !modifyTarget.equals(""))
		{
			modifyTargetList = this.divdeUserTarget(modifyTarget);
		}
		
		Map<String, Object> modifyCondition = new HashMap<String, Object>();
		
	    modifyCondition.put("list", modifyTargetList);
	      
		return checkAssignDAO.getAddAssignedUsr(modifyCondition);
	}
	
	@Override
	public List<AssignedUserVO> getRemoveUnassignedUsrList(String recFieldNo, String modifyTarget) throws Exception {
		List<String> modifyTargetList = null;
		if(modifyTarget != null && !modifyTarget.equals(""))
		{
			modifyTargetList = this.divdeUserTarget(modifyTarget);
		}
		
		Map<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("recFieldNo", recFieldNo);
		condition.put("list", modifyTargetList);
		
		return checkAssignDAO.getRemoveUnassignedUsr(condition);
	}
	
	@Override
	public List<AssignedUserVO> getRemoveAssignedUsrList(String modiTarget) throws Exception {
		
		List<String> modifyTargetList = null;
		if(modiTarget != null && !modiTarget.equals(""))
		{
			modifyTargetList = this.divdeUserTarget(modiTarget);
		}
		
		Map<String, Object> modifyCondition = new HashMap<String, Object>();
		
	    modifyCondition.put("list", modifyTargetList);
	      
		return checkAssignDAO.getRemoveAssignedUsr(modifyCondition);
	}

	@Override
	public List<String> divdeUserTarget(String modifyTarget) throws Exception {

		if(modifyTarget == "")
		{
			LOG.info(":::::::::::::제발좀 빈스트링");
		} 
		if(modifyTarget == null)
		{
			LOG.info(":::::::::::::제발좀 널값");
		}
		
		List<String> modifyTargetList = new ArrayList<String>();
	      
	      for (String str : modifyTarget.split("\\|")) 
	      {
	    	 if(str.equals(""))
	    	 {
	    		 str=" ";
	    	 }
	         modifyTargetList.add(str);
	      }
	   
	  		return modifyTargetList;
	}
	
	@Override
	public List<String> substractTarget(String checkUsrTarget) throws Exception{
		List<String> originChkUsr = divdeUserTarget(checkUsrTarget);
		List<String> allChkUsr = null;
		allChkUsr = getAllChkUsrList();
		
		for(String str : originChkUsr)
		{
		  	allChkUsr.remove(allChkUsr.indexOf(str));
		}

		allChkUsr.toArray();
		
	    
	    return allChkUsr;
	}
	
	@Override
	public String makeStringbyList(List<String> target) throws Exception{
		
		String str = "";
		for (int i = 0; i < target.size(); i++) {
			str += target.get(i) + "|";
		}
		return str;
	}
	
	@Override
	public List<AdminVO> getCompany() throws Exception{
		return checkAssignDAO.getCompanyList();
	}
	
	@Override
	public List<AdminVO> getDept() throws Exception{
		return checkAssignDAO.getDeptList();
	}
	
	@Override
	public List<AdminVO> getPosition() throws Exception{
		return checkAssignDAO.getPositionList();
	}
	
	@Override
	public List<AdminVO> adminListService(AdminVO adminVO) throws Exception{
		return checkAssignDAO.getadminList(adminVO);
	}
	
	@Override
	public int insertCheckUserList(String adminTarget, String recFieldNo, String writer) throws Exception{
		List<String> adminList = null;
		adminList = divdeUserTarget(adminTarget);
		Map<String, Object> condition = new HashMap<String, Object>();
		for(String str : adminList){
			condition.put("writer", writer);
			condition.put("admin_id", str);
			condition.put("recFieldNo", recFieldNo);
			checkAssignDAO.insertCheckUserList(condition);
		}
		
		return 0;
	}
	
	@Override
	public List<AdminVO> getCheckUserListByRecField(String recFieldNo) throws Exception {
		
		return checkAssignDAO.getCheckUserListByRecField(recFieldNo);
	}
	
	@Override
	public String findCheckUserByRecField(String recFieldNo) throws Exception {
		String adminTarget = "";
		List<String> checkUserList = checkAssignDAO.getCheckUserListByRecFieldAction(recFieldNo);
		adminTarget = makeStringbyList(checkUserList);
		return adminTarget;
	}
	
	@Override
	public List<CheckResVO> getAppUserInfo(List<String> userList) throws Exception{
		Map<String, Object> condition = new HashMap<String, Object>();
		
		condition.put("list", userList);
		
		return checkAssignDAO.getAppUserInfoList(condition);
	}
	
	@Override
	public int updateCheckAssginService(String addTarget, String checkUsrTarget) throws Exception{
		List<String> userList = null;
		List<CheckResVO> userInfoList = null;
		
		if(addTarget != null && !addTarget.equals(""))
		{
			userList = divdeUserTarget(addTarget);
			userInfoList = getAppUserInfo(userList);
			for(CheckResVO obj : userInfoList)
			{
				obj.setAdmin_id(checkUsrTarget);
			}
		}
		
		return checkAssignDAO.updateCheckAssgin(userInfoList);

	}


	@Override
	public int countUnassignList(String adminTarget) throws Exception {
		return checkAssignDAO.countUnassign(adminTarget);
	}

	@Override
	public int countAssignList(String adminTarget) throws Exception {
		return checkAssignDAO.countAssign(adminTarget);
	}

	@Override
	public int selectSampleListTotCnt(PagingForAdminVO pagingVO)
			throws Exception {
		return checkAssignDAO.selectSampleListTotCnt(pagingVO);
	}

	@Override
	public List<AdminVO> getCheckerListByNotiService(String rec_noti_no)
			throws Exception {
		return checkAssignDAO.getCheckerListByNotiDao(rec_noti_no);
	}

	@Override
	public int deleteCheckerByNoti(String rec_noti_no, String deleteTarget)
			throws Exception {
		HashMap<String, Object> deleteTargetMap = new HashMap<String, Object>();
		deleteTargetMap.put("rec_noti_no", rec_noti_no);
		List<String> deleteList = this.divdeUserTarget(deleteTarget);
		deleteTargetMap.put("deleteList", deleteList);
		return checkAssignDAO.deleteCheckUserByRec(deleteTargetMap);
	}

	@Override
	public List<String> checkCheckerList(String rec_noti_no, String deleteTarget) throws Exception {
		HashMap<String, Object> deleteTargetMap = new HashMap<String, Object>();
		deleteTargetMap.put("rec_noti_no", rec_noti_no);
		List<String> deleteList = this.divdeUserTarget(deleteTarget);
		deleteTargetMap.put("deleteList", deleteList);
		return checkAssignDAO.checkCheckerList(deleteTargetMap);
	}

	@Override
	public int deleteCheckAppByRes(String rec_noti_no, String admin_id)
			throws Exception {
		HashMap<String, Object> deleteTargetMap = new HashMap<String, Object>();
		deleteTargetMap.put("rec_noti_no", rec_noti_no);		
		deleteTargetMap.put("admin_id", admin_id);
		return checkAssignDAO.deleteAppUserByRes(deleteTargetMap);
	}

	@Override
	public int insertCheckAppByRes(CheckResVO inputCheckResVO, String insertTarget) throws Exception {
		List<String> insertList = this.divdeUserTarget(insertTarget);
		
		for(String str : insertList)
		{
			HashMap<String, Object> insertTargetMap = new HashMap<String, Object>();
			insertTargetMap.put("insertAppNo", str);
			insertTargetMap.put("inputCheckResVO", inputCheckResVO);
			checkAssignDAO.insertAppUserByRes(insertTargetMap);
		}
		
		
		return 0;
	}

	@Override
	public List<CheckResVO> getCheckResInfo(String rec_noti_no, String adminTarget) throws Exception {
		List<String> adminList = this.divdeUserTarget(adminTarget);
		HashMap<String, Object> targetMap = new HashMap<String, Object>();
		targetMap.put("rec_noti_no", rec_noti_no);		
		targetMap.put("adminList", adminList);
		
		return checkAssignDAO.getCheckResInfo(targetMap);
	}

	@Override
	public int deleteCheckRes(String rec_noti_no, String deleteTarget) throws Exception {
		int result = 0;
		List<String> adminList = this.divdeUserTarget(deleteTarget);
		LOG.info(adminList);
		HashMap<String, Object> targetMap = new HashMap<String, Object>();
		for(String str : adminList)
		{
			LOG.info("포문도돌고나도돌고");
			
			targetMap.put("rec_noti_no", rec_noti_no);
			targetMap.put("admin_id", str);
			result = checkAssignDAO.deleteCheckerByUser(targetMap);
		}

		return result;
	}
	
	

	

	


}
