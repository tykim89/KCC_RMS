package rms.com.faq.service;

import java.util.List;

import rms.com.faq.vo.FaqVO;
import rms.com.qna.qnafrq.vo.DefaultVO;

public interface FaqService {
	
	public List<DefaultVO> getFaqList(DefaultVO pagingVO);
	public FaqVO getFaqContent(String faq_no);
	public boolean insertFaq(FaqVO faqVO);
	public boolean updateFaq(FaqVO faqVO);	
	public boolean deleteFaq(String faq_no);
	
	
	public int selectSampleListTotCnt(DefaultVO pagingVO);
}
