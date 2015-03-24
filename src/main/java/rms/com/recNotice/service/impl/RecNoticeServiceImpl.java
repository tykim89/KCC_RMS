package rms.com.recNotice.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import rms.com.attfile.service.impl.FileDAO;
import rms.com.attfile.vo.FileVO;
import rms.com.qna.qnafrq.vo.DefaultVO;
import rms.com.recNotice.service.RecNoticeService;
import rms.com.recNotice.vo.RecNoticeVO;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("recNoticeService")
public class RecNoticeServiceImpl implements RecNoticeService {

 	 @Resource(name="recNoticeDAO")
	 private RecNoticeDAO recNoticeDAO;
 	 
 	 @Resource(name="fileDAO")
 	 private FileDAO fileDAO;
	
	 @Resource(name = "rmsRecNotiIdGnrService")
	 private EgovIdGnrService rmsIdGnrService;
	 
	 /** EgovPropertyService */
	 @Resource(name = "propertiesService")
	 protected EgovPropertyService propertiesService;

	 @Resource(name = "rmsAttFileIdGnrService")
	 private EgovIdGnrService rmsAttFileIdGnrService;
	 

	



	// 채용공고 상세조회
	@Override
	public RecNoticeVO getRecNoticeContent(String rec_noti_no) throws Exception{

			return recNoticeDAO.RecNoticeContent(rec_noti_no);
	}

	
	// 채용공고 등록
	@Override
	public void insertRecNotice(RecNoticeVO recNoticeVO) throws Exception{
			
			String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
			recNoticeVO.setRec_noti_no(key); 
			
			String writer = recNoticeVO.getWriter();
			
			MultipartFile uploadfile = recNoticeVO.getFile();
			
			FileVO fileVO = new FileVO();
			
			if(!uploadfile.isEmpty()) {
				
				String fileKey = rmsAttFileIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
				recNoticeVO.setAtt_file_no(fileKey);	// 채용공고 테이블의 첨부파일번호 채번 저장
				fileVO.setAtt_file_no(fileKey);		// 파일 테이블의 첨부파일번호 채번 저장
				fileVO.setWriter(writer);	// 작성자 저장
				
				String sAtacFlePathAdr = propertiesService.getString("infoPath"); // 파일Path저장
				String orgFileName = uploadfile.getOriginalFilename(); // 원본 파일명 갖고 오기
				String atchFileName = fileKey;

				fileVO.setAtt_file_save_path(sAtacFlePathAdr); // 파일 저장 경로
				fileVO.setAtt_file_name(atchFileName); // 저장될 파일명
				fileVO.setAtt_file_orig_name(orgFileName); // 원본 파일명
				long atchFileSize = uploadfile.getSize(); // 파일 크기 가져오기
				fileVO.setAtt_file_size(String.valueOf(atchFileSize)); // 파일 크기
				String atacFleDvEtsnNm = orgFileName.substring(orgFileName.lastIndexOf(".")); // 파일 확장자 가져오기
				
				if(atacFleDvEtsnNm != null){
					fileVO.setAtt_file_extention(atacFleDvEtsnNm);	// 파일 확장자명
				}

				File file = new File(sAtacFlePathAdr + atchFileName);
				uploadfile.transferTo(file);
			}
			
			recNoticeDAO.RecNoticeInsert(recNoticeVO);
			
			if(!uploadfile.isEmpty()){
				fileDAO.fileInsert(fileVO);
			}

	}
	
	
	// 채용공고 수정
	@Override
	public void updateRecNotice(RecNoticeVO recNoticeVO) throws Exception{
			recNoticeDAO.RecNoticeUpdate(recNoticeVO);
	}

	
	// 채용공고 삭제
	@Override
	public boolean deleteRecNotice(String rec_noti_no) {
		try {
			return recNoticeDAO.RecNoticeDelete(rec_noti_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}


	// 채용공고 목록 조회, 검색
	@Override
	public List<DefaultVO> getRecNoticeList(DefaultVO pagingVO) throws Exception{

			return recNoticeDAO.RecNoticeList(pagingVO);
	}


	// 목록 카운트
	@Override
	public int selectSampleListTotCnt(DefaultVO pagingVO) {
		try {
			return recNoticeDAO.selectSampleListTotCnt(pagingVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}



	
	

}
