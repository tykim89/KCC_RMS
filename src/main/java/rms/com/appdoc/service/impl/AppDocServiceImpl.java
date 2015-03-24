package rms.com.appdoc.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

import rms.com.appdoc.service.AppDocService;
import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppItemListVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appdoc.vo.AppWishBranchVO;
import rms.com.appdoc.vo.PostVO;
import rms.com.appmanage.service.TestResultService;
import rms.com.appmanage.service.impl.TestResultDAO;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.appmanage.vo.RecResultVO;
import rms.com.appmanage.vo.TestResultVO;
import rms.com.attfile.service.impl.FileDAO;
import rms.com.attfile.vo.FileVO;
import rms.com.cmn.service.impl.RmsLoginServiceImpl;

@Service ("appdocService")
public class AppDocServiceImpl implements AppDocService{
	
	/** log */
    protected static final Log LOG = LogFactory.getLog(AppDocServiceImpl.class);
    
    @Resource (name="appdocDAO")
    private AppDocDAO appdocDAO;
    
    @Resource(name="fileDAO")
    private FileDAO fileDAO;
    
	@Resource(name="testResultDAO")
	private TestResultDAO testResultDAO;
    
	@Resource(name = "rmsAppUserIdGnrService")
	private EgovIdGnrService rmsIdGnrService;

	@Resource(name = "rmsRecResultIdGnrService")
	private EgovIdGnrService rmsResultIdGnrService;
	
	@Resource(name = "rmsRecSchIdGnrService")
	private EgovIdGnrService rmsSchIdGnrService;
	
	@Resource(name = "rmsImgFileIdGnrService")
	private EgovIdGnrService rmsImgFileIdGnrService;
	
	 @Resource(name = "propertiesService")
	 protected EgovPropertyService propertiesService;
	
	//입사 지원서 등록
	@Override
	public void appdocBoarddetail(HttpServletRequest request, HttpServletResponse response, 
			AppContentVO acVO, MultipartFile imageFile) throws Exception{
		
    	String rec_noti_no = request.getParameter("rec_noti_no");     	
    	String app_user_no = request.getParameter("app_user_no");
    	String app_item_content = request.getParameter("app_item_content");
    	String app_item_no = request.getParameter("app_item_no");
    	

    	String app_list_code = request.getParameter("app_list_code");
    	
    	LOG.info(">>>>>>>>>>>Impl에서의 리스트코드"+app_list_code);
    	
    	String values[] = request.getParameterValues("app_item_content");
    	String item[] = request.getParameterValues("app_item_no");
    	
    	try{
    		
    		appdocDAO.getSqlMapClient().startTransaction();
    		appdocDAO.getSqlMapClient().startBatch();
    		
    		for(int i=0; i< values.length; i++){
    			    			
		    	LOG.info ("------------------"+ "( " + i +" )" + values[i]);

				acVO.setApp_item_content_no(Integer.toString(i+1));
				acVO.setApp_item_content(values[i]);
//				acVO.setApp_item_no(Integer.toString(i+1));
				acVO.setApp_item_no(item[i]);
				acVO.setRec_noti_no(rec_noti_no);
				acVO.setApp_user_no(app_user_no);
//				acVO.setApp_list_code(app_list_code);
				

				appdocDAO.getSqlMapClient().insert("appdocDAO.appdocBoarddetail", acVO);
				
    		}
    		
    		appdocDAO.getSqlMapClient().executeBatch();
    		appdocDAO.getSqlMapClient().commitTransaction();
    		
    	}catch(Exception e){
    		e.printStackTrace();    		
    	}finally{
    		
    		appdocDAO.getSqlMapClient().endTransaction();
    	}
    	
		
		// ------ 이미지 업로드 -------
    	AppUserVO appUserVO = new AppUserVO();
		FileVO fileVO = new FileVO();
		HttpSession session = request.getSession();
		
		if(!imageFile.isEmpty()){
			
			String imgKey = rmsImgFileIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
			appUserVO.setAtt_file_no(imgKey);
			appUserVO.setApp_user_no(app_user_no);
			fileVO.setAtt_file_no(imgKey);
			fileVO.setWriter(app_user_no);
			
			String orgFileName = imageFile.getOriginalFilename();
			String atchFileName = imgKey;
			
			String sAtacFlePathAdr = session.getServletContext().getRealPath("images/rms/applicant")+"/";
			
			//String sAtacFlePathAdr = propertiesService.getString("imagePath");
			
			// webapp까지의 리얼path를 구해줌
			//String sAtacFlePathAdr = new HttpServletRequestWrapper(request).getRealPath("/images/rms/applicant/");
			
			fileVO.setAtt_file_save_path(sAtacFlePathAdr);
			fileVO.setAtt_file_name(atchFileName);
			fileVO.setAtt_file_orig_name(orgFileName);
			long atchFileSize = imageFile.getSize();
			fileVO.setAtt_file_size(String.valueOf(atchFileSize));
			String atacFleDvEtsnNm = orgFileName.substring(orgFileName.lastIndexOf("."));
			
			if(atacFleDvEtsnNm != null){
				fileVO.setAtt_file_extention(atacFleDvEtsnNm);
			}
			
			// WAR안의 서버 경로로 업로드
			File file = new File(sAtacFlePathAdr + atchFileName + atacFleDvEtsnNm);	// 해당 경로에 저장될 파일이름 : IMG채번.확장자
			imageFile.transferTo(file);
			
			// project외부폴더 kcclab/upload/image로 또 업로드
			String imageUploade = propertiesService.getString("imagePath");
			File file2 = new File(imageUploade + atchFileName + atacFleDvEtsnNm);
			imageFile.transferTo(file2);
			
			appdocDAO.imageUpdate(appUserVO);
			fileDAO.fileInsert(fileVO);
			
		}else{
			
			appUserVO.setApp_user_no(app_user_no);
			appdocDAO.imageUpdate(appUserVO);
			
		}

					
		// ----------------------------
		
		
		
	}
	
	@Override
	public List<String> divdeUserTarget(String target) throws Exception{
		List<String> targetList = new ArrayList<String>();
	      
	      for (String str : target.split("\\|"))
	      {
	    	  targetList.add(str);
	      }
	      
		return targetList;
	}

	// 양식 조회
	@Override
	public List<AppItemListVO> appdocdetailBoard(AppContentVO acVO) {
		return appdocDAO.appdocdetailBoard(acVO);
	}

	//로그인 확인
	@Override
	public AppUserVO appUserLogin(AppUserVO userVO) {

		return appdocDAO.appUserLogin(userVO);
	}

	//신규 입사지원자의 경우, APP_USER 정보 입력
	@Override
	public Boolean loginInfoInsert(AppUserVO userVO) throws Exception{

		String key = rmsIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());

		userVO.setApp_user_no(key);
		
//		String name = userVO.getApp_user_name();
//		
//		LOG.info("impl에서 지원자 이름 값을 받아오는지 테스트 해봅시다"+name);
//		
//		appdocDAO.userNameInsert(name);

		return appdocDAO.loginInfoInsert(userVO);
	}


	//유저 번호 조회
	@Override
	public String searchUserNo(AppUserVO userVO) {
		return appdocDAO.searchUserNo(userVO);
		
	}

	
	//최종제출
	@Override
	public void finalSubmit(AppUserVO userVO) throws Exception{
    	
    	
    	//TEST_RES 데이터 생성
    	List<String> testCode = new ArrayList<String>();
    	testCode.add("TEI_0010");
    	testCode.add("TEI_0020");
    	testCode.add("TEI_0030");
    	
    	TestResultVO testResultVO = new TestResultVO();
    	
    	try{
    		
    		testResultDAO.getSqlMapClient().startTransaction();
    		testResultDAO.getSqlMapClient().startBatch();
    		
    		for(int i=0; i< testCode.size(); i++){

    			testResultVO.setTest_code(testCode.get(i));
    			testResultVO.setApp_user_no(userVO.getApp_user_no());
    			testResultVO.setRec_noti_no(userVO.getRec_noti_no());
				
				testResultDAO.getSqlMapClient().insert("testResultDAO.insert", testResultVO);
				
    		}
    		
    		testResultDAO.getSqlMapClient().executeBatch();
    		testResultDAO.getSqlMapClient().commitTransaction();
    		
    	}catch(Exception e){
    		e.printStackTrace();    		
    	}finally{
    		
    		testResultDAO.getSqlMapClient().endTransaction();
    	}

    	
    	// 최종제출여부 T로
		appdocDAO.finalSubmit(userVO);
		
	}

	
	//채용 결과 디폴트 데이터 생성
	@Override
	public Boolean recResInsert(RecResultVO resultVO) throws Exception{
		
		String key = rmsResultIdGnrService.getNextStringId().replace("YYMMDD", EgovDateUtil.getToday());
		resultVO.setRec_res_no(key);

		return appdocDAO.recResInsert(resultVO);
	}



	//기존 입사지원서 내용 조회
	@Override
	public List<AppContentVO> appdocContent(String app_user_no) {
		
		return appdocDAO.appdocContent(app_user_no);
	}

	//기존 입사지원서 수정
	@Override
	public void appdocUpdate(HttpServletRequest request, AppContentVO acVO) throws Exception{

		String rec_noti_no = request.getParameter("rec_noti_no");     	
    	String app_user_no = request.getParameter("app_user_no");
    	String app_item_no = request.getParameter("app_item_no");
    	
    	LOG.info(app_user_no+"--------확인------");
    	
    	String app_item_content = request.getParameter("app_item_content");
    	
    	String values[] = request.getParameterValues("app_item_content");
    	String item[] = request.getParameterValues("app_item_no");
    	
    	try{
    		
    		appdocDAO.getSqlMapClient().startTransaction();
    		appdocDAO.getSqlMapClient().startBatch();
    		
    		for(int i=0; i< values.length; i++){
    			
		    	LOG.info ("------------------"+ "( " + i +" )" + values[i]);               	

		    	
				acVO.setApp_item_content_no(Integer.toString(i+1));
				acVO.setApp_item_content(values[i]);
//				acVO.setApp_item_no(Integer.toString(i+1));
				acVO.setApp_item_no(item[i]);
				acVO.setRec_noti_no(rec_noti_no);
				acVO.setApp_user_no(app_user_no);
				
				LOG.info("~~~~~~~~~~~Impl acVO~~~~~~~~~~~"+acVO);
				
				appdocDAO.getSqlMapClient().update("appdocDAO.appdocUpdate", acVO);
				
    		}
    		
    		appdocDAO.getSqlMapClient().executeBatch();
    		appdocDAO.getSqlMapClient().commitTransaction();
    		
    	}catch(Exception e){
    		e.printStackTrace();    		
    	}finally{
    		
    		appdocDAO.getSqlMapClient().endTransaction();
    	}		
		
		

	}

	@Override
	public void wishList(String rec_noti_no, String app_user_no) {
		// TODO Auto-generated method stub
		
	}

//	채용공고의 지사 조회
	@Override
	public List<String> appdocBranchList(String rec_noti_no) throws Exception{
		
		return appdocDAO.appdocBranchList(rec_noti_no);
	}

//	@Override
//	public List<AppWishBranchVO> wishBranchList(String typeSelect, String rec_noti_no) throws Exception {
//
//		return appdocDAO.wishBranchList(typeSelect, rec_noti_no);
//	}
	
	//1지망 선택
	@Override
	public List<AppWishBranchVO> wishBranchList1(String typeSelect1) throws Exception {

		return appdocDAO.wishBranchList1(typeSelect1);
	}
	
	//2지망 선택
	@Override
	public List<AppWishBranchVO> wishBranchList2(String typeSelect2) throws Exception {

		return appdocDAO.wishBranchList2(typeSelect2);
	}

	//1지망 입력
	@Override
	public Boolean wishList1(AppWishBranchVO wishVO, String branch_name1) throws Exception {
		
		return appdocDAO.wishList1(wishVO, branch_name1);
		
	}

	//2지망 입력
	@Override
	public Boolean wishList2(AppWishBranchVO wishVO, String branch_name2)
			throws Exception {

		return appdocDAO.wishList2(wishVO, branch_name2);
	}

	//우편번호 검색
	@Override
	public List<PostVO> selectPost(String dong) throws Exception {

		return appdocDAO.selectPost(dong);
	}

	@Override
	public List<AppItemContentVO> getAppUserDetailService(	AppContentVO acVO) throws Exception {

		return appdocDAO.getAppUserDetailService(acVO);
	}

	@Override
	public int appdocInsert(List<AppContentVO> acList, String app_user_no,
			String rec_noti_no, MultipartFile imageFile, HttpServletRequest request ) throws Exception {


		
		// ------ 이미지 업로드 -------
    	AppUserVO appUserVO = new AppUserVO();
		FileVO fileVO = new FileVO();
		HttpSession session = request.getSession();
		
		if(!imageFile.isEmpty()){
			
			String imgKey = rmsImgFileIdGnrService.getNextStringId().replace("YYYYMMDD", EgovDateUtil.getToday());
			appUserVO.setAtt_file_no(imgKey);
			appUserVO.setApp_user_no(app_user_no);
			fileVO.setAtt_file_no(imgKey);
			fileVO.setWriter(app_user_no);
			
			String orgFileName = imageFile.getOriginalFilename();
			String atchFileName = imgKey;
			
			String sAtacFlePathAdr = session.getServletContext().getRealPath("images/rms/applicant")+"/";
			
			//String sAtacFlePathAdr = propertiesService.getString("imagePath");
			
			// webapp까지의 리얼path를 구해줌
			//String sAtacFlePathAdr = new HttpServletRequestWrapper(request).getRealPath("/images/rms/applicant/");
			
			fileVO.setAtt_file_save_path(sAtacFlePathAdr);
			fileVO.setAtt_file_name(atchFileName);
			fileVO.setAtt_file_orig_name(orgFileName);
			long atchFileSize = imageFile.getSize();
			fileVO.setAtt_file_size(String.valueOf(atchFileSize));
			String atacFleDvEtsnNm = orgFileName.substring(orgFileName.lastIndexOf("."));
			
			if(atacFleDvEtsnNm != null){
				fileVO.setAtt_file_extention(atacFleDvEtsnNm);
			}
			
			// WAR안의 서버 경로로 업로드
			File file = new File(sAtacFlePathAdr + atchFileName + atacFleDvEtsnNm);	// 해당 경로에 저장될 파일이름 : IMG채번.확장자
			imageFile.transferTo(file);
			
			// project외부폴더 kcclab/upload/image로 또 업로드
			String imageUploade = propertiesService.getString("imagePath");
			File file2 = new File(imageUploade + atchFileName + atacFleDvEtsnNm);
			imageFile.transferTo(file2);
			
			appdocDAO.imageUpdate(appUserVO);
			fileDAO.fileInsert(fileVO);
			
		}else{
			
			appUserVO.setApp_user_no(app_user_no);
			appdocDAO.imageUpdate(appUserVO);
			
		}
		
		return appdocDAO.appdocInsert(acList,app_user_no, rec_noti_no);
	}
	

}
