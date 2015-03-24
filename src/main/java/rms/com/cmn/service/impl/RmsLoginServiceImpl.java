package rms.com.cmn.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.cmn.service.impl.RmsLoginServiceImpl;
import rms.com.cmn.service.RmsLoginService;

import egovframework.com.cmm.LoginVO;
import egovframework.com.uat.uia.service.impl.EgovLoginServiceImpl;
import egovframework.com.uat.uia.service.impl.LoginDAO;

/**
 * 샘플 Service 구현클래스 생성
 * 
 * <pre>1. Class 파일 생성(위치 : srm/main/java/rms/com/본인업무단패키지/service/impl/)</pre>
 * 
 * <pre>2. @Service("xxxYyyServicce") 어노테이션 선언</pre>
 * 
 * <pre>3. 기존 egov프레임워크 기능활용의 경우 해당 구현클래스를 상속</pre>
 * 
 * <pre>4. 아닐경우 인터페이스만 상속</pre>
 * 
 * <pre>5. 클래스명 좌측의 빨간 X 클릭하여 quickFix의 unimplemented methods 를 통해 인터페이스의 함수 선언</pre>
 * 
 * <pre>6. 사용할 리소스 선언</pre>
 * 
 * <pre>6.1 Resource(name="xxxYyy")형태로 선언</pre>
 * 
 * <pre>6.2 name값은 사용할 리소스의 @Repository("xxxYyy")값과 대소문자 모두 동일해야함</pre>
 */
@Service("rmsLoginService")
public class RmsLoginServiceImpl extends EgovLoginServiceImpl implements RmsLoginService
{
   /** log */
   protected static final Log LOG = LogFactory.getLog(RmsLoginServiceImpl.class);

   @Resource(name = "rmsLoginDAO")
   private RmsLoginDAO        rmsLoginDAO;

   /**
    * 기존로직실행 후 후처리 할경우
    * */
   @Override
   public LoginVO actionLogin2(LoginVO vo) throws Exception
   {
      vo = this.actionLogin(vo);

      // 기존 로직실행 후 후처리할 부분구현
      return vo;
   }

   /**
    * Service단에서 강제 로그인 처리
    * */
   @Override
   public LoginVO testLogin(LoginVO vo) throws Exception
   {
      // 강제 로그인 처리
      LoginVO resultVO = new LoginVO();
      resultVO.setId("testUser");

      return resultVO;
   }

   /**
    * SqlMap단에서 강제 로그인 처리
    * */
   @Override
   public LoginVO testLogin2(LoginVO vo) throws Exception
   {

      LoginVO loginVO = rmsLoginDAO.testLogin(vo);

      // 3. 결과를 리턴한다.
      if (loginVO != null && !loginVO.getId().equals("") && !loginVO.getPassword().equals(""))
      {
         return loginVO;
      } else
      {
         loginVO = new LoginVO();
      }

      return loginVO;
   }

   /*
    * @Override public LoginVO actionLogin(LoginVO vo) throws Exception { //본래
    * 함수를 재구현 할 경우 Override하여 구현
    * LOG.info("RmsLoginServiceImpl.actionLogin LoginVO.id : " + vo.getId());
    * LOG.info("RmsLoginServiceImpl.actionLogin LoginVO.pw : " +
    * vo.getPassword());
    * 
    * //강제 로그인 처리 LoginVO resultVO = new LoginVO(); resultVO.setId("testUser");
    * 
    * return resultVO; }
    */

}
