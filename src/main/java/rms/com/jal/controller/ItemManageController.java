package rms.com.jal.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;
import rms.com.sys.controller.LoginController;
import rms.com.sys.vo.AdminVO;

import egovframework.com.cmm.EgovMessageSource;


@Controller
class ItemManageController {
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	protected static final Log LOG = LogFactory.getLog(ItemManageController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @RequestMapping(value="/rms/jal/recFieldItemManagePage.do")
    public String getRecFieldItemManagePage(ModelMap model){
    	model.addAttribute("whosCall", "recFieldItemManagePage");    	
    	
    	return "forward:/rms/jal/getItemList.do";
    }
    @RequestMapping(value="/rms/jal/testItemManagePage.do")
    public String getTestItemManagePage(ModelMap model){
    	model.addAttribute("whosCall", "testItemManagePage");    	
    	
    	return "forward:/rms/jal/getItemList.do";
    }
    
    @RequestMapping(value="/rms/jal/addItem.do")
    public String addItem(HttpServletRequest request, HttpServletResponse response, @ModelAttribute ItemVO inputItemVO, ModelMap model)throws Exception{
    	int result = 0;
    	String viewName ="";
    	HttpSession session = request.getSession();
    	
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		inputItemVO.setWriter(loginAdmin.getAdmin_id());
    	}
    	result = iService.addItemService(inputItemVO);
    
    	if("REC_FIELD".equals(inputItemVO.getGroup_code()))
    	{
    		viewName= "forward:/rms/jal/recFieldItemManagePage.do";
    		model.addAttribute("recFieldItemResult", result);
    	}
    	else if("TEST_ITEM".equals(inputItemVO.getGroup_code()))
    	{
    		viewName= "forward:/rms/jal/testItemManagePage.do";
    		model.addAttribute("testItemResult", result);
    	}
    	    	
    	return viewName;
    }
    
    @RequestMapping(value="/rms/jal/getItemList.do")
    public String getItemList(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	String target="";
    	String viewName="";
    	String group_code="";
    	if(request.getAttribute("whosCall")!=null)
    	{
    		target =(String) request.getAttribute("whosCall");
    	
	    	if("recFieldItemManagePage".equals(target))
	    	{
	    		group_code ="REC_FIELD";
	    		viewName="/rms/jal/recFieldItemManage";
	    	}else if("testItemManagePage".equals(target))
	    	{
	    		group_code ="TEST_ITEM";
	    		viewName="/rms/jal/testItemManage";
	    	}
    	}else
    	{
    		/*if(request.getParameter("group_code")!=null)
    		{
    			group_code="";
    		}*/
    		LOG.info("아이템리스트 get할때 불러주는 페이지 없음.");
    	}
    	List<ItemVO> itemList = iService.getItemListService(group_code);
    	model.addAttribute("itemList", itemList);
    	
    	for(ItemVO code : itemList){
    		LOG.info(code.toString());
    	}
    	
    	return viewName;
    }
    
    @RequestMapping(value="/rms/jal/modiItem.do")
    public String modiItem(@ModelAttribute ItemVO inputItemVO, HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	String viewName="";
    	int result = 0;
    	HttpSession session = request.getSession();
    
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		inputItemVO.setModifier(loginAdmin.getAdmin_id());
    	}
    	
		result = iService.modiItemService(inputItemVO);
		if("REC_FIELD".equals(inputItemVO.getGroup_code()))
    	{
    		viewName= "forward:/rms/jal/recFieldItemManagePage.do";
    		model.addAttribute("recFieldItemModiResult", result);
    	}
		else if("TEST_ITEM".equals(inputItemVO.getGroup_code()))
    	{
    		viewName= "forward:/rms/jal/testItemManagePage.do";
    		model.addAttribute("testItemModiResult", result);
    	}
    	
    	return viewName;
    }
    
    @RequestMapping(value="/rms/jal/deleteItem.do")
    public String deleteItem(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
    	String viewName="";
    	int result = 0;
    	List<String> detailCodeList =null;
    	String group_code="";
    	String modifier="";
    	HttpSession session = request.getSession();
    	String checkedValue="";
    	if(session.getAttribute("userInfo")!=null)
    	{
    		AdminVO loginAdmin = (AdminVO) session.getAttribute("userInfo");
    		modifier=loginAdmin.getAdmin_id();
    	}
  
    	if(request.getParameter("checkedValue")!=null)
    	{
    		checkedValue = request.getParameter("checkedValue");
    	}
    	if(request.getParameter("group_code")!=null)
    	{
    		group_code = request.getParameter("group_code");
    	}
    	
    	result = iService.deleteItemService(checkedValue, modifier);
    	if("REC_FIELD".equals(group_code))
    	{
    		viewName= "forward:/rms/jal/recFieldItemManagePage.do";
    		
    		model.addAttribute("recFieldItemDeleteResult", result);
    	}
    	else if("TEST_ITEM".equals(group_code))
    	{
    		viewName= "forward:/rms/jal/testItemManagePage.do";
    		model.addAttribute("testItemDeleteResult", result);
    	}
    
    	return viewName;
    }
    
    
}
