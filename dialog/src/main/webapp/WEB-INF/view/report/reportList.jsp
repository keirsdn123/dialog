<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="full_box wsize_90"  id="reportList">			
	    <div class="under_title mb_5 ">
					<p class="fl mt_5"><span>|</span> 보고서 목록조회 </p>
		</div>
		<div id="tab1" class="tabcontent current">
			<div class ="wsize_100 fl mt_20" id ="current" style="height:600px;">											
				<!-- 카테고리 시작 -->
				<div class ="wsize_20 fl" id ="cateCon" style="margin:0 auto; height:100%; border: 1px solid #ddd;box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);">
					<table class="table table-gray table-hover">
						<tbody>															
							<tr v-for="list in selectCategory" v-bind:class="[categorySeq==list.categorySeq ? 'table-gray-active' : '']" >													
								<td class="text-left td-click" v-on:click="reportCate(list.categorySeq)">{{list.categoryNme}}</td>							
							</tr>
						</tbody>
					</table>
				</div>
					
				<div class="wsize_78 hsize_100 fl ml_20">		
					<div class="wsize_100 fr mt_12">
						 <button type="button" class="btn search-btn size_100 fr" v-on:click ="selectDtSearchDataSet()">검색</button>
						 <input type="name" class="form-control search_box wsize_50 fr mr_10" id="inputPassword" v-model="reportSearchWrd" placeholder="검색어 입력">
						 <select class="form-control class_select fr mr_10 wsize_20" v-model="reportSort">
						 	<option value="2" selected = "[reportSort == 2 ? 'selected':'']">제목</option>
							<option value="1" selected = "[reportSort == 1 ? 'selected':'']">작성자</option>
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
							<th>타입</th>					
					     </tr>
					     <tr v-for="(list,index) in selectReportList">
					             <td>{{pagingInfo.records-(pagingInfo.currentPage-1)*pagingInfo.perPage-index}}</td>
					             <td class="text-left"><a v-on:click="reportListView(list.reportCode)">{{list.reportTitle}}</a></td>
					             <td>{{list.memberName}}</td>
					              <td>{{list.reportEnrollDate}}</td>
								<td>{{list.reportTypeNormalPaper}}</td>
					     </tr>
					     </table>
				      	 <a class="btn btn-creat mt_15 size_100 fr" role="button" v-on:click="goReportInsert()">등록</a>
				      	 <!--//목록-->
						 <div class="cb"></div>
						 <form id="pageChange" method="post"></form>
					</div>
				</div>	
								
				<div class="buttons mt_35">
					<nav aria-label="pagination example" class="dis_in">
						<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage"
									limit="10">
   						</b-pagination>
					</nav>					
				</div>
								
			</div>
		</div>
	</div>
 <form id="pageChange" method="post"></form>
 
<jsp:include page="/WEB-INF/view/report/script/reportListScript.jsp"></jsp:include>
