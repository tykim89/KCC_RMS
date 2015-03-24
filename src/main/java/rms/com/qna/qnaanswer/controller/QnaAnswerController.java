package rms.com.qna.qnaanswer.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;

import rms.com.qna.qnaanswer.service.QnaAnswerService;
import rms.com.qna.qnaanswer.vo.QnaAnswerVo;
import rms.com.qna.qnaboard.controller.QnaController;
import rms.com.qna.qnaboard.vo.QnaVO;
import rms.com.qna.qnafrq.service.QnaFrqService;
import rms.com.sys.vo.AdminVO;

@Controller
public class QnaAnswerController {
	
	@Resource (name="qnaAnswerService")
	private QnaAnswerService qnaAnswerService;
	
	protected static final Log LOG = LogFactory.getLog(QnaAnswerController.class);

	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
    /**
     * Q&A 답글 입력
     * @author kccsmlee
     * */
    @RequestMapping (value="/rms/qna/qnaanswer/qnaAnswerInsertBoard.do")
    public String qnaAnswerInsertBoard(HttpServletRequest request, HttpServletResponse response, String frq_answer_content, String qna_quest_no, @ModelAttribute QnaAnswerVo vo) throws Exception {
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);		
    	LOG.info("********* Controller 성공");
//    	qnaAnswerService.qnaAnswerInsertBoard(vo);
    	qnaAnswerService.qnaAnswerInsertBoard(vo, qna_quest_no);
    	return "forward:/rms/qna/qnaBoarddetail.do";

    }
    
    /**
     * Q&A 답글 삭제
     * @author kccsmlee
     * @since 2014.06.05
     * */
    @RequestMapping (value="/rms/qna/qnaanswer/qnaAnswerDelete.do")
    public String qnaAnswerDelete(HttpServletRequest request, HttpServletResponse response, String qna_answer_no, String qna_quest_no, @ModelAttribute QnaAnswerVo vo) throws Exception{
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);
		
    	qnaAnswerService.qnaAnswerDelete(vo, qna_quest_no);
    	return "forward:/rms/qna/qnaBoarddetail.do";
    }
    
    /**
     * Q&A 댓글 수정
     * @author kccsmlee
     * **/
    @RequestMapping (value="/rms/qna/qnaanswer/qnaAnswerUpdate.do")
    public String qnaAnswerupdate(HttpServletRequest request, HttpServletResponse response, @ModelAttribute QnaAnswerVo vo) throws Exception{
    	
		HttpSession session = request.getSession();
		
		AdminVO avo =  (AdminVO) session.getAttribute("userInfo");		
		String writer = avo.getAdmin_id();		
		
		vo.setWriter(writer);
		
		LOG.info("--------------------------->"+vo.getQna_answer_content());
		
    	qnaAnswerService.qnaAnswerUpdate(vo);
    	return "forward:/rms/qna/qnaBoarddetail.do";
    }
    

    
	
}
