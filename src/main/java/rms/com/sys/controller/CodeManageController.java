package rms.com.sys.controller;

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

import rms.com.sys.service.CodeManageService;
import rms.com.sys.vo.AdminVO;
import rms.com.sys.vo.CodeDetailVO;
import rms.com.sys.vo.CodeGroupVO;
import egovframework.com.cmm.EgovMessageSource;


@Controller
public class CodeManageController {
	
	@Resource(name="codeManageService")
	CodeManageService cService;
	
	protected static final Log LOG = LogFactory.getLog(CodeManageController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    @RequestMapping(value="/rms/sys/codeManagePage.do")
    public String goCodeManagePage()throws Exception
    {
    	return "redirect:/rms/sys/getCodeGroupList.do";
    }
    @RequestMapping(value="/rms/sys/getCodeGroupList.do")
    public String getCodeGroupList(ModelMap model)throws Exception{
    	List<CodeGroupVO> codeGroupList = cService.getCodeGroupListService();
    	model.addAttribute("codeGroupList", codeGroupList);
    	return "rms/sys/codeManagePage";
    }
    
    @RequestMapping(value="/rms/sys/addCodeGroup.do")
    public String addCodeGroup(@ModelAttribute CodeGroupVO inputCodeGroupVO, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	int result = 0;
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		inputCodeGroupVO.setWriter(loginAdmin.getAdmin_id());
    	}
    	result = cService.addCodeGroupService(inputCodeGroupVO);
    	model.addAttribute("groupAddResult",result);
    	return "forward:/rms/sys/getCodeGroupList.do";
    }
    
    @RequestMapping(value="/rms/sys/modiCodeGroup.do")
    public String modiCodeGroup(@ModelAttribute CodeGroupVO inputCodeGroupVO,  HttpServletRequest request, ModelMap model)throws Exception{
    	int result = 0;
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		inputCodeGroupVO.setModifier(loginAdmin.getAdmin_id());
    	}
    	result = cService.modiCodeGroupService(inputCodeGroupVO);
    	
    	model.addAttribute("groupModiResult",result);
    	return "forward:/rms/sys/getCodeGroupList.do";
    }
    
    @RequestMapping(value="/rms/sys/deleteCodeGroup.do")
    public String deleteCodeGroup(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	int result = 0;
    	String checkedValue="";
    	String modifier="";
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		modifier=loginAdmin.getAdmin_id();
    	}
    	if(request.getParameterValues("checkedValue")!=null)
    	{
    		checkedValue = request.getParameter("checkedValue");
    	}
    	
    	result = cService.deleteCodeGroupService(checkedValue, modifier);
  
    	model.addAttribute("groupDeleteResult", result);
    	return "forward:/rms/sys/getCodeGroupList.do";
    }
    
    @RequestMapping(value="/rms/sys/addCodeDetail.do")
    public String addCodeDetail(@ModelAttribute("inputCodeDetailVO") CodeDetailVO inputCodeDetailVO, HttpServletRequest request, ModelMap model)throws Exception{
    	int result = 0;
    	String group_code1= "";
    	HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		inputCodeDetailVO.setWriter(loginAdmin.getAdmin_id());
    	}
    	if(request.getParameter("group_code1")!=null)
    	{
    		group_code1=request.getParameter("group_code1");
    		inputCodeDetailVO.setGroup_code(group_code1);
    	}
    	
    	result = cService.addCodeDetailService(inputCodeDetailVO);
    	
    	model.addAttribute("codeDetailAddResult", result);
    	return "forward:/rms/sys/getCodeDetailList.do";
    }
    
    @RequestMapping(value="/rms/sys/getCodeDetailList.do")
    public String getCodeDetailList(ModelMap model, HttpServletRequest request, HttpServletResponse response)throws Exception{
    	String group_code = "";
    	if(request.getParameter("group_code1")!=null)
    	{
    		group_code = request.getParameter("group_code1");
    	}
    	else if(request.getParameter("group_code")!=null)
    	{
    		group_code = request.getParameter("group_code");
    	}
    	List<CodeDetailVO> codeDetailList = cService.getCodeDetailListService(group_code);
    
    	model.addAttribute("codeDetailList", codeDetailList);
    	return "/rms/sys/ajaxForCodeDetailList";
    }
    
    @RequestMapping(value="/rms/sys/modiCodeDetail.do")
    public String modiCodeDetail(@ModelAttribute CodeDetailVO inputCodeDetailVO, HttpServletRequest request, ModelMap model)throws Exception{
    	int result = 0;
    	HttpSession session = request.getSession();
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		inputCodeDetailVO.setModifier(loginAdmin.getAdmin_id());
    	}
    	
    	result = cService.modiCodeDetailService(inputCodeDetailVO);
    	model.addAttribute("codeDetailModiResult", result);
    	return "forward:/rms/sys/getCodeDetailList.do";
    }
    @RequestMapping(value="/rms/sys/deleteCodeDetail.do")
    public String deleteCodeDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	int result = 0;
    	String modifier="";
    	String detailCheckedValue="";
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		modifier=loginAdmin.getAdmin_id();
    	}
    	if(request.getParameterValues("detailCheckedValue")!=null)
    	{
    		
    		detailCheckedValue = request.getParameter("detailCheckedValue");

    	}
    	result = cService.deleteCodeDetailService(detailCheckedValue, modifier);
    	model.addAttribute("codeDetailDeleteResult", result);
    	return "forward:/rms/sys/getCodeDetailList.do";
    }
    
    @RequestMapping(value="/rms/sys/checkUnderItem.do")
    public String checkUnderItem(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	String checkedValue = "";
    	String str ="";
    
    	
    	if(request.getParameterValues("checkedValue")!=null)
    	{
    		checkedValue = request.getParameter("checkedValue");
    	}
    	List<String> tempStr= cService.checkUnderItem(checkedValue);
    	
    	model.addAttribute("checkUnderItemResult", str);
    	return "/rms/sys/checkUnderItem";
    }
}
