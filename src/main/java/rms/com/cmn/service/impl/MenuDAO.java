package rms.com.cmn.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.cmn.vo.AuthVO;
import rms.com.cmn.vo.MenuVO;

@Repository("menuDAO")
public class MenuDAO extends EgovComAbstractDAO
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(MenuDAO.class);
   
   /**
    * 전체권한정보 리스트 가져오기
    * @author 복영훈
    * @since 2014-05-14
    * */
    public List<MenuVO> getMenuList() throws Exception{
      return list("menuDAO.getMenuList", null);
    }

    /**
     * 메뉴 등록하기
     * @author 복영훈
     * @since 2014-05-19
     * */
   public int insertMenu(MenuVO menuVO)
   {
      return update("menuDAO.insertMenu", menuVO);
   }

   /**
    * 메뉴 삭제하기
    * @author 복영훈
    * @since 2014-05-19
    * */
   public int deleteMenu(Map<String, Object> deleteCondition)
   {
      return update("menuDAO.deleteMenu", deleteCondition);
   }

   /**
    * 메뉴 수정하기
    * @author 복영훈
    * @since 2014-05-19
    * */
   public int modifyMenu(MenuVO menuVO)
   {
      return update("menuDAO.updateMenu", menuVO);
   }

   
   /**
    * 권한별 사용메뉴 가져오기
    * @author 복영훈
    * @since 2014-05-20
    * */
   public List<MenuVO> getAuthByMenuUsingList(String authSelect)
   {
      return list("menuDAO.getAuthByMenuUsingList", authSelect);
   }

   
   /**
    * 권한별 미사용메뉴 가져오기
    * @author 복영훈
    * @since 2014-05-20
    * */
   public List<MenuVO> getAuthByMenuUnusingList(String authSelect)
   {
      return list("menuDAO.getAuthByMenuUnusingList", authSelect);
   }

   
   /**
    * 권한별 사용메뉴 추가하기
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   public int addAuthByMenu(Map<String, Object> modifyCondition)
   {
      return update("menuDAO.addAuthByMenu", modifyCondition);
   }

   
   /**
    * 권한별 사용메뉴 제거하기
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   public int removeAuthByMenu(Map<String, Object> modifyCondition)
   {
      return update("menuDAO.removeAuthByMenu", modifyCondition);
   }
}
