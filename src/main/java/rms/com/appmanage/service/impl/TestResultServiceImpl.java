package rms.com.appmanage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import rms.com.appmanage.service.TestResultService;
import rms.com.appmanage.vo.TestResultVO;



@Service("testResultService")
public class TestResultServiceImpl implements TestResultService {

	protected static final Log LOG = LogFactory.getLog(TestResultServiceImpl.class);

	@Resource(name="testResultDAO")
	protected TestResultDAO testResultDAO;
	
	
	
	@Override
	public void insertTestResult(TestResultVO testResultVO) throws Exception {
		testResultDAO.insertTestResult(testResultVO);
	}



	@Override
	public void updateTestResult(List<TestResultVO> testResultList)
			throws Exception {
		
		
	}
	
	
	
	
}
