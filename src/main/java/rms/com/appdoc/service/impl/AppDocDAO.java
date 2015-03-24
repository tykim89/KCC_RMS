package rms.com.appdoc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppItemListVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appdoc.vo.AppWishBranchVO;
import rms.com.appdoc.vo.PostVO;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.appmanage.vo.RecResultVO;


@Repository ("appdocDAO")
public class AppDocDAO extends EgovComAbstractDAO{
	
	protected static final Log LOG = LogFactory.getLog(AppDocDAO.class);
	
	//입사 지원서 등록
//	@Transactional
	public boolean appdocBoarddetail(AppContentVO acVO) {
		
//		String app_list_code = acVO.getApp_list_code();
		
//		LOG.info(">>>>>>>>>>>>>>>>다오에서 리스트코드"+app_list_code);
		
		LOG.info("다오에 오니?");
		
		return update("appdocDAO.appdocBoarddetail", acVO)>0?true:false;
	}

	//양식 조회
	public List<AppItemListVO> appdocdetailBoard(AppContentVO acVO) {
		return list("appdocDAO.appdocdetailBoard", acVO);
	}


	//로그인 확인
	public AppUserVO appUserLogin(AppUserVO userVO) {

		return (AppUserVO) selectByPk("appdocDAO.appUserLogin", userVO);
	}

	//신규 입사지원자의 경우, APP_USER 정보 입력
	public boolean loginInfoInsert(AppUserVO userVO) {

		boolean isc = false;
		System.out.println("222");
		int i = update("appdocDAO.loginInfoInsert", userVO);
		System.out.println(i);
		if(i == 0)
		{
			isc = true;
		}
		else
			isc = false;
		return isc;
	}
	
	
	// 유저 번호 조회
	public String searchUserNo(AppUserVO userVO) {

		return (String) selectByPk("appdocDAO.searchUserNo", userVO);
	}
	
	
	//최종 제출
	public void finalSubmit(AppUserVO userVO) throws Exception {
		update("appdocDAO.finalSubmit", userVO);
	}

	public Boolean recResInsert(RecResultVO resultVO) throws Exception{
		
		String rec_noti_no = resultVO.getRec_noti_no();
		System.out.println("다오에서 공고 번호"+rec_noti_no);
		String app_user_no = resultVO.getApp_user_no();
		System.out.println("다오에서 공고 번호"+app_user_no);
		
		boolean isc = false;
		
		isc = update("appdocDAO.recResInsert", resultVO)>0?true:false;
		
		return isc;
		
	}

	// 채용 결과 디폴트 데이터 생성
	public String searchrecResNo(String app_user_no) {		
		
		return (String) selectByPk("appdocDAO.searchResNo", app_user_no);
		
	}



	//기존 입사지원서 내용 조회
	public List<AppContentVO> appdocContent(String app_user_no) {

		return list("appdocDAO.appdocContent", app_user_no);
	}
	
	
	//입사 지원서 수정
	public void appdocUpdate(AppContentVO acVO){

		update("appdocDAO.appdocUpdate", acVO);

	}

	//지사 조회
	public List<String> appdocBranchList(String rec_noti_no) throws Exception{
		
		LOG.info("--------------채용공고번호 값 확인----"+rec_noti_no);

		return list("appdocDAO.appdocBranch", rec_noti_no);

	}

//	public List<AppWishBranchVO> wishBranchList(String typeSelect, String rec_noti_no) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("rec_noti_no", rec_noti_no);
//		map.put("typeSelect", typeSelect);
//		
//		return list("appdocDAO.wishBranchList", map);
//	}
	
	public List<AppWishBranchVO> wishBranchList1(String typeSelect1) {

		return list("appdocDAO.wishBranchList1", typeSelect1);
		
	}
	
	public List<AppWishBranchVO> wishBranchList2(String typeSelect2) {

		return list("appdocDAO.wishBranchList2", typeSelect2);
		
	}

	public boolean wishList1(AppWishBranchVO wishVO, String branch_name1) {
		
    wishVO.setBranch_name(branch_name1);

	return update("appdocDAO.wishList1", wishVO)>0?true:false;
	
	}

	public Boolean wishList2(AppWishBranchVO wishVO, String branch_name2) {
	    
		wishVO.setBranch_name(branch_name2);
		
		return update("appdocDAO.wishList2", wishVO)>0?true:false;
	}

	public List<PostVO> selectPost(String dong) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("list", dong);//JSON형식은 key, value형식이므로 map에 담아서 변환(지금 plist를 담은 list는 배열형식임)
		List<PostVO> plist = (List<PostVO>)list("appdocDAO.selectPost", dong);
		
		System.out.println(plist);

		return plist;
		
//		return list("appdocDAO.selectPost", dong);
		
		
	}
	
	
	
	public void imageUpdate(AppUserVO appUserVO){
		update("appdocDAO.insertImage", appUserVO);
	}

	public List<AppItemContentVO> getAppUserDetailService(AppContentVO acVO) {
		// TODO Auto-generated method stub
		return list("appdocDAO.getAppUserDetailService", acVO);
	}

	public int appdocInsert(List<AppContentVO> acList, String app_user_no, String rec_noti_no) throws Exception{
    
		
		int i = 1;
//		AppContentVO acVO = new AppContentVO();
		
		this.getSqlMapClient().startTransaction();
    	this.getSqlMapClient().startBatch();
    	
    	LOG.info("*****rec_noti_no****"+rec_noti_no);
		
		for(AppContentVO acVO : acList)
			
//    	for(int i = 0 ; i<acList.size() ;i++)			
		{	
			acVO.setApp_item_content_no(Integer.toString(i++));
			acVO.setApp_user_no(app_user_no);
			acVO.setRec_noti_no(rec_noti_no);
			
			LOG.info("***DAO의 acVO****"+acVO);
			
			this.getSqlMapClient().update("appdocDAO.appdocInsert", acVO);
		}
		
		this.getSqlMapClient().executeBatch();
		this.getSqlMapClient().commitTransaction();		
		this.getSqlMapClient().endTransaction();
		
		return 1;
	}

	
	
	
}
