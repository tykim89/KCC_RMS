package rms.com.qna.qnataker.service;

import java.util.List;

import rms.com.qna.qnataker.vo.QnaTakerVO;
import rms.com.sys.vo.AdminVO;

public interface QnaTakerService {

	public List<QnaTakerVO> qnaTakerBoardlist(String searchKey, String searchValue);


}
