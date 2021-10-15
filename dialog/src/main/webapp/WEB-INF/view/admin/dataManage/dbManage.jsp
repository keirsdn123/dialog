<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="full_box03 ml_5" id="dataManageInfo">

	<!-- 카테고리 -->
	<div class="wsize_15 fl" style="margin-left: 3%;">
		<div class="wsize_100 bgwhite min_h410">
			<div class="under_title" style="margin-left: 0.5%">
				<p class="fl mt_5 ml_10">
					<span>|</span> 카테고리
				</p>
			</div>
			<div class="fl ta_left mt_10">
				<div id="cateTree"></div>
			</div>
		</div>
	</div>

	<!-- 데이터셋 -->
	<div class="fl" style="margin-left: 0.5%; width: 55.9%">
		<div class="wsize_100 bgwhite min_h410">
			<ul class="nav nav-tabs tab_menu_left" id="storageTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active show" id="profitview" data-toggle="tab" href="#profit_view" role="tab" aria-controls="home" aria-selected="true">데이터셋 - 일시</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="balanceview" data-toggle="tab" href="#balance_view" role="tab" aria-controls="profile" aria-selected="false">데이터셋 - 정기</a>
				</li>
			</ul>
			
	<!-- 데이터셋 일시 -->
			<div class="tab-content dis_in wsize_100" id="storageTabContent">
				<div class="tab-pane fade show active pd_1 po_r" id="profit_view" role="tabpanel" aria-labelledby="profitview">
					<div class="wsize_100 fl po_r">
						<div class="under_title">
							<p class="fl">
								<span>|</span> 데이터셋 - 일시
							</p>
							<div class="fr wsize_50">
								<select class="form-control class_select fl wsize_20 ml_002" v-model="selected">
									<option v-for="option in options" v-bind:value="option.value">{{option.text}}</option>
								</select>
								<input type="name" class="form-control search_box wsize_60 ml_001" id="inputPassword" placeholder="검색어 입력" v-model="searchWrd">
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="selectDtset()">검색</button>
							</div>
						</div>
						<div class="cb"></div>
						<table class="table table-gray mt_5 wsize_100 table-hover">
							<colgroup>
								<col width="50px;" />
								<col width="" />
								<col width="100px;" />
								<col width="100px;" />
								<col width="100px;" />
								<col width="100px;" />
							</colgroup>
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>DB화여부</th>
								<th>시각화여부</th>
							</tr>
							<tr v-bind:class="{trSelect : dataCode == info.dataCode}" v-for="info in dtSetList1" v-on:click="infoRawData(info.dataCode,info.dataType,info.processingWhether)">
							
								<td>{{info.dataCode}}</td>
								<td>{{info.dataName}}</td>
								<td>{{info.dataEnrollmentName}}</td>
								<td>{{info.dataEnrollmentDate}}</td>
								<td>{{info.processingWhether}}</td>
								<td>{{info.vizWhether}}</td>
							</tr>
						</table>
						
						<!-- 페이징 -->
						<div class="buttons mt_10" v-show="pagingInfo1.records > 0">
							<nav aria-label="pagination example" class="dis_in">
								<b-pagination ref="table1" for="table1" align="center" size="md" :total-rows="pagingInfo1.records" v-model="pagingInfo1.currentPage" :per-page="pagingInfo1.perPage" limit="10"></b-pagination>
							</nav>
						</div>
					</div>
				</div>
				
				<!-- 데이터셋 정기 -->
				<div class="tab-pane fade tab_inner pd_1 po_r" id="balance_view" role="tabpanel" aria-labelledby="balanceview">
					<div class="wsize_100 fl po_r">
						<div class="under_title">
							<p class="fl">
								<span>|</span> 데이터셋 - 정기
							</p>
							<div class="fr wsize_50">
								<select class="form-control class_select fl wsize_20 ml_002" v-model="selected">
									<option v-for="option in options" v-bind:value="option.value">{{option.text}}</option>
								</select>
								<input type="name" class="form-control search_box wsize_60 ml_001" id="inputPassword" placeholder="검색어 입력" v-model="searchWrd">
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="selectDtset()">검색</button>
							</div>
						</div>
						<div class="cb"></div>
						<table class="table table-gray mt_5 wsize_100 table-hover">
							<colgroup>
								<col width="50px;" />
								<col width="" />
								<col width="100px;" />
								<col width="100px;" />
								<col width="100px;" />
								<col width="100px;" />
							</colgroup>
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>DB화여부</th>
								<th>시각화여부</th>
							</tr>
							
							<tr v-bind:class="{trSelect : dataCode == info.dataCode}" v-for="info in dtSetList2" v-on:click="infoRawData(info.dataCode,info.dataType,info.processingWhether)">
								<td>{{info.dataCode}}</td>
								<td>{{info.dataName}}</td>
								<td>{{info.dataEnrollmentName}}</td>
								<td>{{info.dataEnrollmentDate}}</td>
								<td>{{info.processingWhether}}</td>
								<td>{{info.vizWhether}}</td>
							</tr>
							
						</table>

						<!-- 페이징 -->
						<div class="buttons mt_10" v-show="pagingInfo2.records > 0">
							<nav aria-label="pagination example" class="dis_in">
								<b-pagination ref="table2" for="table2" align="center" size="md" :total-rows="pagingInfo2.records" v-model="pagingInfo2.currentPage" :per-page="pagingInfo2.perPage" limit="10"></b-pagination>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 테이블 구조 -->
	<div class="wsize_25 fl" style="margin-left: 0.5%">
		<div class="wsize_100 bgwhite" style="height:205px;">
			<div class="under_title" style="margin-left: 3%;">
				<p class="fl mt_5">
					<span>|</span> Raw테이블
				</p>
			</div>
			<div class="fl ta_left mt_10">
				<div id="rawTableTree"></div>
			</div>
		</div>
	</div>
	
	<div class="wsize_25 fl" style="margin-left: 0.5%; margin-top: 0.6%">
		<div class="wsize_100 bgwhite" style="height:195px;">
			<div class="under_title" style="margin-left: 3%;">
				<p class="fl mt_5">
					<span>|</span> 표준테이블
				</p>
			</div>
			<div class="fl ta_left mt_10">
				<div id="sdTableTree"></div>
			</div>
		</div>
	</div>
	
	<!-- raw데이터 -->
	<div class="dbbox bgwhite fl">
		<div class="wsize_100 fl">
			<div class="under_title" style="margin-left: 0.5%">
				<p class="fl mt_5 ml_10">
					<span>|</span> Raw데이터
				</p>
			</div>
			<div class="table_scroll1 pd_1">
				<table class="table table-gray02 mb_0 table-hover">
					<thead>
						<tr>
							<th v-for="infoRdc in infoRawDataColumn">{{infoRdc}}</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="infoRdr in infoRawDataRecode">
							<td v-for="rdr in infoRdr">{{rdr}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>	
	</div>
	
	<!-- 표준데이터 -->
	<div class="dbbox bgwhite fl">
		<div class="wsize_100 fl">
			<div class="under_title" style="margin-left: 0.5%">
				<p class="fl mt_5 ml_10">
					<span>|</span> 표준데이터
				</p>
			</div>
			<div class="table_scroll1 pd_1">
				<table class="table table-gray02 mb_0 table-hover">
					<thead>
						<tr>
							<th>시각화코드</th>
							<th>데이터코드</th>
							<th>col1</th>
							<th>col1설명</th>
							<th>col2</th>
							<th>col2설명</th>
							<th>col3</th>
							<th>col3설명</th>
							<th>col4</th>
							<th>col4설명</th>
							<th>col5</th>
							<th>col5설명</th>
							<th>col6</th>
							<th>col7</th>
							<th>col8</th>
							<th>col9</th>
							<th>col10</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="info in infoSdDataRecode">
							<td>{{info.pauseStandarSeq}}</td>
							<td>{{info.dataCode}}</td>
							<td>{{info.pauseStandarColumn1}}</td>
							<td>{{info.pauseStandarColumn1Lable}}</td>
							<td>{{info.pauseStandarColumn2}}</td>
							<td>{{info.pauseStandarColumn2Lable}}</td>
							<td>{{info.pauseStandarColumn3}}</td>
							<td>{{info.pauseStandarColumn3Lable}}</td>
							<td>{{info.pauseStandarColumn4}}</td>
							<td>{{info.pauseStandarColumn4Lable}}</td>
							<td>{{info.pauseStandarColumn5}}</td>
							<td>{{info.pauseStandarColumn5Lable}}</td>
							<td>{{info.pauseStandarColumn6}}</td>
							<td>{{info.pauseStandarColumn7}}</td>
							<td>{{info.pauseStandarColumn8}}</td>
							<td>{{info.pauseStandarColumn9}}</td>
							<td>{{info.pauseStandarColumn10}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 표준데이터상세 -->
	<div class="dbbox bgwhite fl">
		<div class="wsize_100 fl">
			<div class="under_title" style="margin-left: 0.5%">
				<p class="fl mt_5 ml_10">
					<span>|</span> 표준데이터 상세
				</p>
			</div>
			<div class="table_scroll1 pd_1">
				<table class="table table-gray02 mb_0 table-hover">
					<thead>
						<tr>
							<th>시각화코드</th>
							<th>seq</th>
							<th>col1</th>
							<th>col2</th>
							<th>col3</th>
							<th>col4</th>
							<th>col5</th>
							<th>col6</th>
							<th>col7</th>
							<th>col8</th>
							<th>col9</th>
							<th>col10</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="info in infoSdDataDetailRecode">
							<td>{{info.pauseStandarSeq}}</td>
							<td>{{info.pauseStandarDetailSeq}}</td>
							<td>{{info.pauseStandarColumn1d}}</td>
							<td>{{info.pauseStandarColumn2d}}</td>
							<td>{{info.pauseStandarColumn3d}}</td>
							<td>{{info.pauseStandarColumn4d}}</td>
							<td>{{info.pauseStandarColumn5d}}</td>
							<td>{{info.pauseStandarColumn6d}}</td>
							<td>{{info.pauseStandarColumn7d}}</td>
							<td>{{info.pauseStandarColumn8d}}</td>
							<td>{{info.pauseStandarColumn9d}}</td>
							<td>{{info.pauseStandarColumn10d}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>

<jsp:include page="/WEB-INF/view/admin/dataManage/script/dbManageScript.jsp"></jsp:include>
