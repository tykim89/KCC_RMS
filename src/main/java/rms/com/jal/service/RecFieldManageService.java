package rms.com.jal.service;

import java.util.List;

import rms.com.jal.vo.AffVO;
import rms.com.jal.vo.RecFieldVO;

public interface RecFieldManageService {
	public int addRecFieldService(RecFieldVO inputRecFieldVO) throws Exception;
	
	public String recFieldCheckSeqService(String sort_seq) throws Exception;
	
	public List<AffVO> getAffListService()throws Exception;
	
	public int deleteRecFieldService(List<String> checkedList)throws Exception;
	
	public int modiRecFieldService(RecFieldVO inputRecFieldVO) throws Exception;
	
	public List<RecFieldVO> getRecFieldListService()throws Exception;
}
