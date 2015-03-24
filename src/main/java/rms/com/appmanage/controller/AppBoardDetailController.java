package rms.com.appmanage.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;

import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppUserDetailVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appmanage.service.AppBoardDetailService;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.sys.vo.AdminVO;

@Controller
public class AppBoardDetailController {

	/** AppBoardService */
	@Resource(name="appBoardDetailService")
	private AppBoardDetailService appBoardDetailService;
	
	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource          egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	  
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	   
	/** Log */
	protected static final Log LOG = LogFactory.getLog(AppBoardDetailController.class);
	
	
	/**
	 * 입사지원서 상세조회 
	 * 
	 * @author 선재희
	 * @since 2014-06-30
	 */
	@RequestMapping(value="/rms/appmanage/appBoardDetail.do")
	public String gotoAppDocDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		String app_user_no = "";
		if(request.getParameter("userId")!=null)
		{
			app_user_no = request.getParameter("userId");
		}
		if(request.getParameter("appUserNo")!=null)
		{
			app_user_no = request.getParameter("appUserNo");
		}
		//model.addAttribute("user", appBoardDetailService.getAppUserInfoDetail(app_user_no));
		//model.addAttribute("appUserInfo", appBoardDetailService.getAppUserId(app_user_id));l
		//return "rms/appmanage/appBoardDetail";
		model.addAttribute("app_user_no", app_user_no);
		return "forward:/rms/appmanage/getFormItemList.do";
	}
	
	/**
	 * 입사지원서 수정페이지
	 * 
	 * @author 선재희
	 * @since 201-07-01
	 */
	@RequestMapping(value="/rms/appmanage/gotoUpdatePage.do")
	public String gotoUpdatePage(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		model.addAttribute("whosCall", "AppDetailUpdatePage");
		return "forward:/rms/appmanage/getFormItemList.do";
	}
	
	
	/**
	 * 입사지원서 수정
	 * 
	 * @author 선재희
	 * @since 201-07-01
	 */
	@RequestMapping(value="/rms/appmanage/updateAppUserInfo.do")
	public String updateAppUserResume(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		//수정자 가져오기
			
			
		Enumeration<String> e = request.getParameterNames();
		List<AppInfoVO> appInfoList = new ArrayList<AppInfoVO>();
		String app_list_code = "PSINFO01";
		String app_user_no = "";
		if(request.getParameter("appUserNo")!=null)
		{
			app_user_no = request.getParameter("appUserNo");
		}
	
		/*while(e.hasMoreElements())
		{
			String psInfo = e.nextElement();
			String [] psInfoSplit = psInfo.split("\\|");
			if(psInfoSplit.length > 1)
			{
			LOG.info("##############" + psInfoSplit[0]);			
			String[] data = request.getParameterValues(psInfo);
				if(data != null)
				{
					for(String value : data)
					{
						LOG.info("파라미터에 들어있는 값들?????????" + value);
						AppInfoVO appInfo = new AppInfoVO();
						appInfo.setKey(psInfoSplit[0]);
						appInfo.setApp_item_content(value);
						appInfoList.add(appInfo);
	
					}
				}
			}
			
		}*/
		while(e.hasMoreElements())
		{
			String psInfo = e.nextElement();		
			
			LOG.info("##############" + psInfo);			
			String[] data = request.getParameterValues(psInfo);
				if(data != null)
				{
					for(String value : data)
					{
						LOG.info("파라미터에 들어있는 값들?????????" + value);
						/*AppInfoVO appInfo = new AppInfoVO();
						appInfo.setKey(psInfoSplit[0]);
						appInfo.setApp_item_content(value);
						appInfoList.add(appInfo);*/
	
					}
				}
			}
			
		
		
		//int result = appBoardDetailService.updateAppUserResumeOfPsInfo(appInfoList, app_user_no, app_list_code);			
		return "forward:/rms/appmanage/appBoardDetail.do";
	}
	/**
	 * @author  이동선
	 * @param  	app_user_no(지원자번호)
	 * @return	지원자가 지원한 공고의 양식별 구성된 사항목록
	 * */
	@RequestMapping(value="/rms/appmanage/getFormItemList.do")
	public String getFormItemList(HttpServletRequest request, ModelMap model)throws Exception{
		String app_user_no = "";
		
		if(request.getParameter("userId")!=null)
		{
			app_user_no =(String) request.getParameter("userId");
		}
		if(request.getParameter("app_user_no")!=null)
		{
			app_user_no =(String) request.getParameter("app_user_no");
		}
		model.addAttribute("formItemList", appBoardDetailService.getFormItemList(app_user_no));
		return "forward:/rms/appmanage/getAppDetail.do";
	}
	
	
	/**
	 * @author  이동선
	 * @param  	양식 구성사항 목록
	 * @return	양식 구성사항별 지원자 정보 목록들
	 */
	@RequestMapping(value="/rms/appmanage/getAppDetail.do")
	public String getAppUserDetailCont(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@ModelAttribute AppInfoVO inputAppInfoVO)throws Exception{
		String viewName="";
		String app_user_no ="";
		if(request.getParameter("userId")!=null)
		{
			app_user_no = request.getParameter("userId");
		}
		if(request.getParameter("app_user_no")!=null)
		{
			app_user_no = request.getParameter("app_user_no");
		}
		AppUserVO appUserList = appBoardDetailService.getImage(app_user_no);
		model.addAttribute("appUserVO", appUserList);	
		
		if(request.getAttribute("whosCall")!=null)
		{
			if("AppDetailUpdatePage".equals(request.getAttribute("whosCall")))
			{
				viewName="/rms/appmanage/appBoardDetailUpdate";
			}
		}else{
			viewName="/rms/appmanage/appBoardDetail";
		}
		List<AppItemContentVO> formItemList = new ArrayList<AppItemContentVO>();
		if(request.getAttribute("formItemList")!=null)
		{
			formItemList = (List<AppItemContentVO>) request.getAttribute("formItemList");			
		}
		if(request.getParameter("userId")!=null)
		{
			app_user_no =(String) request.getParameter("userId");
			
			inputAppInfoVO.setApp_user_no(app_user_no);
		}
		if(request.getParameter("recNoti")!=null)
		{
			inputAppInfoVO.setRec_noti_no(request.getParameter("recNoti"));
		}
		
		HashMap<String, List<List<AppItemContentVO>>> appDetailMap = appBoardDetailService.getAppUserDetailService(inputAppInfoVO, formItemList);
		//모델에 사항별 목록 add ex)기본사항PSINFO01이름으로 지원자의 기본사항들이 들어있는 목록 add			
		model.addAttribute("appUserDetailMap", appDetailMap);
		model.addAttribute("appBaseInfo", appBoardDetailService.getAppBaseInfoService(app_user_no));
		
		return viewName;
	}


}
