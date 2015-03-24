package rms.com.recProcess.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.recProcess.service.RecProcessService;
import rms.com.recProcess.vo.RecProcessVO;
import rms.com.recProcess.vo.RecProgStepItemVO;
import rms.com.recProcess.vo.StepItemVO;

@Service("recProcessService")
public class RecProcessServiceImpl implements RecProcessService {

	
	@Resource(name="recProcessDAO")
	private RecProcessDAO recProcessDAO;
	

	
	
	@Override
	public List<RecProcessVO> getRecProcessList(String searchValue, String searchKey) throws Exception {
		return recProcessDAO.RecProcessList(searchValue, searchKey);
	}


	@Override
	public void insertRecProcess(RecProcessVO recProcessVO) throws Exception {

		recProcessDAO.RecProcessInsert(recProcessVO);
	}


	@Override
	public void updateRecProcess(RecProcessVO recProcessVO) throws Exception {
		recProcessDAO.RecProcessUpdate(recProcessVO);
	}


	@Override
	public void deleteRecProcess(String rec_prog_no) throws Exception {
		recProcessDAO.RecProcessDelete(rec_prog_no);
	}


	
	@Override
	public List<RecProcessVO> getSelectRecProcessList() throws Exception {
		return recProcessDAO.SelectRecProcessList();
	}


	
/*	
	@Override
	public List<StepItemVO> getAddUseStepList(String modifyTarget) throws Exception {
		
		List<String> modifyTargetList = null;
		if(modifyTarget != null && !modifyTarget.equals("")){
			modifyTargetList = this.divdeUserTarget(modifyTarget);
		}
		
		Map<String, Object> modifyCondition = new HashMap<String, Object>();
		modifyCondition.put("list", modifyTargetList);
		
		return recProcessDAO.AddUseStepList(modifyTarget);
	}


	@Override
	public List<StepItemVO> getAddAfterUseStepList(String modifyTarget)
			throws Exception {
		return null;
	}
*/

	
	
/*	
	@Override
	public List<String> divdeUserTarget(String modifyTarget) throws Exception {
		List<String> modifyTargetList = new ArrayList<String>();
		
		for(String str : modifyTarget.split("\\|")){
			modifyTargetList.add(str);
		}
		return modifyTargetList;
	}


	@Override
	public List<String> makeContrTarget(String modifyTarget, String rightTarget) throws Exception {
		List<String> modifyTargetList = null;
		List<String> rightTargetList = null;
		
		rightTargetList = this.divdeUserTarget(rightTarget);
		modifyTargetList = this.divdeUserTarget(modifyTarget);
		
		int rightTargetSize = rightTargetList.size();
		
		for(int i=0; i<rightTargetSize; i++){
			modifyTargetList.remove(modifyTargetList.indexOf(rightTargetList.get(i)));
		}
		
		modifyTargetList.toArray();
		
		return modifyTargetList;
	}


	@Override
	public String makeStringbyList(List<String> target) throws Exception {
		
		String str = "";
		
		int targetSize = target.size();
		for(int i=0; i<targetSize; i++){
			str += target.get(i) + "|";
		}
		return str;
	}
*/

	
	
	@Override
	public List<StepItemVO> getAddUseStepList(StepItemVO stepItemVO) throws Exception {
		return recProcessDAO.AddUseStepList(stepItemVO);
	}


	@Override
	public List<StepItemVO> getAddAfterUseStepList(StepItemVO stepItemVO) throws Exception {
		return recProcessDAO.AddAfterUseStepItem(stepItemVO);
	}


	@Override
	public List<String> selectField(String selectTarget) throws Exception {
		
		List<String> selectTargetList = null;
		selectTargetList = new ArrayList<String>();
		
		if(selectTarget != null)
		{
			for(String str : selectTarget.split("\\|"))
			{
				selectTargetList.add(str);
			}
		}else
		{
			selectTargetList=null;
		}

	
		return selectTargetList;
	}


	@Override
	public List<StepItemVO> getRemoveUseStepList(StepItemVO stepItemVO) throws Exception {
		return recProcessDAO.RemoveUseStepList(stepItemVO);
	}


	@Override
	public List<StepItemVO> getRemoveAfterUseStepList(StepItemVO stepItemVO) throws Exception {
		return recProcessDAO.RemoveAfterUseStepList(stepItemVO);
	}
	

	
	
	
	
}
