package rms.com.cmn.interceptor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import rms.com.sys.vo.AdminVO;
import rms.com.cmn.service.AuthService;
import rms.com.cmn.vo.MenuVO;

import rms.com.util.service.JSONUtil;

public class RmsInterceptor extends HandlerInterceptorAdapter
{
   @Resource(name = "authService")
   private AuthService        authService;
   protected static final Log LOG = LogFactory.getLog(RmsInterceptor.class);
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {  
      
      String requestURI = request.getRequestURI(); //요청 URI
      
      List<MenuVO> adminByAuthList = authService.getAuthorizedMenuList("");
      
      Map<String, List<MenuVO>> menuMap = new HashMap<String, List<MenuVO>>();
      
      for(MenuVO vo : adminByAuthList)
      {
         if(menuMap.get("depth" + vo.getDepth()) == null)
         {
        	
            menuMap.put("depth" + vo.getDepth(), new ArrayList<MenuVO>());
            menuMap.get("depth" + vo.getDepth()).add(vo);
         }
         else
         {
        	
            menuMap.get("depth" + vo.getDepth()).add(vo);
         }
      }
      
      
      for(int i=1; i<10; i++)
      {
    	  
         if(menuMap.get("depth"+i) != null)
         {
        	
            request.setAttribute("depth" + i + "menu", JSONUtil.toJson(menuMap.get("depth"+i)));
         }
      }
      
      request.setAttribute("menuMap", menuMap);
     
      /**로그인 체크
       * @author 이동선
       */
        if("/KCC_RMS/rms/sys/loginPage.do".equals(requestURI) || "/KCC_RMS/rms/sys/login.do".equals(requestURI) || "/KCC_RMS/rms/recNotice/userNoticeList.do".equals(requestURI))
      {
    	  return true;
      }else
      {
    	  AdminVO userInfo = (AdminVO) request.getSession().getAttribute("userInfo");
    	  
    	  if(userInfo == null)
    	  {
    		  LOG.info(">>>>>>>>>>>>>>>>>>로그인하셈 로그인page.do로 이동");
    		 response.sendRedirect("/KCC_RMS/rms/sys/loginPage.do");
    		  
    		  return false;
    	  }else
    	  {
    		return true;  
    	  }
      }
      //boolean isPermittedURL = false; 

      
      //LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
      
      /*if(loginVO != null){
         return true;
      }else{
         
         
         for(Iterator<String> it = this.permittedURL.iterator(); it.hasNext();){
            String urlPattern = request.getContextPath() + (String) it.next();

            if(Pattern.matches(urlPattern, requestURI)){// 정규표현식을 이용해서 요청 URI가 허용된 URL에 맞는지 점검함.
               isPermittedURL = true;
            }
            
            
         }
         
         if(!isPermittedURL){
            ModelAndView modelAndView = new ModelAndView("redirect:/uat/uia/egovLoginUsr.do");        
            throw new ModelAndViewDefiningException(modelAndView);
         }else{
            return true;
         }
      }*/
      
      //request.setAttribute("test", "1111");
      
      //return true;
   }
}
