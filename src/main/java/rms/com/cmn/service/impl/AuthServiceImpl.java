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
import rms.com.cmn.service.AuthService;
import rms.com.cmn.vo.AdminByAuthVO;
import rms.com.cmn.vo.AuthVO;
import rms.com.cmn.vo.MenuVO;
import rms.com.util.service.JSONUtil;
import twitter4j.internal.org.json.JSONArray;

@Service("authService")
public class AuthServiceImpl extends AbstractServiceImpl implements AuthService
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(AuthServiceImpl.class);

   @Resource(name = "authDAO")
   private AuthDAO            authDAO;

   /** ID Generation */
   @Resource(name = "rmsAuthIdGnrService")
   private EgovIdGnrService   rmsIdGnrService;

   @Override
   public List<AuthVO> getAuthList() throws Exception
   {
      return authDAO.getAuthList();
   }

   @Override
   public int insertAuth(AuthVO authVO) throws Exception
   {
      String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());

      authVO.setAuth_id(key);
      // 작성자정보(이후수정)
      authVO.setWriter("admin");
      return authDAO.insertAuth(authVO);
   }

   @Override
   public int deleteAuth(String deleteTarget) throws Exception
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

      return authDAO.deleteAuth(deleteCondition);
   }

   @Override
   public int updateAuth(AuthVO authVO) throws Exception
   {
      // 수정자(이후수정)
      authVO.setModifier("admin");

      return authDAO.modifyAuth(authVO);
   }

   @Override
   public List<AdminByAuthVO> getAdminByAuthList(Map<String, Object> searchCondition)
   {
      return authDAO.getAdminByAuthList(searchCondition);
   }

   @Override
   public List<AuthVO> getOwnAuthList(String admin_id)
   {
      return authDAO.getOwnAuthList(admin_id);
   }

   @Override
   public List<AuthVO> getNotOwnList(String admin_id)
   {
      return authDAO.getNotOwnAuthList(admin_id);
   }

   @Override
   public int addAdminByAuth(String modifyTarget, String adminId)
   {
      List<String> modifyTargetList = new ArrayList<String>();
      
      for (String str : modifyTarget.split("\\|"))
      {
         modifyTargetList.add(str);
      }
      
      Map<String, Object> modifyCondition = new HashMap<String, Object>();
      
      // 작성자정보(이후수정)
      modifyCondition.put("writer", "admin");
      modifyCondition.put("modifyTargetList", modifyTargetList);
      modifyCondition.put("admin_id", adminId);
      
      return authDAO.addAdminByAuth(modifyCondition);
   }

   @Override
   public int removeAdminByAuth(String modifyTarget, String adminId)
   {
      List<String> modifyTargetList = new ArrayList<String>();
      
      for (String str : modifyTarget.split("\\|"))
      {
         modifyTargetList.add(str);
      }
      
      Map<String, Object> modifyCondition = new HashMap<String, Object>();
      
      modifyCondition.put("modifyTargetList", modifyTargetList);
      modifyCondition.put("admin_id", adminId);
      
      return authDAO.removeAdminByAuth(modifyCondition);
   }

   @Override
   public List<MenuVO> getAuthorizedMenuList(String adminId) throws Exception
   {
      List<MenuVO> authorizedMenuList = authDAO.getAuthorizedMenuList(adminId); 
      
      /*for(MenuVO vo : authorizedMenuList)
      {
         vo.setJsonString(JSONUtil.toJson(vo));
      }*/
      
      /*for(MenuVO menuVO : authorizedMenuList)
      {
         for(int i=1; i < 6; i++)
         {
            if(menuVO.getDepth().equals(String.valueOf(i)))
            {
               
            }
         }
      }*/
      return authorizedMenuList;
   }

}
