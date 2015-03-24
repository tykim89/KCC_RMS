package rms.com.recProcess.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import rms.com.recProcess.vo.RecProcessVO;
import rms.com.recProcess.vo.StepItemVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("recProcessDAO")
public class RecProcessDAO extends EgovComAbstractDAO{
	
	
	
	/**
	 * 채용절차 / 전형단계항목 목록 조회
	 * 
	 * @author tykim
	 * @return RecProcessVO
	 * @since 2014-05-18
	 * */
	public List<RecProcessVO> RecProcessList(String searchValue, String searchKey) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		return list("recProcessList", map);
	}
	
	
	
	/**
	 * 채용절차 등록
	 * 
	 * @author tykim
	 * @since 2014-05-20
	 * */
	public void RecProcessInsert(RecProcessVO recProcessVO) throws Exception {
		update("recProcessInsert", recProcessVO);
	}
	
	
	
	/**
	 * 채용절차 수정
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void RecProcessUpdate(RecProcessVO recProcessVO) throws Exception {
		update("recProcessUpdate", recProcessVO);
	}
	
	
	
	/**
	 * 채용절차 삭제
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void RecProcessDelete(String rec_prog_no) throws Exception {
		update("recProcessDelete", rec_prog_no);
	}
	
	
	
	
	/**
	 * 채용공고 셀렉트박스용 채용절차 리스트 
	 * 
	 * @author tykim
	 * @return RecProcessVO
	 * @since 2014-05-28
	 * */
	public List<RecProcessVO> SelectRecProcessList() throws Exception {
		return list("selectRecProcessList", null);
	}
	
	
	
	/**
	 * 사용할 채용절차 항목 목록 리스트 뽑기
	 * 
	 * @author tykim
	 * @since 2014-06-17
	 * */
	public List<StepItemVO> AddUseStepList(StepItemVO stepItemVO) throws Exception {
		return list("recProcessDAO.AddUseStepItem", stepItemVO);
	}
	
	public List<StepItemVO> AddAfterUseStepItem(StepItemVO stepItemVO) throws Exception {
		return list("recProcessDAO.AddAfterUseStepItem", stepItemVO);
	}
	
	public List<StepItemVO> RemoveUseStepList(StepItemVO stepItemVO) throws Exception {
		return list("recProcessDAO.removeUseStepItem", stepItemVO);
	}
	
	public List<StepItemVO>  RemoveAfterUseStepList(StepItemVO stepItemVO) throws Exception {
		return list("recProcessDAO.removeAfterUseStepItem", stepItemVO);
	}
	
	
}
