package rms.com.recnews.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.util.Map;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Repository;

import rms.com.cmn.service.impl.RmsLoginDAO;

import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recnews.vo.RecnewsVO;


import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("recnewsDAO")
public class RecnewsDAO  extends EgovComAbstractDAO{
	

	/** log */
	
	protected static final Log LOG = LogFactory.getLog(RmsLoginDAO.class);
	   


//		public RecnewsVO selectrecnewsList(RecnewsVO vo) throws Exception{
//			return (RecnewsVO) selectByPk("recnewsDAO.selectrecnewsList", vo);
//		}
		
		
//		public List<RecnewsVO> recnewsBoardlist(String searchKey, String searchValue) throws Exception {
//			
//			HashMap<String, String> map = new HashMap<String, String>();
//			map.put("searchKey", searchKey);
//			map.put("searchValue", searchValue);
//
//			return (List<RecnewsVO>)list("recnewsDAO.recnewsBoardlist",map);
//
//		}

		//채용소식 상세조회
		public RecnewsVO recnewsBoarddetail(String rec_news_no) throws Exception {
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("rec_news_no", rec_news_no);
	
			update("recnewsDAO.readcountUp", map);
		  	return (RecnewsVO)selectByPk("recnewsDAO.recnewsBoarddetail", rec_news_no);
		}


		//채용소식 입력
		public boolean recnewsInsertBoard(RecnewsVO vo) {
			boolean isc = false;			
			isc = update("recnewsDAO.recnewsInsertBoard", vo)>0?true:false;
			return isc;
		}

		//채용소식 수정
		public boolean recnewsUpdateBoard(RecnewsVO vo) {
			boolean isc = false;
	
			isc = update("recnewsDAO.recnewsUpdateBoard", vo)>0?true:false;
			return isc;

		}
		
		//상세조회 삭제
		public boolean recnewsDeleteDetialBoard(RecnewsVO vo) throws Exception {
			
			boolean isc = false;
			isc = update("recnewsDAO.recnewsDeleteDetailBoard", vo)>0?true:false;  
			return isc;
			
		}

		//채용소식 목록 삭제
		public boolean recnewsDeleteBoard(String[] checkeds, String writer) throws Exception {
			
			boolean isc = false;
			
			List list = new ArrayList();
			for(String dd : checkeds)
			{
				LOG.info("DAO에 리스트 추가"+dd);
				list.add(dd);
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("checkList", list);
			map.put("writer",writer);
			
			
			isc = update("recnewsDAO.recnewsDeleteBoard", map)>0?true:false;
			
			return isc;
			
	    }

	    /**
		 * 글 목록을 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return 글 목록
		 * @exception Exception
		 */
		public List<DefaultVO> recnewsBoardlist(DefaultVO pagingVO) {
			// TODO Auto-generated method stub
			return list("recnewsDAO.recnewsBoardlist", pagingVO);
		}
		
	    /**
		 * 글 총 갯수를 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return 글 총 갯수
		 * @exception
		 */
		public int selectSampleListTotCnt(DefaultVO pagingVO) {

			return  (Integer)getSqlMapClientTemplate().queryForObject("recnewsDAO.selectSampleListTotCnt", pagingVO);
		}








}

