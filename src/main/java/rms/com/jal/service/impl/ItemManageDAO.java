package rms.com.jal.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.jal.vo.ItemVO;

@Repository("itemManageDAO")
public class ItemManageDAO extends EgovComAbstractDAO{
	public int addTestItem(ItemVO inputItemVO){
		return update("itemManageDAO.addItemAction", inputItemVO);
	}
	public int checkSortSeq(ItemVO inputItemVO){
		return (Integer) selectByPk("itemManageDAO.addItemAction.checkSeq", inputItemVO);
	}
	public List<ItemVO> getItemListDao(String group_code){
		return list("itemManageDAO.getItemListAction", group_code);
	}
	public int modiItemDao(ItemVO inputItemVO){
		return update("itemManageDAO.modiItemAction", inputItemVO);
	}
	public int deleteItemDao(HashMap<String, Object> deleteTarget){
		
		return update("itemManageDAO.deleteItemAction", deleteTarget);
	}
	public int checkVersionDao(String detail_code){
		return (Integer) selectByPk("itemManageDAO.checkVersionAction", detail_code);
	}
}
