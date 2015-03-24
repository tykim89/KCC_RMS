package rms.com.qna.qnaanswer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.qna.qnaanswer.service.QnaAnswerService;
import rms.com.qna.qnaanswer.vo.QnaAnswerVo;

@Service ("qnaAnswerService")
public class QnaAnswerServiceImpl implements QnaAnswerService{
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(QnaAnswerServiceImpl.class);
    
    @Resource (name="qnaAnswerDAO")
    private QnaAnswerDAO qnaAnswerDAO;
    
	@Resource(name = "rmsQnaAnswerIdGnrService")
	private EgovIdGnrService rmsIdGnrService;

//	@Override
//	public Boolean qnaAnswerInsertBoard(QnaAnswerVo vo) throws Exception {
//		// TODO Auto-generated method stub
//		return qnaAnswerDAO.qnaAnswerInsertBoard(vo);
//	}
    
    @Override
	public Boolean qnaAnswerInsertBoard(QnaAnswerVo vo, String qna_quest_no) throws Exception {

		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		vo.setQna_answer_no(key);
    	
    	return qnaAnswerDAO.qnaAnswerInsertBoard(vo, qna_quest_no);
	}

	@Override
	public List<QnaAnswerVo> getQnaAnswerContent(String qna_quest_no)
			throws Exception {
		// TODO Auto-generated method stub
		return qnaAnswerDAO.getQnaAnswerContent(qna_quest_no);
	}

	@Override
	public List<QnaAnswerVo> qnaAnswerBoardlist(String qna_quest_no)
			throws Exception {

		return qnaAnswerDAO.qnaAnswerBoardlist(qna_quest_no);
	}

	@Override
	public Boolean qnaAnswerDelete(QnaAnswerVo vo, String qna_quest_no) throws Exception {


		return qnaAnswerDAO.qnaAnswerDelete(vo, qna_quest_no);
	}

	@Override
	public Boolean qnaAnswerUpdate(QnaAnswerVo vo) throws Exception {

		return qnaAnswerDAO.qnaAnswerUpdate(vo);
	}
    
    

}
