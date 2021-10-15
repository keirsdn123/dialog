package net.su.dialog.management.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.management.domain.CateManage;

@Repository("net.su.dialog.management.mapper.CateManageMapper")
public interface CateManageMapper {
	
	public List<CateManage> selectCate1() throws Exception; //1차카테고리조회
	
	public List<CateManage> selectCate2() throws Exception; //2차카테고리조회
	
	public void insertCate(CateManage cateManage) throws Exception; //상위카테고리등록
	
	public void insertCate2(CateManage cateManage) throws Exception; //하위카테고리등록
	
	public List<CateManage> selectChild(CateManage cateManage) throws Exception; //하위카테고리조회
	
	public void updateCate(CateManage cateManage) throws Exception; //카테고리수정
	
	public void deleteCate(CateManage cateManage) throws Exception; //카테고리삭제
	
	public int countChild(CateManage cateManage) throws Exception; //하위카테고리갯수조회
	
	public List<Integer> selectDtset(CateManage cateManage) throws Exception;//데이터셋 조회
	
	public void updateEtc(List<Integer> selectDtset) throws Exception; //데이터셋 기타로 수정 
	
}
