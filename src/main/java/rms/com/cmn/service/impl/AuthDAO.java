package rms.com.cmn.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.cmn.vo.AdminByAuthVO;
import rms.com.cmn.vo.AuthVO;
import rms.com.cmn.vo.MenuVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("authDAO")
public class AuthDAO extends EgovComAbstractDAO
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(AuthDAO.class);

   /**
    * 전체권한정보 리스트 가져오기
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   public List<AuthVO> getAuthList() throws Exception
   {
      return list("authDAO.getAuthList", null);
   }

   /**
    * 권한 등록하기
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   public int insertAuth(AuthVO authVO)
   {
      return update("authDAO.insertAuth", authVO);
   }

   /**
    * 권한 삭제하기
    * 
    * @author 복영훈
    * @since 2014-05-14
    * */
   public int deleteAuth(Map<String, Object> deleteCondition)
   {
      return update("authDAO.deleteAuth", deleteCondition);
   }

   /**
    * 권한 수정하기
    * 
    * @author 복영훈
    * @since 2014-05-15
    * */
   public int modifyAuth(AuthVO authVO)
   {
      return update("authDAO.updateAuth", authVO);
   }

   
 /**
  * 사용자별 권한 가져오기
  * @author 복영훈
  * @throws Exception 
  * @since 2014-05-21
  * */
   public List<AdminByAuthVO> getAdminByAuthList(Map<String, Object> searchCondition)
   {
      return list("authDAO.getAdminByAuthList", searchCondition);
   }
   
   
   /**
    * 사용자 소유권한 가져오기
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public List<AuthVO> getOwnAuthList(String admin_id)
   {
      return list("authDAO.getOwnAuthList", admin_id);
   }

   
   /**
    * 사용자 미소유권한 가져오기
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public List<AuthVO> getNotOwnAuthList(String admin_id)
   {
      return list("authDAO.getNotOwnAuthList", admin_id);
   }

   
   /**
    * 사용자별 권한 추가
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public int addAdminByAuth(Map<String, Object> modifyCondition)
   {
      return update("authDAO.addAdminByAuth", modifyCondition);
   }

   
   /**
    * 사용자별 권한 제거
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public int removeAdminByAuth(Map<String, Object> modifyCondition)
   {
      return update("authDAO.removeAdminByAuth", modifyCondition);
   }

   
   /**
    * 특정 사용자의 사용가능 메뉴 가져오기
    * @author 복영훈
    * @since 2014-05-22
    */
   public List<MenuVO> getAuthorizedMenuList(String adminId)
   {
      return list("authDAO.getAuthorizedMenuList",adminId);
   }
}
