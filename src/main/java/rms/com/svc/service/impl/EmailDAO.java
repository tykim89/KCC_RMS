package rms.com.svc.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import rms.com.svc.vo.EmailFormVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("emailDAO")
public class EmailDAO extends EgovComAbstractDAO{
	
	public int addEmailFormDao(EmailFormVO inputEmailVO)throws Exception{
		return update("eamilDAO.addEmailFormAction", inputEmailVO);
	}
	public List<EmailFormVO> getEmailFormListDao(){
		return list("emailDAO.getEmailFormListAction", null);
	}
	public EmailFormVO getEmailFormDetailDao(String email_form_no){
		return (EmailFormVO) selectByPk("emailDAO.getEmailFormDetailAction", email_form_no);
	}
	public int modiEmailFormDao(EmailFormVO inputEmailVO){
		return update("emailDAO.modiEmailFormAction", inputEmailVO);
	}
	public int deleteEmailFormDao(List<String> checkedEmailFormList){
		return update("emailDAO.deleteEmailFormAction", checkedEmailFormList);
	}
}
