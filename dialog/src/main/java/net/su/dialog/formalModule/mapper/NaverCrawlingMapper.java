package net.su.dialog.formalModule.mapper;

import net.su.dialog.formalModule.domain.NaverShoppingVo;

public interface NaverCrawlingMapper {
	
	public int isProductPresent(NaverShoppingVo naverShoppingVo, String tableName)throws Exception;
	//제품 등록
	public int insertShopList(NaverShoppingVo naverShoppingVo, String tableName) throws Exception;
	//수집시간 등록
	public void insertCrawlingDate(NaverShoppingVo naverShoppingVo, int seq, String tableName) throws Exception;
	//판매처 등록
	public void insertNaverMall(NaverShoppingVo naverShoppingVo, int seq, String tableName) throws Exception;
	//휴대폰 스펙 등록
	public void specInsertPhone(NaverShoppingVo naverShoppingVo, int seq) throws Exception;
	//저장장치 스펙 등록
	public void specInsertStorageDevice(NaverShoppingVo naverShoppingVo, int seq) throws Exception;
	//태블렛 pc 스펙 등록
	public void specInsertTabletPc(NaverShoppingVo naverShoppingVo, int seq) throws Exception;
	//그래픽 카드 스펙 등록
	public void specInsertgraphicCard(NaverShoppingVo naverShoppingVo, int seq) throws Exception;
	//TV 스펙 등록
	public void specInsertTv(NaverShoppingVo naverShoppingVo, int seq) throws Exception;
	
}
