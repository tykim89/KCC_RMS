package rms.com.appdoc.controller;



import java.util.List;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import rms.com.appdoc.service.AppDocService;
import rms.com.appdoc.vo.PostVO;


@Controller
public class PostAjaxController {

	@Autowired
	private AppDocService appdocService;
	
    protected static final Log LOG = LogFactory.getLog(PostAjaxController.class);	

    @RequestMapping(value="/rms/appdoc/postList.do")
	public String selectPost(String dong, Model model) throws Exception{

		
		List<PostVO> plist = appdocService.selectPost(dong);	
		
		model.addAttribute("postList",plist);
		
		return "rms/appdoc/ajaxForPostSearch";
	}
	

}
