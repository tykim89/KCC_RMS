package rms.com.faq.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.faq.service.FaqService;
import rms.com.faq.vo.FaqVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends EgovComAbstractDAO{
	
	@Resource(name="faqService")
	FaqService faqService;
	
	protected static final Log LOG = LogFactory.getLog(FaqDAO.class);
	
	

	
	// FAQ 상세조회
	public FaqVO FaqContent(String faq_no) throws Exception{
		return (FaqVO) selectByPk("faqContent", faq_no);
		
	}
	
	
	/**
	 * 목록조회
 	 * 
 	 * @author tykim
 	 * @since 2014-06-11
	 * @return 글 목록
	 * @exception Exception
	 * */
	public List<DefaultVO> FaqList(DefaultVO pagingVO) throws Exception {
		
		return list("faqSearchList", pagingVO);
	}
	
    /**
	 * 글 총 갯수를 조회한다.
	 * 
	 * @author tykim
 	 * @since 2014-06-11
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSampleListTotCnt(DefaultVO pagingVO) throws Exception {
		return (Integer)getSqlMapClientTemplate().queryForObject("faqDAO.selectSampleListTotCnt", pagingVO);
	}
	
	

/*	// FAQ 검색 조회
	public List<FaqVO> FaqSearchList(String searchValue, String searchKey) throws Exception{
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		return list("faqSearchList", map);
	}
	*/
	
	
	// FAQ 등록
	public boolean FaqInsert(FaqVO faqVO) throws Exception{
		boolean flag = false;
		flag = update("faqInsert", faqVO) > 0 ? true : false;
		return flag;
	}
	
	
	
	// FAQ 수정
	public boolean FaqUpdate(FaqVO faqVO) throws Exception{
		boolean flag = false;
		flag = update("faqUpdate", faqVO) > 0 ? true : false;
		return flag;
	}
	
	
	
	// FAQ 삭제
	public boolean FaqDelete(String faq_no) throws Exception{
		boolean flag = false;
		flag = delete("faqDelete", faq_no) > 0 ? true : false;
		return flag;
	}

	
	
}
