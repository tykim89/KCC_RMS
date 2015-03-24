package rms.com.appForm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import rms.com.appForm.service.AppFormService;
import rms.com.appForm.vo.AppFormVO;

@Service("appFormService")
public class AppFormServiceImpl implements AppFormService{

	
	@Resource(name="appFormDAO")
	private AppFormDAO appFormDAO;
	
	
	
	@Override
	public List<AppFormVO> getAppFormList(String searchValue, String searchKey) throws Exception {
		return appFormDAO.AppFormList(searchValue, searchKey);
	}

	@Override
	public List<AppFormVO> getSelectAppFormList() throws Exception {
		return appFormDAO.SelectAppFormList();
	}
	

	

	@Override
	public void insertAppForm(AppFormVO appFormVO) throws Exception {
		appFormDAO.AppFormInsert(appFormVO);
	}



	

	
	
	
	
}
