package rms.com.svc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import rms.com.svc.service.EmailService;
import rms.com.svc.vo.EmailFormVO;

@Service("emailService")
public class EmailServiceImpl implements EmailService{
	@Resource(name="emailDAO")
	EmailDAO emailDAO;

	 @Resource(name = "rmsEmailFormIdGnrService")
	   private EgovIdGnrService   rmsIdGnrService;
	
	@Override
	public int addEmailFormService(EmailFormVO inputEmailFormVO)
			throws Exception {
		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
		inputEmailFormVO.setEmail_form_no(key);
		return emailDAO.addEmailFormDao(inputEmailFormVO);
	}

	@Override
	public List<EmailFormVO> getEmailFormListService() throws Exception {
		return emailDAO.getEmailFormListDao();
	}

	@Override
	public EmailFormVO getEmailFormDetailSerivce(String email_form_no)
			throws Exception {
		return emailDAO.getEmailFormDetailDao(email_form_no);
	}

	@Override
	public int modiEmailFormService(EmailFormVO inputEmailFormVO)
			throws Exception {
		return emailDAO.modiEmailFormDao(inputEmailFormVO);
	}

	@Override
	public int deleteEmailFormService(String [] checkedEmailForm) throws Exception {
		List<String> checkedEmailFormList=null;
		for(String str : checkedEmailForm)
		{
			checkedEmailFormList.add(str);
		}
		return emailDAO.deleteEmailFormDao(checkedEmailFormList);
	}
}
