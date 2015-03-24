package rms.com.attfile.service.impl;

import org.springframework.stereotype.Repository;

import rms.com.attfile.vo.FileVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("fileDAO")
public class FileDAO extends EgovComAbstractDAO{
	
	
	
	/**
	 * 첨부파일 등록
	 * 
	 * @author tykim
	 * @since 2014-06-30
	 * 
	 * */
	public void fileInsert(FileVO fileVO) throws Exception{
		update("fileDAO.insertFile", fileVO);
	}
	

	/**
	 * 첨부파일 삭제 (활성화 여부 F)
	 * 
	 * @author tykim
	 * @since 2014-07-01
	 * 
	 * */
	public void fileDelete(String att_file_no) throws Exception{
		update("fileDAO.deleteFile", att_file_no);
	}
	
	
	
	
	
}
