package net.su.dialog.formalModule.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.formalModule.domain.NaverShoppingVo;
import net.su.dialog.formalModule.domain.NewsExportModule;

@Repository("net.su.dialog.formalModule.mapper.NaverShoppingExportMapper")
public interface NaverShoppingExportMapper {
	public List<NewsExportModule> selectNaverShoppingExportList() throws Exception;
	
	public List<NaverShoppingVo> naverShoppingPhone(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingPhoneMall(String tableNmae, String word, String startDate, String endDate) throws Exception;

	public List<NaverShoppingVo> naverShoppingTablet(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingTabletMall(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingStorage(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingStorageMall(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingGraphic(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingGraphicMall(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingTV(String tableNmae, String word, String startDate, String endDate) throws Exception;
	
	public List<NaverShoppingVo> naverShoppingTvMall(String tableNmae, String word, String startDate, String endDate) throws Exception;
}
