package rms.com.check.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import rms.com.check.service.CheckResultService;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForRecResVO;
import rms.com.jal.vo.RecFieldVO;
import rms.com.recNotice.vo.RecNoticeVO;
import rms.com.sys.vo.AdminVO;
import rms.com.sys.vo.CodeDetailVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CheckResultController {

	/** Service */
	@Resource(name = "checkResultService")
	private CheckResultService checkResultService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	   
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	/** Log */
	protected static final Log LOG = LogFactory.getLog(CheckAssignController.class);
	
	@RequestMapping(value = "/rms/check/gotoCheckResultPage.do")
	public String gotoCheckResultPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		model.addAttribute("state","1");	
		return "forward:/rms/check/getCheckResultList.do";
	}
	
	@RequestMapping(value="/rms/check/getCheckResultList.do")
	public String getCheckUserList(HttpServletRequest request, HttpServletResponse response,@ModelAttribute PagingForRecResVO pagingVO, ModelMap model)throws Exception{
		/**  페이징 */
		String viewName = "";
		String admin_id="";
		if("1".equals(request.getAttribute("state")))
		{
			viewName="rms/check/checkResult";
		}else
		{
			viewName="rms/check/ajaxForCheckResultList";
		}
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			admin_id = user.getAdmin_id();
		}
		pagingVO.setAdmin_id(admin_id);
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = checkResultService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		List<CheckResVO> checkList = checkResultService.getAppUserList(pagingVO);			
		List<RecFieldVO> recFieldList = checkResultService.getRecField();
		List<CodeDetailVO> careerDivList =  checkResultService.getCareerDiv();
		List<CodeDetailVO> checkResList = checkResultService.getCheckRes();
		List<RecNoticeVO> recNoticeListForAdmin = checkResultService.getRecNotiListForAdmin(admin_id);
		
	
		LOG.info(careerDivList);
		LOG.info(checkList);
		model.addAttribute("recFieldList",recFieldList);
		model.addAttribute("careerDivList",careerDivList);
		model.addAttribute("checkResList",checkResList);
		model.addAttribute("recNoticeListForAdmin",recNoticeListForAdmin);
		if(checkList.size()==0 || checkList ==null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("checkList",checkList);
		}
		
		return viewName;
	}
	
	@RequestMapping(value="/rms/check/updateCheckResult.do")
	public String updateCheckRes(HttpServletRequest request, @ModelAttribute("inputCheckResVO")CheckResVO inputCheckResVO, ModelMap model)throws Exception{
		String checkedValue="";
		String viewName="";
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			inputCheckResVO.setAdmin_id(user.getAdmin_id());
			inputCheckResVO.setModifier(user.getAdmin_id());
			inputCheckResVO.setPosition_code(user.getPosition_code());
		}
		
		
		if(request.getParameter("option")!=null && request.getParameter("option").equals("holdRankingCall"))
		{
			viewName = "forward:/rms/check/getHoldranking.do";
		}else
		{
			viewName = "forward:/rms/check/getCheckResultList.do";
		}
		if(request.getParameter("checkedValue")!=null)
		{
			checkedValue = request.getParameter("checkedValue");
		}
		if(request.getParameter("check_res_code1")!=null)
		{
			inputCheckResVO.setCheck_res_code(request.getParameter("check_res_code1"));
		}
		int result = checkResultService.updateCheckResult(checkedValue, inputCheckResVO);
		
		
		return viewName;
	}
	/**
	 * 검토자별 보휴순위 조회 컨트롤러
	 * @author 이동선
	 * @param 검토자아이디, 채용공고번호
	 * @return 검토자 별 보류순위 목록
	 * */
	@RequestMapping(value="/rms/check/getHoldranking.do")
	public String getHoldrankingByChecker(HttpServletRequest request, ModelMap model)throws Exception{
		HttpSession session = request.getSession();
		String admin_id = "";
		String rec_noti_no="";
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			admin_id = user.getAdmin_id();
		}
		if(request.getParameter("rec_noti_no")!=null)
		{
			rec_noti_no =request.getParameter("rec_noti_no");
		}
		List<CheckResVO> holdrankingList = checkResultService.getholdrankingByCheckerService(admin_id, rec_noti_no);
		
		model.addAttribute("holdrankingList", holdrankingList);
		
		return "/rms/check/ajaxForHoldrankingList";
	}
	/**
	 * 검토결과 목록 엑셀문서로 변환하는 컨트롤러
	 * @author 이동선
	 * @param PagingVO
	 * @return 검토자 별 보류순위 목록
	 * */
	@RequestMapping(value="/rms/check/checkResult.xls")
	public String getReport(HttpServletRequest request,ModelMap model, @ModelAttribute PagingForRecResVO pagingVO)throws Exception{	
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");			
			pagingVO.setAdmin_id(user.getAdmin_id());
		}
		
		
		List<CheckResVO> reportList = checkResultService.getReportToExcelService(pagingVO);
		
		model.addAttribute("source", reportList);
		model.addAttribute("format", "xls");
		return "checkResultListView";
	}
	
	@RequestMapping(value="/rms/check/setHoldRanking.do")
	public String setHoldRanking(ModelMap model, HttpServletRequest request, @ModelAttribute CheckResVO chkResVO)throws Exception
	{
		HttpSession session = request.getSession();
		String holdRanking ="";
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			
			chkResVO.setAdmin_id(user.getAdmin_id());
			chkResVO.setModifier(user.getAdmin_id());			
		}
		if(request.getParameter("holdRanking")!=null)
		{
			holdRanking=request.getParameter("holdRanking");
		}
		int result = checkResultService.renewHoldRanking(holdRanking, chkResVO);
		model.addAttribute("renewHoldRankingResult", result);
		return "forward:/rms/check/getHoldranking.do";
	}
	
	@RequestMapping(value="/rms/check/updateCheckComment.json")
	public String updateCheckCommentCont(HttpServletRequest request, @ModelAttribute CheckResVO chkVO, ModelMap model)throws Exception{
		HttpSession session = request.getSession();		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");	
			chkVO.setAdmin_id(user.getAdmin_id());
			chkVO.setModifier(user.getAdmin_id());
		}
		int result = checkResultService.updateCheckComment(chkVO);
		model.addAttribute("updateCommentResult", result);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/rms/check/getCheckComment.do")
	public String getCheckComment(HttpServletRequest request, @ModelAttribute CheckResVO chkVO, ModelMap model)throws Exception{
		HttpSession session = request.getSession();		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");	
			chkVO.setAdmin_id(user.getAdmin_id());
		}
		CheckResVO checkComment = checkResultService.getCheckComment(chkVO);
		model.addAttribute("comment", checkComment.getCheck_comment());
		return "/rms/check/ajaxForCheckComment";
	}
	
	@RequestMapping(value="/rms/check/getCheckCommentJson.json")
	public String getCheckCommentJson(HttpServletRequest request, @ModelAttribute CheckResVO chkVO, ModelMap model)throws Exception{
		HttpSession session = request.getSession();		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");	
			chkVO.setAdmin_id(user.getAdmin_id());
		}
		CheckResVO checkComment = checkResultService.getCheckComment(chkVO);
		model.addAttribute("comment", checkComment.getCheck_comment());
		model.addAttribute("appUserName", checkComment.getApp_user_name());
		return "jsonView";
	}
	
/*	@RequestMapping(value="")
	public String deleteComment()throws Exception{
		
	}*/
}
