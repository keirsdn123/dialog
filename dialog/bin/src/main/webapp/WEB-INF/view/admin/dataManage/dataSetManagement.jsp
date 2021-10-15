<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 미리보기 토글 -->
<script>
   $(document).ready(function(){
      $("#file_table").hide();
      $("#up_icon").hide();
      
      $(".file_preview").click(function(){
         $("#file_table").toggle();
         $("#up_icon").toggle();
         $("#down_icon").toggle();
//          $("#down_icon").css("display","none");
//          $("#up_icon").css("display","block");
       });
   });
</script>

<div id="datacheck">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 mb_25">
			<p class="fl mt_5 "><span>|</span> 시각화 요청 데이터 셋 DB화 </p>
		</div>
		<div class="cb"></div>
		<div class="photo_view">
			<div style="height:auto;">
				<!-- 타이틀 시작 -->
				<div class="photoview_header wsize_100">
					<div class="dataset_title wsize_100">
						
						<div class="dataset_titletext fl wsize_100" style="border: 1px solid #ddd; background-color:white; height:100%; box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);">
							<div class="fl" style="background-color:skyblue; height: 100%; font-size:1.2rem;">
								<div style="margin:0 auto; height:100%; width:80%; color:white; margin-top: 50%; display:table;">
									{{normalDataInfo.typeNormalRegular}} <!-- 데이터 셋 타입 -->
								</div>
							</div>
							
							
							<div class ="fl mt_20 ml_30">						
								{{normalDataInfo.datasetName}} <!-- 제목 -->
							</div>
<!-- 					<span class="badge indigo ml_10 va_center fs20">{{value.typeNormalRegular}} 데이터 셋 타입</span> -->
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
					<span class="fl mr_5">조회수</span> <span class="photowriter_name fl mr_10">{{normalDataInfo.datasetViews}}</span>
				</div>
				<div class="cb">
				</div>
				
				<!-- 내용 표 -->
				<div>
					<table class="table table-ddd01">
						<colgroup>
							<col width="150px" />
		                    <col width="calc(50% - 150px)"/>
						</colgroup>
						<tr>
							<th>출처</th>
							<td>{{normalDataInfo.datasetFrom}}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<a v-on:click="selectFileDownload">{{normalDataInfo.fileOriginalName}}</a>
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
						<table class="table fl wsize_100" style="font-family:'NanumGothic'">
						   <tr>
						      <td>{{normalDataInfo.datasetInfo}}</td>
						   </tr>
						</table>
					</div>
				</div>
				<!-- 시각화 요청 내용 -->
				<div>
					<ul class="screat_num ta_left">
						<li><span>|</span> 시각화 요청 내용</li>
					</ul>
					<div class="payment_way3 ta_left" style="height: auto;">
						<table class="table table-ddd01 fl wsize_100" style="font-weight:600;">
							<tr>
								<td>{{normalDataInfo.vizRequests}}</td>
							</tr>
						</table>
					</div>
					<ul class="screat_num ta_left mt_5" v-if="rejectFlag==1">
						<li><span>|</span> 승인 거부 사유</li>
					</ul>
					<div class="payment_way3 ta_left" style="height: auto;" v-if="rejectFlag==1">
						<table class="table table-ddd01 fl wsize_100" style="font-weight:600;">
							<tr v-if="rejectFlag==1">
								<td>{{normalDataInfo.rejectReason}}</td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<ul class="screat_num ta_left">
						<li><span>|</span> 연관 보고서</li>
					</ul>
					<div class="payment_way3 ta_left" style="height: auto;">
						<table class="table table-ddd01 fl wsize_100" style="font-weight:600;">
							<tr class="active" >
								<th class="text-center" style="width:50%;"><b>제목</b></th>
								<th class="text-center" style="width:25%;"><b>작성자</b></th>
								<th class="text-center" style="width:25%;"><b>등록일</b></th>
							</tr>
							<tr v-for="(list,index) in referenceReportList">
						 		<td v-on:click="reportInfoView(list.reportCode)">{{list.reportTitle}}</td>
			              		<td>{{list.memberName}}</td>
			              		<td>{{list.reportEnrollDate}}</td>
							</tr>
						</table>
					</div>
				</div>
				
				
			</div>
			
			<!-- 미리보기 -->
			<div class="mt_30 bg toggle_div file_preview">
				<p class="ml_35 fl f_sq fw_b">미리보기</p>
				<p class="fr mt_7" id="down_icon"><i class="fa fa-angle-down"></i></p>
				<p class="fr mt_7" id="up_icon"><i class="fa  fa-angle-up"></i></p>
				<p class="mr_20 fr f_sq font_8 mt_7">※표준화된 데이터로 실제 파일 데이터와 다를 수 있으며, 10행까지 제공됩니다.</p>
			</div>
			
			<div id="style-3" class="wsize_100 table_sc_preview">
				<table class="table table-gray" id="file_table">
					<thead>
						<tr v-if="rejectFlag==0">
							<td v-for="(columnType, index) in fileColTypeList" nowrap="nowrap">
								<select class="form-control" :id="'colType'+index">
									<option value="INT" v-if="columnType=='INT'">INT</option>
									<option value="DOUBLE" v-if="columnType=='INT' || columnType=='DOUBLE'">DOUBLE</option>
									<option value="VARCHAR" v-if="columnType=='INT' || columnType=='DOUBLE' || columnType=='VARCHAR'">VARCHAR</option>
								</select>
							</td>
						</tr>
						<tr>
							<th v-for="(columnName, columnIndex) in fileColNameList" nowrap="nowrap">
								<label class="custom-control custom-checkbox mt_5"> 
									<input type="checkbox" class="custom-control-input" checked="checked" v-bind:value="columnIndex" v-model="checkedColumnIndex" v-if="rejectFlag==0">
									<span class="custom-control-indicator" v-if="rejectFlag==0"></span> 
									{{columnName}}
			                  	</label>
			                </th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="rowData in previewData">
							<td v-for="colData in rowData">{{colData}}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			
			<!-- 버튼 -->
			<div class="photo_text" style="height:70px">
				<div class="fl">
					<button type="button" class="btn btn-creat size_100" v-on:click="selectVizRequestList">목록</button>
				</div>
				<div class="fr">
					<button type="button" class="btn btn-cencle" data-toggle="modal" data-placement="bottom" title="승인거부사유" data-target="#reject" v-if="rejectFlag==0">승인 거부</button>
<!-- 					<button type="button" class="btn btn-cencle" v-on:click="" data-target="#reject">승인 거부</button> -->
					<button type="button" class="btn btn-creat ml_10" v-on:click="selectNormalDatabase" v-if="rejectFlag==2">표준 데이터 생성</button>
					<button type="button" class="btn btn-creat ml_10" v-on:click="selectDatabaseManagement" v-if="rejectFlag==3">데이터베이스 조회</button>
					<button type="button" class="btn btn-creat ml_10" v-on:click="insertFileData" v-if="rejectFlag==0">승인하기</button>
				</div>
			</div>
		</div>
	</div>
	<form id="pageChange" method="post"></form>
	<jsp:include page="/WEB-INF/view/admin/dataManage/popup/dbTableCheckPopup.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/admin/dataManage/popup/rejectPopup.jsp"></jsp:include>
</div>
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/admin/dataManage/script/dataSetManagementScript.jsp"></jsp:include>
