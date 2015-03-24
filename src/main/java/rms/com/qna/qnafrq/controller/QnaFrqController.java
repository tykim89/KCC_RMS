package rms.com.qna.qnafrq.controller;

import java.util.List;
import java.util.Map;

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

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;
import rms.com.qna.qnafrq.service.QnaFrqService;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.QnaFrqVO;
import rms.com.recnews.vo.RecnewsVO;
import rms.com.sys.vo.AdminVO;

@Controller
public class QnaFrqController {

	@Resource (name="qnaFrqService")
	private QnaFrqService qnaFrqService;
	
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	protected static final Log LOG = LogFactory.getLog(QnaFrqController.class);
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
    /** 다사용답변 목록 
     * @author kccsmlee
     * */

    @RequestMapping(value="/rms/qna/qnafrq/qnaFrqBoardlist.do")
    public String qnaFrqBoardlist(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("pagingVO") DefaultVO pagingVO, Model model) throws Exception{
    	
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
		
        List<DefaultVO> list = qnaFrqService.qnaFrqBoardlist(pagingVO);
        model.addAttribute("list", list);
        
        int totCnt = qnaFrqService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

    	return "rms/qna/qnafrq/qnaFrqBoardlist";
    	
    }
    
    
    /** 다사용답변 입력 이동 
     * @author kccsmlee
     * */
    
    @RequestMapping(value="/rms/qna/qnafrq/qnaFrqInsertBoardForm.do")
    public String qnaFrqInsertBoardForm(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
    	
    	String group_code="FAQ_TYPE";
		List<ItemVO> itemList= iService.getItemListService(group_code);
		model.addAttribute("itemList", itemList);
		
    	return "rms/qna/qnafrq/qnaFrqInsertBoardForm";
    }
        
    
    /** 다사용답변 입력 
     * @author kccsmlee
     * */    
    @RequestMapping(value="/rms/qna/qnafrq/qnaFrqInsertBoard.do")
    public String qnaFrqInsertBoard(HttpServletRequest request, HttpServletResponse response,  @ModelAttribute QnaFrqVO vo) throws Exception{
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);
		
    	qnaFrqService.qnaFrqInsertBoard(vo);
    	
    	return "redirect:/rms/qna/qnafrq/qnaFrqBoardlist.do";
    }
    
    
    
    
    /** 다사용답변 상세조회 
     * @author kccsmlee
     * */
    
    @RequestMapping(value="/rms/qna/qnafrq/qnaFrqBoarddetail.do")
    public String qnaFrqBoarddetail(HttpServletRequest request, HttpServletResponse response, String frq_answer_no, Model model) throws Exception{
    	
    	String group_code="FAQ_TYPE";
		List<ItemVO> itemList= iService.getItemListService(group_code);
		model.addAttribute("itemList", itemList);
		
    	QnaFrqVO vo= qnaFrqService.qnaFrqBoarddetail(frq_answer_no);
    	model.addAttribute("vo",vo);
    	
    	return "rms/qna/qnafrq/qnaFrqBoarddetail";
    }
    
    
    /** 다사용답변 수정
     * @author kccsmlee
     *  */
    @RequestMapping(value="/rms/qna/qnafrq/qnaFrqUpdateBoard.do")
    public String qnaFrqUpdateBoard(HttpServletRequest request, HttpServletResponse response, Model model, @ModelAttribute QnaFrqVO vo) throws Exception{
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);
		
    	String group_code="FAQ_TYPE";
		List<ItemVO> itemList= iService.getItemListService(group_code);
		model.addAttribute("itemList", itemList);
		
    	qnaFrqService.qnaFrqUpdateBoard(vo);
    	return "redirect:/rms/qna/qnafrq/qnaFrqBoardlist.do";
    		
    }
    
    /** 다사용답변 목록 삭제
     * @author kccsmlee
     * */
    @RequestMapping (value="/rms/qna/qnafrq/qnaFrqDeleteBoard.do")
    public String qnaFrqDeleteBoard(HttpServletRequest request, HttpServletResponse response, @ModelAttribute QnaFrqVO vo, String writer) throws Exception{
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		writer = avo.getAdmin_id();		
		
		String [] checkSell = request.getParameterValues("checkSell");

		if(checkSell!=null){
			for(String checked : checkSell){


			}
		}
		
		qnaFrqService.qnaFrqDelete(checkSell, writer);   
    	return "redirect:/rms/qna/qnafrq/qnaFrqBoardlist.do";
    	
    }
    
    /** 다사용답변 목록 삭제
     * @author kccsmlee
     * @since 14.06.03
     * */
    @RequestMapping (value="/rms/qna/qnafrq/qnaFrqContentList.do")
    public String qnaFrqContentList(HttpServletRequest request, @RequestParam String typeSelect, ModelMap model) throws Exception{

    	//System.out.println("111 : " + authSelect);
      //authSelect 값에 해당하는 사용메뉴 리스트 가져오기

		model.addAttribute("contentList",qnaFrqService.qnaFrqContentList(typeSelect));
    	
    	return "rms/qna/ajaxForFrqContent";
    
    }
    
    /** 다사용답변 상세조회 삭제
     * @author kccsmlee
     * @since 2014.06.05
     * */
    @RequestMapping(value="/rms/qna/qnafrq/qnaFrqDeleteDetailBoard.do")
    public String qnaFrqDeleteDetailBoard(HttpServletRequest request, HttpServletResponse response, @ModelAttribute QnaFrqVO vo,String frq_answer_no) throws Exception {
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);	
		
		qnaFrqService.qnaFrqDeleteDetailBoard(vo);	    	
        return "redirect:/rms/qna/qnafrq/qnaFrqBoardlist.do";
    }
    
    
	

}
