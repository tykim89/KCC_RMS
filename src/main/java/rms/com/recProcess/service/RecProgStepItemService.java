package rms.com.recProcess.service;

import rms.com.recProcess.vo.RecProgStepItemVO;

public interface RecProgStepItemService {

	
	/**
	 * 전형단계항목 등록
	 * 
	 * @author tykim
	 * @since 2014-05-20
	 * */
	public void insertRecProgStepItem(RecProgStepItemVO recProgStepItemVO) throws Exception;

	
	/**
	 * 전형단계항목 수정
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void updateRecProgStepItem(RecProgStepItemVO recProgStepItemVO) throws Exception;
	
	
	/**
	 * 전형단계항목 삭제
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void deleteRecProgStepItem(String rec_prog_no) throws Exception;
	
	
	
}
