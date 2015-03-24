package rms.com.qna.qnafrq.service;

import java.util.List;

import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.QnaFrqVO;

public interface QnaFrqService {

//	public List<QnaFrqVO> qnaFrqBoardlist(String searchKey, String searchValue) throws Exception;


	
	public QnaFrqVO qnaFrqBoarddetail(String frq_answer_no) throws Exception;

	public Boolean qnaFrqUpdateBoard(QnaFrqVO vo) throws Exception;

	public Boolean qnaFrqInsertBoard(QnaFrqVO vo) throws Exception;

	public Boolean qnaFrqDelete(String[] checkeds, String writer) throws Exception;

//	public List<QnaFrqVO> qnafrqList(String qna_type_code) throws Exception;
//
	public List<QnaFrqVO> qnaFrqTypeList() throws Exception;

	public List<QnaFrqVO> qnaTypeCode() throws Exception;

	public List<QnaFrqVO> qnaFrqContentList(String typeSelect) throws Exception;

	public Boolean qnaFrqDeleteDetailBoard(QnaFrqVO vo) throws Exception;

	public List<DefaultVO> qnaFrqBoardlist(DefaultVO pagingVO) throws Exception;

	public int selectSampleListTotCnt(DefaultVO pagingVO) throws Exception;
	
	




	

}
