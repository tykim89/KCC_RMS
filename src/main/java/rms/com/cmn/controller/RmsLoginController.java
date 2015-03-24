package rms.com.cmn.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;

import rms.com.cmn.controller.RmsLoginController;
import rms.com.cmn.service.RmsLoginService;

/**
 * 샘플 Controller생성<p>
 * 1.Class 파일 생성(위치 : srm/main/java/rms/com/본인업무단패키지/controller/)<p>
 * 2.Class 파일 상단에 @Controller 어노테이션 선언<p>
 * 3.사용할 리소스 선언<p>
 * 3-1.@Resource(name="xxxYyy")형태로 선언<p>
 * 3-2.name값은 사용할 리소스의 @Service("XxxYyy")값과 대소문자 모두 동일해야함<p>
 * 3-2.@Resource의 클래스는 실제 구현된 XxxImpl클래스가 아닌 Xxx 인터페이스형식으로 선언<p>
 * 4.Controller함수 선언<p>
 * 4-1.함수상단에 @RequestMapping(value="zzz.do") 선언<p>
 * 4-2.함수의 인자형식으로 HttpServletRequest request, HttpServletResponse response,ModelMap model 선언(ModelMap은 없어도 무관)<p>
 * 4-3.함수의 return형식으로 String지정(Controller로직 종료후에 이동할 페이지나 .do값을 리턴)<P>
 * 4-4.인자로 @ModetlAttribute를 선언할경우 선언한 VO의 변수명과 같은 파라미터값을 자동으로 바인딩해준다. 
 *     (VO의 변수명과 jsp의 파라미터 id를 동일하게 맞춰주어야 바인딩됨)
 * */

@Controller
public class RmsLoginController {

	/** EgovLoginService */
	@Resource(name="rmsLoginService")
	private RmsLoginService rmsloginService;
	
	/** 
	 * 로깅을 위한 LOG 클래스 초기화<p>
	 * Log.info("테스트"); 형식으로 사용
	 * */
	protected static final Log LOG = LogFactory.getLog(RmsLoginController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	/**
	 * 샘플 페이지이동<p>
	 * 1. 페이지만 이동할경우 WEB-INF/jsp/ 하단의 경로와 파일명 리턴(.jsp 적지 않음)<p>
	 * 2. 다른 컨트롤러로 이동할 경우 redirect:/rms/cmn/rmsLoginForm.do 형식으로 리턴
	 */
	@RequestMapping(value = "/rms/cmn/rmsLoginForm.do")
	public String loginUsrView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "rms/cmn/rmsLoginForm";
	}

	/**
	 * 로그인 처리 샘플 1
	 * 기존 전자정부표준프레임워크의 EgovLoginServiceImpl 클래스를 상속받은 RmsLoginServiceImpl 클래스를 통해 로그인.
	 * RmsLoginServiceImpl 클래스는 EgovLoginService 인터페이스를 상속받은 RmsLoginService 인터페이스를 구현함.
	 * EgovLoginServiceImpl의 actionLogin 함수 실행후 추가적인 처리를 할수 있는 구조로 되어 있음.
	 */
	@RequestMapping(value = "/rms/cmn/rmsLogin.do")
	public String loginUser(@ModelAttribute LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		/*
		//ModelAttribute로 대체
		LoginVO loginVO;
		loginVO = new LoginVO();
		String id = request.getParameter("loginId");
		String pw = request.getParameter("loginPw");
		String userSe = request.getParameter("userSe");
		loginVO.setId(id);
		loginVO.setPassword(pw);
		loginVO.setUserSe(userSe);
		*/

		LoginVO resultVO = rmsloginService.actionLogin2(loginVO);

		//로그인성공
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) 
		{
			//세션에 데이터를 저장할경우 아래와 같이 넣어준다.
			//기본적으로 MAP타입으로 저장된다.
			//request.getSession().setAttribute("loginVO", resultVO);
			
			//jsp로 데이터를 넘길경우 model.addAttribute로 넘겨준다.
			//기본적으로 MAP타입으로 넘어간다. jsp페이지에서 ${key} or ${key.value} 형식으로 가져다가 사용가능 
			model.addAttribute("message", egovMessageSource.getMessage("success.request.msg"));

			return "redirect:/rms/cmn/rmsLogin.do";
		}//로그인실패 
		else 
		{
			//message설정의 경우 src/main/resources/egovframework/message/com/message-common_ko_KR.properties 파일에서 가능
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "rms/cmn/rmsLoginForm";
		}
	}
	
	
	/**
	 * 로그인 처리 샘플 2
	 * 강제로 LoginVO를 리턴해줌으로 로그인 된것처럼 처리
	 */
	@RequestMapping(value = "/rms/cmn/rmsLogin2.do")
	public String loginUser2(@ModelAttribute LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		/*
		//ModelAttribute로 대체
		LoginVO loginVO;
		loginVO = new LoginVO();
		String id = request.getParameter("loginId");
		String pw = request.getParameter("loginPw");
		String userSe = request.getParameter("userSe");
		LOG.info("RmsLoginController.loginUser2 ID : " + id);
		LOG.info("RmsLoginController.loginUser2 PW : " + pw);
		loginVO.setId(id);
		loginVO.setPassword(pw);
		loginVO.setUserSe(userSe);*/


		LoginVO resultVO = rmsloginService.testLogin(loginVO);

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
			//컨트롤러를 다시 태울경우에는 redirect:/rms/cmn/rmsLoginForm.do 형식으로 리턴해준다.
			model.addAttribute("message", egovMessageSource.getMessage("success.request.msg"));
			return "rms/cmn/rmsLoginForm";

		} else {
			//message설정의 경우 src/main/resources/egovframework/message/com/message-common_ko_KR.properties 파일에서 가능
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "rms/cmn/rmsLoginForm";
		}
	}
	
	
	/**
	 * 로그인 처리 샘플 3
	 * RmsLoginDAO클래스를 통해 쿼리로 값을 강제 리턴하여 로그인처리
	 */
	@RequestMapping(value = "/rms/cmn/rmsLogin3.do")
	public String loginUser3(@ModelAttribute LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		
		/*
		//ModelAttribute로 대체
		LoginVO loginVO;
		loginVO = new LoginVO();
		String id = request.getParameter("loginId");
		String pw = request.getParameter("loginPw");
		String userSe = request.getParameter("userSe");
		loginVO.setId(id);
		loginVO.setPassword(pw);
		loginVO.setUserSe(userSe);*/

		LoginVO resultVO = rmsloginService.testLogin2(loginVO);

		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
			//컨트롤러를 다시 태울경우에는 redirect:/rms/cmn/rmsLoginForm.do 형식으로 리턴해준다.
			model.addAttribute("message", egovMessageSource.getMessage("success.request.msg"));
			model.addAttribute("loginVO", resultVO);
			
			return "rms/cmn/rmsLoginForm";

		} else {
			//message설정의 경우 src/main/resources/egovframework/message/com/message-common_ko_KR.properties 파일에서 가능
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "rms/cmn/rmsLoginForm";
		}
	}
}
