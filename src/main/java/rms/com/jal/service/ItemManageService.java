package rms.com.jal.service;

import java.util.List;

import rms.com.jal.vo.ItemVO;

public interface ItemManageService {
	public int addItemService(ItemVO inputItemVO)throws Exception;
	
	public int checkSortSeq(ItemVO inputItemVO)throws Exception;
	
	public List<ItemVO> getItemListService(String group_code)throws Exception;
	
	public int modiItemService(ItemVO inputItemVO)throws Exception;
	
	public int deleteItemService(String checkedValue, String modifier)throws Exception;
}
