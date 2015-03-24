package rms.com.sys.service.impl;

import javax.annotation.Resource;

import rms.com.sys.service.LoginService;
import rms.com.sys.vo.AdminVO;

import org.springframework.stereotype.Service;


@Service("loginService2")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDAO2")
	private LoginDAO loginDAO;
	
	@Override
	public AdminVO loginAction(String admin_id) throws Exception{
		AdminVO resultVO = loginDAO.loginFunc(admin_id);
		return resultVO;
	}

}
