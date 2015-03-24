package rms.com.recNotice.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recNotice.vo.RecNoticeVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


@Repository("recNoticeDAO")
public class RecNoticeDAO extends EgovComAbstractDAO {
	
	
	protected static final Log LOG = LogFactory.getLog(RecNoticeDAO.class);
	

	/**
	 * 목록조회
 	 * 
 	 * @author tykim
 	 * @since 2014-06-13
	 * @return 글 목록
	 * @exception Exception
	 * */
	public List<DefaultVO> RecNoticeList(DefaultVO pagingVO) throws Exception {
		return list("recNoticeList", pagingVO);
	}
	
	// 채용공고 상세조회
	public RecNoticeVO RecNoticeContent(String rec_noti_no) throws Exception {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("rec_noti_no", rec_noti_no);
		
		update("recNoticeDAO.readcountUp", map);
		return (RecNoticeVO) selectByPk("recNoticeContent", rec_noti_no);
	}

	// 채용공고 등록
	public void RecNoticeInsert(RecNoticeVO recNoticeVO) throws Exception {
		update("recNoticeInsert", recNoticeVO);
	}
	
	// 채용공고 수정
	public boolean RecNoticeUpdate(RecNoticeVO recNoticeVO) throws Exception {
		boolean flag = false;
		flag = update("recNoticeUpdate", recNoticeVO) > 0 ? true : false;
		return flag;
	}
	
	
	// 채용공고 삭제
	public boolean RecNoticeDelete(String rec_noti_no) throws Exception {
		boolean flag = false;
		flag = update("recNoticeDelete", rec_noti_no) > 0 ? true : false;
		return flag;
	}
	
	
	
    /**
	 * 글 총 갯수를 조회한다.
	 * 
	 * @author tykim
 	 * @since 2014-06-13
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(DefaultVO pagingVO) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject("recNoticeDAO.selectSampleListTotCnt", pagingVO);
	}
	
	
	
}
