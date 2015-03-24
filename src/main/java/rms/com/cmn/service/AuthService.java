package rms.com.cmn.service;

import java.util.List;
import java.util.Map;

import rms.com.cmn.vo.AdminByAuthVO;
import rms.com.cmn.vo.AuthVO;
import rms.com.cmn.vo.MenuVO;
import twitter4j.internal.org.json.JSONArray;

public interface AuthService {
	/**
	 * 전체권한정보 리스트 가져오기
	 * @author 복영훈
	 * @since 2014-05-14
	 * */
	public List<AuthVO> getAuthList() throws Exception;

	/**
	 * 권한 등록하기
	 * @author 복영훈
	 * @throws Exception 
	 * @since 2014-05-14
	 * */
	public int insertAuth(AuthVO authVO) throws Exception;

	/**
	 * 권한 삭제하기
	 * @author 복영훈
	 * @throws Exception 
	 * @since 2014-05-14
	 * */
	public int deleteAuth(String deleteTarget) throws Exception;

	/**
	 * 권한 수정하기
	 * @author 복영훈
	 * @throws Exception 
	 * @since 2014-05-15
	 * */
	public int updateAuth(AuthVO authVO) throws Exception;

	  /**
    * 사용자별 권한 가져오기
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public List<AdminByAuthVO> getAdminByAuthList(Map<String, Object> searchCondition) throws Exception;

   
 /**
  * 사용자 소유권한 가져오기
  * @author 복영훈
  * @throws Exception 
  * @since 2014-05-21
  * */
   public List<AuthVO> getOwnAuthList(String admin_id) throws Exception;

   
   /**
    * 사용자 미소유권한 가져오기
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public List<AuthVO> getNotOwnList(String admin_id) throws Exception;

   
   /**
    * 사용자별 권한 추가
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public int addAdminByAuth(String modifyTarget, String adminId) throws Exception;

   
   /**
    * 사용자별 권한 제거
    * @author 복영훈
    * @throws Exception 
    * @since 2014-05-21
    * */
   public int removeAdminByAuth(String modifyTarget, String adminId) throws Exception;
   
   
   /**
    * 특정 사용자의 사용가능 메뉴 가져오기
    * @author 복영훈
    * @since 2014-05-22
    */
   public List<MenuVO> getAuthorizedMenuList(String adminId) throws Exception;
}
