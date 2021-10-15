<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<div id="exportRequestList">
	<div class="full_box wsize_90">
		<!--탭-->
		<div class="inner_tab mt_30 bd_bd">
			<ul class="nav nav-tabs inner_tab_menu wsize_80" id="teacher_tab" role="tablist">
				<li class="nav-item"><a class="nav-link active show" style="border-bottom: 0 !important; border-right: 0px !important;" id="now-tab" data-toggle="tab" href="#teacher_list_now" role="tab" aria-controls="home" aria-selected="true">RSS 뉴스 데이터</a></li>
				<li class="nav-item"><a class="nav-link" style="border-bottom: 0 !important; border-right: 0px !important;" id="last-tab" data-toggle="tab" href="#teacher_list_last" role="tab" aria-controls="profile" aria-selected="false">쇼핑 데이터</a></li>
				<li class="nav-item"><a class="nav-link" style="border-bottom: 0 !important;" id="last-tab" data-toggle="tab" href="#daumNews" role="tab" aria-controls="profile" aria-selected="false">다음 뉴스 데이터</a></li>
			</ul>
			<div class="tab-content bd_t" id="teacher_tabContent">
				<!--RSS 데이터 -->
				<div class="tab-pane fade show active bt_d" id="teacher_list_now" role="tabpanel" aria-labelledby="now-tab">
					<div class="fl photo_write mt_60 wsize_45 ml_20" >
						<div style="max-height: 335px; overflow: auto;">
							<table class="table table-gray table-hover">
								<tr>
									<th>데이터셋 명</th>
								</tr>
								<tr v-for="rssDatatSet in selectRssDtSetList" v-bind:class="{trSelect : dataCode == rssDatatSet.dataCode}" v-on:click="backColor(rssDatatSet.dataCode)">
									<td>{{rssDatatSet.datasetName}}</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="fl photo_write ml_23 wsize_30 line01 h_460">
						<div class="fl photo_write mt_50 wsize_45 ml_30">
							<table class="table table-ddd001"
								style="width: 600px;">
								<colgroup>
									<col width="150px" />
									<col width="calc(50% - 150px)" />
									<col width="150px" />
									<col width="calc(50% - 150px)" />
								</colgroup>
								<tbody>
									<tr>
										<th class="bold font_1e">수집 단어</th>
										<td><input type="text" class="fr form-control size_440" placeholder="검색어를 입력하세요" v-model = "exportCollectWord"></td>
									</tr>
									<tr>
										<th></th>
									</tr>
									<tr>
										<th class="bold font_1e">비고란</th>
										<td><textarea class="form-control rounded-0 jarea2" rows="5" placeholder="비고 사항을 입력하세요" v-model = "exportCollectRemarks"></textarea></td>
									</tr>
									<tr>
										<th></th>
									</tr>
									<tr>
										<th class="bold font_1e">수집 기간</th>
										<td>
											<button type="button" class="btn search-btn fr size_90 ml_5" v-on:click = "dateReset('rss')">초기화</button>
											<input class="fr form-control date_cho mr_0 size_160 endDate" v-model="exportCollectEndDate">
											<p class="mr_5 mt_5 fr">~</p>
											<input class="fr form-control date_cho mr_0 size_160 startDate mr_002" v-model="exportCollectStartDate">
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<button type="button" class="fl btn search-btn2 size_100 ml_30" v-on:click ="dateChange(exportCollectStartDate, exportCollectEndDate, 'D', 'rss');">1일</button>
											<button type="button" class="fl btn search-btn2 size_100 ml_5" v-on:click ="dateChange(exportCollectStartDate, exportCollectEndDate, 'W', 'rss');">최근 1주</button>
											<button type="button" class="fl btn search-btn2 size_100 ml_5" v-on:click ="dateChange(exportCollectStartDate, exportCollectEndDate, 'M', 'rss');">한달</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<button type="button" class="btn btn-creat mt_410 fr" v-on:click="insertRssExportRequest(2)">데이터 반출 요청</button>
				</div>
				<!--쇼핑 데이터-->
				<div class="tab-pane fade bd_d05" id="teacher_list_last" role="tabpanel" aria-labelledby="last-tab">
					<div class="fl photo_write mt_60 wsize_45 ml_20">
						<div style="max-height: 335px; overflow: auto;">					
							<table class="table table-gray table-hover">
								<tr>
									<th>데이터셋 명</th>
								</tr>
								<tr v-for="shopDatatSet in selectShopDtSetList"  v-bind:class="{trSelect : dataCode == shopDatatSet.dataCode}" v-on:click="backColor(shopDatatSet.dataCode)">
									<td>{{shopDatatSet.datasetName}}</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="fl photo_write ml_23 wsize_30 line01 h_460">
						<div class="fl photo_write mt_45 wsize_45 ml_30">
							<table class="table table-ddd001" style="width: 600px;">
								<colgroup>
									<col width="150px" />
									<col width="calc(50% - 150px)" />
									<col width="150px" />
									<col width="calc(50% - 150px)" />
								</colgroup>
								<tbody>
									<tr>
										<th class="bold font_1e">수집 단어</th>
										<td><input type="text" class="fr form-control size_440" placeholder="검색어를 입력하세요" v-model = "exportShopCollectWord"></td>
									</tr>
									<tr>
										<th></th>
									</tr>
									<tr>
										<th class="bold font_1e">비고란</th>
										<td><textarea class="form-control rounded-0 jarea2" rows="5" placeholder="비고 사항을 입력하세요" v-model = "exportShopCollectRemarks"></textarea></td>
									</tr>
									<tr>
										<th></th>
									</tr>
									<tr>
										<th class="bold font_1e">수집 기간</th>
										<td>
											<button type="button" class="btn search-btn fr size_90 ml_5" v-on:click = "dateReset('shopping')">초기화</button>
											<input class="fr form-control date_cho mr_0 size_160 endDate" v-model="exportShopCollectEndDate">
											<p class="mr_5 mt_5 fr">~</p>
											<input class="fr form-control date_cho mr_0 size_160 startDate mr_002" v-model="exportShopCollectStartDate">
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<button type="button" class="fl btn search-btn2 size_100 ml_30" v-on:click ="dateChange(exportShopCollectStartDate, exportShopCollectEndDate, 'D', 'shopping');">1일</button>
											<button type="button" class="fl btn search-btn2 size_100 ml_5" v-on:click ="dateChange(exportShopCollectStartDate, exportShopCollectEndDate, 'W', 'shopping');">최근 1주</button>
											<button type="button" class="fl btn search-btn2 size_100 ml_5" v-on:click ="dateChange(exportShopCollectStartDate, exportShopCollectEndDate, 'M', 'shopping');">한달</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<button type="button" class="btn btn-creat mt_410 fr" v-on:click="insertShopExportRequest(3)">데이터 반출 요청</button>
				</div>
				<!-- 다음뉴스 -->
				<div class="tab-pane fade bd_d05" id="daumNews" role="tabpanel" aria-labelledby="last-tab">
					<div class="fl photo_write mt_60 wsize_45 ml_20">
						<div style="max-height: 335px; overflow: auto;">					
							<table class="table table-gray table-hover">
								<tr>
									<th>데이터셋 명</th>
								</tr>
								<tr v-for="daumDtSetList in selectDaumDtSetList"  v-bind:class="{trSelect : dataCode == daumDtSetList.dataCode}" v-on:click="clickDaumDt(daumDtSetList.dataCode)">
									<td>{{daumDtSetList.datasetName}}</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="fl photo_write ml_23 wsize_30 line01 h_460">
						<div class="fl photo_write mt_45 wsize_45 ml_30">
							<table class="table table-ddd001" style="width: 600px;">
								<colgroup>
									<col width="150px" />
									<col width="calc(50% - 150px)" />
									<col width="150px" />
									<col width="calc(50% - 150px)" />
								</colgroup>
								<tbody> 
									<tr>
										<th class="bold font_1e">수집 단어</th>
										<td><input type="text" class="fr form-control size_440" readonly v-model = "exportDaumCollectWord"></td>
									</tr>
									<tr>
										<th></th>
									</tr>
									<tr>
										<th class="bold font_1e">비고란</th>
										<td><textarea class="form-control rounded-0 jarea2" rows="5" placeholder="비고 사항을 입력하세요" v-model = "exportDaumCollectRemarks"></textarea></td>
									</tr>
									<tr>
										<th></th>
									</tr>
									<tr>
										<th class="bold font_1e">수집 기간</th>
										<td>
											<input class="fl form-control  mr_0 size_207 mr_002" v-model="exportDaumCollectStartDate" readonly>
											<p class="mr_5 mt_5 fl">~</p>
											<input class="fl form-control  mr_0 size_207" v-model="exportDaumCollectEndDate" readonly>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<button type="button" class="btn btn-creat mt_410 fr" v-on:click="insertDaumExportRequest(5)">데이터 반출 요청</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/exportRequestDataScript.jsp"></jsp:include>