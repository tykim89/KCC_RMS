package rms.com.appResult.service;

import java.util.List;

import rms.com.appResult.vo.AppResultVO;
import rms.com.appdoc.vo.AppUserVO;

public interface AppResultService {

	public String passResult(AppUserVO userVO);

	public  AppResultVO appResultList(AppUserVO userVO);

}
