<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="myDataList">
   <div class="full_box wsize_90">
      <div class="under_title mb_5 ">
         <p class="fl mt_5">
            <span>|</span> 나의 Data
         </p>
      </div>
      <!--          <div class="under_title mb_5 fr"> -->
      <!--검색-->

      <!--          </div> -->
      <!--탭-->
      <div class="inner_tab">
         <ul class="nav nav-tabs inner_tab_menu wsize_70" id="teacher_tab"
            role="tablist">
            <li class="nav-item"><a class="nav-link active show"
               style="border-bottom: 0 !important;" id="now-tab" data-toggle="tab"
               href="#data_list" role="tab" aria-controls="home"
               aria-selected="true">등록한 데이터</a></li>
            <li class="nav-item"><a class="nav-link"
               style="border-bottom: 0 !important;" id="last-tab"
               data-toggle="tab" href="#teacher_list_last" role="tab"
               aria-controls="profile" aria-selected="false">등록한 보고서</a></li>
         </ul>
         <div class="tab-content" id="teacher_tabContent">
            <!--등록한 데이터 -->
            <div class="tab-pane fade show active" id="data_list"
               role="tabpanel" aria-labelledby="now-tab">
               <div class="cb bd_d"></div>
          			<div class="ml_060 wsize_50 mt_30">
       					<input type="name" class="form-control search_box wsize_60"
           				id="inputPassword" placeholder="검색어 입력" v-model="dataSetSearchWrd">
       					<button type="button" class="btn search-btn wsize_20" v-on:click="searchMyDataSet()">검색</button>
      				</div>
               <table class="table table-board mt_70">
                 <colgroup>
			 		<col width="10%;" />
					<col width="50%;" />
					<col width="10%;" />
					<col width="30%;" />
                 </colgroup>
           		 <tr>
                 	<th>NO</th>
                 	<th>제목</th>
                 	<th>시각화 여부</th>
                 	<th>등록일</th>
                 </tr>
                 <tr v-for="(list,index) in selectMydataSetList">
                    <td>{{myDataSet.records-(myDataSet.currentPage-1)*myDataSet.perPage-index}}</td>
                    <td class="text-left" ><a v-on:click="mydataSetListView(list.dataCode, list.typeNormalRegularly)">{{list.datasetName}}</a></td>
					<td>{{list.vizWhether}}</td>
				   	<td>{{list.dataEnrollDate}}</td>
                </tr> 
               </table>
				<!--페이징 -->
				<div class="buttons mt_35">
					<nav aria-label="pagination example" class="dis_in">
						<b-pagination ref="myDataSet" for="table" align="center" size="md" :total-rows="myDataSet.records" v-model="myDataSet.currentPage" :per-page="myDataSet.perPage"  v-show="myDataSet.records > 0" limit="10"> </b-pagination>
					</nav>               
           		</div>
            </div>
            <!--등록한 보고서-->
            <div class="tab-pane fade" id="teacher_list_last" role="tabpanel"
               aria-labelledby="last-tab">
               <div class="cb bd_d"></div>
           			<div class="ml_060 wsize_50 mt_30">
       					<input type="name" class="form-control search_box wsize_60"
           				id="inputPassword" placeholder="검색어 입력" v-model="reportSearchWrd">
       					<button type="button" class="btn search-btn wsize_20" v-on:click="searchMyReport()">검색</button>
      				</div>
               <table class="table table-board mt_70">
					<colgroup>
						<col width="10%;" />
						<col width="50%;" />
						<col width="10%;" />
						<col width="30%;" />
					</colgroup>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>종류</th>
						<th>등록일</th>
					</tr>
		            <tr v-for="(list,index) in selectMyReportList">
						<td>{{myReport.records-(myReport.currentPage-1)*myReport.perPage-index}}</td>
						<td class="text-left" ><a v-on:click="myReportListView(list.reportCode)">{{list.reportTitle}}</a></td>
						<td>{{list.reportTypeNormalPaper}}</td>
						<td>{{list.reportEnrollDate}}</td>
					</tr> 
               </table>
				<!--페이징 -->
				<div class="buttons mt_35">
					<nav aria-label="pagination example" class="dis_in">
						<b-pagination ref="myReport" for="table" align="center" size="md" :total-rows="myReport.records" v-model="myReport.currentPage" :per-page="myReport.perPage"  v-show="myReport.records > 0" limit="10"> </b-pagination>
					</nav>               
           		</div>
            </div>
            <form id="pageChange" method="post">
		   </form>
         </div>
      </div>
   </div>
</div>

<jsp:include page="/WEB-INF/view/user/myData/script/myDataListScript.jsp"></jsp:include>
