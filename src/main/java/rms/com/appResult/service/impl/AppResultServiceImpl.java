package rms.com.appResult.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.appResult.service.AppResultService;
import rms.com.appResult.vo.AppResultVO;
import rms.com.appdoc.vo.AppUserVO;

@Service ("appResultService")
public class AppResultServiceImpl implements AppResultService{
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(AppResultServiceImpl.class);
    
    @Resource (name="appResultDAO")
    private AppResultDAO appResultDAO;

	@Override
	public String passResult(AppUserVO userVO) {

		return appResultDAO.passResult(userVO);
	}

	@Override
	public AppResultVO appResultList(AppUserVO userVO) {

		return appResultDAO.appResultList(userVO);
	}
    
    
    
    
    
    
    
    
    

}
