package rms.com.appmanage.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import rms.com.appmanage.service.AppBoardService;
import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.appmanage.vo.TestResultVO;
import rms.com.sys.vo.AdminVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class TestResultController {

	protected static final Log LOG = LogFactory.getLog(TestResultController.class);
	
	/** AppBoardService */
	@Resource(name="appBoardService")
	private AppBoardService appBoardService;
	
	
   /** EgovMessageSource */
   @Resource(name = "egovMessageSource")
   EgovMessageSource          egovMessageSource;
	
   /** EgovPropertyService */
   @Resource(name = "propertiesService")
   protected EgovPropertyService propertiesService;
   
   /** Validator */
   @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	
   /**
    * 시험결과목록조회
    * 
    * */
	@RequestMapping(value="/rms/appmanage/testResultList.do")
	public String getTestResultList(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("pagingVO") AppUserSearchVO pagingVO, ModelMap model) throws Exception{
		
		String messageId = request.getParameter("messageId");
		
		/**  페이징 */
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//전체 조회 리스트 DAO
		List<AppBoardVO> list = null;
				
		try 
		{
			list = appBoardService.allUserListService(pagingVO);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}		
		
		// 등록,수정,삭제 Controller에서 넘어온 message값 유지
	      if (messageId != null && !"".equals(messageId))
	      {
	         model.addAttribute("message", egovMessageSource.getMessage(messageId));
	      }
		
	    model.addAttribute("userList", list);
	    LOG.info("*************" + list);
	    
	    
	    int totCnt = appBoardService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
	    
		model.addAttribute("recNotiList", appBoardService.recNotiService());
		model.addAttribute("recFieldList", appBoardService.recFieldService()); 
		model.addAttribute("careerDivList", appBoardService.careerDivService()); 
		model.addAttribute("recStepList", appBoardService.recStepService());
		model.addAttribute("recResList", appBoardService.recResService());
		
		
		return "rms/appmanage/testResult";
	}
	
	
	/**
	 * 시험점수 등록
	 * 
	 * */
	@RequestMapping(value="/rms/appmanage/insertTestResult.do")
	public String insertTestResult(HttpServletRequest request, HttpSession session, 
			AdminVO adminVO, Model model) throws Exception{
		
		adminVO = (AdminVO) session.getAttribute("userInfo");
		String writer = adminVO.getAdmin_id();
		
		TestResultVO testResultVO = new TestResultVO();
		Enumeration<String> e = request.getParameterNames();
		
		List<TestResultVO> testResultList = new ArrayList<TestResultVO>();
		
		while(e.hasMoreElements())
		{
			String testResultName = e.nextElement();
			String[] testResult = testResultName.split("\\|");

			if(testResult.length>1)
			{
    			String[] test_score = request.getParameterValues(testResultName);
    			
    			String test_code = testResult[0];
    			String app_user_no = testResult[1];
    			String rec_noti_no = testResult[2];

    			if(test_score != null)
    			{
    				for(String value : test_score)
    				{
    					testResultVO.setTest_code(test_code);
    					testResultVO.setTest_score(value);
    					testResultVO.setApp_user_no(app_user_no);
    					testResultVO.setRec_noti_no(rec_noti_no);
    					testResultVO.setWriter(writer);
    					
    					testResultList.add(testResultVO);
    				}
    			}
			}
		}
		
		
		return "";
	}
	
	
	
}
