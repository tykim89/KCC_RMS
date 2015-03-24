package rms.com.jal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.jal.service.RecFieldManageService;
import rms.com.jal.vo.AffVO;
import rms.com.jal.vo.RecFieldVO;

@Service("recFieldManageService")
public class RecFieldManageServiceImpl implements RecFieldManageService{
	@Resource(name="recFieldManageDAO")
	RecFieldManageDAO recFieldManageDAO;

	@Resource(name = "rmsRecFieldIdGnrService")
	private EgovIdGnrService rmsIdGnrService;
	
	@Override
	public int addRecFieldService(RecFieldVO inputRecFieldVO)  throws Exception{
		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		inputRecFieldVO.setRec_field_no(key);
		return recFieldManageDAO.addRecFieldDao(inputRecFieldVO);		
	}

	@Override
	public String recFieldCheckSeqService(String sort_seq) throws Exception {
		return recFieldManageDAO.recFieldCheckSeqDao(sort_seq);
	}

	@Override
	public List<AffVO> getAffListService() throws Exception {
		return recFieldManageDAO.getAffListDao();
	}

	@Override
	public int deleteRecFieldService(List<String> checkedList) throws Exception {
		return recFieldManageDAO.deleteRecFieldDao(checkedList);
	}

	@Override
	public int modiRecFieldService(RecFieldVO inputRecFieldVO) throws Exception {
		return recFieldManageDAO.modiRecFieldDao(inputRecFieldVO);
	}

	@Override
	public List<RecFieldVO> getRecFieldListService() throws Exception {
		return recFieldManageDAO.getRecFieldListDao();
	}
}
