package rms.com.jal.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import rms.com.jal.vo.AffVO;
import rms.com.jal.vo.RecFieldVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("recFieldManageDAO")
public class RecFieldManageDAO extends EgovComAbstractDAO{
	
	public int addRecFieldDao(RecFieldVO inputRecFieldVO){
		return update("recFieldDAO.addRecFieldAction", inputRecFieldVO);
	}
	public String recFieldCheckSeqDao(String sort_seq){
		return (String)selectByPk("recFieldDAO.addRecFieldAction.checkSeq", sort_seq);
	}
	public List<AffVO> getAffListDao(){
		return list("recFieldDAO.getAffList", null);
	}
	public int deleteRecFieldDao(List<String> checkedList){
		return update("recFieldDAO.deleteRecFieldAction", checkedList);
	}
	public int modiRecFieldDao(RecFieldVO inputRecFieldVO){
		return update("recFieldDAO.modiRecFieldAction", inputRecFieldVO);
	}
	public List<RecFieldVO> getRecFieldListDao(){
		return list("recFieldDAO.getRecFieldListAction", null);
	}
}
