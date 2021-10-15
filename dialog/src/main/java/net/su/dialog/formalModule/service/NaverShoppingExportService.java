package net.su.dialog.formalModule.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.formalModule.domain.NaverShoppingVo;
import net.su.dialog.formalModule.domain.NewsExportModule;
import net.su.dialog.formalModule.mapper.NaverShoppingExportMaperImpl;
import net.su.dialog.formalModule.mapper.NaverShoppingExportMapper;

@Service
public class NaverShoppingExportService {
	@Resource(name = "net.su.dialog.formalModule.mapper.NaverShoppingExportMapper")
	private NaverShoppingExportMapper naverShoppingExportMapper;
	
	public List<NewsExportModule> selectNaverShoppingExportList() throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.selectNaverShoppingExportList();
	}
	// 휴대폰 제품 
	public List<NaverShoppingVo> naverShoppingPhone(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingPhone(tableNmae, word, startDate, endDate);
		
	}
	// 휴대폰 판매처 
	public List<NaverShoppingVo> naverShoppingPhoneMall(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingPhoneMall(tableNmae, word, startDate, endDate);
		
	}
	
	// 태블릿 PC 제품 
	public List<NaverShoppingVo> naverShoppingTablet(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingTablet(tableNmae, word, startDate, endDate);
			
	}
	
	// 휴대폰 판매처 
	public List<NaverShoppingVo> naverShoppingTabletMall(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingTabletMall(tableNmae, word, startDate, endDate);
			
	}
	
	// 저장장치 제품 
	public List<NaverShoppingVo> naverShoppingStorage(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingStorage(tableNmae, word, startDate, endDate);
				
	}
		
	// 저장장치 판매처 
	public List<NaverShoppingVo> naverShoppingStorageMall(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingStorageMall(tableNmae, word, startDate, endDate);
			
	}	
	
	// 그래픽카드 제품 
	public List<NaverShoppingVo> naverShoppingGraphic(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingGraphic(tableNmae, word, startDate, endDate);
					
	}
			
	// 그래픽카드 판매처 
	public List<NaverShoppingVo> naverShoppingGraphicMall(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingGraphicMall(tableNmae, word, startDate, endDate);
				
	}
	
	// tv 제품 
	public List<NaverShoppingVo> naverShoppingTV(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingTV(tableNmae, word, startDate, endDate);
						
	}
				
	// tv 판매처 
	public List<NaverShoppingVo> naverShoppingTvMall(String tableNmae, String word, String startDate, String endDate) throws Exception {
		naverShoppingExportMapper = new NaverShoppingExportMaperImpl();
		return naverShoppingExportMapper.naverShoppingTvMall(tableNmae, word, startDate, endDate);
					
	}
	
	
	
	
}
