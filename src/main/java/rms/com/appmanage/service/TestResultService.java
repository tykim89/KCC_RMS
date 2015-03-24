package rms.com.appmanage.service;

import java.util.List;

import rms.com.appmanage.vo.TestResultVO;

public interface TestResultService {

	
	/**
	 * 최종제출 지원자 시험결과 테이블에 추가
	 * 
	 * */
	public void insertTestResult(TestResultVO testResultVO) throws Exception;
	
	
	/**
	 * 시험결과 점수 업데이트
	 * 
	 * */
	public void updateTestResult(List<TestResultVO> testResultList) throws Exception;
	
	
}
