package rms.com.attfile.controller;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import rms.com.attfile.service.FileService;
import rms.com.attfile.vo.FileVO;

import egovframework.rte.fdl.property.EgovPropertyService;


@Controller
public class FileController {

	@Resource(name="fileService")
	FileService fileService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	
	protected static final Log LOG = LogFactory.getLog(FileController.class);
	
	
	
	/**
	 * 파일 다운로드
	 * 
	 * @author tykim
	 * @since 2014-07-01
	 * */
	@RequestMapping(value = "/rms/attfile/fileDownload.do")
    public ModelAndView fileDown(@ModelAttribute FileVO fileVO) {
    	// 실제 서버에서 변경 되야 함.
    	String downloadFile = fileVO.getFileInfo() + "," + fileVO.getAtt_file_orig_name();
    	
        return new ModelAndView("download", "downloadFile", downloadFile);
    }

	
	
	
	
}
