package rms.com.faq.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import rms.com.faq.service.FaqService;
import rms.com.faq.vo.FaqVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.sys.vo.AdminVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class FaqController {

	
	@Resource(name="faqService")
	private FaqService faqService;

	
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
    
	// 로그 클래스
	protected static final Log LOG = LogFactory.getLog(FaqController.class);

	
	
	// FAQ 목록조회, 검색
	@RequestMapping(value="/rms/faq/faqList.do")
	public String getFaqSearchList(HttpServletRequest request, HttpServletResponse response, Model model,
											   @ModelAttribute("pagingVO") DefaultVO pagingVO){
		
    	/** EgovPropertyService.sample */
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
    	/** paging setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		

		
		
		List<DefaultVO> faqList = faqService.getFaqList(pagingVO);
		model.addAttribute("faqList", faqList);
		
		int totCnt = faqService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		
		model.addAttribute("paginationInfo", paginationInfo);
		
		

		ArrayList<Object> noList = new ArrayList<Object>();
		int i=0;
		int nowPage;
		int result=0;
		nowPage = (int) Math.ceil((double)totCnt/10);
	
		for(i=0; i<totCnt; i++){
			result = totCnt-i;
			noList.add(result);
		}
				
		LOG.info(nowPage);
		LOG.info(noList);

		
		
/*		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
			
		List<FaqVO> faqList = faqService.getFaqSearchList(searchValue, searchKey);
		model.addAttribute("faqList", faqList);		
*/	      
		
	    String messageId = request.getParameter("messageId");
	    // 등록,수정,삭제 Controller에서 넘어온 message값 유지
	    if (messageId != null && !"".equals(messageId))
       {
	    	model.addAttribute("message", egovMessageSource.getMessage(messageId));
	    }
	      
	      
		return "/rms/faq/faqList";
	}

	
	
	// FAQ 상세조회
	@RequestMapping(value="/rms/faq/faqContent.do")
	public String getFaqContent(HttpServletRequest request, HttpServletResponse response, Model model, String faq_no){
		
		FaqVO faqContent = faqService.getFaqContent(faq_no);
		
		model.addAttribute("faqContent", faqContent);

		
		return "/rms/faq/faqContent";
	}
	
	
	
	// FAQ 등록
	@RequestMapping(value="/rms/faq/insertFaq.do")
	public String insertFaq(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
									@ModelAttribute("faqVO") FaqVO faqVO, Model model, AdminVO adminVO){
		
		/** 아이디 세션 받아오기*/
		adminVO = (AdminVO) session.getAttribute("userInfo");
		faqVO.setWriter(adminVO.getAdmin_id());
				
		
	      boolean result = faqService.insertFaq(faqVO);
	      if (result == false)
	      {
	         model.addAttribute("messageId", "fail.common.insert");
	      } else
	      {
	         model.addAttribute("messageId", "success.common.insert");
	      }
		
		return "redirect:/rms/faq/faqList.do";
	}
	
	@RequestMapping(value="/rms/faq/insertFaqForm.do")	// 등록페이지 이동
	public String insertFaqForm(){
		return "rms/faq/faqInsert";
	}
	
	// FAQ 수정
	@RequestMapping(value="/rms/faq/updateFaq.do")
	public String updateFaq(HttpSession session, @ModelAttribute("faqContent") FaqVO faqContent, Model model, AdminVO adminVO){
		
		adminVO = (AdminVO) session.getAttribute("userInfo");
		faqContent.setModifier(adminVO.getAdmin_id());
		
		String faq_no = faqContent.getFaq_no();
		
		faqService.updateFaq(faqContent);


		LOG.info("**************"+faq_no);
		
		return "redirect:/rms/faq/faqContent.do?faq_no="+faq_no;
	}
	
	@RequestMapping(value="/rms/faq/updateFaqForm.do")
	public String getFaqContentForUpdate(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, String faq_no){

		faq_no = request.getParameter("faq_no");
		FaqVO faqContent = faqService.getFaqContent(faq_no);
		
		modelMap.addAttribute("faqContent", faqContent);
		
		LOG.info("**************"+faqContent.getFaq_type_code());
		
		return "/rms/faq/faqUpdate";
	}
	
	
	// FAQ 삭제
	@RequestMapping(value="/rms/faq/deleteFaq.do")
	public String deleteFaq(HttpServletRequest request, HttpServletResponse response, Model model, 
									@RequestParam("faq_no") String faq_no){
		
		
		boolean result = faqService.deleteFaq(faq_no);
		
		  if (result == false)
	      {
	         model.addAttribute("messageId", "fail.common.delete");
	      } else
	      {
	         model.addAttribute("messageId", "success.common.delete");
	      }
		
		  LOG.info(result);
		  
		
		return "redirect:/rms/faq/faqList.do";
	}
	
	

}
