package rms.com.sys.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.sys.vo.AdminVO;


import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("loginDAO2")
public class LoginDAO extends EgovComAbstractDAO{
	protected static final Log LOG = LogFactory.getLog(LoginDAO.class);
	
	public AdminVO loginFunc(String admin_id) throws Exception
	{
		return (AdminVO)selectByPk("loginDAO.loginAction", admin_id);
	}
}
