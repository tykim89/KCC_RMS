package rms.com.cmn.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

/**
 * 샘플 DAO생성<p>
 * 1. Class 파일 생성(위치 : srm/main/java/rms/com/본인업무단패키지/service/impl/)<p>
 * 2. @Repository("xxxYyyDAO") 어노테이션 선언<p>
 * 3. 기존 egov프레임워크 기능활용의 경우 해당 DAO클래스를 상속<p>
 * 4. 아닐경우 EgovComAbstractDAO 상속<p>
 * 5. 함수생성 하여 쿼리실행<p>
 * 5.1 selectByPk(String id, Object parameter) : 단건 조회<p>
 * 5.2 list(String id, Object parameter) : 리스트조회<p>
 * 5.3 update(String id, Object parameter) : 업데이트 및 인서트(인서트쿼리의 경우도 update를 사용해야 성공결과를 받을수 있음)<p>
 * 5.4 delete(String id, Object parameter) : 삭제(특수한 경우 외에는 delete를 사용하지 않음)
 * 6. SqlMapConfig 파일 생성(경로 : src/main/resources/sqlmap/config/oracle/rms/sql-map-config-oracle-rms-본인업무단.xml)
 * 6. SqlMap 파일 생성(경로 : src/main/resources/sqlmap/rms/com/본인업무단/RmsXxxYyy_SQL.xml)
 */
@Repository("rmsLoginDAO")
public class RmsLoginDAO  extends EgovComAbstractDAO{
	/** log */
    protected static final Log LOG = LogFactory.getLog(RmsLoginDAO.class);
    
	/**
	 * 샘플 dao
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO testLogin(LoginVO vo) throws Exception {
    	return (LoginVO)selectByPk("rmsLoginDAO.rmsActionLogin", vo);
    }

}
