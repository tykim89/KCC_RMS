package rms.com.appmanage.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppUserDetailVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appmanage.vo.AppBaseInfoVO;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.sys.vo.AdminVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("appBoardDetailDAO")
public class AppBoardDetailDAO extends EgovComAbstractDAO{

	/** log */	
    protected static final Log LOG = LogFactory.getLog(AppBoardDetailDAO.class);
    
    public AppUserDetailVO getAppUserInfo(String app_user_id) throws Exception{
    	return (AppUserDetailVO) selectByPk("appBoardDetailDAO.getAppUserInfoAction", app_user_id);
    }
    
    
    public AppUserVO getAppUserId(String app_user_id) throws Exception{
    	return (AppUserVO)selectByPk("appBoardDetailDAO.getAppUserIdAction", app_user_id);
    }
    
    public int updateAppUserOfPsInfo(List<AppInfoVO> appInfoList, String app_user_no, String app_list_code) throws Exception{
    	this.getSqlMapClient().startTransaction();
    	this.getSqlMapClient().startBatch();
		
		for(AppInfoVO aiv : appInfoList)
		{
			aiv.setApp_user_no(app_user_no);
			aiv.setApp_list_code(app_list_code);
			this.getSqlMapClient().update("appBoardDetailDAO.updateAppUserOfPsInfoAction", aiv);
		}
		
		this.getSqlMapClient().executeBatch();
		this.getSqlMapClient().commitTransaction();		
		this.getSqlMapClient().endTransaction();
    	
		return 1;
    }
    
    public List<AppItemContentVO> getAppUserDetailDao(AppInfoVO inputAppInfoVO)throws Exception{
    	return list("appBoardDetailDAO.getAppUserDetailAction", inputAppInfoVO);
    }
    /**
     * @author 	이동선
     * @param	app_user_no
     * @return	양식별 구성사항목록
     * */
    public List<AppItemContentVO> getFormItemList(String app_user_no)throws Exception{
    	return list("appBoardDetailDAO.getFormItemListAction", app_user_no);
    }
    
    /**
     * 지원자의 기본정보 로드
     * */
    public AppBaseInfoVO getAppBaseInfoDao(String app_user_no) throws Exception{
    	return (AppBaseInfoVO) selectByPk("appBoardDetailDAO.getAppUserBaseinfoAction", app_user_no);
    }
    
    /**
     * 지원자 사진 가져오기
     * 
     * @author tykim
     * @return 
     * @since 2014-07-08
     * */
    public AppUserVO getImage(String app_user_no) throws Exception {
		return (AppUserVO) selectByPk("appBoardDetailDAO.getImage", app_user_no);
    }
    
}

