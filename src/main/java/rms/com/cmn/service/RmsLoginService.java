package rms.com.cmn.service;

import egovframework.com.cmm.LoginVO;
import egovframework.com.uat.uia.service.EgovLoginService;

/**
 * 샘플 Service 인터페이스 생성<p>
 * 1.Class 파일 생성(위치 : srm/main/java/rms/com/본인업무단패키지/service/)<p>
 * 2.기존 Egov프레임워크를 활용할 경우 Egov프레임워크의 해당 인터페이스 상속<p>
 * 3.메소트 생성(return, argument, Exception 정의)
 */
public interface RmsLoginService extends EgovLoginService{
	/**
     * 2011.08.26
	 * 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin2(LoginVO vo) throws Exception;
    
    
	/**
     * 2014.05.07
	 * 강제로 로그인 처리
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO testLogin(LoginVO vo) throws Exception;
    
    
	/**
     * 2014.05.07
	 * sqlMap 강제로 로그인 처리
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO testLogin2(LoginVO vo) throws Exception;
	
}
