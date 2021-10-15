<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="datalistView">
   <div class="full_box wsize_90">
      <div class="under_title mb_5 mb_25">
         <p class="fl mt_5 "><span>|</span> 데이터셋 상세조회 </p>
      </div>
      <div class="cb"></div>
      <div class="photo_view">
         <div style="height:auto;">
            <!-- 타이틀 시작 -->
            <div class="photoview_header wsize_100">
               <div class="dataset_title wsize_100">
                  
                  <div class="dataset_titletext fl wsize_100" style="border: 1px solid #ddd; background-color:white; height:100%; box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);">
                     <div class="fl" style="background-color:skyblue; height: 100%; font-size:1.2rem;">
                        <div style="margin:0 auto; height:100%; width:80%; color:white; margin-top: 50%;">
                           {{normalDataInfo.typeNormalRegular}} <!-- 데이터 셋 타입 --></span>
                        </div>
                     </div>
                     
                     
                     <div class ="fl mt_20 ml_30">                  
                        {{normalDataInfo.datasetName}} <!-- 제목 -->
                     </div>
<!--                <span class="badge indigo ml_10 va_center fs20">{{value.typeNormalRegular}} 데이터 셋 타입</span> -->
                  </div>
               </div>
               <!-- 작성자 -->
               <div class="photo_Info pd_0 mt_30">
                  <span class="photowriter">작성자</span> <span class="photowriter_name fl ml_10">{{normalDataInfo.dataEnrollName}} ({{normalDataInfo.memberId}})</span>
               </div>
               
              <div>
               <div v-if="normalDataInfo.dataModDate !== null">
                  <!-- 마지막 수정일 -->
                  <div class="photo_Info fr mt_30">
                     <span class="photowriter">마지막 수정일</span> <span class="photowriter_name">{{normalDataInfo.dataModDate}}</span>
                  </div>
                  <!-- 구분선 -->
                  <div>
                     <p class="fr ml_15 mr_15 mt_30"><span>|</span></p>
                  </div>
               </div>
               <!-- 등록일 -->
               <div class="photo_Info mt_30 fr">
                  <span class="photowriter">등록일</span> <span class="photowriter_name">{{normalDataInfo.dataEnrollDate}}</span>
               </div>
            </div>
               <div class="cb"></div>
            </div>
            <!-- 타이틀 끝 -->
            
            <!-- 카테고리 -->
            <div class="photo_Info">      
               <span class="mr_10">카테고리</span>
            </div>
            <div class="photowriter">
              <span class="photowriter_name fl ml_10" v-for="cate in normalDataCateInfo">{{cate}}</span>
            </div>
            <!-- 조회수 -->
            <div class="hits">
               <span class="fl mr_5">조회수</span> <span class="fl mr_10">{{normalDataInfo.datasetViews}}</span>
            </div>
            <div class="cb">
            </div>
            <!-- 등록일 -->
            
            <!-- 내용 표 -->
            <div id = "fileContents">
               <table class="table table-ddd">
                  <colgroup>
                     <col width="150px" />
                     <col width="calc(50% - 150px)"/>
                  </colgroup>
                  <tr>
                     <th>출처</th>
                     <td style="text-align:left;">{{normalDataInfo.datasetFrom}}</td>
                  </tr>
                  <tr id="file">
                     <th>첨부파일</th>
                     <td style="text-align:left;">
                        <a v-on:click="selectDFileDownload">{{normalDataInfo.fileOriginalName}}</a>
                         ({{normalDataInfo.fileSize}}KB)
                     </td>
                  </tr>
               </table>
            </div>
           
            <div>
               <ul class="screat_num ta_left">
                  <li><span>|</span> 내용</li>
               </ul>
               <div class="payment_way3 ta_left" style="height: auto; border: 1px solid #e1e4e6">
<!--                   <input type="text" class="form-control wsize_100 fl" v-bind:value="value.vizRequests" readonly> -->
                  <table class="table fl wsize_100" style="font-family:'NanumGothic'">
                     <tr>
                        <td>{{normalDataInfo.datasetInfo}}</td>
                     </tr>
                  </table>
<!--                   <textarea class="form-control wsize_100 fl" v-bind:value="value.vizRequests" readonly></textarea> -->
               </div>
            </div>
            
             <div>
               <ul class="screat_num ta_left">
                  <li><span>|</span> 연관 보고서</li>
               </ul>
               <div class="payment_way3 ta_left wsize_100" id="style-3" style="height: 17vh; overflow:auto;">
                  <table class="table table-ddd01 fl wsize_100" style="font-weight:600;">
                     <tr class="active" >
                        <th class="text-center" style="width:50%;"><b>제목</b></th>
                        <th class="text-center" style="width:25%;"><b>작성자</b></th>
                        <th class="text-center" style="width:25%;"><b>등록일</b></th>
                     </tr>
                     <tr v-for="(list,index) in referenceDReportList">
                         <td v-on:click="reportInfoView(list.reportCode)">{{list.reportTitle}}</td>
                             <td>{{list.memberName}}</td>
                             <td>{{list.reportEnrollDate}}</td>
                     </tr>
                  </table>
               </div>
            </div>
         </div>
         
<!--          미리보기 -->
         <div class="mt_30 bg toggle_div file_preview" id="previewBar">
            <p class="ml_35 fl f_sq fw_b">미리보기</p>
            <p class="fr mt_7" id="down_icon"><i class="fa fa-angle-down"></i></p>
            <p class="fr mt_7" id="up_icon"><i class="fa  fa-angle-up"></i></p>
         </div>
                  
      <div id="style-3">
         
<!--             <table class="table table-gray" id="file_table"> -->
<!--                <tr> -->
<!--                   <th v-for="(columnName, columnIndex) in fileColNameList"> -->
<!--                      <label> -->
<!--                         <span class="custom-control-indicator"></span>  -->
<!--                         {{columnName}} -->
<!--                       </label> -->
<!--                   </th> -->
<!--                </tr> -->
<!--                <tr v-for="rowData in fileDataList"> -->
<!--                   <td v-for="colData in rowData">{{colData}}</td> -->
<!--                </tr> -->
<!--             </table> -->
            
<!--             시각화 된 데이터 미리보기 -->
            
         <!-- 정기데이터미리보기시작 -->
         <div id="regularPreview" class="dp_n1">  
               <div class="fl ta_left wsize_15">
               <div id="rawTableTree" style="overflow:auto;"></div>
            </div>
            
            <div class="fl wsize_85" style="max-height: 400px; overflow: auto;">
               <table class="table table-gray">
                  <tr>
                     <th v-for="infoRdc in infoRawDataColumn">{{infoRdc}}</th>
                  </tr>
                  <tr v-for="infoRdr in infoRawDataRecode">
                     <td v-for="rdr in infoRdr">{{rdr}}</td>
                  </tr>
               </table>
            </div>
         </div> 
         <!-- 정기데이터미리보기끝 -->         
      </div>
      <!--          시각화 데이터 미리보기 -->
         <div class="mt_20 bg toggle_div vDb_preview" id ="vDb_preview">
            <p class="ml_35 fl f_sq fw_b">미리보기</p> 
            <p class="fr mt_7" id="vDataDown_icon"><i class="fa fa-angle-down"></i></p>
            <p class="fr mt_7" id="vDataUp_icon"><i class="fa  fa-angle-up"></i></p>
             <p class ="fr mt_7 mr_10" style="font-size: 1.3vh">-실제 데이터가 다를수 있으며 50행까지만 지원합니다.-</p>
         </div>
       <!--       시각화 데이터 -->
      <div id="style-3" >
        <div id ="styleK" style="height:50vh; overflow:auto;">
          <table class="table table-gray" id="vData_table" >
               <tr>
                  <th v-for="(columnNme, columnIndex) in vColumnList">
                     <label>
                        <span class="custom-control-indicator"></span> 
                        {{columnNme}}
                      </label>
                  </th>
               </tr>
               <tr v-for="vData in vDataPreview">
                  <td v-for="vDataPreview in vData">{{vDataPreview}}</td>
               </tr>
            </table>
         </div>  
      </div>
         
         <div id ="mainVizBox">
            <div class="fl mt_15 ">
               <ul class="screat_num ta_left">
                  <li><span>|</span> 데이터 시각화</li>
               </ul>
            </div>
            <div class="cb"></div>
   <!--          그래프 들어간다. -->
            <div class="wsize_100 mt_30" style="height: auto;">
               <div class ="wsize_70 fl bd_r bd_l bd_bd" >
                  
                  
                  <div class ="wsize100fl" style="height:550px;">
                     <svg id="graph" width="100%" height="547" style="box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);">
                                    
                     </svg>
                  </div>
               </div>
               
               <div class ="wsize_30 fl" >
<!--                   <div class="wsize_100 fl" style="height: 50px;"> -->
                     
<!--                   </div> -->
                  
                  <div class ="wsize100fl" style="height: 457px;">
                <div class ="fl wsize_100">
							<!-- 범주값이 곧 x축 -->
                          <div class ="fl wsize_40" style="font-weight:bold">   
                              <span>ㅣ</span>범주값 선택
                           </div>
                           <label class ="fl wsize_40" style="background-color:skyblue; color:white; height:28px;" id="xcolTitle" name="xcolTitle">
                              
                           </label>
							<!--X버튼 누르게 되면 선택한 범주값이 없어지게 됨 -->
                           <a class ="fl" style ="background-color: skyblue; color: white; width:30px; height:28px;" v-on:click="delXValue">X</a>
                            <!--범주값들 10개 -->                                                                       
                           <div class ="fr wsize_90 mt_5 bd_bd bd_t" style="min-height:85px; height: 100px; overflow:auto;">                           
                              <div v-for="nme in  columnList" class="xcol" id="xcol1" value ="pause_standar_column1" v-on:click="takeXValue(nme.pauseStandarColumn1,col1,col1Info)">
                                  {{nme.pauseStandarColumn1}}
                                   <div class="xcolInfo" id="xcol1Info" style ="display:none;" value ="pause_standar_column1_lable"></div>
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id="xcol2" value ="pause_standar_column2" v-on:click="takeXValue(nme.pauseStandarColumn2,col2,col2Info)">
                                  {{nme.pauseStandarColumn2}}                                     
                                      <div class="xcolInfo" id="xcol2Info" style ="display:none;" value ="pause_standar_column2_lable"></div>
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id="xcol3" value ="pause_standar_column3" v-on:click="takeXValue(nme.pauseStandarColumn3,col3,col3Info)">
                                  {{nme.pauseStandarColumn3}}                                     
                                     <div class="xcolInfo" id="xcol3Info" style ="display:none;" value ="pause_standar_column3_lable"></div>
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id="xcol4" value ="pause_standar_column4" v-on:click="takeXValue(nme.pauseStandarColumn4,col4,col4Info)">
                                  {{nme.pauseStandarColumn4}}                                     
                                      <div class="xcolInfo" id="xcol4Info" style ="display:none;" value ="pause_standar_column4_lable"></div>
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id="xcol5" value ="pause_standar_column5" v-on:click="takeXValue(nme.pauseStandarColumn5,col5,col5Info)">
                                  {{nme.pauseStandarColumn5}}                                     
                                      <div class="xcolInfo" id="xcol5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>
                              </div>
                                                         
                              <div v-for="nme in  columnList" class="xcol" id ="xcol6" value ="pause_standar_column6" v-on:click="takeXValue(nme.pauseStandarColumn6,col6)">
                                  {{nme.pauseStandarColumn6}}                                  
<!--                                       <div class="xcolInfo" id="xcol6Info" style ="display:none;" value ="pause_standar_column6_lable"></div> -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id ="xcol7" value ="pause_standar_column7" v-on:click="takeXValue(nme.pauseStandarColumn7,col7)">
                                  {{nme.pauseStandarColumn7}}                                     
<!--                                       <div class="xcolInfo" id="xcol7Info" style ="display:none;" value ="pause_standar_column7_lable"></div> -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id ="xcol8" value ="pause_standar_column8" v-on:click="takeXValue(nme.pauseStandarColumn8,col8)">
                                  {{nme.pauseStandarColumn8}}                                     
<!--                                       <div class="xcolInfo" id="xcol8Info" style ="display:none;" value ="pause_standar_column8_lable"></div> -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id ="xcol9"  value ="pause_standar_column9" v-on:click="takeXValue(nme.pauseStandarColumn9,col9)">
                                  {{nme.pauseStandarColumn9}}                                     
<!--                                       <div class="xcolInfo" id="xcol9Info" style ="display:none;" value ="pause_standar_column9_lable"></div> -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="xcol" id ="xcol10" value ="pause_standar_column10" v-on:click="takeXValue(nme.pauseStandarColumn10,col10,col10Info)">
                                  {{nme.pauseStandarColumn10}}                                     
<!--                                       <div class="xcolInfo" id="xcol10Info" style ="display:none;" value ="pause_standar_column10_lable"></div> -->
                              </div>             
                           </div>
                           
                           <div class ="fl wsize_40 mt_5" style="font-weight:bold">   
                              <span>ㅣ</span>수치값 선택
                           </div>
                           
                           <label class ="fl wsize_40 mt_5" style="background-color:skyblue; color:white; height:28px;" id="ycolTitle" name="ycolTitle">
                           
                           </label>
                           
                           <a class ="fl mt_5" style ="background-color: skyblue; color: white; width:30px; height:28px;" v-on:click="delYValue">X</a>
                           
                           <div class ="fr wsize_90" style="margin-top:5px;">
                                     
                           <div class ="fl wsize_100 mt_5 bd_bd bd_t" style="min-height:85px; height: 100px; overflow:auto;">                           
                              <div v-for="nme in  columnList" class="ycol" id="ycol1" value ="pause_standar_column1" v-on:click="takeYValue(nme.pauseStandarColumn1,col1,col1Info)">
                                  {{nme.pauseStandarColumn1}}
                                    <div class="ycolInfo" id="ycol1Info" style ="display:none;" value ="pause_standar_column1_lable"></div>                                                      
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id="ycol2" value ="pause_standar_column2" v-on:click="takeYValue(nme.pauseStandarColumn2,col2,col2Info)">
                                  {{nme.pauseStandarColumn2}}                                     
                                    <div class="ycolInfo" id="ycol2Info" style ="display:none;" value ="pause_standar_column2_lable"></div>  
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id="ycol3" value ="pause_standar_column3" v-on:click="takeYValue(nme.pauseStandarColumn3,col3,col3Info)">
                                  {{nme.pauseStandarColumn3}}                                     
                                    <div class="ycolInfo" id="ycol3Info" style ="display:none;" value ="pause_standar_column3_lable"></div>  
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id="ycol4" value ="pause_standar_column4" v-on:click="takeYValue(nme.pauseStandarColumn4,col4,col4Info)">
                                  {{nme.pauseStandarColumn4}}
                                    <div class="ycolInfo" id="ycol4Info" style ="display:none;" value ="pause_standar_column4_lable"></div>                                       
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id="ycol5" value ="pause_standar_column5" v-on:click="takeYValue(nme.pauseStandarColumn5,col5,col5Info)">
                                  {{nme.pauseStandarColumn5}}                                     
                                    <div class="ycolInfo" id="ycol5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>  
                              </div>
                                                         
                              <div v-for="nme in  columnList" class="ycol" id ="ycol6" value ="pause_standar_column6" v-on:click="takeYValue(nme.pauseStandarColumn6,col6)">
                                  {{nme.pauseStandarColumn6}}                                  
<!--                                     <div class="ycolInfo" id="ycol6Info" style ="display:none;" value ="pause_standar_column6_lable"></div>   -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id ="ycol7" value ="pause_standar_column7" v-on:click="takeYValue(nme.pauseStandarColumn7,col7)">
                                  {{nme.pauseStandarColumn7}}                                     
<!--                                     <div class="ycolInfo" id="ycol7Info" style ="display:none;" value ="pause_standar_column7_lable"></div>   -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id ="ycol8" value ="pause_standar_column8" v-on:click="takeYValue(nme.pauseStandarColumn8,col8)">
                                  {{nme.pauseStandarColumn8}}
<!--                                     <div class="ycolInfo" id="ycol8Info" style ="display:none;" value ="pause_standar_column8_lable"></div>                                       -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id ="ycol9"  value ="pause_standar_column9" v-on:click="takeYValue(nme.pauseStandarColumn9,col9)">
                                  {{nme.pauseStandarColumn9}}                                     
<!--                                     <div class="ycolInfo" id="ycol9Info" style ="display:none;" value ="pause_standar_column9_lable"></div>   -->
                              </div>
                              
                              <div v-for="nme in  columnList" class="ycol" id ="ycol10" value ="pause_standar_column10" v-on:click="takeYValue(nme.pauseStandarColumn10,col10)">
                                  {{nme.pauseStandarColumn10}}                                     
<!--                                     <div class="ycolInfo" id="ycol10Info" style ="display:none;" value ="pause_standar_column10_lable"></div>   -->
                              </div>
                                          
                           </div>
                        </div>

               <div class ="fl wsize_40 mt_5" style="font-weight:bold">   
                     <span>ㅣ</span>범례값 선택
               </div>
                     <label type="text" class ="fl wsize_40 mt_5" style="background-color:skyblue; color:white; height:28px;" id="x1colTitle" name="x1colTitle">
                     
                     </label>
                     <a class ="fl mt_5" style ="background-color: skyblue; color: white; width:30px; height:28px;" v-on:click="delZValue">X</a>
                <div class ="fr wsize_90" style="margin-top:5px;">                                                                                            
                      <div class ="fl wsize_100 mt_5 bd_bd bd_t" style="min-height:85px; height: 100px; overflow:auto;">                           
                         <div v-for="nme in  columnList" class="x1col" id="zcol1" value ="pause_standar_column1" v-on:click="takeZValue(nme.pauseStandarColumn1,col1,col1Info)">
                             {{nme.pauseStandarColumn1}}
                             <div class="x1colInfo" id="x1col1Info" style ="display:none;" value ="pause_standar_column1_lable"></div>                                                      
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol2" value ="pause_standar_column2" v-on:click="takeZValue(nme.pauseStandarColumn2,col2,col2Info)">
                             {{nme.pauseStandarColumn2}}                                     
                             <div class="x1colInfo" id="x1col2Info" style ="display:none;" value ="pause_standar_column2_lable"></div>   
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol3" value ="pause_standar_column3" v-on:click="takeZValue(nme.pauseStandarColumn3,col3,col3Info)">
                             {{nme.pauseStandarColumn3}}
                             <div class="x1colInfo" id="x1col3Info" style ="display:none;" value ="pause_standar_column3_lable"></div>                                    
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol4" value ="pause_standar_column4" v-on:click="takeZValue(nme.pauseStandarColumn4,col4,col4Info)">
                             {{nme.pauseStandarColumn4}}
                             <div class="x1colInfo" id="x1col4Info" style ="display:none;" value ="pause_standar_column4_lable"></div>                                  
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol5" value ="pause_standar_column5" v-on:click="takeZValue(nme.pauseStandarColumn5,col5,col5Info)">
                             {{nme.pauseStandarColumn5}}
                             <div class="x1colInfo" id="x1col5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>                                     
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol6" value ="pause_standar_column6" v-on:click="takeZValue(nme.pauseStandarColumn6,col6)">
                             {{nme.pauseStandarColumn6}}
<!--                              <div class="x1colInfo" id="x1col5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>                                      -->
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol7" value ="pause_standar_column7" v-on:click="takeZValue(nme.pauseStandarColumn7,col7)">
                             {{nme.pauseStandarColumn7}}
<!--                              <div class="x1colInfo" id="x1col5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>                                      -->
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol8" value ="pause_standar_column8" v-on:click="takeZValue(nme.pauseStandarColumn8,col8)">
                             {{nme.pauseStandarColumn8}}
<!--                              <div class="x1colInfo" id="x1col5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>                                      -->
                         </div>
                         
                          <div v-for="nme in  columnList" class="x1col" id="zcol9" value ="pause_standar_column9" v-on:click="takeZValue(nme.pauseStandarColumn9,col9)">
                             {{nme.pauseStandarColumn9}}
<!--                              <div class="x1colInfo" id="x1col5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>                                      -->
                         </div>
                         
                         <div v-for="nme in  columnList" class="x1col" id="zcol10" value ="pause_standar_column10" v-on:click="takeZValue(nme.pauseStandarColumn10,col10)">
                             {{nme.pauseStandarColumn10}}
<!--                              <div class="x1colInfo" id="x1col5Info" style ="display:none;" value ="pause_standar_column5_lable"></div>                                      -->
                         </div>                                                                                         
                      </div>  
               </div>
                                                                  
               
                     
                  <div class ="fl wsize_100 mt_5">
                   <div class ="fl wsize_40" style="font-weight: bold;">   
                              <span>ㅣ</span>조건값 선택
                           </div>
                  
                        <select class="wsize_80" id="condition" name="condition" v-model = "condition">
                            <option value="0" selected>
                              조건선택
                           </option>   
                        
                           <option value = "1">
                               SUM                               
                           </option>
                           
                           <option value = "2">
                               AVG                                     
                           </option>
                           
                           <option value = "3">
                               MAX                                  
                           </option>
                           
                           <option value = "4">
                               MIN                                  
                           </option>
                           
                           <option value = "5">
                               COUNT                                     
                           </option>
                        </select>
   
                  </div>
                           
                           
                     
                  <div class ="fl wsize_100 mt_20"  v-for="nme in columnList">      
                     <div class="wsize_40 ml_20"> 그래프 종류 선택 </div>
                     <div></div>   
                     
                     <!--bar Chart 버튼 -->                     
                     <div class ="wsize_5 fl ml_40 hsize_100" style="min-width:33px;" v-for="nme in  columnList">
                        <button type="button" v-on:click="makeChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="barChart" class ="wsize_100 hsize_100 bgwhite" style="border: none;">
                           <img src ="/resources/img/chart/bar.png" class="wsize_100 hsize_100">
                        </button>               
                     </div>
                     
                                 
                     <!--Area Chart 버튼 -->
                     <div class ="wsize_5 fl hsize_100 ml_10" style="min-width:33px;" v-for="nme in  columnList">
                        <button type="button" v-on:click="areaChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="areaChart" class ="wsize_100 hsize_100 bgwhite" style="border: none;">
                           <img src ="/resources/img/chart/areaChart.png" class="wsize_100 hsize_100">
                        </button>
                     </div>
                     
                     <!-- 다중 Line Chart 버튼 -->
                     <div class ="wsize_5 fl hsize_100 ml_10" style="min-width:33px;" v-for="nme in  columnList">
                        <button type="button" v-on:click="stackAreaChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="stackAreaChart" class ="wsize_100 hsize_100 bgwhite" style="border: none;">
                           <img src ="/resources/img/chart/lineCharts.png" class="wsize_100 hsize_100">
                        </button>
                     </div>
                     
                     <!--Pie Chart 버튼 -->
                     <div class ="wsize_5 fl hsize_100 ml_10" style="min-width:33px;" v-for="nme in  columnList">
                        <button type="button" v-on:click="pieChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="pieChart" class ="wsize_100 hsize_100 bgwhite" style="border: none;">
                           <img src ="/resources/img/chart/pie.png" class="wsize_100 hsize_100">
                        </button>
                     </div>
                     
                     <!--Donut Chart 버튼 -->
                     <div class ="wsize_5 fl hsize_100 ml_10" style="min-width:33px;" v-for="nme in  columnList">
                        <button type="button" v-on:click="donutChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="donutChart"  class ="wsize_100 hsize_100 bgwhite" style="border: none;">
                           <img src ="/resources/img/chart/donut.png" class="wsize_100 hsize_100">
                        </button>
                     </div>
                     
                     <!--GroupBar Chart 버튼 -->
                     <div class ="wsize_5 fl hsize_100 ml_10" style="min-width:33px;" v-for="nme in  columnList">
                        <button type="button" v-on:click="groupChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="groupChart" class ="wsize_100 hsize_100 bgwhite" style="border: none;">
                           <img src ="/resources/img/chart/group.png" class="wsize_100 hsize_100">
                        </button>
                     </div>
                                        
                         </div>        
                        </div>
                                                                      
                    </div>
               </div>
            </div>
         <div class="cb"></div>
         <!-- 버튼 -->
      </div>
   </div>
    <div class="photo_text" style="height:70px">   
            <div class="fl">
               <button type="button" v-on:click="dataSetList" class="btn btn-creat size_100">목록</button>
                           </div>    
<!--             <div v-if="memberRatingCode == 3"> -->
<!--                 <button type="button"  v-on:click="dataSetDelete(dataCode)"class="btn btn-creat size_100 fr">삭제</button> -->
<!--          </div>   -->
            <div class="fr" v-if="normalDataInfo.memberCode == memberCode" >
               <button type="button" v-if="normalDataInfo.status=='S'" data-toggle="modal" data-placement="bottom" title="승인거부사유" data-target="#requestViz" class="btn btn-creat size_130 fr">시각화 요청</button>
               <label v-if="normalDataInfo.status=='P'" class="btn-display size_180 fr">시각화 요청 중</label>
               <label v-if="normalDataInfo.status=='N'" class="btn-display wsize_100 fr"><font color="red">다이얼로그 기준 '파일 유효성' 만족하지 않으므로 시각화 서비스를 이용할 수 없습니다.</font></label>
            </div>         
    </div>
   <jsp:include page="/WEB-INF/view/dataSet/popup/dataSetVizRequestPopup.jsp"></jsp:include>                             
</div>
</div>
<form id="pageChange" method="post"></form>
<jsp:include page="/WEB-INF/view/dataSet/script/dataSetVizScript.jsp"></jsp:include>                      