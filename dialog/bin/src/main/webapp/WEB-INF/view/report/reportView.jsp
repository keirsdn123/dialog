<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="reportView">
   <div class="full_box wsize_90">
      <div class="under_title mb_5 mb_25">
         <p class="fl mt_5 "><span>|</span> 보고서 상세조회 </p>
      </div>
      <div class="cb"></div>
      <div class="photo_view">
         <div style="height:auto;">
            <!-- 타이틀 시작 -->
            <div class="photoview_header wsize_100">
               <div class="dataset_title wsize_100">
                  
                  <div class="dataset_titletext fl wsize_100" style="border: 1px solid #ddd; background-color:white; height:100%; box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);">
                     <div class="fl" style="width:3%; background-color:skyblue; height: 100%; font-size:1.2rem;">
                        <div style="margin:0 auto; height:100%; width:80%; color:white; margin-top: 20%;">
                           {{reportDataInfo.reportTypeNormalPaper}} <!-- 데이터 셋 타입 --></span>
                        </div>
                     </div>
                        
                     <div class ="fl mt_20 ml_30 wsize_90" style ="text-align:left;">                  
                        {{reportDataInfo.reportTitle}} <!-- 제목 -->
                     </div>
<!--                <span class="badge indigo ml_10 va_center fs20">{{value.typeNormalRegular}} 데이터 셋 타입</span> -->
                  </div>
               </div>
               <!-- 작성자 -->
               <div class="photo_Info pd_0 mt_30">
                  <span class="photowriter">작성자</span> <span class="photowriter_name fl ml_10">{{reportDataInfo.memberName}}({{reportDataInfo.memberId}})</span>
               </div>
               <div>
                  <div v-if="reportDataInfo.reportModDate !== null">
                     <!-- 마지막 수정일 -->
                     <div class="photo_Info fr mt_30">
                        <span class="photowriter">마지막 수정일</span> <span class="photowriter_name">{{reportDataInfo.reportModDate}}</span>
                     </div>
                     <!-- 구분선 -->
                     <div>
                        <p class="fr ml_15 mr_15 mt_30"><span>|</span></p>
                     </div>
                  </div>
                  <!-- 등록일 -->
                  <div class="photo_Info mt_30 fr">
                     <span class="photowriter">등록일</span> <span class="photowriter_name">{{reportDataInfo.reportEnrollDate}}</span>
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
               <span class="photowriter_name fl ml_10" v-for="cate in reportCateInfo">{{cate}}</span>
            </div>
            <!-- 조회수 -->
            <div class="hits">
               <span class="fl mr_5">조회수</span> <span class="fl mr_10">{{reportDataInfo.reportViews}}</span>
            </div>
            <div class="cb">
            </div>
            <!-- 등록일 -->
            
            <!-- 내용 표 -->
            <div>
               <table class="table table-ddd">
                  <colgroup>
                     <col width="150px" />
                          <col width="calc(50% - 150px)"/>
                  </colgroup>
                  <tr>
                     <th>첨부파일</th>
                     <td style="text-align:left;">
                        <a v-on:click="selectRFileDownload">{{reportDataInfo.originFileTitle}}</a>
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
                        <td>{{reportDataInfo.reportContent}}</td>
                     </tr>
                  </table>
<!--                   <textarea class="form-control wsize_100 fl" v-bind:value="value.vizRequests" readonly></textarea> -->
               </div>
            </div>
            
            <!-- 연관 데이터셋-->
            <div>
               <ul class="screat_num ta_left">
                  <li><span>|</span> 연관 데이터셋</li>
               </ul>
               <div class="payment_way3 ta_left wsize_100" id="style-3" style="height: 17vh; overflow:auto;">
                  <table class="table table-ddd01 fl wsize_100" style="font-weight:600;">
                     <tr class="active" >
                        <th class="text-center" style="width:50%;"><b>제목</b></th>
                        <th class="text-center" style="width:25%;"><b>작성자</b></th>
                        <th class="text-center" style="width:25%;"><b>등록일</b></th>
                     </tr>
                     <tr v-for="(list,index) in referenceDataSetList">
                         <td v-on:click="dataSetInfoView(list)">{{list.datasetName}}</td>
                             <td>{{list.memberName}}</td>
                             <td>{{list.dataEnrollDate}}</td>
                     </tr>
                  </table>
               </div>
            </div>
         </div>
         
            <div class="cb"></div>
            <!-- 버튼 -->
            <div class="photo_text" style="height:70px">
               <div class="fl">
                  <button type="button" class="btn btn-creat size_100" v-on:click="reportList">목록</button>
               </div>
                  
               <div class="fr">
                  <button type="button" class="btn btn-creat size_100" id="updateReport" v-on:click="updateReport(reportDataInfo.reportCode)">수정</button>
                  <button type="button" class="btn btn-creat size_100" id="deleteReport" v-on:click="deleteReport(reportDataInfo.reportCode)">삭제</button>
               </div>
               
                  
                        
            </div>
         </div>
      </div>                  
   </div>
   <form id="pageChange" method="post">
</form>
 <jsp:include page="/WEB-INF/view/report/script/reportViewScript.jsp"></jsp:include>