package rms.com.cmn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.utl.fcc.service.EgovStringUtil;

import rms.com.cmn.service.AuthService;
import rms.com.cmn.service.MenuService;
import rms.com.cmn.vo.AdminByAuthVO;
import rms.com.cmn.vo.AuthVO;
import rms.com.cmn.vo.MenuVO;
import rms.com.util.service.JSONUtil;

@Controller
public class AuthController
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(AuthController.class);

   @Resource(name = "authService")
   private AuthService        authService;
   
   @Resource(name = "menuService")
   private MenuService        menuService;

   /** EgovMessageSource */
   @Resource(name = "egovMessageSource")
   EgovMessageSource          egovMessageSource;

   /**
    * 기존권한정보를 갖고 권한관리 페이지로 이동
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   @RequestMapping(value = "/rms/cmn/gotoAuthMngPage.do")
   public String gotoAuthMngPage(HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception
   {
      model.addAttribute("authList", authService.getAuthList());
      String messageId = request.getParameter("messageId");
      // 등록,수정,삭제 Controller에서 넘어온 message값 유지
      if (messageId != null && !"".equals(messageId))
      {
         model.addAttribute("message", egovMessageSource.getMessage(messageId));
      }
      return "rms/cmn/authMngPage";
   }

   /**
    * 권한 등록
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   @RequestMapping(value = "/rms/cmn/insertAuth.do")
   public String insertAuth(@ModelAttribute AuthVO authVO, HttpServletRequest request,
         HttpServletResponse response, ModelMap model) throws Exception
   {

      int result = authService.insertAuth(authVO);
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.insert");
      } else
      {
         model.addAttribute("messageId", "success.common.insert");
      }

      return "redirect:/rms/cmn/gotoAuthMngPage.do";
   }

   /**
    * 권한 삭제
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   @RequestMapping(value = "/rms/cmn/deleteAuth.do")
   public String deleteAuth(@RequestParam("deleteTarget") String deleteTarget, HttpServletRequest request,
         HttpServletResponse response, ModelMap model) throws Exception
   {


      int result = authService.deleteAuth(deleteTarget);
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.delete");
      } else
      {
         model.addAttribute("messageId", "success.common.delete");
      }

      return "redirect:/rms/cmn/gotoAuthMngPage.do";
   }

   /**
    * 권한 수정
    * 
    * @author 복영훈
    * @since 2014-05-15
    * */
   @RequestMapping(value = "/rms/cmn/modifyAuth.do")
   public String modifyAuth(@ModelAttribute AuthVO authVO,
         @RequestParam("modifyTarget") String modifyTarget, HttpServletRequest request,
         HttpServletResponse response, ModelMap model) throws Exception
   {
      authVO.setAuth_id(modifyTarget);
      int result = authService.updateAuth(authVO);
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.update");
      } else
      {
         model.addAttribute("messageId", "success.common.update");
      }

      return "redirect:/rms/cmn/gotoAuthMngPage.do";
   }
   
   
   /**
    * 권한별 메뉴관리 페이지로 이동
    * 
    * @author 복영훈
    * @since 2014-05-20
    * */
   @RequestMapping(value = "/rms/cmn/gotoAuthByMenuMngPage.do")
   public String gotoAuthByMenuMngPage(HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception
   {
      model.addAttribute("authList", authService.getAuthList());
      
      String messageId = request.getParameter("messageId");
      // 등록,수정,삭제 Controller에서 넘어온 message값 유지
      if (messageId != null && !"".equals(messageId))
      {
         model.addAttribute("message", egovMessageSource.getMessage(messageId));
      }
      return "rms/cmn/authByMenuMngPage";
   }
   
   
   
   /**
    * 권한별 사용메뉴정보 가져오기(Ajax)
    * 
    * @author 복영훈
    * @since 2014-05-20
    * */
   @RequestMapping(value = "/rms/cmn/getAuthByMenuUsingList.do")
   public  String getAuthByMenuUsingList(HttpServletRequest request, @RequestParam String authSelect, ModelMap model) throws Exception
   {
      //System.out.println("111 : " + authSelect);
      //authSelect 값에 해당하는 사용메뉴 리스트 가져오기
      model.addAttribute("menuList", menuService.getAuthByMenuUsingList(authSelect));
      return "rms/cmn/usingMenuList";
   }
   
   /**
    * 권한별 미사용메뉴정보 가져오기(Ajax)
    * 
    * @author 복영훈
    * @since 2014-05-20
    * */
   @RequestMapping(value = "/rms/cmn/getAuthByMenuUnusingList.do")
   public  String getAuthByMenuUnusingList(HttpServletRequest request, @RequestParam String authSelect, ModelMap model) throws Exception
   {
      model.addAttribute("menuList", menuService.getAuthByMenuUnusingList(authSelect));
      return "rms/cmn/unusingMenuList";
   }
   
   
   
   /**
    * 권한별 사용메뉴 추가하기
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/addAuthByMenu.do")
   public  String addAuthByMenu(HttpServletRequest request, @RequestParam String modifyTarget, @RequestParam String authSelect, ModelMap model) throws Exception
   {
      int result = menuService.addAuthByMenu(modifyTarget, authSelect);
      
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.update");
      } else
      {
         model.addAttribute("messageId", "success.common.update");
      }
      
      return "redirect:/rms/cmn/gotoAuthByMenuMngPage.do";
   }

   
   
   /**
    * 권한별 사용메뉴 제거하기
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/removeAuthByMenu.do")
   public  String removeAuthByMenu(HttpServletRequest request, @RequestParam String modifyTarget, @RequestParam String authSelect, ModelMap model) throws Exception
   {
      int result = menuService.removeAuthByMenu(modifyTarget, authSelect);
      
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.update");
      } else
      {
         model.addAttribute("messageId", "success.common.update");
      }
      
      return "redirect:/rms/cmn/gotoAuthByMenuMngPage.do";
   }
   
   
   /**
    * 권한할당 페이지로 이동
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/gotoAuthAssignPage.do")
   public String gotoAuthAssignPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
   {
      Map<String, Object> searchCondition = new HashMap<String, Object>();
      searchCondition.put("companySelect", EgovStringUtil.nullConvert(request.getParameter("companySelect")));
      searchCondition.put("branchSelect", EgovStringUtil.nullConvert(request.getParameter("branchSelect")));
      searchCondition.put("deptSelect", EgovStringUtil.nullConvert(request.getParameter("deptSelect")));
      searchCondition.put("searchDiv", EgovStringUtil.nullConvert(request.getParameter("searchDiv")));
      searchCondition.put("searchText", EgovStringUtil.nullConvert(request.getParameter("searchText")));
      
      model.addAttribute("adminByAuthList", authService.getAdminByAuthList(searchCondition));
      
      String messageId = request.getParameter("messageId");
      
      // 등록,수정,삭제 Controller에서 넘어온 message값 유지
      if (messageId != null && !"".equals(messageId))
      {
         model.addAttribute("message", egovMessageSource.getMessage(messageId));
      }
      
      return "rms/cmn/authAssign";
   }
   
   
   /**
    * 사용자 소유메뉴 가져오기(Ajax)
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/getOwnAuthList.do")
   public  String getOwnAuthList(HttpServletRequest request, @RequestParam String adminId, ModelMap model) throws Exception
   {
      //System.out.println("111 : " + authSelect);
      //authSelect 값에 해당하는 사용메뉴 리스트 가져오기
      model.addAttribute("authList", authService.getOwnAuthList(adminId));
      return "rms/cmn/ownAuthList";
   }
   
   /**
    * 사용자 미소유 가져오기(Ajax)
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/getNotOwnAuthList.do")
   public  String getNotOwnList(HttpServletRequest request, @RequestParam String adminId, ModelMap model) throws Exception
   {
      model.addAttribute("authList", authService.getNotOwnList(adminId));
      return "rms/cmn/notOwnAuthList";
   }
   
   
   /**
    * 사용자별 권한 추가
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/addAdminByAuth.do")
   public @ResponseBody String addAdminByAuth(HttpServletRequest request, @RequestParam String modifyTarget, @RequestParam String adminId, ModelMap model) throws Exception
   {
      int result = authService.addAdminByAuth(modifyTarget, adminId);
      
      if (result == 0)
      {
         return egovMessageSource.getMessage("fail.common.update");
      } 
      else
      {
         return egovMessageSource.getMessage("success.common.update");
      }
   }
   
   
   /**
    * 사용자별 권한 제거
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   @RequestMapping(value = "/rms/cmn/removeAdminByAuth.do")
   public @ResponseBody String removeAdminByAuth(HttpServletRequest request, @RequestParam String modifyTarget, @RequestParam String adminId, ModelMap model) throws Exception
   {
      int result = authService.removeAdminByAuth(modifyTarget, adminId);
      
      if (result == 0)
      {
         return egovMessageSource.getMessage("fail.common.update");
      } 
      else
      {
         return egovMessageSource.getMessage("success.common.update");
      }
   }
}
