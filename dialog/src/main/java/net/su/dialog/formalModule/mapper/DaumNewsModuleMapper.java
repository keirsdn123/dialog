package net.su.dialog.formalModule.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.formalModule.domain.DaumNewsModule;
import net.su.dialog.schedule.domain.SchVo;

@Repository("net.su.dialog.formalModule.mapper.DaumNewsModuleMapper")
public interface DaumNewsModuleMapper {
	//다음 뉴스 수집 요청 목록 조회
	public List<DaumNewsModule> selectDaumNewsList() throws Exception;
	//다음 뉴스 데이터 등록
	public void insertDaumNews(String tableCreate, List<DaumNewsModule> daumNewsList) throws Exception;
	//다음 뉴스 데이터 등록중 오류발생 시 해당 테이블 삭제
	public void deleteDaumNews(String deleteTableName) throws Exception;
	//다음 뉴스 테이블 생성
	public void createDaumNewsTable(String tableCreate) throws Exception;
	//다음 뉴스 테이블, 데이터 완료 후 상태값 변경
	public void updateStatus(int scheduleCode, int daumNewsCollectRequestCode) throws Exception;
	//다음뉴스모듈 스케줄리스트 조회 
	public List<DevelopSource> selectDaumNewsSchedule();
	
	

}
