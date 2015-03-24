package rms.com.qna.qnaboard.service;

import java.util.List;

import rms.com.qna.qnaboard.vo.QnaVO;
import rms.com.qna.qnafrq.vo.DefaultVO;



public interface QnaService {

	//public List<QnaVO> qnaBoardlist(String searchKey, String searchValue) throws Exception;

	//Q&A 목록
	public List<DefaultVO> qnaBoardlist(DefaultVO pagingVO);
	
	public QnaVO qnaBoarddetail(String qna_quest_no) throws Exception;

	public Boolean qnaInsertBoard(QnaVO vo) throws Exception;

	public Boolean qnaUpdateBoard(QnaVO vo) throws Exception;
	
	public Boolean qnaDeleteDetailBoard(QnaVO vo) throws Exception;

	public Boolean qnaDeleteBoard(String [] checkeds, String writer) throws Exception;

	public QnaVO qnaPWcheck(String qna_quest_pw) throws Exception;
	
	public int qnacheckPW(String qna_quest_no, String qna_quest_pw) throws Exception;

	public int selectSampleListTotCnt(DefaultVO pagingVO) ;


	
	
}
