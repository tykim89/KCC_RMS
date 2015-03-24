package rms.com.check.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.appmanage.vo.AppUserSearchVO;
import rms.com.check.vo.CheckResVO;
import rms.com.check.vo.PagingForRecResVO;
import rms.com.jal.vo.RecFieldVO;
import rms.com.recNotice.vo.RecNoticeVO;
import rms.com.sys.vo.CodeDetailVO;

@Repository("checkResultDAO")
public class CheckResultDAO extends EgovComAbstractDAO{
	protected static final Log LOG = LogFactory.getLog(CheckResultDAO.class);
	public List<RecFieldVO> getRecFieldList() throws Exception{
		return (List<RecFieldVO>) list("checkResultDAO.getRecFieldAction", null);
	}
	
	public List<CodeDetailVO> getCareerDivList() throws Exception{
		return (List<CodeDetailVO>) list("checkResultDAO.getCareerDivAction", null);
	}
	
	public List<CodeDetailVO> getCheckResList() throws Exception{
		return (List<CodeDetailVO>) list("checkResultDAO.getCheckResAction", null);
	}
	
	public List<CheckResVO> getAppUserList(PagingForRecResVO pagingVO) throws Exception{
		return (List<CheckResVO>) list("checkResultDAO.getAppUserListAction", pagingVO);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	}
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
   public int selectSampleListTotCnt(PagingForRecResVO pagingVO) throws Exception{
	   return (Integer)getSqlMapClientTemplate().queryForObject("checkResultDAO.selectSampleListTotCnt", pagingVO);
   }
   /**
    * 로그인한 검토자가 할당받은 채용공고의 목록
    * @author 이동선
    * @param admin_id
    * @return 검토자에 해당하는 채용공고목록
    * */
   public List<RecNoticeVO> getRecNotiListForAdmin(String admin_id)throws Exception{
	   return list("checkResultDAO.getRecNotiListForAdmin", admin_id);
   }
   /**
    * 검토결과 등록
    * @author 이동선
    * @param CheckResVO
    * @return 선택한 지원자의 검토결과를 등록/수정
    * */
   public int updateCheckResultDao(CheckResVO inputCheckResVO)throws Exception{
	   return update("checkResultDAO.updateCheckResultAction", inputCheckResVO);
   }
   /**
    * 보류순위 조회
    * @author 이동선
    * @param 채용공고번호, 검토자아이디
    * */
   public List<CheckResVO> getHoldRankingByCheckerDao(HashMap<String, Object> checkerMap)throws Exception{
	   return list("checkResultDAO.getHoldRankingListAction", checkerMap);
   }
   /**
    * 이력항목으로 출력 할 목록(엑셀)
    * */
   public List<CheckResVO> getReportToExel(PagingForRecResVO pagingVO)throws Exception{
	   return list("checkResultDAO.getReportAction", pagingVO);
   }
   
   /**
    * 보류순위 전체 갱신
    * */
   public int renewHoldRankingDao(CheckResVO chkResVO)throws Exception{
	   return update("checkResultDAO.renewHoldRankingAction", chkResVO);
   }
   /**
    * 코멘트 등록/수정
    * */
   public int updateCheckCommentDao(CheckResVO chkVO)throws Exception{
	   return update("checkResultDAO.updateCheckCommentAction", chkVO);
   }
   /**
    * 코멘트 조회
    * */
   public CheckResVO getCheckCommentDao(CheckResVO chkVO)throws Exception{
	   return (CheckResVO) selectByPk("checkResultDAO.getCheckComment", chkVO);
   }
}
