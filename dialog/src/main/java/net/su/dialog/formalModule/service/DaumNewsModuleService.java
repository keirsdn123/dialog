package net.su.dialog.formalModule.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.formalModule.mapper.DaumNewsModuleMapper;
import net.su.dialog.formalModule.mapper.DaumNewsModuleMapperImpl;
import net.su.dialog.schedule.domain.SchVo;
public class DaumNewsModuleService {
	
//	@Resource(name="net.su.dialog.formalModule.mapper.DaumNewsModuleMapper")
    private DaumNewsModuleMapperImpl daumNewsModuleMapper = new DaumNewsModuleMapperImpl();
	//다음 뉴스 수집 요청 목록 조회
	public List<DaumNewsModule> selectDaumNewsList() throws Exception {
		return daumNewsModuleMapper.selectDaumNewsList();
	}
	//다음 뉴스 테이블 생성
	public void createDaumNewsTable(String tableCreate) throws Exception{
		daumNewsModuleMapper.createDaumNewsTable(tableCreate);
	}
	//다음 뉴스 데이터 등록
	public void insertDaumNews(String tableCreate, List<DaumNewsModule> daumNewsList) throws Exception{
		daumNewsModuleMapper.insertDaumNews(tableCreate,daumNewsList);
	}
	//다음 뉴스 테이블, 데이터 완료 후 상태값 변경
	public void updateStatus(int scheduleCode, int daumNewsCollectRequestCode) throws Exception{
		daumNewsModuleMapper.updateStatus(scheduleCode , daumNewsCollectRequestCode);
	}
	//다음 뉴스 데이터 등록중 오류발생 시 해당 테이블 삭제
	public void deleteDaumNews(String deleteTableName) throws Exception{
		daumNewsModuleMapper.deleteDaumNews(deleteTableName);
	}
	
	
	
	
}
