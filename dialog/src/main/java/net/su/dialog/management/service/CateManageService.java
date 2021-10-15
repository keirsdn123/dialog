package net.su.dialog.management.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import net.su.dialog.management.domain.CateManage;

public interface CateManageService {
	
	public Map<String, Object> selectCate() throws Exception; //카테고리 조회
	
	public void insertCate(CateManage cateManage) throws Exception; //상위카테고리 등록
	
	public void insertCate2(CateManage cateManage) throws Exception; //하위카테고리 등록
	
	public List<CateManage> selectChild(CateManage cateManage) throws Exception; //하위카테고리 조회
	
	public void updateCate(CateManage cateManage) throws Exception; //카테고리 수정
	
	public void deleteCate(CateManage cateManage) throws Exception; //카테고리 삭제
}
