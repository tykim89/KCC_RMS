package rms.com.appmanage.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import rms.com.appmanage.service.AppBoardService;
import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.qna.qnafrq.vo.DefaultVO;

@Service("appBoardService")
public class AppBoardServiceImpl implements AppBoardService{
	
	@Resource(name="appBoardDAO")
	AppBoardDAO appBoardDAO;
	
	
	@Override
	public List<AppBoardVO> allUserListService(AppUserSearchVO pagingVO) throws Exception {
		return appBoardDAO.getUserboardListDao(pagingVO);
	}
	
	@Override
	public List<AppBoardVO> userListService(AppUserSearchVO appUserSearchVO) throws Exception {
		return appBoardDAO.boardListDao(appUserSearchVO);
	}
	
	@Override
	public List<AppUserSearchVO> recNotiService() throws Exception {
		return appBoardDAO.recNotiSearchDao();
	}
	
	@Override
	public List<AppUserSearchVO> recFieldService() throws Exception {
		return appBoardDAO.recFieldSearchDao();
	}
	
	@Override
	public List<AppUserSearchVO> careerDivService() throws Exception {
		return appBoardDAO.careerDivSearchDao();
	}
	
	@Override
	public List<AppUserSearchVO> recStepService() throws Exception {
		return appBoardDAO.recStepSearchDao();
	}
	
	@Override
	public List<AppUserSearchVO> recResService() throws Exception {
		return appBoardDAO.recResSearchDao();
	}


	@Override
	public List<String> selectField(String selectTarget) throws Exception{
		
		List<String> selectTargetList = null;
		selectTargetList = new ArrayList<String>();
		
		if(selectTarget != null)
		{
			for(String str : selectTarget.split("\\|"))
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
	public int selectSampleListTotCnt(AppUserSearchVO pagingVO) throws Exception {

		return appBoardDAO.selectSampleListTotCnt(pagingVO);
	}

	@Override
	public int selectListTotCnt(AppUserSearchVO pagingVO) throws Exception {

		return appBoardDAO.selectListTotCnt(pagingVO);
	}


	


}
