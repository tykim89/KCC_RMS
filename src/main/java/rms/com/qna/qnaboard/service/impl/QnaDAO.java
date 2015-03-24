package rms.com.qna.qnaboard.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.qna.qnaboard.vo.QnaVO;
import rms.com.qna.qnafrq.vo.DefaultVO;


@Repository("qnaDAO")
public class QnaDAO extends EgovComAbstractDAO{
	
	protected static final Log LOG = LogFactory.getLog(QnaDAO.class);
	   

//	public List<QnaVO> qnaBoardlist(String searchKey, String searchValue) {
//		
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("searchKey", searchKey);
//		map.put("searchValue", searchValue);
//				
//		return (List<QnaVO>)list("qnaDAO.qnaBoardlist",map);
//	}

	//QNA 상세조회
	public QnaVO qnaBoarddetail(String qna_quest_no) {
		

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("qna_quest_no", qna_quest_no);
		
		update("qnaDAO.readcountUp", map);
		
		return (QnaVO)selectByPk("qnaDAO.qnaBoarddetail", qna_quest_no);
	}

	//QNA 입력
	public Boolean qnaInsertBoard(QnaVO vo) {
		boolean isc = false;			
		isc = update("qnaDAO.qnaInsertBoard", vo)>0?true:false;
		return isc;
	}

	//Q&A 수정
	public Boolean qnaUpdateBoard(QnaVO vo) {
		boolean isc = false;
		isc = update("qnaDAO.qnaUpdateBoard",vo)>0?true:false;
		return isc;
	}
	
	//Q&A 상세조회 삭제 
	public boolean qnaDeleteDetailBoard(QnaVO vo) {
		
		boolean isc = false;
		isc = update("qnaDAO.qnaDeleteDetailBoard", vo)>0?true:false;
		return isc;
	}

	// Q&A 목록 삭제
	public boolean qnaDeleteBoard(String[] checkeds, String writer) {
		
		boolean isc = false;
		
		List list = new ArrayList();
		for(String dd : checkeds)
		{
			LOG.info("DAO에 리스트 추가"+dd);
			list.add(dd);
		}
//		HashMap map = new HashMap();
//		map.put("checkList", list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("checkList", list);
		map.put("writer", writer);
		
		isc = update("qnaDAO.qnaDeleteBoard", map)>0?true:false;
		
		return isc;
		
	}


	public QnaVO qnaPWcheck(String qna_quest_pw) {
	
		return (QnaVO) selectByPk("qnaDAO.qnaPWcheck", qna_quest_pw);
	}
	
	//Q&A 비밀번호 확인	
	public String qnacheckPW(String qna_quest_no){
		
		return (String) selectByPk("qnaDAO.qnacheckPW", qna_quest_no);
		
	}

	//QNA 목록
	public List<DefaultVO> qnaBoardlist(DefaultVO pagingVO) {
		// TODO Auto-generated method stub
		return list("qnaDAO.qnaBoardlist", pagingVO);
	}

	public int selectSampleListTotCnt(DefaultVO pagingVO) {
		// TODO Auto-generated method stub
		return  (Integer)getSqlMapClientTemplate().queryForObject("qnaDAO.selectSampleListTotCnt", pagingVO);
	}

	

}
