package rms.com.appmanage.service.impl;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.appmanage.vo.TestResultVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


@Repository("testResultDAO")
public class TestResultDAO extends EgovComAbstractDAO{
	
	protected static final Log LOG = LogFactory.getLog(TestResultDAO.class);

	
	/**
	 * 최종제출 지원자 시험결과 테이블에 추가
	 * 
	 * */
	public void insertTestResult(TestResultVO testResultVO) throws Exception {
		update("testResultDAO.insert", testResultVO);
	}
	
	
	/**
	 * 시험결과 점수 업데이트
	 * 
	 * */
	public void updateTestResult(TestResultVO testResultVO) throws Exception {
		update("testResultDAO.update", testResultVO);
	}
	
	
	
}
