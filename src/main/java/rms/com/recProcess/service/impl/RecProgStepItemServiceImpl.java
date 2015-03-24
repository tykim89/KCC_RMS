package rms.com.recProcess.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.recProcess.service.RecProgStepItemService;
import rms.com.recProcess.vo.RecProcessVO;
import rms.com.recProcess.vo.RecProgStepItemVO;

@Service("recProgStepItemService")
public class RecProgStepItemServiceImpl implements RecProgStepItemService {

	
	@Resource(name="recProgStepItemDAO")
	private RecProgStepItemDAO recProgStepItemDAO;



	
	@Override
	public void insertRecProgStepItem(RecProgStepItemVO recProgStepItemVO) throws Exception {
		recProgStepItemDAO.RecProgStepItemInsert(recProgStepItemVO);
	}


	@Override
	public void updateRecProgStepItem(RecProgStepItemVO recProgStepItemVO) throws Exception {
		recProgStepItemDAO.RecProgStepItemUpdate(recProgStepItemVO);
	}


	@Override
	public void deleteRecProgStepItem(String rec_prog_no) throws Exception {
		recProgStepItemDAO.RecProgStepItemDelete(rec_prog_no);
	}
	
	


	
	
	
}
