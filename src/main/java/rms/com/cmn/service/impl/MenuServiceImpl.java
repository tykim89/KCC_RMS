package rms.com.cmn.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import rms.com.cmn.service.MenuService;
import rms.com.cmn.vo.MenuVO;
import rms.com.util.service.JSONUtil;

@Service("menuService")
public class MenuServiceImpl extends AbstractServiceImpl implements MenuService
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(MenuServiceImpl.class);

   @Resource(name = "menuDAO")
   private MenuDAO            menuDAO;

   @Override
   public List<MenuVO> getMenuList() throws Exception
   {
      List<MenuVO> menuList = menuDAO.getMenuList(); 
      for(MenuVO vo : menuList)
      {
         vo.setJsonString(JSONUtil.toJson(vo));
      }
      return menuList;
   }

   @Override
   public int insertMenu(MenuVO menuVO)
   {
      // 작성자정보(이후수정)
      menuVO.setWriter("admin");
      return menuDAO.insertMenu(menuVO);
   }

   @Override
   public int deleteMenu(String deleteTarget)
   {
      List<String> deleteTargetList = new ArrayList<String>();
      for (String str : deleteTarget.split("\\|"))
      {
         deleteTargetList.add(str);
      }
      Map<String, Object> deleteCondition = new HashMap<String, Object>();
      // 수정자(이후수정)
      deleteCondition.put("modifier", "admin");
      deleteCondition.put("deleteTargetList", deleteTargetList);


      return menuDAO.deleteMenu(deleteCondition);
   }

   @Override
   public int updateMenu(MenuVO menuVO)
   {
      //수정자(이후수정)
      menuVO.setModifier("admin");
      
      return menuDAO.modifyMenu(menuVO);
   }

   @Override
   public List<MenuVO> getAuthByMenuUsingList(String authSelect)
   {
      return menuDAO.getAuthByMenuUsingList(authSelect);
   }

   @Override
   public List<MenuVO> getAuthByMenuUnusingList(String authSelect)
   {
      return menuDAO.getAuthByMenuUnusingList(authSelect);
   }

   @Override
   public int addAuthByMenu(String modifyTarget, String authSelect)
   {
      List<String> modifyTargetList = new ArrayList<String>();
      for (String str : modifyTarget.split("\\|"))
      {
         modifyTargetList.add(str);
      }
      Map<String, Object> modifyCondition = new HashMap<String, Object>();
      // 수정자(이후수정)
      modifyCondition.put("writer", "admin");
      modifyCondition.put("modifyTargetList", modifyTargetList);
      modifyCondition.put("auth_id", authSelect);
      
      return menuDAO.addAuthByMenu(modifyCondition);
   }

   @Override
   public int removeAuthByMenu(String modifyTarget, String authSelect)
   {
      List<String> modifyTargetList = new ArrayList<String>();
      for (String str : modifyTarget.split("\\|"))
      {
         modifyTargetList.add(str);
      }
      Map<String, Object> modifyCondition = new HashMap<String, Object>();
      // 수정자(이후수정)
      modifyCondition.put("writer", "admin");
      modifyCondition.put("modifyTargetList", modifyTargetList);
      modifyCondition.put("auth_id", authSelect);
      
      return menuDAO.removeAuthByMenu(modifyCondition);
   }

}
