package rms.com.check.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.check.controller.CheckAssignController;
import rms.com.check.service.CheckResultService;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForRecResVO;
import rms.com.jal.vo.RecFieldVO;
import rms.com.recNotice.vo.RecNoticeVO;
import rms.com.sys.vo.CodeDetailVO;

@Service("checkResultService")
public class CheckResultServiceImpl implements CheckResultService {
	protected static final Log LOG = LogFactory.getLog(CheckResultServiceImpl.class);
	//DAO설정
	@Resource(name="checkResultDAO")
	CheckResultDAO checkResultDAO;
	
	public List<RecFieldVO> getRecField() throws Exception{
		
		return checkResultDAO.getRecFieldList();
	}

	@Override
	public List<CodeDetailVO> getCareerDiv() throws Exception {
		
		return checkResultDAO.getCareerDivList();
	}

	@Override
	public List<CodeDetailVO> getCheckRes() throws Exception {
		
		return checkResultDAO.getCheckResList();
	}

	@Override
	public List<CheckResVO> getAppUserList(PagingForRecResVO pagingVO) throws Exception {
		
		return checkResultDAO.getAppUserList(pagingVO);
	}
	
	@Override
	public int selectSampleListTotCnt(PagingForRecResVO pagingVO)	throws Exception {
		return checkResultDAO.selectSampleListTotCnt(pagingVO);
	}

	@Override
	public List<RecNoticeVO> getRecNotiListForAdmin(String admin_id) throws Exception {
		return checkResultDAO.getRecNotiListForAdmin(admin_id);
	}

	@Override
	public int updateCheckResult(String appUserString, CheckResVO inputCheckResVO) throws Exception {
		List<String> addUserList = this.checkedValueToList(appUserString);
		int result =0;
		if(!inputCheckResVO.getCheck_res_code().equals("CHR_0030"))
		{
			inputCheckResVO.setHold_ranking(" ");
		}
		
		for(String str : addUserList)
		{	
			
			String [] temp = str.split("\\^");
			
			inputCheckResVO.setApp_user_no(temp[0]);
			if(1<temp.length)
			{
				inputCheckResVO.setRec_noti_no(temp[1]);
			}
		
			result += checkResultDAO.updateCheckResultDao(inputCheckResVO);
		}

		return result;
	}
	
	public List<String> checkedValueToList(String checkedValue) throws Exception{
		List<String> targetList = new ArrayList<String>();
	    for (String str : checkedValue.split("\\|"))
	    {
	    	targetList.add(str);
	    }
		    return targetList;
	}

	@Override
	public List<CheckResVO> getholdrankingByCheckerService(String admin_id,
			String rec_noti_no) throws Exception {
		HashMap<String, Object> checkerMap = new HashMap<String, Object>();
		checkerMap.put("admin_id", admin_id);
		checkerMap.put("rec_noti_no", rec_noti_no);
		return checkResultDAO.getHoldRankingByCheckerDao(checkerMap);
	}

	@Override
	public List<CheckResVO> getReportToExcelService(PagingForRecResVO pagingVO)
			throws Exception {
		return checkResultDAO.getReportToExel(pagingVO);
	}

	@Override
	public int renewHoldRanking(String holdRanking, CheckResVO chkResVO) throws Exception {
		List<String> holdRankingList =  this.checkedValueToList(holdRanking);	
		int result = 0;
		for(int i=0; i<holdRankingList.size(); i++)
		{
			chkResVO.setApp_user_no(holdRankingList.get(i));
			String ranking = Integer.toString((i+1));
			chkResVO.setHold_ranking(ranking);
			result += checkResultDAO.renewHoldRankingDao(chkResVO);
		}
		return result;
	}

	@Override
	public int updateCheckComment(CheckResVO chkVO) throws Exception {
		String userNo = chkVO.getApp_user_no();
		String [] temp = userNo.split("\\^");
		chkVO.setApp_user_no(temp[0]);
		return checkResultDAO.updateCheckCommentDao(chkVO);
	}

	@Override
	public CheckResVO getCheckComment(CheckResVO chkVO) throws Exception {
		String userNo = chkVO.getApp_user_no();
		String [] temp = userNo.split("\\^");
		chkVO.setApp_user_no(temp[0]);
		return checkResultDAO.getCheckCommentDao(chkVO);
	}

	
}

	
