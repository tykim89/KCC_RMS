package rms.com.qna.qnafrq.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.QnaFrqVO;


@Repository("qnaFrqDAO")
public class QnaFrqDAO extends EgovComAbstractDAO{
	
	protected static final Log LOG = LogFactory.getLog(QnaFrqDAO.class);

//	public List<QnaFrqVO> qnaFrqBoardlist(String searchKey, String searchValue) {
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("searchKey", searchKey);
//		map.put("searchValue", searchValue);
//				
//		return (List<QnaFrqVO>)list("qnqFrqDAO.qnaFrqBoardlist",map);
//	}
	
//	public List<DefaultVO> qnaFrqBoardlist(DefaultVO pagingVO) throws Exception{
//						
//		return list("qnqFrqDAO.qnaFrqBoardlist",pagingVO);
//	}

	// 다사용답변 상세조회
	public QnaFrqVO qnaFrqBoarddetail(String frq_answer_no) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("frq_answer_no", frq_answer_no);
		return (QnaFrqVO) selectByPk("qnaFrqDAO.qnaFrqBoarddetail", frq_answer_no);
	}

	// 다사용답변 수정
	public Boolean qnaFrqUpdateBoard(QnaFrqVO vo) {
		boolean isc = false;
		isc = update("qnaFrqDAO.qnaFrqUpdateBoard",vo)>0?true:false;
		return isc;
	}

	//다사용답변 입력 
	public Boolean qnaFrqInsertBoard(QnaFrqVO vo) {
		boolean isc = false;
		isc = update("qnaFrqDAO.qnaFrqInsertBoard", vo)>0?true:false;
		return isc;
	}

	//다사용답변 목록 삭제
	public boolean qnaFrqDeleteBoard(String[] checkeds, String writer) throws Exception{
		
        boolean isc = false;
        
		List list = new ArrayList();
		for(String dd : checkeds)
		{
			list.add(dd);
		}
       
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("checkList", list);
        map.put("writer", writer);              

        isc = update("qnaFrqDAO.qnaFrqDeleteBoard", map)>0?true:false;
        
        
        return isc;
		
		
	}
	
	public List<QnaFrqVO> qnaFrqTypeList() {

		return list("qnaFrqDAO.qnaFrqTypeList", null);
	}

	public List<QnaFrqVO> qnaTypeCode() {
		return list("qnaFrqDAO.qnaTypeCode", null);
	}

	public List<QnaFrqVO> qnaFrqContentList(String typeSelect) {

		return list("qnaFrqDAO.qnaFrqContentList", typeSelect);
	}

	public Boolean qnaFrqDeleteDetailBoard(QnaFrqVO vo) {
        boolean isc = false;
        isc = update("qnaFrqDAO.qnaFrqDeleteDetailBoard", vo)>0?true:false;     
        return isc;
	}


	public int selectSampleListTotCnt(DefaultVO pagingVO) {
		return (Integer)getSqlMapClientTemplate().queryForObject("qnaFrqDAO.selectSampleListToCnt", pagingVO);
	}

	//다사용답변 목록 
	public List<DefaultVO> qnaFrqBoardlist(DefaultVO pagingVO) {
		return list("qnqFrqDAO.qnaFrqBoardlist",pagingVO);
	}


	


}
