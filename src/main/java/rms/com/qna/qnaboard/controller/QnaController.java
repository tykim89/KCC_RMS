
package rms.com.qna.qnaboard.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springmodules.validation.commons.DefaultBeanValidator;


import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;
import rms.com.qna.qnaanswer.service.QnaAnswerService;
import rms.com.qna.qnaanswer.vo.QnaAnswerVo;
import rms.com.qna.qnaboard.service.QnaService;
import rms.com.qna.qnaboard.vo.QnaVO;
import rms.com.qna.qnafrq.service.QnaFrqService;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.QnaFrqVO;
import rms.com.sys.vo.AdminVO;




import egovframework.com.cmm.EgovMessageSource;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class QnaController {
	
	@Resource (name="qnaService")
	private QnaService qnaSerivce;
	
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	@Resource (name="qnaFrqService")
	QnaFrqService qnaFrqService;
	
	@Resource(name="qnaAnswerService")
	QnaAnswerService qnaAnswerService;
	
	
	protected static final Log LOG = LogFactory.getLog(QnaController.class);

	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
    /**
	 * QNA 목록
	 * @author kccsmlee
	 * */
	@RequestMapping(value="/rms/qna/qnaBoardlist.do")
	public String QnaBoardlist(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") DefaultVO pagingVO, Model model) throws Exception {
		
//		String searchKey = request.getParameter("searchKey");
//		String searchValue = request.getParameter("searchValue");
//		
//		List<QnaVO> list = (ArrayList<QnaVO>)qnaSerivce.qnaBoardlist(searchKey, searchValue);
		

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
		
        int totCnt = qnaSerivce.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
		List<DefaultVO> list = qnaSerivce.qnaBoardlist(pagingVO);
		
		if(list.size()==0 || list == null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("list",list);			
		}		
//		String qna_quest_no = request.getParameter("qna_quest_no");
//		String qna_quest_pw = request.getParameter("qna_quest_pw");
//		QnaVO vo = qnaSerivce.qnacheckPW(qna_quest_no, qna_quest_pw);
//		model.addAttribute("vo",vo);
		
		return "rms/qna/qnaBoardlist";
	
	}
	
	/**
	 * QNA 상세조회
	 * @author kccsmlee
	 *  */
	@RequestMapping(value="/rms/qna/qnaBoarddetail.do")
	public String QnaBoarddetail(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") DefaultVO pagingVO, @RequestParam String qna_quest_no, Model model) throws Exception {
		
		LOG.info(">>>>>>>>상세조회의"+pagingVO.getPageIndex());
		
		String group_code="FAQ_TYPE";
		List<ItemVO> itemList= iService.getItemListService(group_code);
		model.addAttribute("itemList", itemList);
		
//		List<QnaAnswerVo> answerList = qnaAnswerService.getQnaAnswerContent(qna_quest_no);
//		model.addAttribute("answerList",answerList);
		
		QnaVO vo = qnaSerivce.qnaBoarddetail(qna_quest_no);
		vo.setPageIndex(pagingVO.getPageIndex());		
		model.addAttribute("vo",vo);
		
		List<QnaAnswerVo> qalist = qnaAnswerService.qnaAnswerBoardlist(qna_quest_no);
		model.addAttribute("qalist", qalist);
		
		List<QnaFrqVO> qflist = qnaFrqService.qnaTypeCode();
		model.addAttribute("qflist",qflist);
			
		return "rms/qna/qnaBoarddetail";
		
	}
	
	/**
	 * QNA 입력 이동
	 * @author kccsmlee
	 * */
	@RequestMapping(value="/rms/qna/qnaInsertBoardForm.do")	
	public String recnewsInsertBoardForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String group_code="FAQ_TYPE";
		List<ItemVO> itemList= iService.getItemListService(group_code);
		model.addAttribute("itemList", itemList);
		
		return "rms/qna/qnaInsertBoardForm";
		
	}
	
	
	/**
	 * QNA 입력
	 * @author kccsmlee
	 *  */
	@RequestMapping(value="/rms/qna/qnaInsertBoard.do")
	public String qnaInsertBoard(HttpServletRequest request, HttpServletResponse response, @ModelAttribute QnaVO vo) throws Exception {
		
		qnaSerivce.qnaInsertBoard(vo);
		return "redirect:/rms/qna/qnaBoardlist.do";
	
		
	}
	
	
	/**
	 * Q&A 수정
	 * @author kccsmlee
	 *  */
	@RequestMapping(value="/rms/qna/qnaUpdateBoard.do")
	public String qnaUpdateBoard(HttpServletRequest request, HttpServletResponse response, Model model, @ModelAttribute QnaVO vo, @ModelAttribute("pagingVO") DefaultVO pagingVO) throws Exception {

		LOG.info(">>>>>>>>수정할때"+pagingVO.getPageIndex()); 
		
		String group_code="FAQ_TYPE";
		List<ItemVO> itemList= iService.getItemListService(group_code);
		model.addAttribute("itemList", itemList);
		
		qnaSerivce.qnaUpdateBoard(vo);
		return "redirect:/rms/qna/qnaBoardlist.do";
		
		
	}
		
	 /** 
	  * Q&A 상세조회 삭제 
	  * @author kccsmlee
	  * */
	    @RequestMapping(value="/rms/qna/qnaDeleteDetailBoard.do")
	    public String qnaDeleteDetailBoard(HttpServletRequest request, HttpServletResponse response, String qna_quest_no, @ModelAttribute QnaVO vo, @ModelAttribute("pagingVO") DefaultVO pagingVO) throws Exception {
	    	
			HttpSession session = request.getSession();
			
			AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
			String writer = avo.getAdmin_id();	
			
			vo.setWriter(writer);
			
			qnaSerivce.qnaDeleteDetailBoard(vo);	    	
	        return "forward:/rms/qna/qnaBoardlist.do";
	    }
	    
	 /**
	  * Q&A 목록 삭제
	  * @author kccsmlee
	  *  */
	    @RequestMapping(value="/rms/qna/qnaDeleteBoard.do")
	    public String qnaDeleteBoard(HttpServletRequest request, HttpServletResponse response, @ModelAttribute QnaVO vo, String writer) throws Exception {

			HttpSession session = request.getSession();
			
			AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
			writer = avo.getAdmin_id();	
			
			String [] checkSell = request.getParameterValues("checkSell");
	    			if(checkSell!=null){
	    				for(String checked : checkSell){


	    				}
	    			}
	    			
			qnaSerivce.qnaDeleteBoard(checkSell, writer);	    	
	        return "redirect:/rms/qna/qnaBoardlist.do";
	    }
	    
	/**
	 * QNA 비밀번호 이동
	 * @author kccsmlee
	 * */
	@RequestMapping(value="/rms/qna/pwchk.do",  method = RequestMethod.GET)	
	public String qnaPWCheck(HttpServletRequest request, HttpServletResponse response, Locale locale, Model model) throws Exception {
			
		return "rms/qna/qnaPWCheck";
		
	}	    
	
	
	

	@RequestMapping(value="/rms/qna/qnaPWcheck.do")
	public String qnaPWcheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

			String group_code="FAQ_TYPE";
			List<ItemVO> itemList= iService.getItemListService(group_code);
			model.addAttribute("itemList", itemList);
		
			String qna_quest_pw = request.getParameter("qna_quest_pw");
			
			
			LOG.info("----------qna_quest_pw : "+qna_quest_pw);
			
			QnaVO vo = new QnaVO();
			vo = qnaSerivce.qnaPWcheck(qna_quest_pw);
			
			if(vo.getQna_quest_pw()!="" && vo.getQna_quest_pw().equals(qna_quest_pw)){
				
				LOG.info("------- 패스워드 같음");

				model.addAttribute("vo",vo);
				
				
//				List<QnaAnswerVo> answerList = qnaAnswerService.getQnaAnswerContent(qna_quest_no);
//				model.addAttribute("answerList",answerList);
				
				return "rms/qna/qnaBoarddetail";
	
				
			}else if(vo.getQna_quest_pw()!=qna_quest_pw){
				
				System.out.println("패스워드 다름 ㅋㅋㅋㅋㅋ");
				return "rms/qna/qnaBoardlist";
			}else{
				return "rms/qna/qnaBoardlist";
			}
			
		}		
	
	/**
	 * Q&A 비밀번호 확인
	 * @author kccsmlee
	 * */
	@RequestMapping ( value="/rms/qna/qnaboard/checkPW.do")
	public String checkPW(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		
		String qna_quest_no ="";
		String qna_quest_pw ="";

		int result = 0;
		
		
		if(request.getParameter("qna_quest_no")!=null)
		{
			qna_quest_no =request.getParameter("qna_quest_no");
		}
		if(request.getParameter("qna_quest_pw")!=null)
		{
			qna_quest_pw = request.getParameter("qna_quest_pw");
		}
		
		result = qnaSerivce.qnacheckPW(qna_quest_no, qna_quest_pw);
		
		model.addAttribute("qnaPwCheckResult", result);
		return "rms/qna/ajaxForQnaCheckPw";
	}
	
	
	
	
// -------------------------------------------------- 아 래 는 K C C 홈 페 이 지 부 분 -----------------------------------------------------------
	
	
	
	
	/**
	 * KCC 홈페이지 Q&A 목록 조회
	 * @author kccsmlee
	 * */
	@RequestMapping (value="/rms/qna/qnaboard/kccQnaBoardlist.do")
	public String kccBoardlist(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") DefaultVO pagingVO, Model model) throws Exception{
    			
		List<DefaultVO> list = qnaSerivce.qnaBoardlist(pagingVO);
		model.addAttribute("list",list);
		
		return "rms/kcc/kccQnaBoardlist";
	}
	

	   
    
    

}
