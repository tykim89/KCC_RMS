package rms.com.appResult.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import rms.com.appResult.service.AppResultService;
import rms.com.appResult.vo.AppResultVO;
import rms.com.appdoc.service.AppDocService;
import rms.com.appdoc.vo.AppUserVO;


@Controller
public class AppResultController {
	
	protected static final Log LOG = LogFactory.getLog(AppResultController.class);
	
	@Resource(name="appResultService")
	private AppResultService appResultService;
	
	@Resource(name="appdocService")
	private AppDocService appdocService;
	
	
	/**
	 * 입사지원자 로그인
	 * @author kccsmlee
	 * @since 14.07.04
	 * */
	@RequestMapping (value="/rms/appResult/loginPage.do")
	public String loginPage() throws Exception{
		return "/rms/kcc/resultcheck/userLogin";
	}
	
	/**
	 * 로그인 확인
	 * @author kccsmlee
	 * @since 14.07.04
	 * */
	@RequestMapping (value="/rms/appResult/loginCheck.do")
	public String loginCheck(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userVO") AppUserVO userVO, Model model) throws Exception{
		
        String viewName = "";
        String app_user_name="";
        String app_user_email_addr="";
        String app_user_pw="";
        
        if(request.getParameter("app_user_name") != null)
        {
        	app_user_name = request.getParameter("app_user_name");
        }
        if(request.getParameter("app_user_email_addr") != null)
        {
        	app_user_email_addr = request.getParameter("app_user_email_addr");
        }
        if(request.getParameter("app_user_pw") != null)
        {
        	app_user_pw = request.getParameter("app_user_pw");
        }
        
        userVO = appdocService.appUserLogin(userVO);

		String userExistState="";
		
		if(userVO!=null){
			
			// 이름과 비밀번호 모두 일치하는 경우
			if(userVO.getApp_user_name().equals(app_user_name) && userVO.getApp_user_email_addr().equals(app_user_email_addr) 
					&& userVO.getApp_user_pw().equals(app_user_pw)){
				
				userExistState = "userIsExist";
				
				String result = appResultService.passResult(userVO); 	
				LOG.info("*****result*****"+result);
				
				AppResultVO content = appResultService.appResultList(userVO);

							if(result.equals("RER_0010")){

								//합격한경우
								model.addAttribute("content",content);
								viewName = "/rms/kcc/resultcheck/passUser";
			
							}else if(result.equals("RER_0020")){
								
								//불합격한경우
								viewName = "/rms/kcc/resultcheck/nonpassUser";
							
							}else{
							
								//진행중인 경우
								viewName = "/rms/kcc/resultcheck/ingpassUser";
							}

				
			// 이름 불일치
			}else if(userVO.getApp_user_name() != app_user_name && userVO.getApp_user_pw().equals(app_user_pw)){
				
				userExistState = "nameIsNotExist";
    			model.addAttribute("userExistState", userExistState);
    			viewName = "/rms/kcc/resultcheck/userLogin";
    		
    		//비밀번호 불일치
			}else{
				
				userExistState = "pwIsNotExist";
    			model.addAttribute("userExistState", userExistState);
    			viewName = "/rms/kcc/resultcheck/userLogin";			
				
			}
		
		//유저 정보 없을 경우
		}else{
			
    		userExistState = "userIsNotExist";
    		model.addAttribute("userExistState", userExistState);
    		
    		viewName = "/rms/kcc/resultcheck/userLogin";
			
		}
		
		return viewName;
	}

}
