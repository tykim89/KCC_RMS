package rms.com.appmanage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppUserDetailVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appmanage.service.AppBoardDetailService;
import rms.com.appmanage.vo.AppBaseInfoVO;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.check.service.impl.CheckAssignServiceImpl;

@Service("appBoardDetailService")
public class AppBoardDetailServiceImpl implements AppBoardDetailService {

	@Resource(name="appBoardDetailDAO")
	AppBoardDetailDAO appBoardDetailDAO;
	
	protected static final Log LOG = LogFactory
			.getLog(CheckAssignServiceImpl.class);
	
	@Override
	public AppUserDetailVO getAppUserInfoDetail(String app_user_id) throws Exception {
		
		return appBoardDetailDAO.getAppUserInfo(app_user_id);
	}

	@Override
	public AppUserVO getAppUserId(String app_user_id) throws Exception {
		
		return appBoardDetailDAO.getAppUserId(app_user_id);
	}

	@Override
	public int updateAppUserResumeOfPsInfo(List<AppInfoVO> appInfoList, String app_user_no, String app_list_code) throws Exception {	
		return appBoardDetailDAO.updateAppUserOfPsInfo(appInfoList, app_user_no, app_list_code);	
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
	public HashMap<String, List<List<AppItemContentVO>>> getAppUserDetailService(AppInfoVO inputAppInfoVO, List<AppItemContentVO> formItemList) throws Exception {
		HashMap<String, List<List<AppItemContentVO>>> appItemMap = new HashMap<String, List<List<AppItemContentVO>>>();
		for(AppItemContentVO aicv : formItemList)
		{
			LOG.info("포문돈다 ==="+aicv.getApp_list_code());
			inputAppInfoVO.setApp_list_code(aicv.getApp_list_code());
			List<AppItemContentVO> tempTotalList = appBoardDetailDAO.getAppUserDetailDao(inputAppInfoVO);//리스트 리턴
			
			List<List<AppItemContentVO>> tempSeparatedList = new ArrayList<List<AppItemContentVO>>();
			int tempListNo = 0;
			ArrayList<Integer> changePoint = new ArrayList<Integer>();
			
			for(int i=0; i<tempTotalList.size(); i++)
			{
				int listNo = Integer.parseInt(tempTotalList.get(i).getList_no());
				if(tempListNo != listNo)
				{	
					changePoint.add(i);
					LOG.info("체크포인트인덱스 ==="+i);
					tempListNo = Integer.parseInt(tempTotalList.get(i).getList_no());
					LOG.info("체크포인트 리스트넘셋 ==="+tempListNo);
				}
			}
			for(int j=0; j < changePoint.size(); j++)
			{
				LOG.info("몇번도나 ==="+j);
				if(changePoint.size()-1==j)
				{	
					tempSeparatedList.add(tempTotalList.subList(changePoint.get(j), tempTotalList.size()));
					LOG.info("하나있거나 마지막 ==="+changePoint.get(j));
				}else
				{
					tempSeparatedList.add(tempTotalList.subList(changePoint.get(j), changePoint.get(j+1)));
					LOG.info("서브리스트 ==="+tempTotalList.subList(changePoint.get(j), changePoint.get(j+1)));
				}				
			}
			appItemMap.put(aicv.getApp_list_code(), tempSeparatedList);
		}
		return appItemMap;
	}

	@Override
	public List<AppItemContentVO> getFormItemList(String app_user_no) throws Exception {
		return appBoardDetailDAO.getFormItemList(app_user_no);
	}

	@Override
	public AppBaseInfoVO getAppBaseInfoService(String app_user_no)throws Exception {
		return appBoardDetailDAO.getAppBaseInfoDao(app_user_no);
	}
	

	@Override
	public AppUserVO getImage(String app_user_no) throws Exception {
		return (AppUserVO) appBoardDetailDAO.getImage(app_user_no);
	}
	
	

}
