package rms.com.svc.controller;

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

import rms.com.svc.service.EmailService;
import rms.com.svc.vo.EmailFormVO;
import egovframework.com.cmm.EgovMessageSource;

@Controller
public class EmailController {
	@Resource(name="emailService")
	EmailService eService;
	
	protected static final Log LOG = LogFactory.getLog(EmailController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    /**이메일 양식 등록
     * @author 	이동선
     * @since	2014-05-20
     * */
    @RequestMapping(value="/rms/svc/addEmailForm.do")
    public String addEmailForm(@ModelAttribute EmailFormVO inputEmailFormVO)throws Exception{
    	int result = 0;
    	
    	inputEmailFormVO.setEmail_form_name("tes양식");
    	inputEmailFormVO.setEmail_form_content("<a href=/>");
    	
    	result = eService.addEmailFormService(inputEmailFormVO);
    	if(result !=0)
    	{
    		LOG.info("[이메일 양식]"+result+"건의 행이 등록");
    	}else
    		
    	{
    		LOG.info("[이메일 양식] 등록 실패");
    	}
    	return "redirect:/rms/svc/getEmailFormList.do";
    }
    
    /**이메일 양식 목록 조회
     * @author 	이동선
     * @since	2014-05-20
     * */
    @RequestMapping(value="/rms/svc/getEmailFormList.do")
    public String getEmailFormList(ModelMap model)throws Exception{
    	List<EmailFormVO> emailFormList = eService.getEmailFormListService();
    	for(EmailFormVO vo : emailFormList)
    	{
    		LOG.info("@@@"+vo.toString());
    	}
    	model.addAttribute("emailFormList", emailFormList);
    	
    	return "rms/cmn/rmsLoginForm";
    }
    
    /**이메일 양식 상세 조회
     * @author 	이동선
     * @since	2014-05-20
     * */
    @RequestMapping(value="/rms/svc/getEmailFormDetail.do")
    public String getEmailFormDetail(ModelMap model, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	String email_form_no="";
    	if(request.getParameter("email_form_no")!=null)
    	{
    		email_form_no = request.getParameter("email_form_no");
    	}
    	email_form_no ="001";
    	EmailFormVO emailForm = eService.getEmailFormDetailSerivce(email_form_no);
    	
    	LOG.info("@@@ 이메일양식상세 = "+emailForm.toString());
    	model.addAttribute("emailFormDetail", emailForm);
    	
    	return "redirect:/rms/svc/getEmailFormList.do";
    }
    
    /**이메일 양식 수정
     * @author 	이동선
     * @since	2014-05-20
     * */
    @RequestMapping(value="rms/svc/modiEmailForm.do")
    public String modiEmailForm(@ModelAttribute EmailFormVO inputEmailFormVO)throws Exception{
    	int result = 0;
    	
    	inputEmailFormVO.setEmail_form_no("001");
    	inputEmailFormVO.setEmail_form_name("tes양식2");
    	inputEmailFormVO.setEmail_form_content("<a href=/>123123");
    	
    	result = eService.modiEmailFormService(inputEmailFormVO);
    	if(result !=0)
    	{
    		LOG.info("[이메일 양식]"+result+"건의 행이 수정");
    	}else
    	{
    		LOG.info("[이메일 양식] 수정 실패");
    	}
    	return "redirect:/rms/svc/getEmailFormList.do";
    }
    
    /**이메일 양식 삭제
     * @author 	이동선
     * @since	2014-05-20
     * */
    @RequestMapping(value="rms/svc/deleteEmailForm.do")
    public String deleteEmailForm(HttpServletRequest request, HttpServletResponse response)throws Exception{
    	int result = 0;
    	String[] checked_email_form_no_List=null;
    	if(request.getParameterValues("checked")!=null)
    	{
    		checked_email_form_no_List = request.getParameterValues("checked");
    	}
    	result = eService.deleteEmailFormService(checked_email_form_no_List);
    	if(result !=0)
    	{
    		LOG.info("[이메일 양식]"+result+"건의 행이 삭제");
    	}else
    	{
    		LOG.info("[이메일 양식] 삭제 실패");
    	}
    	return "redirect:/rms/svc/getEmailFormList.do";
    }
}
