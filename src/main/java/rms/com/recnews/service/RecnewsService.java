package rms.com.recnews.service;

import java.util.List;

//import rms.com.recnews.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recnews.vo.RecnewsVO;

public interface RecnewsService {
	
	//public List<RecnewsVO> recnewsBoardlist(String searchKey, String searchValue) throws Exception;
    
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<DefaultVO> recnewsBoardlist(DefaultVO pagingVO);
	
//	public RecnewsVO selectrecnewsList(RecnewsVO vo) throws Exception;

	public RecnewsVO recnewsBoarddetail(String rec_news_no) throws Exception;

	public Boolean recnewsInsertBoard(RecnewsVO vo) throws Exception;

	public Boolean recnewsUpdateBoard(RecnewsVO vo) throws Exception;

	public Boolean recnewsDeleteDetailBoard(RecnewsVO vo) throws Exception;

	public Boolean recnewsDeleteBoard(String [] checkeds, String writer) throws Exception;

    /**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(DefaultVO pagingVO) ;




	

	

}
