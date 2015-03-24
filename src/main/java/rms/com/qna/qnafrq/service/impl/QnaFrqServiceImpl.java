package rms.com.qna.qnafrq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.qna.qnafrq.service.QnaFrqService;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.QnaFrqVO;

@Service("qnaFrqService")
public class QnaFrqServiceImpl implements QnaFrqService{
	
	@Resource(name="qnaFrqDAO")
	private QnaFrqDAO qnaFrqDAO;
	
	@Resource(name = "rmsFrqAnswerIdGnrService")
	private EgovIdGnrService rmsIdGnrService;

//	@Override
//	public List<QnaFrqVO> qnaFrqBoardlist(String searchKey, String searchValue) {
//
//		return qnaFrqDAO.qnaFrqBoardlist(searchKey, searchValue);
//	}
	
//	@Override
//	public List<DefaultVO> qnaFrqBoardlist(DefaultVO pagingVO) throws Exception {
//
//		return qnaFrqDAO.qnaFrqBoardlist(pagingVO);
//	}

	@Override
	public QnaFrqVO qnaFrqBoarddetail(String frq_answer_no) throws Exception {
		
		return qnaFrqDAO.qnaFrqBoarddetail(frq_answer_no);
	}

	@Override
	public Boolean qnaFrqUpdateBoard(QnaFrqVO vo) throws Exception {

		return qnaFrqDAO.qnaFrqUpdateBoard(vo);
	}

	@Override
	public Boolean qnaFrqInsertBoard(QnaFrqVO vo) throws Exception {
		
		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		vo.setFrq_answer_no(key);

		return qnaFrqDAO.qnaFrqInsertBoard(vo);
	}

	@Override
	public Boolean qnaFrqDelete(String[] checkeds, String writer) throws Exception {
		
		return qnaFrqDAO.qnaFrqDeleteBoard(checkeds, writer);
		
	}

//	@Override
//	public List<QnaFrqVO> qnafrqList(String qna_type_code) throws Exception {
//
//		return qnaFrqDAO.qnaFrqList(qna_type_code);
//	}
//
	@Override
	public List<QnaFrqVO> qnaFrqTypeList() throws Exception {

		return qnaFrqDAO.qnaFrqTypeList();
	}

	@Override
	public List<QnaFrqVO> qnaTypeCode() throws Exception {
		return qnaFrqDAO.qnaTypeCode();
	}

	@Override
	public List<QnaFrqVO> qnaFrqContentList(String typeSelect)	throws Exception {
		return qnaFrqDAO.qnaFrqContentList(typeSelect);
	}

	@Override
	public Boolean qnaFrqDeleteDetailBoard(QnaFrqVO vo) throws Exception {

		return qnaFrqDAO.qnaFrqDeleteDetailBoard(vo);
	}

	@Override
	public List<DefaultVO> qnaFrqBoardlist(DefaultVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaFrqDAO.qnaFrqBoardlist(pagingVO);
	}

	@Override
	public int selectSampleListTotCnt(DefaultVO pagingVO) throws Exception {

		return qnaFrqDAO.selectSampleListTotCnt(pagingVO);
	}

//	@Override
//	public int selectSampleListTotCnt(DefaultVO pagingVO) {
//		
//		return qnaFrqDAO.selectSampleListToCnt(pagingVO);
//	}

}
