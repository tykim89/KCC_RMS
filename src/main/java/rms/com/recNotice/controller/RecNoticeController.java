package rms.com.recNotice.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import rms.com.appForm.service.AppFormService;
import rms.com.appForm.vo.AppFormVO;
import rms.com.appmanage.service.AppBoardService;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.attfile.service.FileService;
import rms.com.attfile.vo.FileVO;
import rms.com.jal.service.RecFieldManageService;
import rms.com.jal.vo.RecFieldVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recNotice.service.RecNoticeService;
import rms.com.recNotice.vo.RecNoticeVO;
import rms.com.recProcess.service.RecProcessService;
import rms.com.recProcess.vo.RecProcessVO;
import rms.com.sys.vo.AdminVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class RecNoticeController {


	@Resource(name="recNoticeService")
	private RecNoticeService recNoticeService;

	@Resource(name="appFormService")
	private AppFormService appFormService;

	@Resource(name="recProcessService")
	private RecProcessService recProcessService;
	
	@Resource(name="fileService")
	FileService fileService;

	@Resource(name="appBoardService")
	AppBoardService appBoardService;

	@Resource(name="recFieldManageService")
	RecFieldManageService rService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	protected static final Log LOG = LogFactory.getLog(RecNoticeController.class);



	/**
	 * 채용공고 목록조회 + 검색
	 * 
	 * @author tykim
	 * @throws Exception 
	 * @since 2014-05-21
	 **/
	@RequestMapping(value="/rms/recNotice/recNoticeList.do")
	public String getRecNoticeList(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model,
			@ModelAttribute("pagingVO") DefaultVO pagingVO, RecNoticeVO recNoticeVO) throws Exception{

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


		// 현재 년도, 내년 까지만 구하여 등록폼에 보내기
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int y = cal.get ( cal.YEAR );
		int nY = y+1;
		String year = String.valueOf(y);
		String nextYear = String.valueOf(nY);
		model.addAttribute("year", year);
		model.addAttribute("nextYear", nextYear);


		//선택된 지원분야가 있는지 조사
		String selectTarget = null;
		selectTarget = request.getParameter("selectTarget");

		if(selectTarget == "" || selectTarget == null || selectTarget.equals("null")) 
		{
			selectTarget = null;
		}
			
		
		//선택된 지원분야 항목
		List<String> result = appBoardService.selectField(selectTarget);
		pagingVO.setRecFieldList(result);



		String rec_year = request.getParameter("rec_year");
		String career_div_code = request.getParameter("career_div_code");
		LOG.info("*********************"+rec_year);
		LOG.info("*********************"+career_div_code);




		List<DefaultVO> recNoticeList = null;
		recNoticeList = recNoticeService.getRecNoticeList(pagingVO);



		//지원분야 항목 가져오기
		List<AppUserSearchVO> recFieldList = null;
		recFieldList = appBoardService.recFieldService();



		int totCnt = recNoticeService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);

		LOG.info("----------------------"+totCnt);
		model.addAttribute("paginationInfo", paginationInfo);


		model.addAttribute("recNoticeList", recNoticeList);
		model.addAttribute("recFieldList", recFieldList);

		return "/rms/recNotice/recNotiList";

	}



	// 채용공고 상세조회
	@RequestMapping(value="/rms/recNotice/recNoticeContent.do")
	public String getRecNoticeContent(HttpServletRequest request, HttpServletResponse response, Model model, String rec_noti_no) throws Exception{

		RecNoticeVO recNoticeContent = recNoticeService.getRecNoticeContent(rec_noti_no);
		model.addAttribute("recNoticeVO", recNoticeContent);


		return "/rms/recNotice/recNotiContent";
	}



	// 채용공고 등록
	@RequestMapping(value="/rms/recNotice/insertRecNotice.do")
	public String insertRecNotice(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session,
			@ModelAttribute("recNoticeVO") RecNoticeVO recNoticeVO, AdminVO adminVO) throws Exception{
		
		adminVO = (AdminVO) session.getAttribute("userInfo");
		recNoticeVO.setWriter(adminVO.getAdmin_id());

		recNoticeService.insertRecNotice(recNoticeVO);

		return "redirect:/rms/recNotice/recNoticeList.do";
	}

	@RequestMapping(value="/rms/recNotice/insertRecNoticeForm.do")	// 등록 폼 이동
	public String insertRecNotioceForm(Model model) throws Exception{

		// 현재 년도, 내년 까지만 구하여 등록폼에 보내기
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int y = cal.get ( cal.YEAR );
		int nY = y+1;
		String year = String.valueOf(y);
		String nextYear = String.valueOf(nY);
		model.addAttribute("year", year);
		model.addAttribute("nextYear", nextYear);
		
		//모집분야 리스트 불러오기
		List<RecFieldVO> recFieldList = null;
		recFieldList = rService.getRecFieldListService();


		//지원서양식 리스트 불러오기
		List<AppFormVO> appFormList = null;
		appFormList = appFormService.getSelectAppFormList();


		//채용절차 리스트 불러오기
		List<RecProcessVO> recProcessList = null;
		recProcessList = recProcessService.getSelectRecProcessList();


		model.addAttribute("recFieldList", recFieldList);
		model.addAttribute("appFormList", appFormList);
		model.addAttribute("recProcessList", recProcessList);

		return "rms/recNotice/recNotiInsert";
	}




	// 채용공고 수정
	@RequestMapping(value="/rms/recNotice/updateRecNotice.do")
	public String updateRecNotice(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("recNoticeVO") RecNoticeVO recNoticeVO, 
			@RequestParam("rec_noti_no") String rec_noti_no,
			AdminVO adminVO, HttpSession session) throws Exception{

		adminVO = (AdminVO) session.getAttribute("userInfo");
		recNoticeVO.setModifier(adminVO.getAdmin_id());

		recNoticeService.updateRecNotice(recNoticeVO);

		return "redirect:/rms/recNotice/recNoticeContent.do?rec_noti_no="+rec_noti_no;
	}

	@RequestMapping(value="/rms/recNotice/updateRecNoticeForm.do")		// 수정 폼 이동, 상세조회 값 세팅
	public String getRecNoticeContentForUpdate(HttpServletRequest request, HttpServletResponse response, 
			Model model, String rec_noti_no) throws Exception{

		RecNoticeVO recNoticeContent = recNoticeService.getRecNoticeContent(rec_noti_no);

		model.addAttribute("recNoticeVO", recNoticeContent);

		
		// 현재 년도, 내년 까지만 구하여 등록폼에 보내기
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int y = cal.get ( cal.YEAR );
		int nY = y+1;
		String year = String.valueOf(y);
		String nextYear = String.valueOf(nY);
		
		model.addAttribute("year", year);
		model.addAttribute("nextYear", nextYear);

		//모집분야 리스트 불러오기
		List<RecFieldVO> recFieldList = null;
		recFieldList = rService.getRecFieldListService();

		//지원서양식 리스트 불러오기
		List<AppFormVO> appFormList = null;
		appFormList = appFormService.getSelectAppFormList();

		//채용절차 리스트 불러오기
		List<RecProcessVO> recProcessList = null;
		recProcessList = recProcessService.getSelectRecProcessList();

		model.addAttribute("recFieldList", recFieldList);
		model.addAttribute("appFormList", appFormList);
		model.addAttribute("recProcessList", recProcessList);

		return "/rms/recNotice/recNotiUpdate";
	}



	// 채용공고 삭제
	@RequestMapping(value="/rms/recNotice/deleteRecNotice.do")
	public String deleteRecNotice(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, Model model, AdminVO adminVO, RecNoticeVO recNoticeVO, FileVO fileVO) throws Exception{

		adminVO = (AdminVO) session.getAttribute("userInfo");
		recNoticeVO.setModifier(adminVO.getAdmin_id());
		fileVO.setModifier(adminVO.getAdmin_id());
		
		String rec_noti_no = request.getParameter("rec_noti_no");
		recNoticeService.deleteRecNotice(rec_noti_no);
		
		String attFileNo = request.getParameter("att_file_no");
		LOG.info(attFileNo);
		
		if(attFileNo != "FILE00000"){
			fileService.fileDelete(attFileNo);
		}
		

		return "redirect:/rms/recNotice/recNoticeList.do";
	}

	
	
	// 스케쥴러 사용 (응시마감일자가 지난 채용공고 자동으로 '마감'으로 변환)
	@Scheduled(cron="3 0 0 * * *")  // 초 분 시 일 월 주(년)
	public void dailyRecNoticeCheck(){
		LOG.info("체크체킃케츠케츠ㅔㅋ츠ㅔㅋ츠ㅔㅋ체ㅡ");
	}
	
	

	
	



	//------------------------------------------------------------------------------------------------------------------
	// 지원자의 채용공고 조회 및 입사지원

	/**
	 * 채용공고 목록 조회
	 * 
	 * @author tykim
	 * @since 2014-06-23
	 * */
	@RequestMapping(value="/rms/recNotice/userNoticeList.do")
	public String getUserRecNoticeList(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model,
			@ModelAttribute("pagingVO") DefaultVO pagingVO, RecNoticeVO recNoticeVO) throws Exception{


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


		List<DefaultVO> recNoticeList = null;
		recNoticeList = recNoticeService.getRecNoticeList(pagingVO);


		int totCnt = recNoticeService.selectSampleListTotCnt(pagingVO);
		paginationInfo.setTotalRecordCount(totCnt);
		

		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("recNoticeList", recNoticeList);

		return "/rms/kcc/userRecNotiList";

	}


	
	/**
	 * 채용공고 상세조회
	 * 
	 * @author tykim
	 * @since 2014-06-23
	 * */
	@RequestMapping(value="/rms/recNotice/userNoticeContent.do")
	public String getUserRecNoticeContent(HttpServletRequest request, HttpServletResponse response, Model model, String rec_noti_no) throws Exception{

		RecNoticeVO recNoticeContent = recNoticeService.getRecNoticeContent(rec_noti_no);
		model.addAttribute("recNoticeVO", recNoticeContent);


		return "/rms/kcc/userRecNotiContent";
	}
	
	
	


}
