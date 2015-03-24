package rms.com.attfile.service;

import rms.com.attfile.vo.FileVO;

public interface FileService {

	
	public void fileInsert(FileVO fileVO) throws Exception;
	public void fileDelete(String att_file_no) throws Exception;
	
	
}
