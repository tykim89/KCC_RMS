package rms.com.jal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.idgnr.EgovIdGnrStrategy;

import rms.com.jal.service.ItemManageService;
import rms.com.jal.vo.ItemVO;

@Service("itemManageService1")
public class ItemManageServiceImpl implements ItemManageService{

	@Resource(name="itemManageDAO")
	ItemManageDAO itemManageDAO;
	@Resource(name = "rmsRecFieldItemIdGnrService")
	private EgovIdGnrService rmsIdGnrService;
	@Resource(name = "rmsTestItemIdGnrService")
	private EgovIdGnrService testItemIdGnrService;
	
	@Override
	public int addItemService(ItemVO inputItemVO) throws Exception {
		/*String group_initial ="";
		String[] str;
		if(inputItemVO.getGroup_code()!=null)
		{
			str = inputItemVO.getGroup_code().split("_");
			group_initial = str[0].substring(0,4-str.length);
			for(int i=1; i<str.length; i++)
			{
				group_initial += str[i].charAt(0);
			}
		}
		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday()).replace("XXX", group_initial);*/
		String key="";
		if("REC_FIELD".equals(inputItemVO.getGroup_code()))
		{
			key = rmsIdGnrService.getNextStringId();
		}
		else if("TEST_ITEM".equals(inputItemVO.getGroup_code()))
		{
			key = testItemIdGnrService.getNextStringId();
		}
			
		inputItemVO.setDetail_code(key);
		return itemManageDAO.addTestItem(inputItemVO);
	}

	@Override
	public int checkSortSeq(ItemVO inputItemVO) throws Exception {
		return itemManageDAO.checkSortSeq(inputItemVO);
	}

	@Override
	public List<ItemVO> getItemListService(String group_code) throws Exception {
		return itemManageDAO.getItemListDao(group_code);
	}

	@Override
	public int modiItemService(ItemVO inputItemVO) throws Exception {
		
		if(inputItemVO.getVersion()==itemManageDAO.checkVersionDao(inputItemVO.getDetail_code()))
		{
			return itemManageDAO.modiItemDao(inputItemVO);
		}else
		{
			return 0;
		}	
	}

	@Override
	public int deleteItemService(String checkedValue, String modifier) throws Exception {
		
		List<String> deleteTargetList = new ArrayList<String>();
	    for (String str : checkedValue.split("\\|"))
	    {
	        deleteTargetList.add(str);
	    }
	    HashMap<String, Object> deleteTarget = new HashMap<String, Object>();
		deleteTarget.put("deleteTargetList", deleteTargetList);
		deleteTarget.put("modifier", modifier);
		return itemManageDAO.deleteItemDao(deleteTarget);
	}
	
}
