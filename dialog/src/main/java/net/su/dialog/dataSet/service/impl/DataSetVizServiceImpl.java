package net.su.dialog.dataSet.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;
import org.supercsv.cellprocessor.ParseInt;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.codehaus.jackson.JsonParseException;
import org.json.JSONException;
import org.json.JSONObject;
import net.su.dialog.dataSet.domain.DataSetVo;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.DataVizGroupVo;
import net.su.dialog.dataSet.domain.DataVizVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.mapper.DataSetVizMapper;
import net.su.dialog.dataSet.service.DataSetVizService;
import net.su.dialog.report.domain.ReportDomain;


@Service
public class DataSetVizServiceImpl implements DataSetVizService{
      
      @Resource(name="net.su.dialog.dataSet.mapper.DataSetVizMapper")
      private DataSetVizMapper dataSetVizMapper;
      
      public List<DataVizVo> getSelectBox(DataVizVo dataVizVo) throws Exception{
            return dataSetVizMapper.getSelectBox(dataVizVo);
       }
   
      public void updateDataSetRequestViz(DataVizVo dataVizVo) throws Exception{
         dataSetVizMapper.updateDataSetRequestViz(dataVizVo);
      }
      //선택시 보이는 바차트
      public List<DataVizVo> makeChartView(DataVizVo dataVizVo) throws Exception{      
         if(dataVizVo.getCondition() == 1) {  //여기서 condition의 숫자들은 조건값(sum,avg,max,min,count)을 말합니다.       
            directMake(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.makeChartSumView(dataVizVo);
            run(normalChart);
            return normalChart;
            
         } else if (dataVizVo.getCondition() == 2) {
            directMake(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.makeChartAvgView(dataVizVo);
            run(normalChart);
            return normalChart;
            
         } else if (dataVizVo.getCondition() == 3) {
            directMake(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.makeChartMaxView(dataVizVo);
            run(normalChart);
            return normalChart;
            
         } else if (dataVizVo.getCondition() == 4) {
            directMake(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.makeChartMinView(dataVizVo);
            run(normalChart);
            return normalChart;
            
         } else if (dataVizVo.getCondition() == 5) {
            directMake(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.makeChartCountView(dataVizVo);
            run(normalChart);
            return normalChart;
         }
         directMake(dataVizVo);
         List<DataVizVo> normalChart = dataSetVizMapper.makeChartView(dataVizVo);
         run(normalChart);         
         return normalChart;
      }

      
      //상세조회시 바로 보이는 bar-chart, line-chart
      public List<DataVizVo> selectBLChart(DataVizVo dataVizVo) throws Exception{
         System.out.println("Asdfadsfads"+dataVizVo.getCondition());
         
         if(dataVizVo.getCondition() == 1) {
            checkBar(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.selectBLSumChart(dataVizVo);
            run(normalChart);
            return normalChart;         
         } else if (dataVizVo.getCondition() == 2) {
            checkBar(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.selectBLAvgChart(dataVizVo);
            run(normalChart);
            return normalChart;   
            
         } else if (dataVizVo.getCondition() == 3) {
            checkBar(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.selectBLMaxChart(dataVizVo);
            run(normalChart);
            return normalChart;   
            
         } else if (dataVizVo.getCondition() == 4) {
            checkBar(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.selectBLMinChart(dataVizVo);
            run(normalChart);
            return normalChart;   
            
         } else if (dataVizVo.getCondition() == 5) {
            checkBar(dataVizVo);
            List<DataVizVo> normalChart = dataSetVizMapper.selectBLCountChart(dataVizVo);
            run(normalChart);
            return normalChart;   
         } else
         checkBar(dataVizVo);
         List<DataVizVo> normalChart = dataSetVizMapper.selectBLChart(dataVizVo);
         run(normalChart);
         return normalChart;   
      }
   
      //상세조회시 바로 보이는 pie-chart, donut-chart
      public List<HashMap<String, Object>> selectPDChart(DataVizVo dataVizVo) throws Exception{
            
            if(dataVizVo.getCondition() == 1) {
               checkBar(dataVizVo);
               //json형태로 담겨 있는 xcolInfo를 map형태로 바꾼다.
               //map형태는 {key = value} 형식으로 되어 있다.
               List<HashMap<String, Object>> spiea = dataSetVizMapper.selectPDSumChart(dataVizVo);
               for(int i=0;i<spiea.size();i++) { //map형태의 spiea의 변수의 size만큼 for문 실행
            	   //xcolInfo가 null이 아닐 경우 실행
                  if(spiea.get(i).get("xcolInfo") != null) {
                	//xcolInfo를 "jsonObj"라는 이름의 JSONOject로 만든다.(그때 바로 map형태로 해서 value값뽑으려니 잘 되지 않아서 다시 json형태로 만듬)
                  JSONObject jsonObj = new JSONObject (String.valueOf(spiea.get(i).get("xcolInfo"))); 
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ; //jsonObj를 "rs"라는 이름의 map형태로 만들었따.
                  String key = String.valueOf((spiea.get(i).get("xcolName"))); //key값 
                  String rsKey = key.substring(0,key.indexOf("."));
                  spiea.get(i).put("xcolName", rs.get(rsKey)); 
                  }
               }
               return spiea;
            } else if(dataVizVo.getCondition() == 2) {
               checkBar(dataVizVo);
               List<HashMap<String, Object>> spiea = dataSetVizMapper.selectPDAvgChart(dataVizVo);
               for(int i=0;i<spiea.size();i++) {
                  if(spiea.get(i).get("xcolInfo") != null) {
                  
                  JSONObject jsonObj = new JSONObject (String.valueOf(spiea.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((spiea.get(i).get("xcolName")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  spiea.get(i).put("xcolName", rs.get(rsKey));
                  }
               }
               return spiea;
            } else if(dataVizVo.getCondition() == 3) {
               checkBar(dataVizVo);
               List<HashMap<String, Object>> spiea = dataSetVizMapper.selectPDMaxChart(dataVizVo);
               for(int i=0;i<spiea.size();i++) {
                  if(spiea.get(i).get("xcolInfo") != null) {
                  
                  JSONObject jsonObj = new JSONObject (String.valueOf(spiea.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((spiea.get(i).get("xcolName")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  spiea.get(i).put("xcolName", rs.get(rsKey));
                  }
               }
               return spiea;
            } else if(dataVizVo.getCondition() == 4) {
               checkBar(dataVizVo);
               List<HashMap<String, Object>> spiea = dataSetVizMapper.selectPDMinChart(dataVizVo);
               for(int i=0;i<spiea.size();i++) {
                  if(spiea.get(i).get("xcolInfo") != null) {
                  
                  JSONObject jsonObj = new JSONObject (String.valueOf(spiea.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((spiea.get(i).get("xcolName")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  spiea.get(i).put("xcolName", rs.get(rsKey));
                  }
               }
               return spiea;
            } else if(dataVizVo.getCondition() == 5) {
               checkBar(dataVizVo);
               List<HashMap<String, Object>> spiea = dataSetVizMapper.selectPDCountChart(dataVizVo);
               for(int i=0;i<spiea.size();i++) {
                  if(spiea.get(i).get("xcolInfo") != null) {
                  
                  JSONObject jsonObj = new JSONObject (String.valueOf(spiea.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((spiea.get(i).get("xcolName")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  spiea.get(i).put("xcolName", rs.get(rsKey));
                  }
               }
               return spiea;
            }  else {
               checkBar(dataVizVo);
               List<HashMap<String, Object>> spiea = dataSetVizMapper.selectPDChart(dataVizVo);
               for(int i=0;i<spiea.size();i++) {
                  if(spiea.get(i).get("xcolInfo") != null) {
                  
                  JSONObject jsonObj = new JSONObject (String.valueOf(spiea.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((spiea.get(i).get("xcolName")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  spiea.get(i).put("xcolName", rs.get(rsKey));
                  }
               }
               return spiea;
            }
         }
      
      //상세조회시 바로 보이는 groupBar
      public List<HashMap<String, Object>> selectGChart(DataVizGroupVo dataVizGroupVo) throws Exception{
         System.out.println("표준데이터 리스트 조회");
         System.out.println("조건 가지고 오는지" +  dataVizGroupVo.getCondition());
         System.out.println("xc축" + dataVizGroupVo.getXcolName());
         System.out.println("yc축" + dataVizGroupVo.getYcolName());
         System.out.println("x축인포"+ dataVizGroupVo.getXcolInfo());
         
         if(dataVizGroupVo.getCondition() == 1) {
            check(dataVizGroupVo);
            System.out.println("tlqjfltqjf"+dataVizGroupVo.getX1colInfo());
            
            List<HashMap<String, Object>> sgroupBar = dataSetVizMapper.selectGSumChart(dataVizGroupVo);
            for(int i=0;i<sgroupBar.size();i++) {
               if(sgroupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(sgroupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return sgroupBar;
         } else if(dataVizGroupVo.getCondition() == 2) {
            //여기에다 조건문 걸기 ㅠㅠ 
            
            check(dataVizGroupVo);
            List<HashMap<String, Object>> sgroupBar = dataSetVizMapper.selectGAvgChart(dataVizGroupVo);
            for(int i=0;i<sgroupBar.size();i++) {
               if(sgroupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(sgroupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return sgroupBar;
         } else if(dataVizGroupVo.getCondition() == 3) {
            check(dataVizGroupVo);
            List<HashMap<String, Object>> sgroupBar = dataSetVizMapper.selectGMaxChart(dataVizGroupVo);
            for(int i=0;i<sgroupBar.size();i++) {
               if(sgroupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(sgroupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return sgroupBar;
         } else if(dataVizGroupVo.getCondition() == 4) {
            check(dataVizGroupVo);
            List<HashMap<String, Object>> sgroupBar = dataSetVizMapper.selectGMinChart(dataVizGroupVo);
            for(int i=0;i<sgroupBar.size();i++) {
               if(sgroupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(sgroupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return sgroupBar;
         } else if(dataVizGroupVo.getCondition() == 5) {
            check(dataVizGroupVo);
            List<HashMap<String, Object>> sgroupBar = dataSetVizMapper.selectGCountChart(dataVizGroupVo);
            for(int i=0;i<sgroupBar.size();i++) {
               if(sgroupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(sgroupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return sgroupBar;
         }  else {
            check(dataVizGroupVo);
            List<HashMap<String, Object>> sgroupBar = dataSetVizMapper.selectGChart(dataVizGroupVo);
            for(int i=0;i<sgroupBar.size();i++) {
               if(sgroupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(sgroupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(sgroupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((sgroupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  sgroupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return sgroupBar;
         }
      }
   
      // 선택시 보이는 pie
      public List<HashMap<String, Object>> pieChartView(DataVizVo dataVizVo) throws Exception{
         if(dataVizVo.getCondition() == 1) {
            directMake(dataVizVo);
            List<HashMap<String, Object>> piea = dataSetVizMapper.pieChartSumView(dataVizVo);      
            for(int i=0;i<piea.size();i++) {
               if(piea.get(i).get("xcolInfo") != null) {
               
               JSONObject jsonObj = new JSONObject (String.valueOf(piea.get(i).get("xcolInfo")));
               HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
               String key = String.valueOf((piea.get(i).get("xcolName")));
               String rsKey = key.substring(0,key.indexOf("."));
               piea.get(i).put("xcolName", rs.get(rsKey));
               }
            }
            return piea;
         } else if(dataVizVo.getCondition() == 2) {
            directMake(dataVizVo);
            List<HashMap<String, Object>> piea = dataSetVizMapper.pieChartAvgView(dataVizVo);
            for(int i=0;i<piea.size();i++) {
               if(piea.get(i).get("xcolInfo") != null) {
               
               JSONObject jsonObj = new JSONObject (String.valueOf(piea.get(i).get("xcolInfo")));
               HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
               String key = String.valueOf((piea.get(i).get("xcolName")));
               String rsKey = key.substring(0,key.indexOf("."));
               piea.get(i).put("xcolName", rs.get(rsKey));
               }
            }
            return piea;
         } else if(dataVizVo.getCondition() == 3) {
            directMake(dataVizVo);
            List<HashMap<String, Object>> piea = dataSetVizMapper.pieChartMaxView(dataVizVo);
            for(int i=0;i<piea.size();i++) {
               if(piea.get(i).get("xcolInfo") != null) {
               
               JSONObject jsonObj = new JSONObject (String.valueOf(piea.get(i).get("xcolInfo")));
               HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
               String key = String.valueOf((piea.get(i).get("xcolName")));
               String rsKey = key.substring(0,key.indexOf("."));
               piea.get(i).put("xcolName", rs.get(rsKey));
               }
            }
            return piea;
         } else if(dataVizVo.getCondition() == 4) {
            directMake(dataVizVo);
            List<HashMap<String, Object>> piea = dataSetVizMapper.pieChartMinView(dataVizVo);
            for(int i=0;i<piea.size();i++) {
               if(piea.get(i).get("xcolInfo") != null) {
               
               JSONObject jsonObj = new JSONObject (String.valueOf(piea.get(i).get("xcolInfo")));
               HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
               String key = String.valueOf((piea.get(i).get("xcolName")));
               String rsKey = key.substring(0,key.indexOf("."));
               piea.get(i).put("xcolName", rs.get(rsKey));
               }
            }
            return piea;
         } else if(dataVizVo.getCondition() == 5) {
            directMake(dataVizVo);
            List<HashMap<String, Object>> piea = dataSetVizMapper.pieChartCountView(dataVizVo);
            for(int i=0;i<piea.size();i++) {
               if(piea.get(i).get("xcolInfo") != null) {
               
               JSONObject jsonObj = new JSONObject (String.valueOf(piea.get(i).get("xcolInfo")));
               HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
               String key = String.valueOf((piea.get(i).get("xcolName")));
               String rsKey = key.substring(0,key.indexOf("."));
               piea.get(i).put("xcolName", rs.get(rsKey));
               }
            }
            return piea;
         }  else {
            directMake(dataVizVo);
            List<HashMap<String, Object>> piea = dataSetVizMapper.pieChartView(dataVizVo);
            for(int i=0;i<piea.size();i++) {
               if(piea.get(i).get("xcolInfo") != null) {
               
               JSONObject jsonObj = new JSONObject (String.valueOf(piea.get(i).get("xcolInfo")));
               HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
               String key = String.valueOf((piea.get(i).get("xcolName")));
               String rsKey = key.substring(0,key.indexOf("."));
               piea.get(i).put("xcolName", rs.get(rsKey));
               }
            }

            return piea;
         }
      }
      
      //선택시 보이는 group
      public List<HashMap<String, Object>> groupChartView(DataVizGroupVo dataVizGroupVo) throws Exception{
         System.out.println("표준데이터 리스트 조회");
         System.out.println("조건 가지고 오는지" +  dataVizGroupVo.getCondition());
         
         if(dataVizGroupVo.getCondition() == 1) {
            directMakeG(dataVizGroupVo);
            List<HashMap<String, Object>> groupBar = dataSetVizMapper.groupChartSumView(dataVizGroupVo);
            for(int i=0;i<groupBar.size();i++) {
               if(groupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(groupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            
            return groupBar;
         } else if(dataVizGroupVo.getCondition() == 2) {
            directMakeG(dataVizGroupVo);
            List<HashMap<String, Object>> groupBar = dataSetVizMapper.groupChartAvgView(dataVizGroupVo);
            for(int i=0;i<groupBar.size();i++) {
               if(groupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(groupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return groupBar;
         } else if(dataVizGroupVo.getCondition() == 3) {
            directMakeG(dataVizGroupVo);
            List<HashMap<String, Object>> groupBar = dataSetVizMapper.groupChartMaxView(dataVizGroupVo);
            for(int i=0;i<groupBar.size();i++) {
               if(groupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(groupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return groupBar;
         } else if(dataVizGroupVo.getCondition() == 4) {
            directMakeG(dataVizGroupVo);
            List<HashMap<String, Object>> groupBar = dataSetVizMapper.groupChartMinView(dataVizGroupVo);
            for(int i=0;i<groupBar.size();i++) {
               if(groupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(groupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return groupBar;
         } else if(dataVizGroupVo.getCondition() == 5) {
            directMakeG(dataVizGroupVo);
            List<HashMap<String, Object>> groupBar = dataSetVizMapper.groupChartCountView(dataVizGroupVo);
            for(int i=0;i<groupBar.size();i++) {
               if(groupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(groupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return groupBar;
         }  else {
            directMakeG(dataVizGroupVo);
            List<HashMap<String, Object>> groupBar = dataSetVizMapper.groupChartView(dataVizGroupVo);
            for(int i=0;i<groupBar.size();i++) {
               if(groupBar.get(i).get("xcolInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("xcolInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("x")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("x", rs.get(rsKey));
                  }
               if(groupBar.get(i).get("x1colInfo") != null) {               
                  JSONObject jsonObj = new JSONObject (String.valueOf(groupBar.get(i).get("x1colInfo")));
                  HashMap<String, String> rs= new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                  String key = String.valueOf((groupBar.get(i).get("id")));
                  String rsKey = key.substring(0,key.indexOf("."));
                  groupBar.get(i).put("id", rs.get(rsKey));
                  }
            }
            return groupBar;
         }
      }
      
      //연관 보고서 조회
      public List<ReportDomain> selectDReferenceReportList(Dataset dvo) throws Exception{
         return dataSetVizMapper.selectDReferenceReportList(dvo);
      }
      
      //범주, 수치, 범례 바로 보이기
      public DataVizVo selectVTitle(DataVizVo dataVizVo) throws Exception{
         DataVizVo sco = new DataVizVo();
         dataVizVo = dataSetVizMapper.selectVFTitle(dataVizVo);
         if(dataVizVo.getVizPauseStandarX().equals("pause_standar_column1")) {
            dataVizVo.setVizPauseStandarXInfo("pause_standar_column1");
         } else if (dataVizVo.getVizPauseStandarX().equals("pause_standar_column2")) {
            dataVizVo.setVizPauseStandarXInfo("pause_standar_column2");
         } else if (dataVizVo.getVizPauseStandarX().equals("pause_standar_column3")) {
            dataVizVo.setVizPauseStandarXInfo("pause_standar_column3");
         } else if (dataVizVo.getVizPauseStandarX().equals("pause_standar_column4")) {
            dataVizVo.setVizPauseStandarXInfo("pause_standar_column4");
         } else if (dataVizVo.getVizPauseStandarX().equals("pause_standar_column5")) {
            dataVizVo.setVizPauseStandarXInfo("pause_standar_column5");
         } else if (dataVizVo.getVizPauseStandarLable().equals("pause_standar_column1")) {
            dataVizVo.setVizPauseStandarX1Info("pause_standar_column1");
         } else if (dataVizVo.getVizPauseStandarLable().equals("pause_standar_column2")) {
            dataVizVo.setVizPauseStandarX1Info("pause_standar_column2");
         } else if (dataVizVo.getVizPauseStandarLable().equals("pause_standar_column3")) {
            dataVizVo.setVizPauseStandarX1Info("pause_standar_column3");
         } else if (dataVizVo.getVizPauseStandarLable().equals("pause_standar_column4")) {
            dataVizVo.setVizPauseStandarX1Info("pause_standar_column4");
         } else if (dataVizVo.getVizPauseStandarLable().equals("pause_standar_column5")) {
            dataVizVo.setVizPauseStandarX1Info("pause_standar_column5");
         } else
          dataVizVo.setVizPauseStandarXInfo(null);
          dataVizVo.setVizPauseStandarX1Info(null);
          System.out.println("ASDfasdf"+dataVizVo.getVizPauseStandarXInfo());
          System.out.println("ASDfasdf"+dataVizVo.getVizPauseStandarX1Info());
         sco = dataSetVizMapper.selectVTitle(dataVizVo);
               
         sco.setVizPauseStandarX(dataVizVo.getVizPauseStandarX());
         sco.setVizPauseStandarY(dataVizVo.getVizPauseStandarY());
         sco.setVizPauseStandarLable(dataVizVo.getVizPauseStandarLable());
         sco.setVizPauseStandarXInfo(dataVizVo.getVizPauseStandarXInfo());
         sco.setVizPauseStandarX1Info(dataVizVo.getVizPauseStandarX1Info());
         
         return sco;
      }
      //데이터 테이블 타이틀 가져오기
      public DataVizVo selectDBPreviewTitle(DataVizVo dataVizVo) throws Exception{
    	  dataVizVo = dataSetVizMapper.selectDBPreviewTitle(dataVizVo);  
    	  return dataVizVo;
      }
      
      //데이터 테이블 데이터 가져오기
      public Map<String, Object> selectDBPreviewCol (DataVizVo dataVizVo) throws Exception{

  		Map<String, Object> columnMap = new HashMap<String, Object>();
  		
  		List<DataVizVo> columnList = dataSetVizMapper.selectDBPreviewCol(dataVizVo);
  		columnMap.put("columnList", columnList);
  		return columnMap;
  	  }
      
      public List<DataVizVo> selectDBdataList(String changeData, String normalDataTableTitle) throws Exception{
    	  
  		Map<String, String> dbDataMap = new HashMap<String, String>();
  		
  		dbDataMap.put("changeData",changeData);
  		dbDataMap.put("normalDataTableTitle",normalDataTableTitle);
  		List<DataVizVo> list = dataSetVizMapper.selectDBdataList(dbDataMap);
  		return list;
  	  }
      
      //상세조회에서 그냥 바로 그래프 만들때!
      public void directMake(DataVizVo dataVizVo) {
    	  //조건절 vo에 있는 xcolName변수안에 있는 값이 "pause_standar_column1"이라는 명칭과 같은 경우이다.
    	  //이것을 해놓은 이유는 DB에있는 normal_data_standard_info 테이블을 확인해보면
    	  //범주값(pause_standar_column1~5)들은 각각의 칼럼들이 가지고있는 lable이 있기때문이다.
    	  //수치값들은 lable이 없다.
         if(dataVizVo.getXcolName().equals("pause_standar_column1")) {
            dataVizVo.setXcolInfo("pause_standar_column1_Lable");
            
         } else if (dataVizVo.getXcolName().equals("pause_standar_column2")) {
            dataVizVo.setXcolInfo("pause_standar_column2_Lable");
            
         } else if (dataVizVo.getXcolName().equals("pause_standar_column3")) {
            dataVizVo.setXcolInfo("pause_standar_column3_Lable");
            
         } else if (dataVizVo.getXcolName().equals("pause_standar_column4")) {
            dataVizVo.setXcolInfo("pause_standar_column4_Lable");
            
         } else if (dataVizVo.getXcolName().equals("pause_standar_column5")) {
            dataVizVo.setXcolInfo("pause_standar_column5_Lable");
         } 
      }
      //범례가 들어간 그래프일때 사용되는 메서드.
      public void directMakeG(DataVizGroupVo dataVizGroupVo) {
         if(dataVizGroupVo.getXcolName().equals("pause_standar_column1")) {
            dataVizGroupVo.setXcolInfo("pause_standar_column1_Lable");            
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column2")) {
            dataVizGroupVo.setXcolInfo("pause_standar_column2_Lable");
            
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column3")) {
            dataVizGroupVo.setXcolInfo("pause_standar_column3_Lable");
            
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column4")) {
            dataVizGroupVo.setXcolInfo("pause_standar_column4_Lable");
            
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column5")) {
            dataVizGroupVo.setXcolInfo("pause_standar_column5_Lable");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column1")) {
            dataVizGroupVo.setX1colInfo("pause_standar_column1_Lable");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column2")) {
            dataVizGroupVo.setX1colInfo("pause_standar_column2_Lable");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column3")) {
            dataVizGroupVo.setX1colInfo("pause_standar_column3_Lable");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column4")) {
            dataVizGroupVo.setX1colInfo("pause_standar_column4_Lable");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column5")) {
            dataVizGroupVo.setX1colInfo("pause_standar_column5_Lable");
         } 
      }
      
      //info에 있는지 없는지 검사!!
      public void check(DataVizGroupVo dataVizGroupVo) {
         if(dataVizGroupVo.getXcolName().equals("pause_standar_column1")) {
            dataVizGroupVo.setXcolInfo("1");
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column2")) {
            dataVizGroupVo.setXcolInfo("1");
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column3")) {
            dataVizGroupVo.setXcolInfo("1");
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column4")) {
            dataVizGroupVo.setXcolInfo("1");
         } else if (dataVizGroupVo.getXcolName().equals("pause_standar_column5")) {
            dataVizGroupVo.setXcolInfo("1");
         } else
            dataVizGroupVo.setXcolInfo(null);
         
         System.out.println("tlqjfltqjf"+dataVizGroupVo.getXcolInfo());
         
         if(dataVizGroupVo.getX1colName().equals("pause_standar_column1")) {
            dataVizGroupVo.setX1colInfo("1");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column2")) {
            dataVizGroupVo.setX1colInfo("1");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column3")) {
            dataVizGroupVo.setX1colInfo("1");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column4")) {
            dataVizGroupVo.setX1colInfo("1");
         } else if (dataVizGroupVo.getX1colName().equals("pause_standar_column5")) {
            dataVizGroupVo.setX1colInfo("1");
         } else
            dataVizGroupVo.setX1colInfo(null);
      }
      
      //info에 있는지 없는지 검사!!
      public void checkBar(DataVizVo dataVizVo) {
         if(dataVizVo.getXcolName().equals("pause_standar_column1")) {
            dataVizVo.setXcolInfo("1");
         } else if (dataVizVo.getXcolName().equals("pause_standar_column2")) {
            dataVizVo.setXcolInfo("1");
         } else if (dataVizVo.getXcolName().equals("pause_standar_column3")) {
            dataVizVo.setXcolInfo("1");
         } else if (dataVizVo.getXcolName().equals("pause_standar_column4")) {
            dataVizVo.setXcolInfo("1");
         } else if (dataVizVo.getXcolName().equals("pause_standar_column5")) {
            dataVizVo.setXcolInfo("1");
         } else
            dataVizVo.setXcolInfo(null);            
         System.out.println("tlqjfltqjf"+dataVizVo.getXcolInfo());            
      }
      
    //변환 시키는 메서드!!! serviceImpl 보다보면 이 메서드가 사용된 것들이 있고 안되어있는 것들이 있는데
      //이유는 각각의 그래프 마다 받는 형태가 다르기 때문이다.
      public void run(List<DataVizVo> normalChart) throws JSONException {
         
         for(int i=0; i<normalChart.size(); i++ ) {
            System.out.println("노멀차트에 있는 값을 꺼내보자!"+normalChart.get(i).getXcolInfo());
            
            if(normalChart.get(i).getXcolInfo()!=null) {
            JSONObject jsonObj = new JSONObject (normalChart.get(i).getXcolInfo());
            //json object에 담긴 상태
                     
             try {
                     HashMap<String, String> rs = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
                      
                     System.out.println("==hashmap 출력==") ;
                     System.out.println(rs) ;
                      
                     System.out.println() ;                         
                                                     
                     System.out.println("==변수 출력==") ;
   
                     System.out.println(rs.get("0")) ;
                     System.out.println(rs.get("1")) ;
                                     
                     System.out.println("normalChart xcolName = "+normalChart.get(i).getXcolName());
                     normalChart.get(i).setXcolName(rs.get(""+normalChart.get(i).getXcolName())); //현재 map형태(rs)의 value 값을 찾아서 normalChart의 xcolName에 set 
                     System.out.println("normalChart xcolName = "+normalChart.get(i).getXcolName());
                 } catch (JsonParseException e) {
                     e.printStackTrace();
                 } catch (JsonMappingException e) {
                     e.printStackTrace();
                 } catch (IOException e) {
                     e.printStackTrace();
                 }
            }
         }
      }
}