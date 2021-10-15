<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div>
		<div class="full_box wsize_90" id="dataSetVizRequest">
		    <div class="under_title mb_5 ">
				<p class="fl mt_5"><span>|</span> 시각화 요청 </p>
			</div>
			<button type="button" class="fr btn search-btn3" v-on:click="selectApprovalVizRequest()">검색</button>
			<input type="name" class="fr form-control search_box width_030"
			id="inputPassword" placeholder="검색어 입력" v-model="vizSearchWrd">
			<div class="inner_tab mt_30">
				<div class="fr">
					<a v-on:click="vizDataSort(0)">전체</a> | 
					<a v-on:click="vizDataSort(1)">승인 대기</a> | 
					<a v-on:click="vizDataSort(2)">승인 완료</a> |
					<a v-on:click="vizDataSort(3)">승인 거부</a>
				</div>
				<table class="table table-board mt_10">
		          	<colgroup>
						<col width="10%;" />
						<col width="50%;" />
						<col width="25%;" />
						<col width="15%;" />
					</colgroup>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>날짜</th>
						<th>상태</th>
					</tr>
			     	<tr v-for="(list,index) in selectMyVizRequestList">
		             	<td>{{myVizRequest.records-(myVizRequest.currentPage-1)*myVizRequest.perPage-index}}</td>
		             	<td class="text-left"><a v-on:click="infoVizlist(list.dataCode)">{{list.datasetName}}</a></td>
		              	<td>{{list.dataEnrollDate}}</td>
		             		<td class="text_red" v-if="list.status == 'P'">승인대기 중</td>
						<td class="text_red" v-if="list.status == 'Y'">승인완료</td>
						<td class="text_red" v-if="list.status == 'R'">승인거부</td>
				   </tr>
	            </table>
				<!-- 페이징 -->
   				<div class="buttons mt_35">
					<nav aria-label="pagination example" class="dis_in">
						<b-pagination ref="myVizRequest" for="table" align="center" size="md" :total-rows="myVizRequest.records" v-model="myVizRequest.currentPage" :per-page="myVizRequest.perPage"  v-show="myVizRequest.records > 0" limit="10"> </b-pagination>
					</nav>               
           		</div>
            <form id="pageChange" method="post"></form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/dataSetVisualRequestScript.jsp"></jsp:include>