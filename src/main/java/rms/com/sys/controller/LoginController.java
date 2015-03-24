package rms.com.sys.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

import rms.com.sys.service.LoginService;
import rms.com.sys.vo.AdminVO;

import egovframework.com.cmm.EgovMessageSource;
@Controller
public class LoginController 
{
	@Resource(name="loginService2")
	private LoginService loginService;
	
	protected static final Log LOG = LogFactory.getLog(LoginController.class);
		
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
	/**로그인 메인 화면 이동
	 * @author 이동선
	 * @param null
	 * @return 메인화면이동
	 * */
	@RequestMapping(value="/rms/sys/loginPage.do")
	public String loginMainPage(){
		return "rms/sys/loginMain";
	}
	/**로그인
	 * @author 이동선
	 * @param id, pw
	 * @return 아이디, 비밀번호 일치 결과
	 * */
	@RequestMapping(value="/rms/sys/login.do")
	public String userLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
	{
		String viewName="";
		String admin_id = "";
		String admin_pw = "";
		HttpSession session = request.getSession();
		if(request.getParameter("admin_id")!=null)
		{
			admin_id = request.getParameter("admin_id");
		}
		if(request.getParameter("admin_pw")!=null){
			admin_pw = request.getParameter("admin_pw");
		}
			
		
		AdminVO resultAdminVO = loginService.loginAction(admin_id);
	
		String loginState="";
		if(resultAdminVO!=null)
		{
			loginState="idExist";
			if(resultAdminVO.getAdmin_pw().equals(admin_pw))
			{
				loginState="pwAgreement";
				if(session.getAttribute("userInfo")!=null)
				{
					session.removeAttribute("userInfo");
				}
				session.setAttribute("userInfo", resultAdminVO);
				viewName = "redirect:/rms/sys/addUserPage.do";
			}
			else
			{
				loginState="pwNotAgreement";
				model.addAttribute("loginState", loginState);
				viewName="/rms/sys/loginMain";
			}
		}else
		{
			loginState="idNotExist";
			model.addAttribute("loginState", loginState);
			viewName="/rms/sys/loginMain";
		
		}
		return viewName;

	}
	/**로그아웃
	 * @author 이동선
	 * @param id
	 * @return 세션 로그아웃
	 * */
	@RequestMapping(value="/rms/sys/logout.do")
	public String userLogout(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo")!=null)
		{
			//session.removeAttribute("userInfo");
			session.invalidate();
			//LOG.info(id+"로그아웃!!!!!!");
		}
			
		return "redirect:/rms/sys/loginPage.do";
	}
}
