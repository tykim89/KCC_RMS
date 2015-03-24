package rms.com.recProcess.service.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.recProcess.vo.RecProgStepItemVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository
public class RecProgStepItemDAO extends EgovComAbstractDAO{
	
	protected final static Log LOG = LogFactory.getLog(RecProgStepItemDAO.class);
	
	
	/**
	 * 전형단계항목 등록
	 * 
	 * @author tykim
	 * @since 2014-05-20
	 * */
	public void RecProgStepItemInsert(RecProgStepItemVO recProgStepItemVO) throws Exception {
		update("recProgStepItemInsert", recProgStepItemVO);
	}
	
	
	/**
	 * 전형단계항목 수정
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void RecProgStepItemUpdate(RecProgStepItemVO recProgStepItemVO) throws Exception {
		update("recProgStepItemUpdate", recProgStepItemVO);
	}
	
	
	/**
	 * 전형단계항목 삭제
	 * 
	 * @author tykim
	 * @since 2014-05-22
	 * */
	public void RecProgStepItemDelete(String rec_prog_no) throws Exception {
		update("recProgStepItemDelete", rec_prog_no);
	}
	
	
	
}
