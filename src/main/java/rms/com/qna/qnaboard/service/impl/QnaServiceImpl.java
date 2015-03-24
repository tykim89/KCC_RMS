package rms.com.qna.qnaboard.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.qna.qnaboard.service.QnaService;
import rms.com.qna.qnaboard.vo.QnaVO;
import rms.com.qna.qnafrq.vo.DefaultVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(QnaServiceImpl.class);
    
    @Resource(name="qnaDAO")
    private QnaDAO qnaDAO;
    
	@Resource(name = "rmsQnaIdGnrService")
	private EgovIdGnrService rmsIdGnrService;

//	@Override
//	public List<QnaVO> qnaBoardlist(String searchKey, String searchValue) throws Exception {
//		
//		return qnaDAO.qnaBoardlist(searchKey, searchValue);
//	}

	@Override
	public QnaVO qnaBoarddetail(String qna_quest_no) throws Exception {
		
		return qnaDAO.qnaBoarddetail(qna_quest_no);
	}

	@Override
	public Boolean qnaInsertBoard(QnaVO vo) throws Exception {
		
		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		vo.setQna_quest_no(key);
		
		return qnaDAO.qnaInsertBoard(vo);
	}

	@Override
	public Boolean qnaUpdateBoard(QnaVO vo) throws Exception {
		return qnaDAO.qnaUpdateBoard(vo);
	}
	
	@Override
	public Boolean qnaDeleteDetailBoard(QnaVO vo) throws Exception {
		return qnaDAO.qnaDeleteDetailBoard(vo);		
	}

	@Override
	public Boolean qnaDeleteBoard(String[] checkeds, String writer) throws Exception{
		return qnaDAO.qnaDeleteBoard(checkeds, writer);
		
	}

	@Override
	public QnaVO qnaPWcheck(String qna_quest_pw) throws Exception {
		
		return qnaDAO.qnaPWcheck(qna_quest_pw);
		
	}
	
	public int qnacheckPW(String qna_quest_no, String qna_quest_pw) throws Exception {
		int result = 0;
		
		LOG.info(qna_quest_no+"--------------서비스의 질문번호");
		LOG.info(qna_quest_pw+"--------------서비스의 비밀번호");
		String resultByOracle = qnaDAO.qnacheckPW(qna_quest_no);
		LOG.info(resultByOracle+"--------------디비 비밀번호");
		LOG.info(qna_quest_pw+"--------------서비스의 비밀번호");
		if(qna_quest_pw.equals(resultByOracle))
		{
			result=1;
		}
	//	LOG.info(qnaDAO.qnacheckPW(qna_quest_pw)+"--------다오에서 넘어오는 비밀번호");
		
		return result;
	}

	@Override
	public List<DefaultVO> qnaBoardlist(DefaultVO pagingVO) {

		return qnaDAO.qnaBoardlist(pagingVO);
	}

	
	@Override
	public int selectSampleListTotCnt(DefaultVO pagingVO) {

		return qnaDAO.selectSampleListTotCnt(pagingVO);
	}




   
    
    

}
