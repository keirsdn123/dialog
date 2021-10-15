<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<div id="mainPage">
	<div class="full_box wsize_90">
		<div class="mt_50" style="height:10vh;">
			<div class="wsize_90" style="max-height:350px; margin:0 auto">				  
				<img src="/resources/img/main/hand-3044387_1280.jpg" style="height: 350px; width:100%; opacity:0.7;">
					<div class="wsize_60" style="border: 1px solid #564f4f7d;position: relative;top:-240px;height: 120px;margin:auto;background-color: #564f4f7d;">			
						<div class="wsize_100 mt_33" style="margin-top:33px">
							<div class="wsize_100 dis_in">
								<span class="search_main wsize_70 mr_10">
									<input type="name" class="form-control search_box text_main wsize_100" id="inputSearchMain" placeholder="데이터 검색" v-model="dataSetSearchWrd" v-on:keyup.enter="selectSearchedData">
								</span>
								<button type="button" class="btn search-btn size_100 h_50 fn mt_41m" v-on:click="selectSearchedData" style="margin-top: -41px">검색</button>
							</div>
						</div>
					</div>
			</div>
			<div class="mt_30i pd_10 wsize_90" style="height:150px; margin:0 auto; border:1px solid rgba(197, 196, 196, 0.61)">				  
				<div class="wsize_25 fl" style="height:100%; border-right:1px solid rgba(197, 196, 196, 0.61);padding:25px;font-size: 25px;">
					<dl>				
						<dd class="bold"><i class="fa fa-cloud" width="50" height="50"></i></dd>
						<dd class="bold">데이터 현황</dd>
					</dl>
				</div>
				<div class="wsize_25 fl" style="height:100%; border-right:1px solid rgba(197, 196, 196, 0.61); padding:25px;font-size: 25px;">
					<dl>
						<dd>데이터 셋</dd>
						<dd class="bold">{{datasetCount}}</dd>
					</dl>
				</div >
				<div class="wsize_25 fl" style="height:100%; border-right:1px solid rgba(197, 196, 196, 0.61); padding:25px;font-size: 25px;">
					<dl>
						<dd>시각화</dd>
						<dd class="bold">{{vizCount}}</dd>
					</dl>
				</div>
				<div class="wsize_25 fl" style="height:100%; padding:25px;font-size: 25px;">
					<dl>
						<dd>보고서</dd>
						<dd class="bold">{{reportCount}}</dd>
					</dl>
				</div>
			</div>
			<div class="mt_30i wsize_90" style="height: 350px; margin: auto;">
				<div class="wsize_48 fl" style="min-height: 350px; padding: 1% 1% 1% 1%; border:1px solid rgba(197, 196, 196, 0.61)">
					<div class="wsize_100" >
						<div class="under_title mb_25 wsize_48">
							<p class="fl mt_5 "><span><i class="fa  fa-th-list"></i></span> 데이터 TOP5 </p>
						</div>
						<div class="fr mt_10 mr_10">
							<a v-on:click="selectDatasetList">
								<p class="fl mr_10">more </p>
								<p class="fl mr_5 mt_002"><i class="fa fa-angle-right"></i></p>
							</a>
						</div>
						<div>
							<table class="table table-board">
								<thead>
									<tr>
										<th>No.</th>
										<th>제목</th>
										<th>시각화</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(data,index) in datasetList">
										<td>{{index+1}}</td>
										<td class="text-left"><a v-on:click="dataSetListView(data.dataCode, data.typeNormalRegularly)"><p style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; width:340px;height:18px; display:inline-block">{{data.datasetName}}</p></a></td>
										<td v-if="data.vizWhether == 'N'">NO</td>
										<td v-if="data.vizWhether == 'Y'">YES</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="wsize_48 fr" style="min-height: 350px; padding: 1% 1% 1% 1%; border:1px solid rgba(197, 196, 196, 0.61)">
					<div class="wsize_100">
						<div class="under_title mb_25 wsize_48">
							<p class="fl mt_5 "><span><i class="fa  fa-th-list"></i></span> 보고서 TOP5 </p>
						</div>
						<div class="fr mt_10 mr_10">
							<a v-on:click="selectReportList">
								<p class="fl mr_10">more </p>
								<p class="fl mr_5 mt_002"><i class="fa fa-angle-right"></i></p>
							</a>
						</div>
						<div>
							<table class="table table-board">
								<thead>
									<tr>
										<th>No.</th>
										<th>제목</th>
										<th>타입</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(report,index) in reportList">
										<td>{{index+1}}</td>
										<td class="text-left"><a v-on:click="reportListView(report.reportCode)"><p style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap; width:340px;height:18px; display:inline-block">{{report.reportTitle}}</p></a></td>
										<td>{{report.reportTypeNormalPaper}}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id="pageChange" method="post"></form>
	<jsp:include page="/WEB-INF/view/main/script/homeScript.jsp"></jsp:include>
</div>