package rms.com.qna.qnaanswer.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.qna.qnaanswer.vo.QnaAnswerVo;

@Repository("qnaAnswerDAO")
public class QnaAnswerDAO extends EgovComAbstractDAO{
	
	protected static final Log LOG = LogFactory.getLog(QnaAnswerDAO.class);


	 //Q&A 답글 입력
	public Boolean qnaAnswerInsertBoard(QnaAnswerVo vo, String qna_quest_no) {
		
		System.out.println(qna_quest_no+"--------------------------------------");
		update("qnaAnswerDAO.qnaQuestRepleCntUp", qna_quest_no);
		
		boolean isc = false;
		isc = update("qnaAnswerDAO.qnaAnswerInsertBoard",vo)>0?true:false; 
		return isc;
	}

	public List<QnaAnswerVo> getQnaAnswerContent(String qna_quest_no) {
		return list("qnaAnswerDAO.getQnaAnswerContent", qna_quest_no);
	}

	public List<QnaAnswerVo> qnaAnswerBoardlist(String qna_quest_no) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("qna_quest_no", qna_quest_no);
		
		System.out.println(map);
		
		return list("qnaAnswerDAO.qnaAnswerBoardlist", map);
	}

	//Q&A 답글 삭제
	public Boolean qnaAnswerDelete(QnaAnswerVo vo, String qna_quest_no) {
		
		update("qnaAnswerDAO.qnaQuestRepleCntDown", qna_quest_no);
		
		boolean isc = false;
		isc = update("qnaAnswerDAO.qnaAnswerDelete",vo)>0?true:false;

		return isc;
	}

	//Q&A 댓글 수정
	public Boolean qnaAnswerUpdate(QnaAnswerVo vo) {
		
		LOG.info("---------------DAO"+vo.getQna_answer_content());

		boolean isc = false;
		isc = update("qnaAnswerDAO.qnaAnswerUpdate",vo)>0?true:false;
		return isc;
	}

}
