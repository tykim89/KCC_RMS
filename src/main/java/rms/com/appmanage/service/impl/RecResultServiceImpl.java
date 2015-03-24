package rms.com.appmanage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import rms.com.appmanage.service.RecResultService;
import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.appmanage.vo.RecResultVO;
import rms.com.check.vo.CheckResVO;
import rms.com.sys.vo.AdminVO;

@Service("recResultService")
public class RecResultServiceImpl implements RecResultService {

	@Resource(name="recResultDAO")
	RecResultDAO recResultDAO;
	
	@Override
	public List<String> checkUser(String selectUsrTarget) throws Exception {
		
		List<String> selectTargetList = new ArrayList<String>();
		
		//구분자 "|" 없애기
		
		if(selectUsrTarget != null)
		{
			for(String str : selectUsrTarget.split("\\|"))
			{
				selectTargetList.add(str);
			}
		}else
		{
			selectTargetList=null;
		}
		
		return selectTargetList;
	}
	
	@Override
	public List<String> actionStepItemService(String app_user_no) throws Exception {
		
		return recResultDAO.checkStepItemDao(app_user_no);
	}


	@Override
	public List<String> actionRecResultService() throws Exception {
		
		return recResultDAO.checkRecResultDao();
	}

	@Override
	public List<String> checkResult(String updateResultTarget) throws Exception {
		List<String> updateTargetList = new ArrayList<String>();
		//구분자 "|" 없애기
		
		if(updateResultTarget != null)
		{
			for(String str : updateResultTarget.split("\\|"))
			{
				updateTargetList.add(str);
			}
		}else
		{
			updateTargetList=null;
		}
		
		return updateTargetList;
	}

	@Override
	public int updateResult(RecResultVO recResultVO) throws Exception {
	
		List<String> appUserList = recResultVO.getAppUserList();
		String stepItemCode = recResultVO.getStepItemCode();
		String resultCode = recResultVO.getResultCode();
		
		Map<String, Object> modifyCondition = new HashMap<String, Object>();
		
		// 작성자정보(이후수정)
	      modifyCondition.put("modifier", "SYSTEM");
	      //modifyCondition.put("modi_date", "SYSDATE");
	      modifyCondition.put("stepItemCode", stepItemCode);
	      modifyCondition.put("resultCode", resultCode);
	      modifyCondition.put("appUserList", appUserList);
	      
	      return recResultDAO.updateRecResult(modifyCondition);
	}
	
	
	

	@Override
	public void updateRecSch(RecResultVO recResultVO, AdminVO adminVO, HttpSession session) throws Exception {
		
		adminVO = (AdminVO) session.getAttribute("userInfo");
		recResultVO.setModifier(adminVO.getAdmin_id());
		
		List<String> appUserList = recResultVO.getAppUserList();
		int appUserListSize = appUserList.size();
		
		recResultDAO.getSqlMapClient().startTransaction();
		recResultDAO.getSqlMapClient().startBatch();
		
		for(int i=0; i<appUserListSize; i++)
		{	
			recResultVO.setApp_user_no(appUserList.get(i));
			recResultDAO.updateRecSch(recResultVO);	
		}
		
		recResultDAO.getSqlMapClient().executeBatch();
		recResultDAO.getSqlMapClient().commitTransaction();
		recResultDAO.getSqlMapClient().endTransaction();
		

	}
	
	@Override
	public RecResultVO getScheContent(RecResultVO resultVO) throws Exception {
		String userNo = resultVO.getApp_user_no();
		resultVO.setApp_user_no(userNo);
		return recResultDAO.getScheContentDao(resultVO);
	}

	@Override
	public int updateScheContent(RecResultVO resultVO)	throws Exception {
		
		return recResultDAO.updateScheContent(resultVO);
	}

	
	
}
