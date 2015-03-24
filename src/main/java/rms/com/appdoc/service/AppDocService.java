package rms.com.appdoc.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import rms.com.appdoc.vo.AppContentVO;
import rms.com.appdoc.vo.AppItemContentVO;
import rms.com.appdoc.vo.AppItemListVO;
import rms.com.appdoc.vo.AppUserVO;
import rms.com.appdoc.vo.AppWishBranchVO;
import rms.com.appdoc.vo.PostVO;
import rms.com.appmanage.vo.AppInfoVO;
import rms.com.appmanage.vo.RecResultVO;


public interface AppDocService {

	//입사 지원서 등록
	public void appdocBoarddetail(HttpServletRequest request, HttpServletResponse response, 
			AppContentVO acVO, MultipartFile imageFile) throws Exception;
	
	public List<String> divdeUserTarget(String modifyTarget) throws Exception;

	//양식 조회
	List<AppItemListVO> appdocdetailBoard(AppContentVO acVO);

	//로그인 확인
	AppUserVO appUserLogin(AppUserVO userVO);

	//신규 입사지원자의 경우, APP_USER 정보 입력
	public Boolean loginInfoInsert(AppUserVO userVO) throws Exception;

	//기존 입사지원서 내용 조회
	List<AppContentVO> appdocContent(String app_user_no);

	//유저 번호 조회
	String searchUserNo(AppUserVO userVO);
	
	//최종제출
	public void finalSubmit(AppUserVO userVO) throws Exception;

	//채용 결과 디폴트 데이터 생성
	public Boolean recResInsert(RecResultVO resultVO) throws Exception;



	//기존 입사지원서 수정
	public void appdocUpdate(HttpServletRequest request, AppContentVO acVO) throws Exception;

	//희망 순위 등록
	public void wishList(String rec_noti_no, String app_user_no);

	//채용공고의 지사 조회
	public List<String> appdocBranchList(String rec_noti_no) throws Exception;

	//1지망 조회
	public List<AppWishBranchVO> wishBranchList1(String typeSelect1) throws Exception;
	
	//2지망 조회
	public List<AppWishBranchVO> wishBranchList2(String typeSelect2) throws Exception;

	//1지망 입력
	public Boolean wishList1(AppWishBranchVO wishVO, String branch_name1) throws Exception;

	//2지망 입력
	public Boolean wishList2(AppWishBranchVO wishVO, String branch_name2) throws Exception;
	
	//우편번호 검색
	public List<PostVO> selectPost(String dong) throws Exception;

	public List<AppItemContentVO> getAppUserDetailService(AppContentVO acVO) throws Exception;

	public int appdocInsert(List<AppContentVO> acList, String app_user_no, String rec_noti_no, MultipartFile imageFile, HttpServletRequest request) throws Exception;




}
