package rms.com.sys.service;

import rms.com.sys.vo.AdminVO;

public interface LoginService
{
	public AdminVO loginAction(String id) throws Exception;
}
