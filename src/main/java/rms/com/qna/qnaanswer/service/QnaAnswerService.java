package rms.com.qna.qnaanswer.service;

import java.util.List;

import rms.com.qna.qnaanswer.vo.QnaAnswerVo;

public interface QnaAnswerService {

//	public Boolean qnaAnswerInsertBoard(QnaAnswerVo vo) throws Exception;
	public Boolean qnaAnswerInsertBoard(QnaAnswerVo vo, String qna_quest_no) throws Exception;
	
	public List<QnaAnswerVo> getQnaAnswerContent(String qna_quest_no)throws Exception;

	public List<QnaAnswerVo> qnaAnswerBoardlist(String qna_quest_no) throws Exception;

	public Boolean qnaAnswerDelete(QnaAnswerVo vo, String qna_quest_no) throws Exception;

	public Boolean qnaAnswerUpdate(QnaAnswerVo vo) throws Exception;

	

}
