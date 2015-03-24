package rms.com.appmanage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


import rms.com.appmanage.service.AppBoardService;
import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import org.springmodules.validation.commons.DefaultBeanValidator;



@Controller
public class AppBoardController {

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
   
	/** Log */
	protected static final Log LOG = LogFactory.getLog(AppBoardController.class);

	
		
	/**
	 * 입사지원서 조회 
	 * 
	 * @author 선재희
	 * @since 2014-05-14
	 */
	@RequestMapping(value="/rms/appmanage/appBoard.do")
	public String appBoardView(HttpServletRequest request, HttpServletResponse response, 
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
		
		return "rms/appmanage/appBoard";
	}
	
	/**
	 * 검색조건에 맞는 입사지원조회 
	 * 
	 * @author 선재희
	 * @since 2014-05-14
	 */
	@RequestMapping(value="/rms/appmanage/appBoardBySearch.do")
	public String appBoardBySearch(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") AppUserSearchVO pagingVO, ModelMap model) throws Exception{
		
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
		
		//페이징처리 끝
		
		String messageId = request.getParameter("messageId");
		List<String> recFieldList = null;
		List<AppBoardVO> userList = null;
		
		//String selectTarget = request.getParameter("selectTarget");
		String recNoti = request.getParameter("recNoti");
		String careerDiv = request.getParameter("careerDiv");
		String recStep = request.getParameter("recStep");
		String recRes = request.getParameter("recRes");
		String userName = request.getParameter("userName"); // text 값
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		LOG.info("파라미터 전달 값 나와라 오바!!!   :::: " + userName);
		//recFieldList = appBoardService.selectField(selectTarget);
		pagingVO.setRecFieldList(recFieldList);
		pagingVO.setRec_noti_no(recNoti);
		pagingVO.setCareer_div_code(careerDiv);
		pagingVO.setRec_step_code(recStep);
		pagingVO.setRec_res_code(recRes);
		pagingVO.setApp_user_name(userName);
		pagingVO.setStart_date(start_date);
		pagingVO.setEnd_date(end_date);
		
		LOG.info("++++++++++++" + careerDiv);
		
		try {
			userList = appBoardService.userListService(pagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int totCnt = appBoardService.selectListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		model.addAttribute("userList", userList);
		
		// 등록,수정,삭제 Controller에서 넘어온 message값 유지
	      if (messageId != null && !"".equals(messageId))
	      {
	         model.addAttribute("message", egovMessageSource.getMessage(messageId));
	      }
		
		return "rms/appmanage/appBoardAjax";
	}

}

