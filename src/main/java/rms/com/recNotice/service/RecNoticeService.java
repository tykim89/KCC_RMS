package rms.com.recNotice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recNotice.vo.RecNoticeVO;


public interface RecNoticeService {

	public List<DefaultVO> getRecNoticeList(DefaultVO pagingVO) throws Exception;
	public RecNoticeVO getRecNoticeContent(String rec_noti_no) throws Exception;
	
	public void insertRecNotice(RecNoticeVO recNoticeVO) throws Exception;
	public void updateRecNotice(RecNoticeVO recNoticeVO) throws Exception;
	public boolean deleteRecNotice(String rec_noti_no);
	
	
	public int selectSampleListTotCnt(DefaultVO pagingVO);
	
}
