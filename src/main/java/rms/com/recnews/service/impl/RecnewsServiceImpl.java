
package rms.com.recnews.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.antlr.grammar.v3.ANTLRParser.throwsSpec_return;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


import rms.com.cmn.service.impl.RmsLoginServiceImpl;
import rms.com.jal.vo.RecFieldVO;

import rms.com.recnews.service.RecnewsService;

//import rms.com.recnews.vo.DefaultVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recnews.vo.RecnewsVO;

@Service("recnewsService")
public class RecnewsServiceImpl implements RecnewsService{
	/** log */
    protected static final Log LOG = LogFactory.getLog(RmsLoginServiceImpl.class);
    
    @Resource(name="recnewsDAO")
    private RecnewsDAO recnewsDAO;
    
	@Resource(name = "rmsRecNewsIdGnrService")
	private EgovIdGnrService rmsIdGnrService;
	

        
//    /**페이지 테스트*/
//    @Override
//	public RecnewsVO recnewsBoardlist(RecnewsVO recnewsVO) {
//	recnewsVO = this.recnewsBoardlist(recnewsVO);
//	return recnewsVO;
//	}
//
//	@Override
//	public RecnewsVO selectrecnewsList(RecnewsVO recnewsVO) throws Exception {
//		recnewsVO = this.selectrecnewsList(recnewsVO);
//		return recnewsVO;
//		
//	}

//	@Override
//	public List<RecnewsVO> recnewsBoardlist(String searchKey, String searchValue) throws Exception {
//		return recnewsDAO.recnewsBoardlist(searchKey, searchValue);
//	}

	@Override
	public RecnewsVO recnewsBoarddetail(String rec_news_no) throws Exception {

		return recnewsDAO.recnewsBoarddetail(rec_news_no);
	}

	@Override
	public Boolean recnewsInsertBoard(RecnewsVO vo) throws Exception {

		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		vo.setRec_news_no(key);
		
		return recnewsDAO.recnewsInsertBoard(vo);
	}

	@Override
	public Boolean recnewsUpdateBoard(RecnewsVO vo) throws Exception {
		return recnewsDAO.recnewsUpdateBoard(vo);
	}

	
	@Override
	public Boolean recnewsDeleteDetailBoard(RecnewsVO vo) throws Exception {
		return recnewsDAO.recnewsDeleteDetialBoard(vo);
		
	}

	@Override
	public Boolean recnewsDeleteBoard(String[] checkeds, String writer) throws Exception {
		return recnewsDAO.recnewsDeleteBoard(checkeds, writer);
		
	}
	
    /**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<DefaultVO> recnewsBoardlist(DefaultVO pagingVO) {

		return recnewsDAO.recnewsBoardlist(pagingVO);
	}
	
    /**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectSampleListTotCnt(DefaultVO pagingVO) {

		return recnewsDAO.selectSampleListTotCnt(pagingVO);
	}



    
}