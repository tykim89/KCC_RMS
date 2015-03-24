package rms.com.appResult.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.appResult.vo.AppResultVO;
import rms.com.appdoc.vo.AppUserVO;

@Repository ("appResultDAO")
public class AppResultDAO extends EgovComAbstractDAO{
	
	
	protected static final Log LOG = LogFactory.getLog(AppResultDAO.class);

	public String passResult(AppUserVO userVO) {
		
		return (String) selectByPk("appResultDAO.passResult", userVO);
	}

	public AppResultVO appResultList(AppUserVO userVO) {

		return  (AppResultVO) selectByPk("appResultDAO.appResultList", userVO);
	}
	

}
