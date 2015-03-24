 package rms.com.appmanage.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.scheduler.Scheduler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.EgovMessageSource;

import rms.com.appmanage.service.RecResultService;
import rms.com.appmanage.vo.RecResultVO;
import rms.com.check.vo.CheckResVO;
import rms.com.cmn.controller.RmsLoginController;
import rms.com.sys.vo.AdminVO;
import twitter4j.internal.http.HttpRequest;

@Controller
public class RecResultController {

	/** RecResultService */
	@Resource(name="recResultService")
	private RecResultService recResultService;
	
   /** EgovMessageSource */
   @Resource(name = "egovMessageSource")
   EgovMessageSource          egovMessageSource;

   /** Log */
	protected static final Log LOG = LogFactory.getLog(RmsLoginController.class);
	
	
	/**
	 * 전형결과 관리 (등록/수정)
	 * 
	 * @author 선재희
	 * @since 2014-05-14
	 */
	@RequestMapping(value="/rms/appmanage/manageRecResult.do", method=RequestMethod.POST)
	public String recResult(HttpServletRequest request, @ModelAttribute RecResultVO recResultVO, HttpServletResponse response, ModelMap model) throws Exception{
		
		List<String> stepItemList = null;
		List<String> recResultList = null;
		
		LOG.info("**********manageRecResult Controller");
		
		//선택된 리스트가 잘 넘어왔는지 조사
		String selectUsrTarget = null;
		
		if(request.getParameter("selectUsrTarget")!= null)
		{
			selectUsrTarget = request.getParameter("selectUsrTarget");
			LOG.info("*********************"+selectUsrTarget);
		}
		//선택된 지원자를 리스트로 저장
		List<String> appUserList = recResultService.checkUser(selectUsrTarget);
		final String app_user_no = appUserList.get(0);
		
		recResultVO.setApp_user_no(app_user_no);
		
		LOG.info("//////////////" + app_user_no);

		try {
			stepItemList = recResultService.actionStepItemService(app_user_no);
			recResultList = recResultService.actionRecResultService();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("selectUsrTarget", selectUsrTarget);
		model.addAttribute("stepItemList", stepItemList);
		model.addAttribute("recResultList", recResultList);
		
		return "rms/appmanage/recResult";
	}
	
	//전형결과 수정
	@RequestMapping(value="/rms/appmanage/updateResult.do")
	public String updateResult(HttpServletRequest request, @ModelAttribute RecResultVO recResultVO, HttpServletResponse response, ModelMap model) throws Exception{
		
		//채용절차단계항목|전형결과 로 가져옴
		List<String> userResultList = null;
		String updateResultTarget = null;
		int updateResult;
		String stepItemCode;
		String resultCode;
		String selectUsrTarget = null;
		
		if(request.getParameter("updateResultTarget")!= null)
		  {
			selectUsrTarget = request.getParameter("selectUsrTarget");
			updateResultTarget = request.getParameter("updateResultTarget");
			LOG.info("================ updateResult.do : "+updateResultTarget);
		  }
		
		List<String> appUserList = recResultService.checkUser(selectUsrTarget);
		userResultList = recResultService.checkResult(updateResultTarget);
		stepItemCode = userResultList.get(0);
		resultCode = userResultList.get(1);
		
		recResultVO.setAppUserList(appUserList);
		recResultVO.setStepItemCode(stepItemCode);
		recResultVO.setResultCode(resultCode);
		
		updateResult = recResultService.updateResult(recResultVO);
		//전형결과 수정
		 
		if (updateResult == 0)
	      {
	         model.addAttribute("messageId", "fail.common.update");
	      } else
	      {
	         model.addAttribute("messageId", "success.common.update");
	      }
		
		return "redirect:/rms/appmanage/appBoard.do";
		
	}
	
	
	
	
	/**
	 * 전형일정 등록/수정
	 * 
	 * */
	@RequestMapping(value="/rms/appmanage/mangeRecSch.do")
	public String recSchUpdateForm(HttpServletRequest request, HttpServletResponse response, Model model,
			RecResultVO recResultVO) throws Exception{
		
		String selectUsrTarget = null;
		
		if(request.getParameter("selectUsrTarget")!= null) {
			selectUsrTarget = request.getParameter("selectUsrTarget");
		}
		
		model.addAttribute("selectUsrTarget", selectUsrTarget);

		
		return "rms/appmanage/recSch";
	}
	
	@RequestMapping(value="/rms/appmanage/updateRecSch.do")
	public String recSchUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
			@ModelAttribute("recResultVO") RecResultVO recResultVO, AdminVO adminVO, Model model) throws Exception{
		
		String selectUsrTarget = request.getParameter("selectUsrTarget");
		
		// 선택한 지원자 리스트
		List<String> appUserList = recResultService.checkUser(selectUsrTarget);
		LOG.info("*********************"+appUserList);
		
		if(appUserList != null){
			recResultVO.setAppUserList(appUserList);
			recResultService.updateRecSch(recResultVO, adminVO, session);
		}

		
		return "redirect:/rms/appmanage/appBoard.do";
	}
	
	@RequestMapping(value="/rms/appmanage/getRecScheJson.json")
	public String getRecScheJson(HttpServletRequest request, @ModelAttribute RecResultVO resultVO, ModelMap model) throws Exception {
		/*HttpSession session = request.getSession();		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");	
			resultVO.setAdmin_id(user.getAdmin_id());
		}*/
		
		RecResultVO schedule = recResultService.getScheContent(resultVO);
		String app_user_name = schedule.getApp_user_name();
		String content = schedule.getRec_sch_content();
		String rec_noti_title = schedule.getRec_noti_title();
		model.addAttribute("userName", app_user_name);
		model.addAttribute("content", content);
		model.addAttribute("recNotiName", rec_noti_title);
		
		return "jsonView";
		
	}
	
	@RequestMapping(value="/rms/appmanage/updateResScheJson.json")
	public String updateResScheJson(HttpServletRequest request, @ModelAttribute RecResultVO resultVO, ModelMap model) throws Exception{
		HttpSession session = request.getSession();		
		if(session.getAttribute("userInfo")!=null)
		{
			AdminVO user = (AdminVO) session.getAttribute("userInfo");	
			resultVO.setAdmin_id(user.getAdmin_id());
			resultVO.setModifier(user.getAdmin_id());
		}
		int result = recResultService.updateScheContent(resultVO);
		model.addAttribute("updateContentResult", result);
		
		return "jsonView";
	}

}
