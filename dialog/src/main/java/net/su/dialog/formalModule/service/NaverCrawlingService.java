package net.su.dialog.formalModule.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.formalModule.domain.NaverShoppingVo;
import net.su.dialog.formalModule.mapper.NaverCrawlingMapper;
import net.su.dialog.formalModule.mapper.NaverCrawlingMapperImpl;

//@Service
public class NaverCrawlingService {
//	@Resource(name="net.su.dialog.formalModule.mapper.NaverCrawlingMapper")
    private NaverCrawlingMapperImpl  naverCrawlingMapper= new NaverCrawlingMapperImpl();
	
	//제품 중복 확인
	public int isProductPresent(NaverShoppingVo naverShoppingVo, String tableName)throws Exception{
		System.out.println("도나");
		
		return naverCrawlingMapper.isProductPresent(naverShoppingVo,tableName);
	}
	//제품 등록
	public int insertShopList(NaverShoppingVo naverShoppingVo, String tableName) throws Exception{
		return naverCrawlingMapper.insertShopList(naverShoppingVo, tableName);
	}
	//수집시간 등록
	public void insertCrawlingDate(NaverShoppingVo naverShoppingVo, int seq, String tableName) throws Exception{
		naverCrawlingMapper.insertCrawlingDate(naverShoppingVo, seq, tableName);
	}
	//판매처 등록
	public void insertNaverMall(NaverShoppingVo naverShoppingVo, int seq, String tableName) throws Exception{
		naverCrawlingMapper.insertNaverMall(naverShoppingVo, seq, tableName);
	}
	//휴대폰 스펙 등록
	public void specInsertPhone(NaverShoppingVo naverShoppingVo, int seq) throws Exception{
		naverCrawlingMapper.specInsertPhone(naverShoppingVo, seq);
	}
	//저장장치 스펙 등록
	public void specInsertStorageDevice(NaverShoppingVo naverShoppingVo, int seq) throws Exception{
		naverCrawlingMapper.specInsertStorageDevice(naverShoppingVo, seq);
	}
	//태블렛 pc 스펙 등록
	public void specInsertTabletPc(NaverShoppingVo naverShoppingVo, int seq) throws Exception{
		naverCrawlingMapper.specInsertTabletPc(naverShoppingVo, seq);
	}
	//그래픽 카드 스펙 등록
	public void specInsertgraphicCard(NaverShoppingVo naverShoppingVo, int seq) throws Exception{
		naverCrawlingMapper.specInsertgraphicCard(naverShoppingVo, seq);
	}
	//TV 스펙 등록
	public void specInsertTv(NaverShoppingVo naverShoppingVo, int seq) throws Exception{
		naverCrawlingMapper.specInsertTv(naverShoppingVo, seq);
	}
}
