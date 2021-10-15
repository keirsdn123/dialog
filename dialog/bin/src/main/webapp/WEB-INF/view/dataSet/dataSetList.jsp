<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <div class="full_box wsize_90"  id="datasetList">
          <div class="under_title mb_5 ">
            <ul class="tab">
               <li class="current" data-tab="tab1"><a href="#">카테고리</a></li>
               <li data-tab="tab2"><a href="#">뉴스</a></li>                     
            </ul>               
         </div>
          <div class="under_title mb_5 ">
                  <p class="fl mt_5"><span>|</span> 데이터 목록조회 </p>
         </div>
      <div id="tab1" class="tabcontent current">
         <div class ="wsize_100 fl mt_20" id ="current"style="height:600px;">                                 
               <!-- 카테고리 시작 -->
               <div class ="wsize_20 fl" id ="cateCon" style="margin:0 auto; height:100%; border: 1px solid #ddd; font-family:JejuGothic; box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);">
                  <table class="table table-gray table-hover">                                                
                     <tr v-for="list in selectCategory" v-bind:class="[categorySeq==list.categorySeq ? 'table-gray-active' : '']" >                                                
                        <td class="text-left cs-pointer" v-on:click="datasetCate(list.categorySeq)">{{list.categoryNme}}</td>                     
                     </tr>
                  </table>                     
               </div>
            <div class="wsize_78 hsize_100 fl ml_20">      
               <div class="wsize_100 fr mt_12">
                   <button type="button" class="btn search-btn size_100 fr" v-on:click="searchSelectDataSet()">검색</button>
                   <input type="name" class="form-control search_box wsize_50 fr mr_10" id="inputPassword" placeholder="검색어 입력" v-model="dataSetSearchWrd"  >
                   <select class="form-control class_select fr mr_10 wsize_20" v-model="dataSetSearchType">
                        <option v-bind:value="'dataSetWriter'">작성자</option>
                        <option v-bind:value="'dataSetTitle'">제목</option>
                  </select>                        
               </div>
               <div class="cb"></div>
               <div class="wsize_100 mt_30" style="height:80%;">
                  <table class="table table-board ">
                          <colgroup>
                              <col width="80px;" />
                             <col width="300px" />
                             <col width="100px;" />
                             <col width="100px;" />
                          <col width="100px;" />
                             <col width="100px;" />
                         </colgroup>
                    <tr>
                      <th>NO</th>
                       <th>제목</th>
                       <th>작성자</th>
                        <th>날짜</th>
                     <th>시각화여부</th>
                     <th>타입</th>
                    </tr>
                    <tr v-for="(list,index) in selectDatasetList">
                         <td>{{index+((dataSetList.currentPage-1)*dataSetList.perPage)+1}}</td>
                         <td class="text-left"><a v-on:click="dataSetListView(list.dataCode, list.typeNormalRegularly)">{{list.datasetName}}</a></td>
                         <td>{{list.memberName}}</td>
                         <td>{{list.dataEnrollDate}}</td>
                      <td v-if="list.vizWhether == 'N'">NO</td>
                      <td v-if="list.vizWhether == 'Y'">YES</td>
                      <td>{{list.typeNormalRegularly}}</td>
                    </tr>
                    </table>
                    <a v-on:click="dataSetInsertView()"  class="btn btn-creat mt_15 size_100 fr" role="button">등록</a>
                      <div class="cb"></div>
                     <!--페이징 -->
                   <div class="buttons">
                     <nav aria-label="pagination example" class="dis_in">
                        <b-pagination ref="dataSetTable" for="table" align="center" size="md" :total-rows="dataSetList.records" v-model="dataSetList.currentPage" :per-page="dataSetList.perPage" v-show="dataSetList.records > 0" limit="10"> </b-pagination>
                     </nav>               
                     </div>
                      <!--//목록-->
                   <div class="cb"></div>
                   <form id="pageChange" method="post"></form>
               </div>
            </div>                     
         </div>
      </div>
      <div id="tab2" class="tabcontent">
         <div class="wsize_100 hsize_100 fl ml_20">      
               <div class="wsize_100 fr mt_20">
                   <button type="button" class="btn search-btn size_100 fr" v-on:click="searchSelectDataSetNews()">검색</button>
                   <input type="name" class="form-control search_box wsize_50 fr mr_10" id="inputPassword" placeholder="검색어 입력" v-model="dataSetSearchWrd" >
                   <select class="form-control class_select fl wsize_20" v-model="dataSetSearchType">
                     <option v-bind:value="'dataSetTitle'">제목</option>
                     <option v-bind:value="'dataSetWriter'">작성자</option>
                  </select>
               </div>
               <div class="cb"></div>
               <div class="wsize_100 mt_30" style="height:80%;">
               <table class="table table-board ">
                       <colgroup>
                           <col width="80px;" />
                          <col width="300px" />
                          <col width="100px;" />
                          <col width="100px;" />
                       <col width="100px;" />
                          <col width="100px;" />
                      </colgroup>
                    <tr>
                         <th>NO</th>
                       <th>제목</th>
                       <th>작성자</th>
                        <th>날짜</th>
                     <th>시각화여부</th>
                     <th>타입</th>
                    </tr>
                    <tr v-for="(list,index) in selectDatasetNewsList">
                        <td>{{dataSetNewsList.records-(dataSetNewsList.currentPage-1)*dataSetNewsList.perPage-index}}</td>
                        <td class="text-left"><a v-on:click="dataSetListView(list.dataCode, list.typeNormalRegularly)">{{list.datasetName}}</a></td>
                        <td>{{list.memberName}}</td>
                        <td>{{list.dataEnrollDate}}</td>
                     <td v-if="list.vizWhether == 'N'">NO</td>
                     <td v-if="list.vizWhether == 'Y'">YES</td>
                     <td>{{list.typeNormalRegularly}}</td>
                    </tr>
                    </table>
                    <a v-on:click="dataSetInsertView()"  class="btn btn-creat mt_15 size_100 fr" role="button">등록</a>
                   <div class="cb"></div>
                  <!--페이징 -->
                   <div class="buttons">
                     <nav aria-label="pagination example" class="dis_in">
                        <b-pagination ref="dataSetNewsTable" for="table" align="center" size="md" :total-rows="dataSetNewsList.records" v-model="dataSetNewsList.currentPage" :per-page="dataSetNewsList.perPage"  v-show="dataSetNewsList.records > 0" limit="10"> </b-pagination>
                     </nav>               
                     </div>
               </div>
          </div>                  
      </div>
   </div>
 <form id="pageChange" method="post"></form>
<jsp:include page="/WEB-INF/view/dataSet/script/dataSetListScript.jsp"></jsp:include>