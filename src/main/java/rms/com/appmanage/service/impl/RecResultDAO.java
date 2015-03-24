package rms.com.appmanage.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import rms.com.appmanage.vo.RecResultVO;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;



@Repository("recResultDAO")
public class RecResultDAO extends EgovComAbstractDAO{

	/** log */
    protected static final Log LOG = LogFactory.getLog(RecResultDAO.class);
    

    /** 
     * 해당 지원자의 채용절차단계항목 가져오기
     * 
     * @author 선재희
     * @since 2014-05-26
     * */
   public List<String> checkStepItemDao(String app_user_no) throws Exception{
	   return (List<String>) list("recResultDAO.checkStepItemAction", app_user_no);
   }
   
   /**
    * 전형결과항목 가져오기
    * 
    * @author 선재희
    * @since 2014-05-27
    */
   public List<String> checkRecResultDao() throws Exception{
	   return (List<String>) list("recResultDAO.checkRecResultAction", null);
   }
   
   /**
    * 해당 지원자의 전형결과 수정하기
    * 
    * @author 선재희
    * @since 2014-05-28
    */
   public int updateRecResult(Map<String, Object> modifyCondition)
   {
      return update("recResultDAO.updateRecResult", modifyCondition);
   }
   
   
   
   
   /**
    * 전형일정 등록/수정
    * 
    * */
   public void updateRecSch(RecResultVO recResultVO){
	   update("recResultDAO.updateRecResSch", recResultVO);
   }
   
   /**
    * 전형일정 조회
    */
   public RecResultVO getScheContentDao(RecResultVO recResultVO){
	   return (RecResultVO) selectByPk("recResultDAO.getRecResSch", recResultVO);
   }
   
   /**
    * 전형일정 수정/삭제
    */
   public int updateScheContent(RecResultVO recResultVO){
	   return update("recResultDAO.updateScheContent", recResultVO);
   }
}
