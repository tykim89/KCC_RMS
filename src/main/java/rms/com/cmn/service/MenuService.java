package rms.com.cmn.service;

import java.util.List;

import rms.com.cmn.vo.MenuVO;

public interface MenuService
{
   /**
    * 전체메뉴정보 리스트 가져오기
    * @author 복영훈
    * @since 2014-05-15
    * */
   List<MenuVO> getMenuList() throws Exception;

   /**
    * 메뉴 입력하기
    * @author 복영훈
    * @since 2014-05-19
    * */
   int insertMenu(MenuVO menuVO);

   /**
    * 메뉴 삭제하기
    * @author 복영훈
    * @since 2014-05-19
    * */
   int deleteMenu(String deleteTarget);

   /**
    * 메뉴 수정하기
    * @author 복영훈
    * @since 2014-05-19
    * */
   int updateMenu(MenuVO menuVO);

   
   /**
    * 권한별 사용메뉴 가져오기
    * @author 복영훈
    * @since 2014-05-20
    * */
   List<MenuVO> getAuthByMenuUsingList(String authSelect);
   
   
   /**
    * 권한별 미사용메뉴 가져오기
    * @author 복영훈
    * @since 2014-05-20
    * */
   List<MenuVO> getAuthByMenuUnusingList(String authSelect);

   
   /**
    * 권한별 사용메뉴 추가하기
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   int addAuthByMenu(String modifyTarget, String authSelect);

   
   /**
    * 권한별 사용메뉴 제거하기
    * 
    * @author 복영훈
    * @since 2014-05-21
    * */
   int removeAuthByMenu(String modifyTarget, String authSelect);
}
