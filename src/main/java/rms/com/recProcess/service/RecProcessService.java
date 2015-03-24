package rms.com.recProcess.service;

import java.util.List;

import rms.com.recProcess.vo.RecProcessVO;
import rms.com.recProcess.vo.StepItemVO;

public interface RecProcessService {

	
	/**
	 * 채용절차 목록 조회
	 * 
	 * @author tykim
	 * @return RecProcessVO
	 * @since 2014-05-18
	 * */
	public List<RecProcessVO> getRecProcessList(String searchValue, String searchKey) throws Exception;
	
	
	/**
	 * 채용절차 등록
	 * 
	 * @author tykim
	 * @since 2014-05-18
	 * */
	public void insertRecProcess(RecProcessVO recProcessVO) throws Exception;
	
	
	/**
	 * 채용절차 수정
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void updateRecProcess(RecProcessVO recProcessVO) throws Exception;
	
	
	/**
	 * 채용절차 삭제
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void deleteRecProcess(String rec_prog_no) throws Exception;
	
	
	
	
	/**
	 * 채용공고 셀렉트박스용 채용절차 리스트 불러오기
	 * 
	 * @author tykim
	 * @since 2014-05-28
	 * */
	public List<RecProcessVO> getSelectRecProcessList() throws Exception;
	
	
	
	 /**
	 * 셀렉트값 구분자로 넘어온 것 짤라서 넘기기
	 * 
	 * @author tykim
	 * @since 2014-06-18
	 * */
	public List<String> selectField(String selectTarget) throws Exception;
	
	
	
	/**
	 * 사용할 채용절차 항목 목록 리스트 뽑기
	 * 
	 * @author tykim
	 * @since 2014-06-17
	 * */
	public List<StepItemVO> getAddUseStepList(StepItemVO stepItemVO) throws Exception;
	
	public List<StepItemVO> getAddAfterUseStepList(StepItemVO stepItemVO) throws Exception;
	
	public List<StepItemVO> getRemoveUseStepList(StepItemVO stepItemVO) throws Exception;
	
	public List<StepItemVO> getRemoveAfterUseStepList(StepItemVO stepItemVO) throws Exception;
	
	
/*	
	*//**
	 * 구분자 제거
	 * 
	 * *//*
	public List<String> divdeUserTarget(String modifyTarget) throws Exception;
	
	public List<String> makeContrTarget(String modifyTarget, String leftTarget) throws Exception;
	
	public String makeStringbyList(List<String> target) throws Exception;
*/	
	
	
}
