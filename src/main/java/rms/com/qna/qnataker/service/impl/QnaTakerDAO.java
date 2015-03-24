package rms.com.qna.qnataker.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.qna.qnataker.vo.QnaTakerVO;
import rms.com.sys.vo.AdminVO;

@Repository ("qnaTakerDAO")
public class QnaTakerDAO extends EgovComAbstractDAO{

	public List<QnaTakerVO> qnaTakerBoardlist(String searchKey, String searchValue) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchKey",searchKey);
		map.put("searchValue",searchValue);
		return list("qnaTakerDAO.qnaTakerBoardlist", map);
	}


}
