package net.su.dialog.dataSet.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataSetListViewVo;

@Repository("net.su.dialog.dataSet.mapper.DataSetListViewMapper")
public interface DataSetListViewMapper {
	
	public DataSetListViewVo selectDataListView(DataSetListViewVo dataSetListViewVo) throws Exception;
	
	public List<DataSetListViewVo> selectDataListViewCate(DataSetListViewVo dataSetListViewVo) throws Exception;
}
