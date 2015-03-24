package rms.com.sys.controller;

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

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import rms.com.appmanage.vo.AppBoardVO;
import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;
import rms.com.sys.service.UserService;
import rms.com.sys.vo.AdminVO;
import rms.com.sys.vo.BranchVO;
import rms.com.sys.vo.CompanyVO;
import rms.com.sys.vo.DefaultVO;
import rms.com.sys.vo.DeptVO;

@Controller
public class UserController {
	@Resource(name="userService")
	UserService uService;
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	protected static final Log LOG = LogFactory.getLog(UserController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**계정등록 페이지 이동
     * @author 이동선
     * */
    @RequestMapping(value="/rms/sys/addUserPage.do")
    public String addUserPage(ModelMap model){
    	model.addAttribute("whosCall", "addUserPage");
    	return "forward:/rms/sys/getCompanyList.do";
    }
    /**
	 * 아이디 찾기
	 * 
	 * */
	@RequestMapping(value="/rms/sys/findId.do")
	public String findIdControl(@ModelAttribute AdminVO inputAdminVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
									
		String result = uService.findIdService(inputAdminVO);
		model.addAttribute("findIdResult", result);	
		
		return "/rms/sys/ajaxForFindId";
	}
	
	/** 비밀번호 초기화
	 * @author lds
	 * @param request, response
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/pwInit.do")
	public String pwInit(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		AdminVO inputAdminVO = new AdminVO();
		String admin_id ="";

		if(request.getParameter("admin_id")!=null)
		{
			admin_id = request.getParameter("admin_id");
		}
		HttpSession session = request.getSession();		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			//LOG.info("이건모디파이어"+user.getAdmin_id());
			inputAdminVO.setModifier(user.getAdmin_id());
		}
		inputAdminVO.setAdmin_id(admin_id);
		
		int result = uService.pwInitService(inputAdminVO);
		
		model.addAttribute("InitPwResult", result);
		return "/rms/sys/ajaxForUserInfoDetail";
	}
	
	/** 계정 등록 
	 * @author lds
	 * @param request, response
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/addUser.do")
	public String addUser(@ModelAttribute AdminVO inputAdminVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			inputAdminVO.setWriter(user.getAdmin_id());
		}
		int result = uService.addUserService(inputAdminVO);
		//version 관리랑 활성여부, Email여부??, 작성일시, 유효성검사(비밀번호 재확인과 일치) 추후추가
		model.addAttribute("addUserResult", result);
		return "forward:/rms/sys/addUserPage.do";
	}
	
	/**
	 *중복확인
	 * */
	@RequestMapping(value="/rms/sys/checkOverlap.do")
	public String checkOverlap(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		int result = 0;
		String admin_id="";
		if(request.getParameter("admin_id")!=null)
		{
			admin_id = request.getParameter("admin_id");
		}		
		if(uService.checkOverlapService(admin_id)==1)
		{
			result=1;
		}else{
			result=0;
		}
		model.addAttribute("overlapCheckResult", result);
		return "rms/sys/ajaxForAddUser";
	}
	/**
	 *기등록 확인
	 * */
	@RequestMapping(value="/rms/sys/checkPreUser.do")
	public String checkPreUser(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		int result=0;
		String admin_name="";
		String admin_email_id="";
		String admin_email_addr_url="";
		AdminVO inputAdminVO = new AdminVO();
		
		if(request.getParameter("admin_name")!=null)
		{
			admin_name = request.getParameter("admin_name");
		}
		if(request.getParameter("admin_email_id")!=null)
		{
			admin_email_id = request.getParameter("admin_email_id");
		}
		if(request.getParameter("admin_email_addr_url")!=null)
		{
			admin_email_addr_url = request.getParameter("admin_email_addr_url");
		}
		inputAdminVO.setAdmin_name(admin_name);
		inputAdminVO.setAdmin_email_id(admin_email_id);
		inputAdminVO.setAdmin_email_addr_url(admin_email_addr_url);
		
		if(uService.checkPreUserService(inputAdminVO)==1)
		{
			result = 1;
		}else{
			result = 0;
		}
		model.addAttribute("preUserCheckResult", result);
		return "rms/sys/ajaxForAddUser";
	}
	/**
	 *계정정보 수정
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/modiUserByAdmin.do")
	public String modiUserByAdmin(@ModelAttribute AdminVO inputAdminVO, ModelMap model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");
			LOG.info("이건모디파이어"+user.getAdmin_id());
			inputAdminVO.setModifier(user.getAdmin_id());
		}
		int result = uService.modiUserByAdminService(inputAdminVO);
		model.addAttribute("modiUserResult", result);
		return "/rms/sys/ajaxForUserInfoDetail";
	}
	
	/**
	 *개인정보 수정
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/modiUserByUser.do")
	public String modiUserByUser(@ModelAttribute AdminVO inputAdminVO){
		String viewName="";
		int result =0;
		
		inputAdminVO.setAdmin_id("test1");
		inputAdminVO.setAdmin_pw("rrrr");
		
		try {
			result = uService.modiUserByUserService(inputAdminVO);
		} catch (Exception e) {
			LOG.info("######## 수정 문제");
			e.printStackTrace();
		}
		if(result!=0)
		{
			LOG.info("######## "+result+"건의 계정이 수정되었습니다.");
			viewName="rms/cmn/rmsLoginForm";
		}else{
			LOG.info("######## 수정 대실패");
			viewName="/rms/cmn/ajaxForUserInfoDetail";
		}
	
		return viewName;
	}
	/**
	 *계정삭제
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/deleteUser.do")
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
		HttpSession session = request.getSession();
		String admin_id="";
		AdminVO inputAdminVO = new AdminVO();
		AdminVO userInfo =new AdminVO();
		 
		if(request.getParameter("admin_id")!=null)
		{
			admin_id = request.getParameter("admin_id");
		}
		if(session.getAttribute("userInfo")!=null)
		{
			userInfo = (AdminVO) session.getAttribute("userInfo");
		}
		inputAdminVO.setAdmin_id(admin_id);
		
		inputAdminVO.setModifier(userInfo.getAdmin_id());
		
		int result = uService.deleteUserService(inputAdminVO);
		
		model.addAttribute("deleteUserResult", result);
		return "/rms/sys/ajaxForUserInfoDetail";
	}
	/**
	 *계정정보 검색
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/getUserList.do")
	public String getUserList(HttpServletRequest request, @ModelAttribute("pagingVO") DefaultVO pagingVO, HttpServletResponse response, ModelMap model)throws Exception{
		
		/**  페이징 */
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
	/*	if(request.getParameter("searchValue")!=null)
		{
			pagingVO.setSearchKeyword(request.getParameter("searchValue"));
		}
		if(request.getParameter("searchKey")!=null)
		{
			pagingVO.setSearchCondition(request.getParameter("searchKey"));
		}*/
		
		int totCnt = uService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
				
		List<AdminVO> userList = uService.getUserListService(pagingVO);
		
		if(userList.size()==0 || userList ==null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("userList",userList);			
		}
	
		return "rms/sys/userListPage";
	}
	/**
	 * 계정정보 상세조회
	 * */
	@RequestMapping(value="/rms/sys/getUserDetail.do")
	public String getUserDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		String admin_id="";
		if(request.getParameter("admin_id")!=null)
		{
			admin_id = request.getParameter("admin_id");
			
		}
		
		AdminVO resultAdminVO = uService.getUserDetailService(admin_id);
		
		model.addAttribute("userDetail", resultAdminVO);
		model.addAttribute("whosCall", "getUserDetail");
		return "forward:/rms/sys/getCompanyList.do";
	}
	/**회사 리스트 조회
	 * @author 이동선
	 * @param null
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/getCompanyList.do")
	public String getCompanyList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		List<CompanyVO> companyList = uService.getCompanyListService();
		model.addAttribute("companyList", companyList);
		return "forward:/rms/sys/getBranchList.do";
	}
	/**지사 리스트 조회
	 * @author 이동선
	 * @param null
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/getBranchList.do")
	public String getBranchList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		
		List<BranchVO> branchList = uService.getBranchListService();
		
		model.addAttribute("branchList", branchList);
		
		return "forward:/rms/sys/getDeptList.do";
	}
	/**부서 리스트 조회
	 * @author 이동선
	 * @param null
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/getDeptList.do")
	public String getDeptList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		List<DeptVO> deptList = uService.getDeptListService();
		model.addAttribute("deptList", deptList);
		return "forward:/rms/sys/getPositionList.do";
	}
	/**직급 리스트 조회
	 * @author 이동선
	 * @param null
	 * @throws Exception 
	 * */
	@RequestMapping(value="/rms/sys/getPositionList.do")
	public String getPositionList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		String viewName = "";
		List<ItemVO> positionList= iService.getItemListService("POSITION");
		
		model.addAttribute("positionList", positionList);
		
		if(request.getAttribute("whosCall")!=null)
		{
			String whosCall = (String) request.getAttribute("whosCall");
		
			if("addUserPage".equals(whosCall))
			{
				viewName = "/rms/sys/addUserPage";			
			}
			else if("getUserDetail".equals(whosCall))
			{
				viewName = "/rms/sys/userInfoDetail";				
			}
		}
		
		return viewName;
	}
	
	@RequestMapping(value="/rms/sys/searchUser.do")
	public String searchUser(HttpServletRequest request, @ModelAttribute("pagingVO") DefaultVO pagingVO,HttpServletResponse response, ModelMap model)throws Exception{
		/**  페이징 */
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = uService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
				
		List<AdminVO> userList = uService.getUserListService(pagingVO);
		
		if(userList.size()==0 || userList ==null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("userList",userList);			
		}
		
		return "rms/sys/ajaxForUserList";
	}
	

}
