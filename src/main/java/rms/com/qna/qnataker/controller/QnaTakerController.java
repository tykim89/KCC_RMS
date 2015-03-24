package rms.com.qna.qnataker.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;

import rms.com.qna.qnataker.service.QnaTakerService;
import rms.com.qna.qnataker.vo.QnaTakerVO;
import rms.com.sys.vo.AdminVO;

@Controller
public class QnaTakerController {

	@Resource (name="qnaTakerService")
	private QnaTakerService qnaTakerService;
	
	protected static final Log LOG = LogFactory.getLog(QnaTakerController.class);
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
    /** 메일 수신자 목록 */
    @RequestMapping(value="/rms/qna/qnaTaker/qnaTakerBoardlist.do")
    public String qnaTakerBoardlist(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	
    	String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		List<QnaTakerVO> list = qnaTakerService.qnaTakerBoardlist(searchKey,searchValue);
		model.addAttribute("list", list);
    	
    	return "rms/qna/qnataker/qnaTakerBoardlist";
    }
    
    
    	
    
	

}
