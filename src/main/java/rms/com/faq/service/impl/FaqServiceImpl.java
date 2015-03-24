package rms.com.faq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import rms.com.faq.service.FaqService;
import rms.com.faq.vo.FaqVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("faqService")
public class FaqServiceImpl implements FaqService{
	
	 @Resource(name="faqDAO")
	 private FaqDAO faqDAO;

	 @Resource(name = "rmsFaqIdGnrService")
	 private EgovIdGnrService rmsIdGnrService;


	// FAQ 상세조회
	@Override
	public FaqVO getFaqContent(String faq_no) {
		try {
			return faqDAO.FaqContent(faq_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
/*	// FAQ 검색 조회
	@Override
	public List<FaqVO> getFaqSearchList(String searchValue, String searchKey) {
		try {
			return faqDAO.FaqSearchList(searchValue, searchKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}*/


	
	// FAQ 등록
	@Override
	public boolean insertFaq(FaqVO faqVO) {
		try {
			String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
			faqVO.setFaq_no(key); 
			return faqDAO.FaqInsert(faqVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	// FAQ 수정
	@Override
	public boolean updateFaq(FaqVO faqVO) {
		try {
			return faqDAO.FaqUpdate(faqVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	// FAQ 삭제
	@Override
	public boolean deleteFaq(String faq_no) {
		try {
			return faqDAO.FaqDelete(faq_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	


	@Override
	public List<DefaultVO> getFaqList(DefaultVO pagingVO) {
		try {
			return faqDAO.FaqList(pagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}



	@Override
	public int selectSampleListTotCnt(DefaultVO pagingVO) {
		try {
			return faqDAO.selectSampleListTotCnt(pagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	

	
	
	

}
