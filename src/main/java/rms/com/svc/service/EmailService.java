package rms.com.svc.service;

import java.util.List;

import rms.com.svc.vo.EmailFormVO;

public interface EmailService {
	/**이메일 양식 등록
	 * @author lds
	 * @param inputEmailFormVO
	 * @return 반영 row count
	 * */
	public int addEmailFormService(EmailFormVO inputEmailFormVO) throws Exception;
	
	/**이메일 양식 목록 조회
	 * @author lds
	 * @param null
	 * @return 반영 row count
	 * */
	public List<EmailFormVO> getEmailFormListService() throws Exception;
	
	/**이메일 양식 상세 조회
	 * @author lds
	 * @param email_form_no
	 * @return 반영 row count
	 * */
	public EmailFormVO getEmailFormDetailSerivce(String email_form_no) throws Exception;
	
	/**이메일 양식 수정
	 * @author lds
	 * @param inputEmailFormVO
	 * @return 반영 row count
	 * */
	public int modiEmailFormService(EmailFormVO inputEmailFormVO)throws Exception;
	
	/**이메일 양식 삭제
	 * @author lds
	 * @param email_form_no
	 * @return 반영 row count
	 * */
	public int deleteEmailFormService(String[] checkedEmailFormList)throws Exception;
}
