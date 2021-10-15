<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div>
	<div class="full_box wsize_90">
		<!--위에 탭-->
		<div class="left_list_box2" id="collectRequestList">
			<ul class="nav nav-tabs tab_menu_left" id="aroundTab" role="tablist">
				<li class="nav-item"><a class="nav-link active"  style="border-right: 0 !important;" id="collect" data-toggle="tab" href="#collect_list" role="tab" aria-controls="home" aria-selected="true">데이터 수집 요청 목록</a></li>
				<li class="nav-item"><a class="nav-link" id="class" style="border-right: 0 !important;" data-toggle="tab" href="#class_list" role="tab" aria-controls="profile" aria-selected="false">데이터 반출 요청 목록</a></li>
				<li class="nav-item"><a class="nav-link" id="student" data-toggle="tab" href="#student_list" role="tab" aria-controls="profile" aria-selected="false">시각화 요청 목록</a></li>
			</ul>
			<div class="tab-content dis_in comment_center_box mt_30" id="aroundTabContent">
				<div class="tab-pane fade show active tab_inner" id="collect_list" role="tabpanel" aria-labelledby="collect">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 데이터 수집 요청 목록
						</p>
					</div>
					<!-- 데이터 수집 요청 목록 -->
					<div class="inner_tab mt_30">
						<ul class="nav nav-tabs inner_tab_menu wsize_100 dis_in fl bd_btt" id="collect_tab" role="tablist">
							<li class="nav-item fl"><a class="nav-link active show" id="daum-tab" data-toggle="tab" href="#collect_list_now" role="tab" aria-controls="home" aria-selected="true">다음 뉴스 데이터</a></li>
							<li class="nav-item fl"><a class="nav-link" id="act-tab" data-toggle="tab" href="#collect_list_last" role="tab" aria-controls="profile" aria-selected="false">기타 데이터</a></li>
						</ul>
						<div class="tab-content fl wsize_100" id="collect_tabContent">
							<!--다음 뉴스 데이터-->
							<div class="tab-pane fade show active" id="collect_list_now" role="tabpanel" aria-labelledby="daum-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectMyDaumCollectRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="daumSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="daumDataSort(0)" v-bind:class="[daumSort==0 ? 'font_blue' : '']">전체</a> | 
									<a v-on:click="daumDataSort(1)" v-bind:class="[daumSort==1 ? 'font_blue' : '']">수집 대기</a> | 
									<a v-on:click="daumDataSort(2)" v-bind:class="[daumSort==2 ? 'font_blue' : '']">수집 중</a> | 
									<a v-on:click="daumDataSort(3)" v-bind:class="[daumSort==3 ? 'font_blue' : '']">수집 완료</a>
								</div>
								<div id="style-3">
									<table class="table table-gray table-hover">
										<colgroup>
											<col width="80px;" />
											<col width="150px;" />
											<col width="120px;" />
											<col width=""/>
											<col width="100px;" />
											<col width="100px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>현재 상태</th>
										</tr>
										<tr v-for="(daumRequest,index) in selectMyDaumCollectRequestList" v-on:click="infoDaumList(daumRequest.daumNewsDataCollectRequestCode)">
											<td>{{index+1}}</td>
											<td class="bold color_b">{{daumRequest.daumNewsRequestCollectWord}}</td>
											<td>{{daumRequest.daumNewsRequestCollectDate}}</td>
											<td><span>{{daumRequest.daumNewsRequestCollectStartDate}}~{{daumRequest.daumNewsRequestCollectEndDate}}</span></td>
											<td class="text_red" v-if="daumRequest.daumNewsRequestCollectStatus == 'N'">수집 대기</td>
											<td class="text_red" v-if="daumRequest.daumNewsRequestCollectStatus == 'S'">수집 중</td>
											<td class="text_red" v-if="daumRequest.daumNewsRequestCollectStatus == 'Y'">수집 완료</td>
										</tr>
									</table>
									<!--다음 뉴스 데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="daumTable" for="table" align="center" size="md" :total-rows="daumReqPaging.records" v-model="daumReqPaging.currentPage" :per-page="daumReqPaging.perPage" limit="10" v-show="daumReqPaging.records > 0">
											</b-pagination>
										</nav>
									</div>
								</div>
							</div>
							<!--기타 데이터-->
							<div class="tab-pane fade" id="collect_list_last" role="tabpanel" aria-labelledby="act-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectMyActCollectRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="actSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="actDataSort(0)" v-bind:class="[actSort==0 ? 'font_blue' : '']">전체</a> | 
									<a v-on:click="actDataSort(1)" v-bind:class="[actSort==1 ? 'font_blue' : '']">수집 대기</a> | 
									<a v-on:click="actDataSort(2)" v-bind:class="[actSort==2 ? 'font_blue' : '']">수집 중</a> |
									<a v-on:click="actDataSort(3)" v-bind:class="[actSort==3 ? 'font_blue' : '']">수집 완료</a> | 
									<a v-on:click="actDataSort(4)" v-bind:class="[actSort==4 ? 'font_blue' : '']">수집 거부</a>
								</div>
								<div id="style-3">
									<table class="table table-gray table-hover">
										<colgroup>
											<col width="80px;" />
											<col width="" />
											<col width="100px;" />
											<col width="120px;" />
											<col width="100px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>사이트명</th>
											<th>요청 날짜</th>
											<th>현재 상태</th>
										</tr>
										<tr v-for="(actRequest,index) in selectMyActCollectRequestList" v-on:click="infoActList(actRequest.actDataCollectRequestCode)">
											<td>{{index+1}}</td>
											<td>{{actRequest.actRequestCollectSiteName}}</td>
											<td>{{actRequest.actRequestCollectDate}}</td>
											<td class="text_red" v-if="actRequest.actRequestCollectStatus == 'N'">수집 대기</td>
											<td class="text_red" v-if="actRequest.actRequestCollectStatus == 'S'">수집 중</td>
											<td class="text_red" v-if="actRequest.actRequestCollectStatus == 'Y'">수집 완료</td>
											<td class="text_red" v-if="actRequest.actRequestCollectStatus == 'D'">수집 거부</td>
										</tr>
									</table>
									<!--기타 데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="actTable" for="table" align="center" size="md" :total-rows="actReqPaging.records" v-model="actReqPaging.currentPage" :per-page="actReqPaging.perPage" limit="10" v-show="actReqPaging.records > 0">
											</b-pagination>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--데이터 반출 요청 목록-->
				<div class="tab-pane fade tab_inner " id="class_list" role="tabpanel" aria-labelledby="class">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 데이터 반출 요청 목록
						</p>
					</div>
					<!--안쪽탭-->
					<div class="inner_tab mt_30">
						<ul class="nav nav-tabs inner_tab_menu wsize_100 dis_in fl bd_btt" id="class_tab" role="tablist">
							<li class="nav-item fl"><a class="nav-link active show" style="border-right: 0 !important;" id="rss-tab" data-toggle="tab" href="#class_list_now" role="tab" aria-controls="home" aria-selected="true">RSS 뉴스 데이터</a></li>
							<li class="nav-item fl"><a class="nav-link" id="shop-tab" style="border-right: 0 !important;" data-toggle="tab" href="#class_list_last" role="tab" aria-controls="profile" aria-selected="false">쇼핑 데이터</a></li>
							<li class="nav-item fl"><a class="nav-link" id="daumNews-tab" data-toggle="tab" href="#daumNews" role="tab" aria-controls="profile" aria-selected="false">다음 뉴스 데이터</a></li>
						</ul>
						<div class="tab-content fl wsize_100" id="class_tabContent">
							<!--RSS 뉴스 데이터 -->
							<div class="tab-pane fade show active" id="class_list_now" role="tabpanel" aria-labelledby="rss-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectMyRssExportRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="rssSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="rssDataSort(0)" v-bind:class="[rssSort==0 ? 'font_blue' : '']">전체</a> | 
									<a v-on:click="rssDataSort(1)" v-bind:class="[rssSort==1 ? 'font_blue' : '']">반출 대기</a> | 
									<a v-on:click="rssDataSort(2)" v-bind:class="[rssSort==2 ? 'font_blue' : '']">반출 중</a> | 
									<a v-on:click="rssDataSort(3)" v-bind:class="[rssSort==3 ? 'font_blue' : '']">반출 완료</a>
								</div>
								<div id="style-3">
									<table class="table table-gray table-hover">
										<colgroup>
											<col width="80px;" />
											<col width="150px;" />
											<col width="" />
											<col width="120px;" />
											<col width="200px;" />
											<col width="120px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 데이터 셋</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>요청 상태</th>
										</tr>
										<tr v-for="(rssRequest,index) in selectMyRssExportRequestList" v-on:click="infoExportList(rssRequest.dataExportRequestCode,2)">
											<td>{{index+1}}</td>
											<td class="bold color_b">{{rssRequest.exportCollectWord}}</td>
											<td>{{rssRequest.datasetName}}</td>
											<td>{{rssRequest.exportCollectDate}}</td>
											<td>{{rssRequest.exportCollectStartDate}}~{{rssRequest.exportCollectEndDate}}</td>
											<td class="text_red" v-if="rssRequest.exportCollectStatus == 'N'">반출 대기</td>
											<td class="text_red" v-if="rssRequest.exportCollectStatus == 'S'">반출 중</td>
											<td class="text_red" v-if="rssRequest.exportCollectStatus == 'Y'">반출 완료</td>
										</tr>
									</table>
									<!--RSS 뉴스 데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="rssTable" for="table" align="center" size="md" :total-rows="rssReqPaging.records" v-model="rssReqPaging.currentPage" :per-page="rssReqPaging.perPage" limit="10" v-show="rssReqPaging.records > 0">
											</b-pagination>
										</nav>
									</div>
								</div>
							</div>
							<!--쇼핑 데이터-->
							<div class="tab-pane fade" id="class_list_last" role="tabpanel" aria-labelledby="shop-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectMyShopExportRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="shopSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="shopDataSort(0)" v-bind:class="[shopSort==0 ? 'font_blue' : '']">전체</a> | 
									<a v-on:click="shopDataSort(1)" v-bind:class="[shopSort==1 ? 'font_blue' : '']">반출 대기</a> | 
									<a v-on:click="shopDataSort(2)" v-bind:class="[shopSort==2 ? 'font_blue' : '']">반출 중</a> | 
									<a v-on:click="shopDataSort(3)" v-bind:class="[shopSort==3 ? 'font_blue' : '']">반출 완료</a>
								</div>
								<div id="style-3">
									<table class="table table-gray table-hover">
										<colgroup>
											<col width="80px;" />
											<col width="150px;" />
											<col width="" />
											<col width="120px;" />
											<col width="200px;" />
											<col width="120px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 데이터 셋</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>요청 상태</th>
										</tr>
										<tr v-for="(shoppingRequest,index) in selectMyShopExportRequestList" v-on:click="infoExportList(shoppingRequest.dataExportRequestCode,3)">
											<td>{{index+1}}</td>
											<td class="bold color_b">{{shoppingRequest.exportCollectWord}}</td>
											<td>{{shoppingRequest.datasetName}}</td>
											<td>{{shoppingRequest.exportCollectDate}}</td>
											<td>{{shoppingRequest.exportCollectStartDate}}~{{shoppingRequest.exportCollectEndDate}}</td>
											<td class="text_red" v-if="shoppingRequest.exportCollectStatus == 'N'">반출 대기</td>
											<td class="text_red" v-if="shoppingRequest.exportCollectStatus == 'S'">반출 중</td>
											<td class="text_red" v-if="shoppingRequest.exportCollectStatus == 'Y'">반출 완료</td>
										</tr>
									</table>
									<!--쇼핑 데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="shopTable" for="table" align="center" size="md" :total-rows="shopReqPaging.records" v-model="shopReqPaging.currentPage" :per-page="shopReqPaging.perPage" limit="10" v-show="shopReqPaging.records > 0">
											</b-pagination>
										</nav>
									</div>
								</div>
							</div>
							<!-- 다음뉴스 반출 -->
							<div class="tab-pane fade" id="daumNews" role="tabpanel" aria-labelledby="daumNews-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectMyDaumNewsExportRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="daumExportSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="daumNewsSort(0)" v-bind:class="[daumExportSort==0 ? 'font_blue' : '']">전체</a> | 
									<a v-on:click="daumNewsSort(1)" v-bind:class="[daumExportSort==1 ? 'font_blue' : '']">반출 대기</a> | 
									<a v-on:click="daumNewsSort(2)" v-bind:class="[daumExportSort==2 ? 'font_blue' : '']">반출 중</a> | 
									<a v-on:click="daumNewsSort(3)" v-bind:class="[daumExportSort==3 ? 'font_blue' : '']">반출 완료</a>
								</div>
								<div id="style-3">
									<table class="table table-gray table-hover">
										<colgroup>
											<col width="80px;" />
											<col width="150px;" />
											<col width="" />
											<col width="120px;" />
											<col width="200px;" />
											<col width="120px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 데이터 셋</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>요청 상태</th>
										</tr>
										<tr v-for="(DaumExportRequest,index) in selectMyDaumExportRequestList" v-on:click="infoExportList(DaumExportRequest.dataExportRequestCode,5)">
											<td>{{index+1}}</td>
											<td class="bold color_b">{{DaumExportRequest.exportCollectWord}}</td>
											<td>{{DaumExportRequest.datasetName}}</td>
											<td>{{DaumExportRequest.exportCollectDate}}</td>
											<td>{{DaumExportRequest.exportCollectStartDate}}~{{DaumExportRequest.exportCollectEndDate}}</td>
											<td class="text_red" v-if="DaumExportRequest.exportCollectStatus == 'N'">반출 대기</td>
											<td class="text_red" v-if="DaumExportRequest.exportCollectStatus == 'S'">반출 중</td>
											<td class="text_red" v-if="DaumExportRequest.exportCollectStatus == 'Y'">반출 완료</td>
										</tr>
									</table>
									<!--다음뉴스데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="daumNewsTable" for="table" align="center" size="md" :total-rows="daumExportPaging.records" v-model="daumExportPaging.currentPage" :per-page="daumExportPaging.perPage" limit="10" v-show="daumExportPaging.records > 0">
											</b-pagination>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--시각화 요청 목록-->
				<div class="tab-pane fade tab_inner " id="student_list" role="tabpanel" aria-labelledby="student">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 시각화 요청 목록
						</p>
					</div>
					<button type="button" class="fr btn search-btn3" v-on:click="searchMyVizRequest">검색</button>
					<input type="name" class="fr form-control search_box width_030" id="inputPassword" placeholder="검색어 입력" v-model="vizSearchWrd">
					<!--안쪽탭-->
					<div class="inner_tab mt_30">
						<div class="fr">
							<a v-on:click="vizDataSort(0)" v-bind:class="[vizSort==0 ? 'font_blue' : '']">전체</a> |
							<a v-on:click="vizDataSort(1)" v-bind:class="[vizSort==1 ? 'font_blue' : '']">승인 대기</a> | 
							<a v-on:click="vizDataSort(2)" v-bind:class="[vizSort==2 ? 'font_blue' : '']">승인 완료</a> |
							<a v-on:click="vizDataSort(3)" v-bind:class="[vizSort==3 ? 'font_blue' : '']">승인 거부</a>
						</div>
						<div class="tab-content fl wsize_100" id="student_tabContent">
							<!--시각화 요청 -->
							<div class="tab-pane fade show active" id="student_list_now" role="tabpanel" aria-labelledby="now-tab">
								<div id="style-3">
									<table class="table table-gray table-hover">
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
											<td>{{index+1}}</td>
											<td class="text-left"><a v-on:click="infoVizlist(list.dataCode)">{{list.datasetName}}</a></td>
											<td>{{list.dataEnrollDate}}</td>
											<td class="text_red" v-if="list.status == 'P'">승인대기 중</td>
											<td class="text_red" v-if="list.status == 'Y'">승인완료</td>
											<td class="text_red" v-if="list.status == 'R'">승인거부</td>
										</tr>
									</table>
									<!--시각화 요청 데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="vizTable" for="table" align="center" size="md" :total-rows="vizReqPaging.records" v-model="vizReqPaging.currentPage" :per-page="vizReqPaging.perPage" limit="10" v-show="vizReqPaging.records > 0">
											</b-pagination>
										</nav>
									</div>
									<form id="pageChange" method="post"></form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/collectRequestDataSelectScript.jsp"></jsp:include>
