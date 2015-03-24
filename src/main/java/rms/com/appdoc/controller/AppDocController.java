package rms.com.appdoc.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springmodules.validation.commons.DefaultBeanValidator;

import rms.com.appdoc.service.AppDocService;
import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appdoc.vo.AppWishBranchVO;
import rms.com.appmanage.service.AppBoardDetailService;
import rms.com.appmanage.service.TestResultService;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.appmanage.vo.RecResultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class AppDocController {
	
	@Resource (name="appdocService")
	private AppDocService appdocService;
	
	@Resource (name="appBoardDetailService")
	private AppBoardDetailService appBoardDetailService;
	
	@Resource(name="testResultService")
	private TestResultService testResultService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** Validator */
    @Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
    
    protected static final Log LOG = LogFactory.getLog(AppDocController.class);
   
    
    /**
     * 개인정보보보호법 동의
     * @author kccsmlee
     * @since 14.07.03
     */
    @RequestMapping (value="/rms/appdoc/agreement.do")
    public String agreement(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	
    	String rec_noti_no = request.getParameter("rec_noti_no");
    	LOG.info("여기까진 잘 온다"+rec_noti_no);
    	model.addAttribute("rec_noti_no", rec_noti_no);
    	
    	return "rms/kcc/userAgreement";
    }
    

    /**
     * 로그인 페이지 이동
     * @author kccsmlee
     * @since 14.06.23
     */
    @RequestMapping (value="/rms/appdoc/appUserLogin.do")
    public String userLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
    	
    	String rec_noti_no = request.getParameter("rec_noti_no");
    	model.addAttribute("rec_noti_no", rec_noti_no);
    	LOG.info("=============채용공고번호 가져옴???? "+rec_noti_no);
    	
    	return "rms/appdoc/appUserLogin";
    	
    }
    
    /**
     * 로그인 확인
     * @author kccsmlee
     * @since 14.06.23
     */
    @RequestMapping (value="/rms/appdoc/loginAction.do")
    public String loginAction(HttpServletRequest request, HttpServletResponse response, 
    		@ModelAttribute("userVO") AppUserVO userVO, @ModelAttribute AppContentVO acVO, Model model) throws Exception{
    
    	AppUserVO resultUserVO = new AppUserVO();
    	

        String viewName = "";
        String app_user_name="";
        String app_user_email_addr="";
        String app_user_pw="";
    	String rec_noti_no = request.getParameter("rec_noti_no");
    	

        if(request.getParameter("app_user_name") != null)
        {
        	app_user_name = request.getParameter("app_user_name");
        }
        if(request.getParameter("app_user_email_addr") != null)
        {
        	app_user_email_addr = request.getParameter("app_user_email_addr");
        }
        if(request.getParameter("app_user_pw") != null)
        {
        	app_user_pw = request.getParameter("app_user_pw");
        }
        if(request.getParameter("rec_noti_no") != null)
        {
        	rec_noti_no = request.getParameter("rec_noti_no");
        }
        
        LOG.info("==========="+app_user_name+app_user_email_addr+app_user_pw+rec_noti_no);
        

        userVO = (AppUserVO) appdocService.appUserLogin(userVO);

        LOG.info("================유저 검색: "+userVO);

        
        String userExistState="";
        // 입력받은 유저 정보를 조회하여 해당 email을 가진 유저가 있을 경우
    	if(userVO!=null)
    	{

    		// 해당 채용공고와 지원자 채용공고가 일치 하는 경우
    		if(userVO.getRec_noti_no().equals(rec_noti_no))
    		{
    			
    			// 이름과 비밀번호 모두 일치하는 경우 --> 작성중인 지원서 페이지로 이동
    			if(userVO.getApp_user_name().equals(app_user_name) && userVO.getApp_user_pw().equals(app_user_pw))
    			{
    				userExistState = "userIsExist";
        			String app_user_no = userVO.getApp_user_no();

        			acVO.setApp_user_no(app_user_no);

        			List list = appdocService.appdocContent(app_user_no);
        			model.addAttribute("list",list);
        			model.addAttribute("app_user_no",app_user_no);
        			model.addAttribute("rec_noti_no",rec_noti_no);
        			LOG.info("=====기존 유저의 채용공고 번호================="+rec_noti_no);
        			LOG.info("====================================="+list);
        			
        			String  name = userVO.getApp_user_name();
        			model.addAttribute("name",name);
        			
//                	viewName = "/rms/appdoc/userAppdocDetail";
        			viewName = "forward:/rms/appdoc/getFormItemList.do";

    			}
    			
    			// 이름 불일치
    			else if(userVO.getApp_user_name() != app_user_name && userVO.getApp_user_pw().equals(app_user_pw))
    			{
    				userExistState = "nameIsNotExist";
        			model.addAttribute("userExistState", userExistState);
        			model.addAttribute("rec_noti_no", rec_noti_no);
        			viewName = "/rms/appdoc/appUserLogin";
    			}
    			
    			else
    			{
    				userExistState = "pwIsNotExist";
        			model.addAttribute("userExistState", userExistState);
        			model.addAttribute("rec_noti_no", rec_noti_no);
        			viewName = "/rms/appdoc/appUserLogin";
    			}
    			
    		}
    		
    		// 다른 채용공고일 경우
    		else
    		{
    			userExistState = "recnoIsNotExist";
    			model.addAttribute("userExistState", userExistState);
    			model.addAttribute("rec_noti_no", rec_noti_no);
    			viewName = "/rms/appdoc/appUserLogin";
    		}
    	
    		
    	}
    	
    	//  유저 정보 없을 경우
    	else
    	{
    		userExistState = "userIsNotExist";
    		model.addAttribute("userExistState", userExistState);
    		
    		resultUserVO.setApp_user_name(app_user_name);
    		resultUserVO.setApp_user_email_addr(app_user_email_addr);
    		resultUserVO.setApp_user_pw(app_user_pw);
    		resultUserVO.setRec_noti_no(rec_noti_no);
    		LOG.info("---------------------------------"+resultUserVO);
    		viewName = "forward:/rms/appdoc/userInfoInsert.do";
    	}
    	
    	return viewName;

    
    }
    
    /**
     * 신규 입사자 양식 조회로 이동
     * @author kccsmlee
     * @since 14.06.23
     * */
    @RequestMapping (value="/rms/appdoc/userInfoInsert.do")
    public String userInfoInsert(HttpServletRequest request, HttpServletResponse response, 
    		@ModelAttribute AppUserVO resultUserVO) throws Exception{
       
    	LOG.info(resultUserVO);

    	appdocService.loginInfoInsert(resultUserVO);
    	
    	return "forward:/rms/appdoc/appdocList.do";
    }

  
    
    /**
     * 양식 조회
     * @author kccsmlee
     * @since 14.06.23
     * */
    @RequestMapping (value="/rms/appdoc/appdocList.do")
    public String appdocBoardlist(HttpServletRequest request, HttpServletResponse response, @ModelAttribute AppUserVO userVO, 
    		@ModelAttribute AppContentVO acVO, @ModelAttribute AppInfoVO inputAppInfoVO, Model model) throws Exception{ 	

    	String rec_noti_no = request.getParameter("rec_noti_no"); 
    	acVO.setRec_noti_no(rec_noti_no);

    	//이메일과 비밀번호를 통한 유저번호 조회
    	String app_user_no = appdocService.searchUserNo(userVO);
    	
//    	String app_user_name = userVO.getApp_user_name();
//    	LOG.info("*********이름***"+app_user_name);
//
//    	
//    	String app_item_no = acVO.getApp_item_no();
//    	
    	List branch = appdocService.appdocBranchList(rec_noti_no);
    	
    	LOG.info("==branch=="+branch);
    	
    	model.addAttribute("branch", branch);
//    	
//    	//양식 조회
//    	List<AppItemListVO> list = appdocService.appdocdetailBoard(acVO);
//        model.addAttribute("list",list);
//        model.addAttribute("rec_noti_no",rec_noti_no);
//        model.addAttribute("app_user_no",app_user_no);
//        model.addAttribute("app_item_no",app_item_no);
//        model.addAttribute("app_user_name",app_user_name);
//        
//        
//    	return "/rms/appdoc/appdocBoarddetail"; 

		LOG.info("+++++++++++++++"+app_user_no);

		
		List<AppItemContentVO> formItemList = new ArrayList<AppItemContentVO>();
		formItemList = appBoardDetailService.getFormItemList(app_user_no);		
		
		model.addAttribute("formItemList",formItemList);
		
		AppUserVO appUserList = appBoardDetailService.getImage(app_user_no);
		
		model.addAttribute("appUserVO", appUserList);
		
		acVO.setApp_user_no(app_user_no);
		
		for(AppItemContentVO aicv : formItemList)
		{
			acVO.setApp_list_code(aicv.getApp_list_code());
			
			//List<AppItemContentVO> appDetailList = appBoardDetailService.getAppUserDetailService(inputAppInfoVO);
			//모델에 사항별 목록 add ex)기본사항PSINFO01이름으로 지원자의 기본사항들이 들어있는 목록 add
			
			List<AppItemContentVO> appdocForm = appdocService.getAppUserDetailService(acVO);
						
			LOG.info(aicv.getApp_list_code()+"=333333"+appdocForm);
			model.addAttribute(aicv.getApp_list_code(), appdocForm);
		}
		model.addAttribute("appBaseInfo", appBoardDetailService.getAppBaseInfoService(app_user_no));
		
		//생년월일 조회
		Calendar cal = java.util.Calendar.getInstance();
		
		int thisYear = cal.get ( cal.YEAR );
		int pastYear = thisYear - 54;
		
		List<String> aa = new ArrayList<String>();
		
		for(int i=thisYear; i>=pastYear; i--){
			aa.add(String.valueOf(i));
		}
		model.addAttribute("aa", aa);
		
		List<String> bb = new ArrayList<String>();
		for(int i=1; i<=12; i++){
			bb.add(String.valueOf(i));
		}
		model.addAttribute("bb", bb);
		
		List<String> cc = new ArrayList<String>();
		for(int i=1; i<=31; i++){
			cc.add(String.valueOf(i));
		}
		
		model.addAttribute("cc", cc);
		
      model.addAttribute("rec_noti_no",rec_noti_no);
      model.addAttribute("app_user_no",app_user_no);

		
		return "/rms/appdoc/appdocForm";
		    
    	
    }

    
    /**
     * 지원서 입력
     * @author kccsmlee
     * @since 14.06.23
     * */    
    @RequestMapping (value="/rms/appdoc/appdocInsert.do")
    public String appdocBoarddetail(HttpServletRequest request,  HttpServletResponse response, Model model,
    		@RequestParam("imageFile") MultipartFile imageFile, @ModelAttribute AppWishBranchVO wishVO) throws Exception { 
//    		@ModelAttribute AppWishBranchVO wishVO, 
    		  	
    	
    	String rec_noti_no = request.getParameter("rec_noti_no");        	
    	LOG.info("***rec_noti_no****"+rec_noti_no);
    	String app_user_no = request.getParameter("app_user_no");   
    	LOG.info("***app_user_no****"+app_user_no);
//    	String app_list_code = "PSINFO01";
    	
    	//희망 1순위 등록
    	String branch_name1 = request.getParameter("branch_name1");
    	wishVO.setRec_noti_no(rec_noti_no);
    	wishVO.setApp_user_no(app_user_no);
    	appdocService.wishList1(wishVO, branch_name1);

    	//희망 2순위 등록
    	String branch_name2 = request.getParameter("branch_name2");
    	appdocService.wishList2(wishVO, branch_name2);
    	

    		
	    		Enumeration<String> e = request.getParameterNames();
	    		
	    		
	    		LOG.info("******e****"+e);
	    		
	    		List<AppContentVO> acList = new ArrayList<AppContentVO>();
	    		
	    		
	    		while(e.hasMoreElements())
	    		{
	    			String psInfo = e.nextElement();
	    			
	    			ArrayList<String> list = new ArrayList<String>();
	    			String[] psInfoSplit = psInfo.split("\\|");
	    			
	    			LOG.info("psInfoSplit//"+psInfoSplit);

	    			if(psInfoSplit.length>1){
	    				
		    			//content
		    			String[] data = request.getParameterValues(psInfo);
		    			LOG.info("*****data*****"+data);
		    			
		    			//app_list_code
		    			String code = psInfoSplit[0];
		    			LOG.info("*****code*****"+code);

		    			//app_item_no
		    			String item = psInfoSplit[1];
		    			LOG.info("*****item*****"+item);
		    			
		    			//list_no
		    			String num = psInfoSplit[2];
		    			LOG.info("*****num*****"+num);

	        			if(data != null)
	        			{
	        				for(String value : data)
	        				{
	        					
	        						LOG.info(value);
				    				LOG.info("***"+data +"***"+ code+"***"+item);
				    				
				    				AppContentVO acVO = new AppContentVO();
//				    				acVO.setKey(psInfo);			    				

				    				acVO.setApp_list_code(code);				    				
				    				acVO.setApp_item_no(item);
				    				acVO.setList_no(num);
				    				acVO.setApp_item_content(value);
				    				
				    				LOG.info("******이걸 확인해보자******"+acVO);
				    				acList.add(acVO);
	        				}
	        			}		
	    				
	    			}
	    			
	    		}

	    		int result = appdocService.appdocInsert(acList, app_user_no, rec_noti_no, imageFile, request);
    	

		

    	/*-----------------유동적 방식이었던 부분--------------------*/
    	
//    	acVO.setApp_list_code(app_list_code);
   	
    	
    	//희망 1순위 등록
//    	String branch_name1 = request.getParameter("branch_name1");
//    	wishVO.setRec_noti_no(rec_noti_no);
//    	wishVO.setApp_user_no(app_user_no);
//    	appdocService.wishList1(wishVO, branch_name1);

    	//희망 2순위 등록
//    	String branch_name2 = request.getParameter("branch_name2");
//    	appdocService.wishList2(wishVO, branch_name2);
    	
    	    		
    	/*String app_item_content = request.getParameter("app_item_content");
    	    	
        String values[] = request.getParameterValues("app_item_content");
            
            if (values != null) 
            { 
	        		
                	LOG.info("컨트롤러의 acVO ----------------------"+acVO);	
            		appdocService.appdocBoarddetail(request, response, acVO, imageFile);

                } 
            
            model.addAttribute("rec_noti_no",rec_noti_no);
            model.addAttribute("app_user_no",app_user_no);
            return "/rms/appdoc/appdocFinalSubmit";*/
    	
    	
    	
    	/*-----------------유동적 방식이었던 부분--------------------*/
    	
    	/*-----------------고정적 방식인 부분--------------------*/
    	
//    		Enumeration<String> e = request.getParameterNames();
//    		
//    		LOG.info("******e****"+e);
//    		
//    		List<AppContentVO> acList = new ArrayList<AppContentVO>();
//    		String app_list_code = "PSINFO01";
    		
//    		while(e.hasMoreElements())
//    		{
//    			String psInfo = e.nextElement();
    			
//    			LOG.info("**********"+psInfo);
//    			String [] psInfoSplit = psInfo.split("\\|");
//    			if(psInfoSplit.length > 1)
//    			{
//
//    			String[] data = request.getParameterValues(psInfo);
    		
//    			LOG.info("**********"+data);
    			
//    			if(data != null)
//    			{
//    				for(String value : data)
//    				{
//    					LOG.info("파라미터에 들어있는 값들?????????" + value);
//    					AppContentVO acVO = new AppContentVO();
//    					acVO.setKey(data[0]);
//    					acVO.setApp_item_content(value);
//    					acList.add(acVO);
//    				}
//    			}
//    			}
    			
//    		}
    		
//    		int result = appdocService.appdocInsert(acList, app_user_no, app_list_code);
    		
//    		return "/rms/appdoc/appdocFinalSubmit";
    	
    	/*-----------------고정적 방식인 부분--------------------*/
    	
            model.addAttribute("rec_noti_no",rec_noti_no);
            model.addAttribute("app_user_no",app_user_no);
            
    		return "/rms/appdoc/appdocFinalSubmit";
    		

    	
    }
    
    /***
     * 최종 제출 
     * @author kccsmlee
     * @since 14.06.26
     * @return
     */
    @RequestMapping (value="/rms/appdoc/finalSubmit.do")
    public String finalSubmit(HttpServletRequest request, HttpServletResponse response, 
    		@ModelAttribute AppUserVO userVO, @ModelAttribute RecResultVO resultVO) throws Exception{
    	
     	String rec_noti_no = request.getParameter("rec_noti_no");     	   	
    	String app_user_no = request.getParameter("app_user_no"); 
    	
    	resultVO.setRec_noti_no(rec_noti_no);
    	resultVO.setApp_user_no(app_user_no);

    	//최종 제출 여부를 'F' -> 'T'
    	appdocService.finalSubmit(userVO);
    	
    	//채용 결과쪽 데이터 생성
    	appdocService.recResInsert(resultVO);

    	
    	
    	return "redirect:/rms/recNotice/userNoticeList.do";
    }
    
    /**
     * 입사지원서 수정
     * @author kccsmlee
     * @since 16.06.30
     * 
     * */
    @RequestMapping (value="/rms/appdoc/appdocUpdate.do")
    public String appdocUpdate(HttpServletRequest request, @ModelAttribute AppContentVO acVO, Model model) throws Exception{
    	    	
    	String rec_noti_no = request.getParameter("rec_noti_no");
    	String app_user_no = request.getParameter("app_user_no");
    	
    	String app_item_content = request.getParameter("app_item_content");
    	
        String values[] = request.getParameterValues("app_item_content");
            
            if (values != null) 
            { 
	        		
                	LOG.info("컨트롤러의 acVO ----------------------"+acVO);	
                	appdocService.appdocUpdate(request, acVO);

                } 
            
            model.addAttribute("rec_noti_no",rec_noti_no);
            model.addAttribute("app_user_no",app_user_no);
    	

    	
    	
    	
    	return "/rms/appdoc/appdocFinalSubmit";
    }
    
    /**
     * 1지망 선택
     * @author kccsmlee
     * @since 14.07.01
     * **/
    @RequestMapping (value="/rms/appdoc/wishBranchList1.do")
    public String wishBranchList1(HttpServletRequest request, @RequestParam("typeSelect1") String typeSelect1, ModelMap model) throws Exception{
		
    	
//    	String typeSelect1 = request.getParameter("typeSelect1");
    	
    	LOG.info("******회사이름*******"+typeSelect1);
    	
    	List list = appdocService.wishBranchList1(typeSelect1);
    	
    	LOG.info("*******************"+list);
    	
    	model.addAttribute("branchList1",appdocService.wishBranchList1(typeSelect1));    	

    	return "rms/appdoc/ajaxForBranchList1";
    	
    }
    
    /**
     * 2지망 선택
     * @author kccsmlee
     * @since 14.07.01
     * **/
    @RequestMapping (value="/rms/appdoc/wishBranchList2.do")
    public String wishBranchList2(HttpServletRequest request, ModelMap model) throws Exception{
		
    	String typeSelect2 = request.getParameter("typeSelect2");
    	
    	model.addAttribute("branchList2",appdocService.wishBranchList2(typeSelect2));

    	return "rms/appdoc/ajaxForBranchList2";
    	
    }
    
	//번지 검색
	@RequestMapping(value = "/rms/appdoc/postsearch.do", method = RequestMethod.GET)
	public String postsearch(Model model){

		return "/rms/appdoc/postSearch";
		
	}
	
	/**
	 * @author  이동선
	 * @param  	app_user_no(지원자번호)
	 * @return	지원자가 지원한 공고의 양식별 구성된 사항목록
	 * */
	@RequestMapping(value="/rms/appdoc/getFormItemList.do")
	public String getFormItemList(HttpServletRequest request, ModelMap model)throws Exception{
		
		String app_user_no = "";
		
		if(request.getAttribute("app_user_no")!=null)
		{
			app_user_no =(String) request.getAttribute("app_user_no");
			LOG.info("+++++++++++++++"+app_user_no);
		}
		
		model.addAttribute("app_user_no",app_user_no);
		model.addAttribute("formItemList", appBoardDetailService.getFormItemList(app_user_no));
		
		return "forward:/rms/appdoc/getAppDetail.do";
	}
	
	
	/**
	 * @author  이동선
	 * @param  	양식 구성사항 목록
	 * @return	양식 구성사항별 지원자 정보 목록들
	 */
	@RequestMapping(value="/rms/appdoc/getAppDetail.do")
	public String getAppUserDetailCont(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@ModelAttribute AppInfoVO inputAppInfoVO)throws Exception{

		String app_user_no =(String) request.getAttribute("app_user_no");
		
		AppUserVO appUserList = appBoardDetailService.getImage(app_user_no);
		
		model.addAttribute("appUserVO", appUserList);


		List<AppItemContentVO> formItemList = new ArrayList<AppItemContentVO>();
		
		if(request.getAttribute("formItemList")!=null)
		{
			formItemList = (List<AppItemContentVO>) request.getAttribute("formItemList");
			
		}
		if(request.getAttribute("app_user_no")!=null)
		{
			app_user_no =(String) request.getAttribute("app_user_no");
			
			inputAppInfoVO.setApp_user_no((String)request.getAttribute("app_user_no"));
		}
		if(request.getAttribute("rec_noti_no")!=null)
		{
			inputAppInfoVO.setRec_noti_no(request.getParameter("rec_noti_no"));
		}

		HashMap<String, List<List<AppItemContentVO>>> appDetailMap = appBoardDetailService.getAppUserDetailService(inputAppInfoVO, formItemList);
		//모델에 사항별 목록 add ex)기본사항PSINFO01이름으로 지원자의 기본사항들이 들어있는 목록 add			
		model.addAttribute("appUserDetailMap", appDetailMap);
		model.addAttribute("appBaseInfo", appBoardDetailService.getAppBaseInfoService(app_user_no));
		
		return "/rms/appdoc/appdocDetail";
	}
	
	//검정고시일 경우, 
	@RequestMapping(value="/rms/appdoc/exam1.do")
	public String exam1(){
		return "/rms/appdoc/ajaxForExam1";
	}
	
	//검정고시가 아닐 경우,
	@RequestMapping(value="/rms/appdoc/exam2.do")
	public String exam2(){
		return "/rms/appdoc/ajaxForExam2";
	}
	
    
    
}
