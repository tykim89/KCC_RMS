package rms.com.recnews.controller;


import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


import rms.com.recnews.service.RecnewsService;

//import rms.com.recnews.vo.DefaultVO;.
import rms.com.qna.qnafrq.vo.DefaultVO; 
import rms.com.recnews.vo.RecnewsVO;
import rms.com.sys.vo.AdminVO;

@Controller
public class RecnewsController {
	
	@Resource (name="recnewsService")
	private RecnewsService recnewsSerivce;
	
	protected static final Log LOG = LogFactory.getLog(RecnewsController.class);

	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
	
	/**
	 * 채용소식 목록
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/recnews/recnewsBoardlist.do")
	public String RecnewsBoardlist(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO")DefaultVO pagingVO,  Model model) 
			throws Exception {
		
		LOG.info("어디한번유지되나보자"+pagingVO.getSearchKeyword());
		
    	/** EgovPropertyService.sample */
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing setting */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
//		String searchKey = request.getParameter("searchKey");
//		String searchValue = request.getParameter("searchValue");
//		List<RecnewsVO> list = (ArrayList<RecnewsVO>)recnewsSerivce.recnewsSerivce(searchKey, searchValue);
		
		int totCnt = recnewsSerivce.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<DefaultVO> list = recnewsSerivce.recnewsBoardlist(pagingVO);	
		
		if(list.size()==0 || list ==null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("list",list);			
		}
		
		
		LOG.info(">>>>>>>>>>>>>>>목록의 pageIndex"+pagingVO.getPageIndex());
		
	
		return "rms/recnews/recnewsBoardlist";
	
	}
	/**
	 * 채용소식 상세조회
	 * @author kccsmlee
	 *  */
	@RequestMapping(value="/rms/recnews/recnewsBoarddetail.do")
	public String RecnewsBoarddetail(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") DefaultVO pagingVO, String rec_news_no, Model model) throws Exception {
		

		LOG.info(">>>>>>>>상세조회의"+pagingVO.getPageIndex());
		
		RecnewsVO vo = recnewsSerivce.recnewsBoarddetail(rec_news_no);
		vo.setPageIndex(pagingVO.getPageIndex());		
		
		model.addAttribute("vo",vo);	
		return "rms/recnews/recnewsBoarddetail";
		
	}
	
	/**
	 * 채용소식 입력 이동
	 * @author kccsmlee
	 * */
	@RequestMapping(value="/rms/recnews/recnewsInsertBoardForm.do")
	public String recnewsInsertBoardForm(HttpServletRequest request, HttpServletResponse response, RecnewsVO vo) throws Exception {
		
		return "rms/recnews/recnewsInsertBoardForm";
		
	}
	
	/**
	 * 채용소식 입력
	 * @author kccsmlee
	 *  */
	@RequestMapping(value="/rms/recnews/recnewsInsertBoard.do")
	public String recnewsInsertBoard(HttpServletRequest request, HttpServletResponse response, @ModelAttribute RecnewsVO vo) throws Exception {
				
		HttpSession session = request.getSession();
				
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);
		
		recnewsSerivce.recnewsInsertBoard(vo);
	
		return "redirect:/rms/recnews/recnewsBoardlist.do";
		
	}
	
	/**
	 * 채용소식 수정 페이지이동
	 * @author kccsmlee
	 *  */
	@RequestMapping(value="/rms/recnews/recnewsUpdateBoardForm.do")
	public String recnewsUpdateBoardForm(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") DefaultVO pagingVO, String rec_news_no, Model model) throws Exception {
		

		RecnewsVO vo = recnewsSerivce.recnewsBoarddetail(rec_news_no);
		
		vo.setPageIndex(pagingVO.getPageIndex());
		
		model.addAttribute("vo",vo);		
		return "rms/recnews/recnewsBoardUpdate";
		
	}
	
	/**
	 * 채용소식 수정 
	 * @author kccsmlee
	 * */
	@RequestMapping(value="/rms/recnews/recnewsUpdateBoard.do")
	public String recnewsUpdateBoard(HttpServletRequest request, HttpServletResponse response, String rec_news_no, @ModelAttribute RecnewsVO vo, @ModelAttribute("pagingVO") DefaultVO pagingVO) throws Exception {
				
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);		
		
		recnewsSerivce.recnewsUpdateBoard(vo);

		return "forward:/rms/recnews/recnewsBoarddetail.do";
	}
	
	 /** 
	  * 채용소식 상세조회 삭제 
	  * @author kccsmlee
	  * */
	    @RequestMapping(value="/rms/recnews/recnewsDeleteDetailBoard.do")
	    public String recnewsDeleteDetailBoard(HttpServletRequest request, HttpServletResponse response, String rec_news_no, @ModelAttribute("pagingVO") DefaultVO pagingVO, @ModelAttribute RecnewsVO vo, Model model) throws Exception {
	   	    	
			HttpSession session = request.getSession();
			
			AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
			String writer = avo.getAdmin_id();		
			
			vo.setWriter(writer);  	
			
			recnewsSerivce.recnewsDeleteDetailBoard(vo);
			
	        return "forward:/rms/recnews/recnewsBoardlist.do";
	    }
	
	
	 /**
	  * 채용소식 목록 삭제 
	  * @author kccsmlee
	  * */
	    @RequestMapping(value="/rms/recnews/recnewsDeleteBoard.do")
	    public String recnewsDeleteBoard(HttpServletRequest request, HttpServletResponse response, @ModelAttribute RecnewsVO vo, @ModelAttribute("pagingVO") DefaultVO pagingVO, String writer) throws Exception {
	    	

			HttpSession session = request.getSession();
			
			AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
			writer = avo.getAdmin_id();		
			
			String [] checkSell = request.getParameterValues("checkSell");

	    			if(checkSell!=null){
	    				for(String checked : checkSell){


	    				}
	    			}
	    			
			recnewsSerivce.recnewsDeleteBoard(checkSell, writer);	    	
	        return "redirect:/rms/recnews/recnewsBoardlist.do";
	    }
	    



}
