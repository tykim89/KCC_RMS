package rms.com.jal.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import rms.com.jal.service.ItemManageService;
import rms.com.jal.service.RecFieldManageService;
import rms.com.jal.vo.AffVO;
import rms.com.jal.vo.ItemVO;
import rms.com.jal.vo.RecFieldVO;
import rms.com.sys.controller.LoginController;
import egovframework.com.cmm.EgovMessageSource;

@Controller
public class RecFieldManageController {
	@Resource(name="recFieldManageService")
	RecFieldManageService rService;
	@Resource(name="itemManageService1")
	ItemManageService iService;
	
	protected static final Log LOG = LogFactory.getLog(RecFieldManageController.class);
	
	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
	@RequestMapping(value="/rms/jal/addRecField.do")
	public String addRecField(HttpServletRequest request, HttpServletResponse response, @ModelAttribute RecFieldVO inputRecFieldVO){
		String viewName="rms/cmn/rmsLoginForm";
		int result = 0;
		String overlap_rec_field_no = "";
		
		try {
			overlap_rec_field_no = rService.recFieldCheckSeqService(inputRecFieldVO.getSort_seq());
		} catch (Exception e) {
			LOG.info("[모집분야]seq조회중 이상");
			e.printStackTrace();
		}
		if(overlap_rec_field_no==null)
		{
			try {
				result = rService.addRecFieldService(inputRecFieldVO);
				if(result!=0){
					LOG.info("[모집분야]"+result+"건의 행이 삽입");
				}else{
					LOG.info("[모집분야]삽입실패");
				}
			} catch (Exception e) {
				LOG.info("[모집분야]삽입이상");
				e.printStackTrace();
			}
		}else{
			LOG.info("[모집분야]정렬순서 중복됨");
		}
		
		return "redirect:/rms/jal/recField_getRecFieldItemList.do";
	}
	/**
	 * 계열 목록
	 * 
	 * */
	@RequestMapping(value="/rms/jal/getAffList.do")
	public String getAffList(ModelMap model){
		List<AffVO> affList=null;
		try {
			affList= rService.getAffListService();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(AffVO aff : affList){
			LOG.info("@@"+aff.toString());
		}
		return "redirect:/rms/jal/recField_getRecFieldItemList.do";
	}
	/**
	 * 모집분야 항목 목록 
	 * itemManageService를 import하여 모듈 사용함
	 * */
	@RequestMapping(value="/rms/jal/recField_getRecFieldItemList.do")
	public String recFieldGetRecFieldItemList(ModelMap model){
		List<ItemVO> recFieldList=null;
		try {
			recFieldList= iService.getItemListService("REC_FIELD");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(ItemVO item : recFieldList){
			LOG.info("@@"+item.toString());
		}
		return "rms/cmn/rmsLoginForm";
	}
	
	@RequestMapping(value="/rms/jal/deleteRecField.do")
	public String deleteRecField(HttpServletRequest request, HttpServletResponse response){
		String [] checked;
		int result = 0;
		List<String> checkedList = null;
		
		if(request.getParameterValues("checked")!=null)
		{
			checked = request.getParameterValues("checked");
			for(String str : checked)
			{
				checkedList.add(str);
			}
		}
		try {
			result = rService.deleteRecFieldService(checkedList);
		} catch (Exception e) {
			LOG.info("[모집분야]삭제exception");
			e.printStackTrace();
		}
		if(result != 0)
		{
			LOG.info("[모집분야]"+result+"건의 행이 삭제됨");
		}else
		{
			LOG.info("[모집분야]삭제되지 않음");
		}
		
		return "redirect:/rms/jal/recField_getRecFieldItemList.do";
	}
	
	@RequestMapping(value="/rms/jal/modiRecField.do")
	public String modiRecField(@ModelAttribute RecFieldVO inputRecFieldVO){
		int result = 0;
		String overlap_rec_field_no = "";
		try {
			overlap_rec_field_no = rService.recFieldCheckSeqService(inputRecFieldVO.getSort_seq());
			LOG.info("[모집분야]seq조회 : "+overlap_rec_field_no);
		} catch (Exception e) {
			LOG.info("[모집분야]seq조회중 이상");
			e.printStackTrace();
		}
		LOG.info("[모집분야]seq비교 : "+overlap_rec_field_no+"=?"+inputRecFieldVO.getRec_field_no());
		if(overlap_rec_field_no==null || overlap_rec_field_no.equals(inputRecFieldVO.getRec_field_no()))
		{
			try {
				result = rService.modiRecFieldService(inputRecFieldVO);
				if(result!=0){
					LOG.info("[모집분야]"+result+"건의 행이 수정");
				}else{
					LOG.info("[모집분야]수정실패");
				}
			} catch (Exception e) {
				LOG.info("[모집분야]수정이상");
				e.printStackTrace();
			}
		}else{
			LOG.info("[모집분야]정렬순서 중복됨");
		}
		
		return "redirect:/rms/jal/recField_getRecFieldItemList.do";
	}
	
	@RequestMapping(value="/rms/jal/getRecFieldList.do")
	public String getRecFieldList(ModelMap model){
		List<RecFieldVO> recFieldList = null;
		try {
			recFieldList = rService.getRecFieldListService();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(RecFieldVO vo : recFieldList)
		{
			LOG.info("##"+vo.toString());
		}
		return "/rms/cmn/rmsLoginForm";
	}
}
