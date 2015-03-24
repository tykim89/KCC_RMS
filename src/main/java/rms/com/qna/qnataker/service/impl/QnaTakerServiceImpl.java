package rms.com.qna.qnataker.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import rms.com.qna.qnataker.service.QnaTakerService;
import rms.com.qna.qnataker.vo.QnaTakerVO;
import rms.com.sys.vo.AdminVO;

@Service ("qnaTakerService")
public class QnaTakerServiceImpl implements QnaTakerService{
	
	@Resource (name="qnaTakerDAO")
	private QnaTakerDAO qnaTakerDAO;

	@Override
	public List<QnaTakerVO> qnaTakerBoardlist(String searchKey, String searchValue) {
			
		return qnaTakerDAO.qnaTakerBoardlist(searchKey, searchValue);
	}

}
