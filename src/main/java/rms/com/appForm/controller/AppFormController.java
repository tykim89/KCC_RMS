package rms.com.appForm.controller;

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

import rms.com.appForm.service.AppFormService;
import rms.com.appForm.vo.AppFormVO;
import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;


@Controller
public class AppFormController {

	protected static final Log LOG = LogFactory.getLog(AppFormController.class);
	
	
	@Resource(name="appFormService")
	private AppFormService appFormService;
	
	
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	
	
	/**
	 * 지원서양식 목록조회 검색
	 * 
	 * @author tykim
	 * @since 2014-05-23
	 * */
	@RequestMapping(value="rms/appForm/appFormList.do")
	public String getAppFormList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		String searchValue = request.getParameter("searchValue");
		String searchKey = request.getParameter("searchKey");
		
		List<AppFormVO> appFormList = null;
		appFormList = appFormService.getAppFormList(searchValue, searchKey);
		
		model.addAttribute("appFormList", appFormList);
		
		return "rms/appForm/appFormList";
	}
	
	
	
	
	/**
	 * 지원서양식 등록!!
	 * 
	 * @author tykim
	 * @since 2014-05-26
	 * */
	
	// 등록폼으로 코드목록, 코드별 항목목록 가져오기
	@RequestMapping(value="/rms/appForm/getAppItemList.do")
    public String getItemList(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	
		// 지원서항목코드 가져오기 //
		// *기본사항*
    	String bas_list="BAS_LIST";
    	if(request.getParameter("bas_list")!=null)
    	{
    		bas_list = request.getParameter("bas_list");
    	}
    	
    	List<ItemVO> basList = iService.getItemListService(bas_list);
    	model.addAttribute("basList", basList);
    	
    	for(ItemVO code : basList){
    		LOG.info(code.toString());
    	}
    	
    	
    	
    	
    	// 지원서항목코드 별로 세부 항목 가져오기
    	
    	
    	
    	
    	return "redirect:/";
    }
	
	
		
	
	// 최종 등록 수행
	@RequestMapping(value="rms/appForm/insertAppForm.do")
	public String insertAppForm(HttpServletRequest request, HttpServletResponse response, Model model,
										  @ModelAttribute("appFormVO") AppFormVO appFormVO) throws Exception {
	
		// 지원서 명, 메모 등록
		appFormService.insertAppForm(appFormVO);
		
		
		//
		
		
		
		
		//
		
		
		
		
		return "";
	}
	
	
	
	
	
}
