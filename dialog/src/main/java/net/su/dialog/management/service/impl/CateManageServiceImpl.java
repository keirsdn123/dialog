package net.su.dialog.management.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import net.su.dialog.dataSet.domain.DataManage;
import net.su.dialog.management.domain.CateManage;
import net.su.dialog.management.mapper.CateManageMapper;
import net.su.dialog.management.service.CateManageService;

@Service
public class CateManageServiceImpl implements CateManageService {
	
	@Resource(name = "net.su.dialog.management.mapper.CateManageMapper")
	private CateManageMapper cateManageMapper;
	
	//카테고리조회
	public Map<String, Object> selectCate() throws Exception{
		Map<String, Object> selectCate = new HashMap<String, Object>();
		
		List<CateManage> selectCate1 = cateManageMapper.selectCate1(); //1차카테고리조회
		
		int count = 0;
		for(int i=0; i<selectCate1.size(); i++) {
			count += selectCate1.get(i).getCateCount();
		};
		selectCate1.get(0).setCateCount(count);
		
		List<CateManage> selectCate2 = cateManageMapper.selectCate2(); //2차카테고리조회
		selectCate.put("selectCate1", selectCate1);
		selectCate.put("selectCate2", selectCate2);
		return selectCate;
	}
	
	//상위카테고리 등록
	public void insertCate(CateManage cateManage) throws Exception{
		
		cateManageMapper.insertCate(cateManage);
	}
	
	//하위카테고리 등록
	public void insertCate2(CateManage cateManage) throws Exception{
		cateManageMapper.insertCate2(cateManage);
	}
	
	//하위카테고리 조회
	public List<CateManage> selectChild(CateManage cateManage) throws Exception{
		return cateManageMapper.selectChild(cateManage);
	}
	
	//카테고리 수정
	public void updateCate(CateManage cateManage) throws Exception{
		cateManageMapper.updateCate(cateManage);
	}
	
	//카테고리 삭제
	public void deleteCate(CateManage cateManage) throws Exception{
		if(cateManage.getCateType() == 1) {
			int a = cateManageMapper.countChild(cateManage);
			cateManage.setCountChild(a);	
		}
		
		List<Integer> selectDtset = cateManageMapper.selectDtset(cateManage);
		if(selectDtset.size() != 0) {
			cateManageMapper.updateEtc(selectDtset);
		}
		cateManageMapper.deleteCate(cateManage);
	}
}
