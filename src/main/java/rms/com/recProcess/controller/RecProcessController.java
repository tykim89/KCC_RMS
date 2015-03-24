package rms.com.recProcess.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.appmanage.service.AppBoardService;
import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;
import rms.com.recProcess.service.RecProcessService;
import rms.com.recProcess.service.RecProgStepItemService;
import rms.com.recProcess.vo.RecProcessVO;
import rms.com.recProcess.vo.RecProgStepItemVO;
import rms.com.recProcess.vo.StepItemVO;
import rms.com.sys.vo.AdminVO;
import twitter4j.internal.http.HttpRequest;

@Controller
public class RecProcessController {
	
	
	protected final static Log LOG = LogFactory.getLog(RecProcessController.class);
	
	
	@Resource(name="recProcessService")
	private RecProcessService recProcessService;
	
	@Resource(name="recProgStepItemService")
	private RecProgStepItemService recProgStepItemService;
	
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	@Resource(name="appBoardService")
	AppBoardService appBoardService;
	
    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;
    
	 @Resource(name = "rmsRecProgIdGnrService")
	 private EgovIdGnrService rmsIdGnrService;
	
	
	/**
	 * 채용절차 및 해당하는 전형단계 항목 목록 조회
	 * 
	 * @author tykim
	 * @since 2014-05-19
	 * */
	@RequestMapping(value="/rms/recProcess/recProcessList.do")
	public String getRecProcessList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		String searchValue = request.getParameter("searchValue");
		String searchKey = request.getParameter("searchKey");
		
		List<RecProcessVO> recProcessList = recProcessService.getRecProcessList(searchValue, searchKey);
		model.addAttribute("recProcessList", recProcessList);

		return "rms/recProcess/recProcessList";
	}
	
	
	/**
	 * 채용절차 상세조회
	 * 
	 * @author tykim
	 * @since 2014-06-16
	 * */
	public String getRecProcessContent(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		
		return "rms/recProcess/recProcessContent";
	}
	
	
	
	
	/**
	 * 전형단계항목 추가
	 * 
	 * @author tykim
	 * @since 2014-05-20
	 * */
/*    @RequestMapping(value="/rms/recProcess/addProcessItem.do")
    public String addItem(HttpServletRequest request, HttpServletResponse response, @ModelAttribute ItemVO inputItemVO)throws Exception{
    	int result = 0;
    	
    	if(iService.checkSortSeq(inputItemVO)==0)
    	{
    		result = iService.addItemService(inputItemVO);
    	}else{
    		LOG.info("정렬순서 겹치자네");
    	}
    	LOG.info(result+"건의 행이 삽입되었습니다.");
    	    	
    	return "rms/recProcess/rmsLoginForm";
    }
   */ 
    
    
	

	
	/**
	 * 채용절차, 전형단계항목 등록
	 * 
	 * @author tykim
	 * @since 2014-05-19
	 * */
	@RequestMapping(value="/rms/recProcess/insertRecProcessForm.do")
    public String getItemList(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception{
    	
    	String group_code="STEP_ITEM";
    	if(request.getParameter("group_code")!=null)
    	{
    		group_code = request.getParameter("group_code");
    	}
    	
    	List<ItemVO> stepItemList = iService.getItemListService(group_code);
    	model.addAttribute("stepItemList", stepItemList);
    	
    	for(ItemVO code : stepItemList){
    		LOG.info(code.toString());
    	}
    	
    	return "rms/recProcess/recProcessInsert";
    }
	
	@RequestMapping(value="rms/recProcess/insertRecProcess.do")
	public String insertRecProcess(HttpSession session, HttpServletRequest request, HttpServletResponse response,
											  @RequestParam String modifyTarget,
											  @ModelAttribute("recProcessVO") RecProcessVO recProcessVO, 
											  @ModelAttribute("stepItemVO") StepItemVO stepItemVO,
											  @ModelAttribute("recProgStepItemVO") RecProgStepItemVO recProgStepItemVO, AdminVO adminVO, Model model) throws Exception{
		
		adminVO = (AdminVO) session.getAttribute("userInfo");
		recProcessVO.setWriter(adminVO.getAdmin_id());
		
		//채번 등록
		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		recProcessVO.setRec_prog_no(key);

		
		recProcessService.insertRecProcess(recProcessVO);
		
		
		// 선택타켓 넘겨서 자른 리스트
		String selectTarget = null;
		selectTarget = request.getParameter("modifyTarget");
		
		List<String> result = recProcessService.selectField(selectTarget);
		stepItemVO.setProgStepList(result);
		
		List<StepItemVO> stepItem = recProcessService.getAddUseStepList(stepItemVO);
		
		ArrayList<String> stepList = new ArrayList<String>();
		ArrayList<String> stepSortList = new ArrayList<String>();
		
		
		// 사용할 전형단계 항목 VO중에서 항목명 뽑아 리스트에 저장
			String detailCode;
			String stepSeq;

			for(int i=0; i<stepItem.size(); i++){
				
				detailCode = stepItem.get(i).getDetail_code();
				stepSeq = stepItem.get(i).getSort_seq();
				
				stepList.add(detailCode);
				stepSortList.add(stepSeq);
			}
			
		

		

		int stepListSize=stepList.size();
		for(int i = 0; i<stepListSize; i++){
			RecProgStepItemVO tempVO= new RecProgStepItemVO();
			
			tempVO.setRec_prog_no(key);
			tempVO.setStep_item_code(stepList.get(i));
			tempVO.setStep_seq(stepSortList.get(i));
			tempVO.setWriter(adminVO.getAdmin_id());
			

			
			recProgStepItemService.insertRecProgStepItem(tempVO);
		}
		
		
		
//		recProgStepItemService.insertRecProgStepItem(recProgStepItemVO);
		
		
		return "redirect:/rms/recProcess/recProcessList.do";
	}
	
	
	
	
	/**
	 * 채용절차, 전형단계항목 수정
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	@RequestMapping(value="/rms/recProcess/updateRecProcess.do")
	public String updateRecProcess(/*@RequestParam("rec_prog_no") String rec_prog_no,*/
												@ModelAttribute("recProcessVO") RecProcessVO recProcessVO, 
			  									@ModelAttribute("recProgStepItemVO") RecProgStepItemVO recProgStepItemVO, Model model) throws Exception{
		
		// 채용절차 수정 //
		recProcessVO.setRec_prog_no("6");		recProcessVO.setRec_prog_name("6 채용절차 수정");
		recProcessVO.setRec_prog_memo("수정되었니~~~~~~?");
		
		recProcessService.updateRecProcess(recProcessVO);
		
		
		
		// 전형단계항목 정렬 순서 수정//
		ArrayList<String> stepList = new ArrayList<String>();
		stepList.add("STI_0010");
		stepList.add("STI_0030");
		stepList.add("STI_0020");


		int stepListSize=stepList.size();
		for(int i=0; i<stepListSize; i++){
			RecProgStepItemVO vo = new RecProgStepItemVO();
			
			vo.setRec_prog_no("6");
			vo.setStep_item_code(stepList.get(i));
			vo.setStep_seq(Integer.toString((i+1)*10));
			
			recProgStepItemService.updateRecProgStepItem(vo);
		}
		
		LOG.info(recProgStepItemVO);
		
		return "redirect:/rms/recProcess/recProcessList.do";
		
	}
	
	
	
	
	/**
	 * 채용절차, 전형단계항목 삭제
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	@RequestMapping(value="/rms/recProcess/deleteRecProcess.do")
	public String deleteRecProcess(HttpServletRequest request) throws Exception {
		
		String a = request.getParameter("rec_prog_no");
		LOG.info("======="+a);
		recProgStepItemService.deleteRecProgStepItem(a);
		recProcessService.deleteRecProcess(a);

		return "redirect:/rms/recProcess/recProcessList.do";
	}
	
	
	
	/**
	 * 사용 채용절차항목 목록 이동
	 * 
	 * @author tykim
	 * @since 2014-06-17
	 * */
	@RequestMapping(value="/rms/recProcess/useProcessStepItem.do")
	public @ResponseBody String useProcessStepItem(HttpServletRequest request, ModelMap model, 
																		@RequestParam String modifyTarget,
																		@RequestParam String rightTarget) throws Exception {
			
	    return "redirect:/rms/recProcess/insertRecProcessForm.do";
	}
	
	
	@RequestMapping(value="/rms/recProcess/unUseProcessStepItem.do")
	public @ResponseBody String unUseProcessStepItem(HttpServletRequest request, ModelMap model, 
																		@RequestParam String modifyTarget,
																		@RequestParam String rightTarget) throws Exception {
				
	    return "redirect:/rms/recProcess/insertRecProcessForm.do";
	}
	
	
	
	   /**
	    * 미사용 채용절차 항목 가져오기(Ajax)
	    * 
	    * @author tykim
	    * @since 2014-06-17
	    * */
	   @RequestMapping(value = "/rms/recProcess/getUnUseStepList.do")
	   public  String getUnUseStepList(HttpServletRequest request, ModelMap model, 
												   @RequestParam String modifyTarget, 
												   @RequestParam String rightTarget, 
												   @RequestParam String div,
												   @ModelAttribute("stepItemVO") StepItemVO stepItemVO) throws Exception {
		   
		   List<String> result = recProcessService.selectField(modifyTarget);
		   stepItemVO.setProgStepList(result);

/*		   List<String> result_2 = recProcessService.selectField(rightTarget);
		   stepItemVO.setProgStepList_2(result_2);
*/		   
		   
			if(div.equals("remove")){
/*				List<StepItemVO> stepItem = recProcessService.getRemoveAfterUseStepList(stepItemVO);
				model.addAttribute("stepItem", stepItem);
*/				
			}else {
				List<StepItemVO> stepItem = recProcessService.getAddAfterUseStepList(stepItemVO);
				model.addAttribute("stepItem", stepItem);
			}
		   
	      return "rms/recProcess/unusingProcessList";
	   }
	   
	   /**
	    * 사용 채용절차 항목 가져오기(Ajax)
	    * 
	    * @author tykim
	    * @since 2014-06-17
	    * */
	   @RequestMapping(value = "/rms/recProcess/getUseStepList.do")
	   public  String getUseStepList(HttpServletRequest request, ModelMap model, 
											    @RequestParam String modifyTarget,
											    @RequestParam String rightTarget,
											    @RequestParam String div,
												@ModelAttribute("stepItemVO") StepItemVO stepItemVO) throws Exception {

		   
			List<String> result = recProcessService.selectField(modifyTarget);
			stepItemVO.setProgStepList(result);
			
/*			List<String> result_2 = recProcessService.selectField(rightTarget);
			stepItemVO.setProgStepList_2(result_2);
*/			

			if(div.equals("add")){
				List<StepItemVO> stepItem = recProcessService.getAddUseStepList(stepItemVO);
				model.addAttribute("stepItem", stepItem);

				for(int i=0; i<stepItem.size(); i++){
					LOG.info(stepItem.get(i).getDetail_code_name());
					LOG.info(stepItem.get(i).getDetail_code());
				}
				
			}else {
/*				List<StepItemVO> stepItem = recProcessService.getRemoveUseStepList(stepItemVO);
				model.addAttribute("stepItem", stepItem);
*/				
			}

			
	      return "rms/recProcess/usingProcessList";
	   }
	   
	
}
