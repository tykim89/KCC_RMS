
package rms.com.appmanage.service.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.appmanage.vo.AppBoardVO;
import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.qna.qnafrq.vo.DefaultVO;

@Repository("appBoardDAO")
public class AppBoardDAO extends EgovComAbstractDAO{

	/** log */
    protected static final Log LOG = LogFactory.getLog(AppBoardDAO.class);
    

    /**
     * 전체 입사지원서 리스트 가져오기
     * @author 선재희
     * @since 2014-05-14
     * */
   public List<AppBoardVO> getUserboardListDao(AppUserSearchVO pagingVO) throws Exception{
	   return (List<AppBoardVO>)list("appBoardDAO.allListAction", pagingVO);
   }
   
    /**
     * 검색조건에 해당하는 입사지원서 리스트 가져오기
     * @author 선재희
     * @since 2014-05-14
     * */
   public List<AppBoardVO> boardListDao(AppUserSearchVO pagingVO) throws Exception{
	   return (List<AppBoardVO>)list("appBoardDAO.listAction", pagingVO);
   }

   /**
    * 모든 채용공고 항목 가져오기
    * @author 선재희
    * @since 2014-05-14
    * */
   public List<AppUserSearchVO> recNotiSearchDao() throws Exception{
	   return (List<AppUserSearchVO>)list("appBoardDAO.getRecNotiListAction", null);
   }
   
   /**
    * 모든 지원분야 항목 가져오기
    * @author 선재희
    * @since 2014-05-14
    * */
   public List<AppUserSearchVO> recFieldSearchDao() throws Exception{
	   return (List<AppUserSearchVO>)list("appBoardDAO.getRecFieldListAction", null);
   }
   
   /**
    * 신입경력구분 항목 가져오기
    * @author 선재희
    * @since 2014-05-14
    * */
   public List<AppUserSearchVO> careerDivSearchDao() throws Exception{
	   return (List<AppUserSearchVO>)list("appBoardDAO.getCareerDivListAction", null);
   }
   
   /**
    * 전형단계 항목 가져오기
    * @author 선재희
    * @since 2014-05-14
    * */
   public List<AppUserSearchVO> recStepSearchDao() throws Exception{
	   return (List<AppUserSearchVO>)list("appBoardDAO.getRecStepListAction", null);
   }
   
   /**
    * 전형결과 항목 가져오기
    * @author 선재희
    * @since 2014-05-14
    * */
   public List<AppUserSearchVO> recResSearchDao() throws Exception{
	   return (List<AppUserSearchVO>)list("appBoardDAO.getRecResListAction", null);
   }
   
   
   /**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
   public int selectSampleListTotCnt(AppUserSearchVO pagingVO) throws Exception{
	   return (Integer)getSqlMapClientTemplate().queryForObject("appBoardDAO.selectSampleListTotCnt", pagingVO);
   }
   
   public int selectListTotCnt(AppUserSearchVO pagingVO) throws Exception{
	   return (Integer)getSqlMapClientTemplate().queryForObject("appBoardDAO.selectListTotCnt", pagingVO);
   }
   
   
}