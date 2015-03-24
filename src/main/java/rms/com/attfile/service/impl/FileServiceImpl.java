package rms.com.attfile.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import rms.com.attfile.service.FileService;
import rms.com.attfile.vo.FileVO;

@Service("fileService")
public class FileServiceImpl implements FileService {

	
	@Resource(name="fileDAO")
	private FileDAO fileDAO;
	
	
	@Override
	public void fileInsert(FileVO fileVO) throws Exception {
		fileDAO.fileInsert(fileVO);
	}


	@Override
	public void fileDelete(String att_file_no) throws Exception {
		fileDAO.fileDelete(att_file_no);
	}

	
	
}
