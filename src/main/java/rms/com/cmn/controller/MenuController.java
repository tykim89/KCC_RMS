package rms.com.cmn.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.EgovMessageSource;

import rms.com.cmn.service.MenuService;
import rms.com.cmn.vo.AuthVO;
import rms.com.cmn.vo.MenuVO;

@Controller
public class MenuController
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(MenuController.class);

   @Resource(name = "menuService")
   private MenuService        menuService;

   /** EgovMessageSource */
   @Resource(name = "egovMessageSource")
   EgovMessageSource          egovMessageSource;

   /**
    * 기존메뉴정보를 갖고 메뉴관리 페이지로 이동
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   @RequestMapping(value = "/rms/cmn/gotoMenuMngPage.do")
   public String gotoMenuMngPage(HttpServletRequest request, HttpServletResponse response,
         ModelMap model) throws Exception
   {
      model.addAttribute("menuList", menuService.getMenuList());
      String messageId = request.getParameter("messageId");

      // 등록,수정,삭제 Controller에서 넘어온 message값 유지
      if (messageId != null && !"".equals(messageId))
      {
         model.addAttribute("message", egovMessageSource.getMessage(messageId));
      }
      return "rms/cmn/menuMngPage";
   }

   /**
    * 메뉴 등록
    * 
    * @author 복영훈
    * @since 2014-05-19
    * */
   @RequestMapping(value = "/rms/cmn/insertMenu.do")
   public String insertMenu(@ModelAttribute MenuVO menuVO, HttpServletRequest request,
         HttpServletResponse response, ModelMap model) throws Exception
   {

      int result = menuService.insertMenu(menuVO);
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.insert");
      } else
      {
         model.addAttribute("messageId", "success.common.insert");
      }

      return "redirect:/rms/cmn/gotoMenuMngPage.do";
   }

   /**
    * 메뉴 삭제
    * 
    * @author 복영훈
    * @since 2014-05-19
    * */
   @RequestMapping(value = "/rms/cmn/deleteMenu.do")
   public String deleteAuth(@RequestParam("deleteTarget") String deleteTarget,
         HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
   {

      int result = menuService.deleteMenu(deleteTarget);
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.delete");
      } else
      {
         model.addAttribute("messageId", "success.common.delete");
      }

      return "redirect:/rms/cmn/gotoMenuMngPage.do";
   }

   /**
    * 메뉴 수정
    * 
    * @author 복영훈
    * @since 2014-05-19
    * */
   @RequestMapping(value = "/rms/cmn/modifyMenu.do")
   public String modifyAuth(@ModelAttribute MenuVO menuVO,
         @RequestParam("modifyTarget") String modifyTarget, HttpServletRequest request,
         HttpServletResponse response, ModelMap model) throws Exception
   {
      menuVO.setMenu_id(modifyTarget);
      int result = menuService.updateMenu(menuVO);
      if (result == 0)
      {
         model.addAttribute("messageId", "fail.common.update");
      } else
      {
         model.addAttribute("messageId", "success.common.update");
      }

      return "redirect:/rms/cmn/gotoMenuMngPage.do";
   }
   
   @RequestMapping(value="/rms/setSessionSelectedMenu.do")
   public void setSessionSelectedMenu(HttpServletRequest request)
   {
	   HttpSession session = request.getSession();
	   String menuId = "";
	   String menuName= "";
	   String secondMenuId= "";

	   if(request.getParameter("selectedMenuId")!=null)
	   {
		   menuId = request.getParameter("selectedMenuId");
		   session.setAttribute("selectedMenuId", menuId);
	   }
	   if(request.getParameter("selectedMenuId")!=null)
	   {
		   menuName = request.getParameter("selectedMenuName");
		   session.setAttribute("selectedMenuName", menuName);
	   }
	   if(request.getParameter("selectedSecondMenuId")!=null)
	   {
		   secondMenuId = request.getParameter("selectedSecondMenuId");
		   session.setAttribute("selectedSecondMenuId", secondMenuId);
	   }else
	   {
		   if(session.getAttribute("selectedSecondMenuId")!=null)
		   {
			   session.removeAttribute("selectedSecondMenuId");
		   }
	   }

   }
}
