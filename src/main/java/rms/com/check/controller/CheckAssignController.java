package rms.com.check.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import rms.com.check.service.CheckAssignService;
import rms.com.check.vo.AssignedUserVO;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForAdminVO;
import rms.com.cmn.service.AuthService;
import rms.com.sys.vo.AdminVO;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class CheckAssignController {

	/** Service */
	@Resource(name = "checkAssignService")
	private CheckAssignService checkAssignService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Log */
	protected static final Log LOG = LogFactory
			.getLog(CheckAssignController.class);

	/**
	 * 검토자할당 페이지로 이동
	 * 
	 * @author 선재희
	 * @since 2014-06-02
	 * */
	@RequestMapping(value = "/rms/check/gotoCheckAssignPage.do")
	public String gotoCheckAssignPage(HttpServletRequest request, HttpServletResponse response, @ModelAttribute AdminVO adminVO, ModelMap model) throws Exception {
		LOG.info("***************** Success gotoCheckAssignPage.do");

		String messageId = request.getParameter("messageId");

		// 등록,수정,삭제 Controller에서 넘어온 message값 유지
		if (messageId != null && !"".equals(messageId)) {
			model.addAttribute("message",
					egovMessageSource.getMessage(messageId));
		}
		
		//1. 진행중인 채용공고 가져오기
		model.addAttribute("recFieldList", checkAssignService.getRecField());

		return "rms/check/checkAssign";
	}
	
	/**
	 * 채용공고에 맞는 검토자 리스트 화면 출력
	 * 
	 * @author 선재희
	 * @since 2014-06-11
	 */
	@RequestMapping(value = "/rms/check/getFirstCheckUserList.do")
	public String getFirstCheckUserList(HttpServletRequest request, HttpServletResponse response, @RequestParam String recFieldNo, ModelMap model) throws Exception {
		LOG.info("***************** Success getCheckUserList.do");
		LOG.info("================== recFieldNo : " + recFieldNo);
		
		model.addAttribute("adminList", checkAssignService.getUserListByRecField(recFieldNo));
		model.addAttribute("checkUserTarget", checkAssignService.getStringByCheckUsrList(recFieldNo));
		
		return "rms/check/checkUserList";
	}
	

	/**
	 * 미할당된 지원자 리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-02
	 */

	@RequestMapping(value = "/rms/check/getUnassignUsrList.do")
	public String getUnassignUsrList(HttpServletRequest request, @RequestParam String recFieldNo, @RequestParam String div, HttpServletResponse response, ModelMap model) throws Exception {
		String addTarget = "";
		String admin_id= "";
		//addTarget = request.getParameter("addTarget");
		
		admin_id = request.getParameter("checkUsrTarget");
		// HttpSession session = request.getSession();
		
		// 추가버튼 눌렀을 때, 미할당된 지원자 리스트
		List<AssignedUserVO> userList = null;
		
	/*	if (div.equals("")) 
		{
			String target = checkAssignService.getBaseUserList(recFieldNo, targetString);
			//model.addAttribute("userList", checkAssignService.getBaseUserList(recFieldNo));
		} else if (div.equals("remove")) 
		{
			userList =  checkAssignService.getRemoveUnassignedUsrList(recFieldNo, addTarget);
			LOG.info("아놔진짜.....빨랑돼라 제발 쫌!!!!!!!!!!!!!!!!!!!!!" + userList);
			
			model.addAttribute("userList", userList);
			//LOG.info("\\\\\\\\\\userList[0]" + checkAssignService.getRemoveUnassignedUsrList(recFieldNo, addTarget));
		}
		else if(div.equals("add"))
		{
			LOG.info("%%%%%%%%%%%%%%%%%" + adminTarget);
			model.addAttribute("userList", checkAssignService.getAddUnassignedUsrList(recFieldNo, addTarget, adminTarget));
		} */
		
		
		return "rms/check/unassignedUser";
	}
	
	/**
	 * 검토자에 해당하는 할당된 지원자 리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-29
	 */

	@RequestMapping(value = "/rms/check/getDetailAssignList.do")
	public String getDetailAssignList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String admin_id = "";
		String rec_noti_no ="";

		if (request.getParameter("checkUsrTarget") != null) {
			admin_id = request.getParameter("checkUsrTarget");
		}
		if (request.getParameter("recFieldNo") != null) {
			rec_noti_no = request.getParameter("recFieldNo");
		}		
		model.addAttribute("userList",	checkAssignService.getDetailAssignList(admin_id, rec_noti_no));
		model.addAttribute("assignUsrTarget", checkAssignService.getAssignUsrTarget(admin_id, rec_noti_no));	
		
		return "rms/check/assignUser";
	}
	
	/**
	 * 검토자에 해당하는 미할당된 지원자 리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-29
	 */

	@RequestMapping(value = "/rms/check/getDetailUnassignList.do")
	public String getDetailUnassignList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String admin_id = "";
		String targetString ="";
		String rec_noti_no ="";
		if(request.getParameter("checkUsrTarget")!=null)
		{
			admin_id = request.getParameter("checkUsrTarget");
		}
		if(request.getParameter("addTarget")!=null)
		{
			targetString = request.getParameter("addTarget");
			LOG.info("********* Controlloer ::::: " + targetString);
		}
		if (request.getParameter("recFieldNo") != null) {
			rec_noti_no = request.getParameter("recFieldNo");
		}		
		LOG.info("********* Controlloer ::::: " + targetString);
		// 추가버튼 눌렀을 때, 미할당된 지원자 리스트
		
		model.addAttribute("userList", checkAssignService.getBaseUserList(rec_noti_no, targetString, admin_id));
		//model.addAttribute("adminIdByUnassign", adminTarget);
		//model.addAttribute("count", checkAssignService.countUnassignList(adminTarget));
		
		return "rms/check/unassignedUser";
	}
	
	/**
	 * 관리자리스트 창 가져오기
	 * 
	 * @author 선재희
	 * @since 2014-06-10
	 */
	@RequestMapping(value = "/rms/check/gotoAdminPop.do")
	public String gotoAdminPop(HttpServletRequest request, HttpServletResponse response, @RequestParam String recFieldNo, ModelMap model) throws Exception {

		HttpSession session = request.getSession();
		model.addAttribute("companyList", checkAssignService.getCompany());
		model.addAttribute("depList", checkAssignService.getDept());
		model.addAttribute("positionList", checkAssignService.getPosition());
		model.addAttribute("recFieldNoByAdmin", recFieldNo);
		PagingForAdminVO pagingVO = new PagingForAdminVO();
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO av = new AdminVO();
			pagingVO.setAdmin_id(av.getAdmin_id());
		}
		pagingVO.setRec_noti_no(recFieldNo);		
		
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = checkAssignService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		List<AdminVO> adminList= checkAssignService.basicAdminListService(pagingVO);
		if(adminList.size()==0 || adminList ==null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("adminList",adminList);
		}

		return "rms/check/adminList";

	}
	
	/**
	 * 조건검색에 맞는 관리자리스트 창으로 이동 (Ajax)
	 * 
	 * @author 선재희
	 * @since 2014-06-10
	 */
	@RequestMapping(value = "/rms/check/getAdminList.do")
	public String getAdminList(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("pagingVO")PagingForAdminVO pagingVO,
			ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		AdminVO user = new AdminVO();
		if(session.getAttribute("userInfo")!=null)
		{
			user = (AdminVO) session.getAttribute("userInfo");
			pagingVO.setAdmin_id(user.getAdmin_id());
		}		
		pagingVO.setPageUnit(propertiesService.getInt("pageUnit"));
		pagingVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pagingVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(pagingVO.getPageUnit());
		paginationInfo.setPageSize(pagingVO.getPageSize());
		
		pagingVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		pagingVO.setLastIndex(paginationInfo.getLastRecordIndex());
		pagingVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = checkAssignService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		List<AdminVO> adminList= checkAssignService.basicAdminListService(pagingVO);
		if(adminList.size()==0 || adminList ==null){
			model.addAttribute("isc",true);
		}else{
			model.addAttribute("adminList",adminList);
		}
		
		return "rms/check/adminListAjax";
	}
	
	/**
	 * 확정된 검토자 리스트 보여주기
	 * 
	 * @author 선재희
	 * @since 2014-06-11
	 */

	@RequestMapping(value = "/rms/check/getCheckUserList.do")
	public String getCheckUserList(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	
	/*	//기존 검토자리스트
		String chkUsrTarget = "";
		//선택된 검토자
		String adminTarget = "";
		
		String recFieldNo = "";
		chkUsrTarget = request.getParameter("chkUsrTarget");
		
		recFieldNo = request.getParameter("recFieldNoByAdmin");
		adminTarget = request.getParameter("adminTarget");
		
		
		LOG.info("////////////////" + adminTarget);
		
		LOG.info("^^^^^^^^^^^^성공해라 얍! INSERT 전 ===> 채용공고 : " + recFieldNo);
		LOG.info("^^^^^^^^^^^^성공해라 얍! INSERT 전 ===> 기존 검토자 리스트 : " + adminTarget);
		
		LOG.info("값 다 받아왔다!!");
		
		if (request.getParameter("adminTarget") != null) {
			checkAssignService.insertCheckUserList(adminTarget, recFieldNo);
			model.addAttribute("adminList", checkAssignService.getCheckUserListByRecField(recFieldNo));
			model.addAttribute("checkUserTarget",checkAssignService.findCheckUserByRecField(recFieldNo));
			LOG.info("////////////////" + adminTarget);
		} else if(request.getParameter("mainAdminTarget") != null)
		{
			adminTarget = request.getParameter("mainAdminTarget");
			//model.addAttribute("adminList",	checkAssignService.getCheckUserList(adminTarget));
		}*/
		
		String writer = "";
		String rec_noti_no ="";
		String adminTarget="";
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = new AdminVO();
			writer = user.getAdmin_id();
		}
		if(request.getParameter("rec_noti_no")!=null)
		{
			rec_noti_no = request.getParameter("rec_noti_no");
		}
		if(request.getParameter("adminTarget")!=null)
		{
			adminTarget = request.getParameter("adminTarget");
		}
		
		checkAssignService.insertCheckUserList(adminTarget, rec_noti_no, writer);
		
		return "forward:/rms/check/getCheckerList.do";
	}
	
	/**
	 * 채용공고별 할당된 검토자리스트
	 * 
	 * @author 이동선
	 * @since 2014-06-02
	 * @param 채용공고번호
	 */
	@RequestMapping(value="/rms/check/getCheckerList.do")
	public String getCheckerListByNoti(HttpServletRequest request, ModelMap model)throws Exception{
		String rec_noti_no = "";
		if(request.getParameter("rec_noti_no")!=null)
		{			
			rec_noti_no = request.getParameter("rec_noti_no");
		}
		if(request.getParameter("recFieldNo")!=null)
		{			
			rec_noti_no = request.getParameter("recFieldNo");
		}
		List<AdminVO> checkerList = checkAssignService.getCheckerListByNotiService(rec_noti_no);
		model.addAttribute("adminList", checkerList);
		return "rms/check/checkUserList";
	}
	
	/**
	 * 할당된 지원자 리스트
	 * 
	 * @author 선재희
	 * @since 2014-06-02
	 */

	@RequestMapping(value = "/rms/check/getAssignUsrList.do")
	public String getAssignUsrList(HttpServletRequest request,
			@RequestParam String recFieldNo, @RequestParam String div,
			HttpServletResponse response, ModelMap model) throws Exception {
		String addTarget = null;

		addTarget = request.getParameter("addTarget");

		LOG.info("***************** Success getAssignUsrList.do");

		// 추가버튼 눌렀을 때, 할당된 지원자 리스트
		if (div.equals("add")) {
			model.addAttribute("userList",
					checkAssignService.getAddAssignedUsrList(addTarget));
		}
		// 제거버튼 눌었을 때, 할당된 지원자 리스트
		else {

			model.addAttribute("userList",
					checkAssignService.getRemoveAssignedUsrList(addTarget));

		}
		
		model.addAttribute("assignUsrTarget", addTarget);

		return "rms/check/assignUser";
	}
	
	
	
	

	/**
	 * 사용자 검토할당 추가
	 * 
	 * @author 선재희
	 * @since 2014-06-02
	 */
	@RequestMapping(value = "/rms/check/addUserByAssign.do")
	public @ResponseBody String addUserByAssign(HttpServletRequest request, @RequestParam String addTarget, ModelMap model) throws Exception {
		return "redirect:/rms/check/gotoCheckAssignPage.do";

	}

	/**
	 * 사용자 검토할당 제거
	 * 
	 * @author 선재희
	 * @since 2014-06-02
	 */
	@RequestMapping(value = "/rms/check/removeUserByAssign.do")
	public @ResponseBody
	String removeUserByAssign(HttpServletRequest request,
			@RequestParam String addTarget, @RequestParam String rightTarget,
			ModelMap model) throws Exception {

		return "redirect:/rms/check/gotoCheckAssignPage.do";

	}

	
	
	/** 
	 * 검토 할당 업데이트
	 * 
	 * @author 선재희
	 * @since 20104-06-12
	 */
	@RequestMapping(value = "/rms/check/updateCheckAssign.do")
	public String updateCheckAssign(HttpServletRequest request, HttpServletResponse response, ModelMap model, @ModelAttribute CheckResVO checkVO) throws Exception {
		LOG.info("***************** Success updateCheckAssign.do");

		String admin_id = "";
		String rec_noti_no ="";
		String addTarget="";

		if (request.getParameter("checkUsrTarget") != null) {
			admin_id = request.getParameter("checkUsrTarget");
		}
		if (request.getParameter("recFieldNo") != null) {
			rec_noti_no = request.getParameter("recFieldNo");
		}		
		if (request.getParameter("addTarget") != null) {
			addTarget = request.getParameter("addTarget");
		}
		checkAssignService.deleteCheckAppByRes(rec_noti_no, admin_id);
		checkVO.setAdmin_id(admin_id);
		checkVO.setRec_noti_no(rec_noti_no);
		if(!addTarget.equals(""))
		{
			checkAssignService.insertCheckAppByRes(checkVO, addTarget);
		}
		
		/*String addTarget = "";
		String checkUsrTarget = "";
		int update = 0;

		if (request.getParameter("addTarget") != null && request.getParameter("checkUsrTarget") != null) {
			addTarget = request.getParameter("addTarget");
			checkUsrTarget = request.getParameter("checkUsrTarget");
			
			update = checkAssignService.updateCheckAssginService(addTarget, checkUsrTarget);
			
			if(update > 0)
			{
				//message설정의 경우 src/main/resources/egovframework/message/com/message-common_ko_KR.properties 파일에서 가능
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			} else
			{
				model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
			}
			
			LOG.info("////////////////" + addTarget + "|" + checkUsrTarget);
		}*/

		
		return "forward:/rms/check/getCheckerList.do";

	}
	
	@RequestMapping(value="/rms/check/deleteChecker.do")
	public String deleteCheckerByRec(HttpServletRequest request, ModelMap model)throws Exception	{
		LOG.info("->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>3");
		String deleteTarget ="";
		String rec_noti_no ="";
		if(request.getParameter("rec_noti_no")!=null)
		{
			rec_noti_no = request.getParameter("rec_noti_no");
		}
		if(request.getParameter("deleteTarget")!=null)
		{
			deleteTarget = request.getParameter("deleteTarget");
		}
	//	List<AdminVO> checkerList = checkAssignService.checkCheckerList(rec_noti_no, deleteTarget);
		int result = checkAssignService.deleteCheckerByNoti(rec_noti_no, deleteTarget);
		LOG.info("->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>4/"+result);
		model.addAttribute("deleteResult", result);
		return "forward:/rms/check/getCheckerList.do";
	}
	
	@RequestMapping(value="/rms/check/checkUnderAppUser.json")
	public String checkUnderUser(HttpServletRequest request, ModelMap model)throws Exception{
		String deleteTarget ="";
		String rec_noti_no ="";
		if(request.getParameter("rec_noti_no")!=null)
		{
			rec_noti_no = request.getParameter("rec_noti_no");
		}
		if(request.getParameter("deleteTarget")!=null)
		{
			deleteTarget = request.getParameter("deleteTarget");
		}
		List<String> checkerList = checkAssignService.checkCheckerList(rec_noti_no, deleteTarget);
		String checkerTarget = checkAssignService.makeStringbyList(checkerList);
		model.addAttribute("checkUnderResultList", checkerTarget);
		model.addAttribute("checkerList", checkerList);
		return "jsonView";		
	}
	
	@RequestMapping(value="/rms/check/deleteAssignedUser.do")
	public String deleteAssignedUser(HttpServletRequest request, ModelMap model)throws Exception	{
		LOG.info("->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>1");
		String deleteTarget ="";
		String rec_noti_no ="";
		if(request.getParameter("rec_noti_no")!=null)
		{
			rec_noti_no = request.getParameter("rec_noti_no");
		}
		if(request.getParameter("deleteTarget")!=null)
		{
			deleteTarget = request.getParameter("deleteTarget");
		}
	
		//List<CheckResVO> checkResInfo = checkAssignService.getCheckResInfo(rec_noti_no, deleteTarget);
		int deleteUnderAppUserResult =  checkAssignService.deleteCheckRes(rec_noti_no, deleteTarget);
		LOG.info("->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>2/"+deleteUnderAppUserResult);
		//int result = checkAssignService.deleteCheckerByNoti(rec_noti_no, deleteTarget);
		model.addAttribute("deleteUnderAppUserResult", deleteUnderAppUserResult);
		return "forward:/rms/check/deleteChecker.do";
	}
}
