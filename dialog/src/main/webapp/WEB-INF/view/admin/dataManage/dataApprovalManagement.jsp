<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<div class="full_box wsize_90">
		<!--위에 탭-->
		<div class="left_list_box2" id="approvalRequestList">
			<ul class="nav nav-tabs tab_menu_left" id="aroundTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="collect" style="border-right: 0 !important;" data-toggle="tab" href="#collect_list" role="tab" aria-controls="home" aria-selected="true">데이터 수집 요청 관리</a></li>
				<li class="nav-item"><a class="nav-link" id="class" style="border-right: 0 !important;" data-toggle="tab" href="#class_list" role="tab" aria-controls="profile" aria-selected="false">데이터 반출 요청 관리</a></li>
				<li class="nav-item"><a class="nav-link" id="student" data-toggle="tab" href="#student_list" role="tab" aria-controls="profile" aria-selected="false">시각화 요청 관리</a></li>
			</ul>
			<div class="tab-content dis_in comment_center_box mt_30" id="aroundTabContent">
				<div class="tab-pane fade show active tab_inner" id="collect_list" role="tabpanel" aria-labelledby="collect">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 데이터 수집 요청 관리
						</p>
					</div>
					<!-- 데이터 수집 요청 관리 -->
					<div class="inner_tab mt_30">
						<ul class="nav nav-tabs inner_tab_menu wsize_100 dis_in fl bd_btt" id="collect_tab" role="tablist">
							<li class="nav-item fl"><a class="nav-link active show" id="daum-tab" data-toggle="tab" href="#collect_list_now" role="tab" aria-controls="home" aria-selected="true">다음 뉴스 데이터</a></li>
							<li class="nav-item fl"><a class="nav-link" id="act-tab" data-toggle="tab" href="#collect_list_last" role="tab" aria-controls="profile" aria-selected="false">기타 데이터</a></li>
						</ul>
						<div class="tab-content fl wsize_100" id="collect_tabContent">
							<!--다음 뉴스 데이터-->
							<div class="tab-pane fade show active" id="collect_list_now" role="tabpanel" aria-labelledby="daum-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectApprovalDaumRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="daumSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="daumDataSort(0)" v-bind:class="[daumSort==0 ? 'font_blue':'']">전체</a> | 
									<a v-on:click="daumDataSort(1)" v-bind:class="[daumSort==1 ? 'font_blue':'']">수집 대기</a> | 
									<a v-on:click="daumDataSort(2)" v-bind:class="[daumSort==2 ? 'font_blue':'']">수집 중</a> | 
									<a v-on:click="daumDataSort(3)" v-bind:class="[daumSort==3 ? 'font_blue':'']">수집 완료</a>
								</div>
								<div id="style-3">
									<table class="table table-gray table-hover">
										<colgroup>
											<col width="80px;" />
											<col width="150px;" />
											<col width="120px;" />
											<col width="" />
											<col width="100px;" />
											<col width="100px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>작성자</th>
											<th>현재 상태</th>
										</tr>
										<tr v-for="(daumApprovalRequest,index) in selectApprovalDaumRequestList" v-on:click="infoMDaumList(daumApprovalRequest.daumNewsDataCollectRequestCode)">
											<td>{{daumReqPaging.records-(daumReqPaging.currentPage-1)*daumReqPaging.perPage-index}}</td>
											<td class="bold color_b">{{daumApprovalRequest.daumNewsRequestCollectWord}}</td>
											<td>{{daumApprovalRequest.daumNewsRequestCollectDate}}</td>
											<td><span>{{daumApprovalRequest.daumNewsRequestCollectStartDate}}~{{daumApprovalRequest.daumNewsRequestCollectEndDate}}</span></td>
											<td><span>{{daumApprovalRequest.memberId}}</span></td>
											<td class="text_red" v-if="daumApprovalRequest.daumNewsRequestCollectStatus == 'N'">수집 대기</td>
											<td class="text_red" v-if="daumApprovalRequest.daumNewsRequestCollectStatus == 'S'">수집 중</td>
											<td class="text_red" v-if="daumApprovalRequest.daumNewsRequestCollectStatus == 'Y'">수집 완료</td>
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
								<button class="btn btn-creat fr size_130 mr_010" data-toggle="modal" data-placement="bottom" data-target="#dataCollectionRequestPopup" role="button">스케줄 등록</button>
							</div>
							<!--기타 데이터-->
							<div class="tab-pane fade" id="collect_list_last" role="tabpanel" aria-labelledby="act-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectApprovalActRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="actSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="actDataSort(0)" v-bind:class="[actSort==0 ? 'font_blue':'']">전체</a> | 
									<a v-on:click="actDataSort(1)" v-bind:class="[actSort==1 ? 'font_blue':'']">수집 대기</a> | 
									<a v-on:click="actDataSort(2)" v-bind:class="[actSort==2 ? 'font_blue':'']">수집 중</a> | 
									<a v-on:click="actDataSort(3)" v-bind:class="[actSort==3 ? 'font_blue':'']">수집 완료</a> | 
									<a v-on:click="actDataSort(4)" v-bind:class="[actSort==4 ? 'font_blue':'']">수집 거부</a>
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
											<th>작성자</th>
											<th>현재 상태</th>
										</tr>
										<tr v-for="(actApprovalRequest,index) in selectApprovalActRequestList" v-on:click="infoMActList(actApprovalRequest.actDataCollectRequestCode)">
											<td>{{actReqPaging.records-(actReqPaging.currentPage-1)*actReqPaging.perPage-index}}</td>
											<td>{{actApprovalRequest.actRequestCollectSiteName}}</td>
											<td>{{actApprovalRequest.actRequestCollectDate}}</td>
											<td>{{actApprovalRequest.memberId}}</td>
											<td class="text_red" v-if="actApprovalRequest.actRequestCollectStatus == 'N'">수집 대기</td>
											<td class="text_red" v-if="actApprovalRequest.actRequestCollectStatus == 'S'">수집 중</td>
											<td class="text_red" v-if="actApprovalRequest.actRequestCollectStatus == 'Y'">수집 완료</td>
											<td class="text_red" v-if="actApprovalRequest.actRequestCollectStatus == 'D'">수집 거부</td>
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
								<button class="btn btn-creat fr size_130" type="button">스케줄 등록</button>
							</div>
						</div>
					</div>
				</div>

				<!--데이터 반출 요청 관리-->
				<div class="tab-pane fade tab_inner " id="class_list" role="tabpanel" aria-labelledby="class">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 데이터 반출 요청 관리
						</p>
					</div>
					<!--안쪽탭-->
					<div class="inner_tab mt_30">
						<ul class="nav nav-tabs inner_tab_menu wsize_100 dis_in fl bd_btt" id="class_tab" role="tablist">
							<li class="nav-item fl"><a class="nav-link active show" id="rss-tab" style="border-right: 0 !important;" data-toggle="tab" href="#class_list_now" role="tab" aria-controls="home" aria-selected="true">RSS 뉴스 데이터</a></li>
							<li class="nav-item fl"><a class="nav-link" id="shop-tab" style="border-right: 0 !important;" data-toggle="tab" href="#class_list_last" role="tab" aria-controls="profile" aria-selected="false">쇼핑 데이터</a></li>
							<li class="nav-item fl"><a class="nav-link" id="daumNews-tab" data-toggle="tab" href="#daumNews" role="tab" aria-controls="profile" aria-selected="false">다음 뉴스 데이터</a></li>
						</ul>
						<div class="tab-content fl wsize_100" id="class_tabContent">
							<!--RSS 뉴스 데이터 -->
							<div class="tab-pane fade show active" id="class_list_now" role="tabpanel" aria-labelledby="rss-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectApprovalRssRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="rssSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="rssDataSort(0)" v-bind:class="[rssSort==0 ? 'font_blue':'']">전체</a> | 
									<a v-on:click="rssDataSort(1)" v-bind:class="[rssSort==1 ? 'font_blue':'']">반출 대기</a> | 
									<a v-on:click="rssDataSort(2)" v-bind:class="[rssSort==2 ? 'font_blue':'']">반출 중</a> | 
									<a v-on:click="rssDataSort(3)" v-bind:class="[rssSort==3 ? 'font_blue':'']">반출 완료</a>
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
											<col width="120px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 데이터 셋</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>작성자</th>
											<th>요청 상태</th>
										</tr>
										<tr v-for="(rssRequest,index) in selectApprovalRssRequestList" v-on:click="infoMExportList(rssRequest.dataExportRequestCode,2)">
											<td>{{rssReqPaging.records-(rssReqPaging.currentPage-1)*rssReqPaging.perPage-index}}</td>
											<td class="bold color_b">{{rssRequest.exportCollectWord}}</td>
											<td>{{rssRequest.datasetName}}</td>
											<td>{{rssRequest.exportCollectDate}}</td>
											<td>{{rssRequest.exportCollectStartDate}}~{{rssRequest.exportCollectEndDate}}</td>
											<td>{{rssRequest.memberId}}</td>
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
								<button class="btn btn-creat fr size_130" data-toggle="modal" data-placement="bottom" data-target="#dataExportRequestPopup" role="button">스케줄 등록</button>
							</div>

							<!--쇼핑 데이터-->
							<div class="tab-pane fade" id="class_list_last" role="tabpanel" aria-labelledby="shop-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectApprovalShopRequest()">검색</button>
									<input type="name" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="shopSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="shopDataSort(0)" v-bind:class="[shopSort==0 ? 'font_blue':'']">전체</a> | 
									<a v-on:click="shopDataSort(1)" v-bind:class="[shopSort==1 ? 'font_blue':'']">반출 대기</a> | 
									<a v-on:click="shopDataSort(2)" v-bind:class="[shopSort==2 ? 'font_blue':'']">반출 중</a> | 
									<a v-on:click="shopDataSort(3)" v-bind:class="[shopSort==3 ? 'font_blue':'']">반출 완료</a>
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
											<col width="120px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 데이터 셋</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>작성자</th>
											<th>요청 상태</th>
										</tr>
										<tr v-for="(shoppingRequest,index) in selectApprovalShopRequestList" v-on:click="infoMExportList(shoppingRequest.dataExportRequestCode,3)">
											<td>{{shopReqPaging.records-(shopReqPaging.currentPage-1)*shopReqPaging.perPage-index}}</td>
											<td class="bold color_b">{{shoppingRequest.exportCollectWord}}</td>
											<td>{{shoppingRequest.datasetName}}</td>
											<td>{{shoppingRequest.exportCollectDate}}</td>
											<td>{{shoppingRequest.exportCollectStartDate}}~{{shoppingRequest.exportCollectEndDate}}</td>
											<td>{{shoppingRequest.memberId}}</td>
											<td class="text_red" v-if="shoppingRequest.exportCollectStatus == 'N'">반출 대기
											</td>
											<td class="text_red" v-if="shoppingRequest.exportCollectStatus == 'S'">반출 중</td>
											<td class="text_red" v-if="shoppingRequest.exportCollectStatus == 'Y'">반출 완료
											</td>
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
								<button class="btn btn-creat fr size_130" data-toggle="modal" data-placement="bottom" data-target="#dataExportRequestShoppingPopup" role="button">스케줄 등록</button>
							</div>
							<!-- 다음뉴스 반출 -->
							<div class="tab-pane fade" id="daumNews" role="tabpanel" aria-labelledby="daumNews-tab">
								<div class="fr wsize_50 mt_002">
									<button type="button" class="fr btn search-btn wsize_20 ml_001" v-on:click="selectApprovalDaumNewsRequest()">검색</button>
									<input type="text" class="fr form-control search_box wsize_60" id="inputPassword" placeholder="단어 검색" v-model="daumExportSearchWrd">
								</div>
								<div class="fr mt_007 mr_050">
									<a v-on:click="daumNewsSort(0)" v-bind:class="[daumExportSort==0 ? 'font_blue':'']">전체</a> | 
									<a v-on:click="daumNewsSort(1)" v-bind:class="[daumExportSort==1 ? 'font_blue':'']">반출 대기</a> | 
									<a v-on:click="daumNewsSort(2)" v-bind:class="[daumExportSort==2 ? 'font_blue':'']">반출 중</a> | 
									<a v-on:click="daumNewsSort(3)" v-bind:class="[daumExportSort==3 ? 'font_blue':'']">반출 완료</a>
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
											<col width="120px;" />
										</colgroup>
										<tr>
											<th>NO</th>
											<th>단어</th>
											<th>요청 데이터 셋</th>
											<th>요청 날짜</th>
											<th>수집 기간</th>
											<th>작성자</th>
											<th>요청 상태</th>
										</tr>
										<tr v-for="(daumNewsRequest,index) in selectApprovalDaumNewsRequestList" v-on:click="infoMExportList(daumNewsRequest.dataExportRequestCode,5)">
											<td>{{daumExportPaging.records-(daumExportPaging.currentPage-1)*daumExportPaging.perPage-index}}</td>
											<td class="bold color_b">{{daumNewsRequest.exportCollectWord}}</td>
											<td>{{daumNewsRequest.datasetName}}</td>
											<td>{{daumNewsRequest.exportCollectDate}}</td>
											<td>{{daumNewsRequest.exportCollectStartDate}}~{{daumNewsRequest.exportCollectEndDate}}</td>
											<td>{{daumNewsRequest.memberId}}</td>
											<td class="text_red" v-if="daumNewsRequest.exportCollectStatus == 'N'">반출 대기</td>
											<td class="text_red" v-if="daumNewsRequest.exportCollectStatus == 'S'">반출 중</td>
											<td class="text_red" v-if="daumNewsRequest.exportCollectStatus == 'Y'">반출 완료</td>
										</tr>
									</table>
									<!--다음뉴스 데이터 페이징 -->
									<div class="buttons mt_35">
										<nav aria-label="pagination example" class="dis_in">
											<b-pagination ref="daumNewsTable" for="table" align="center" size="md" :total-rows="daumExportPaging.records" v-model="daumExportPaging.currentPage" :per-page="daumExportPaging.perPage" limit="10" v-show="daumExportPaging.records > 0">
											</b-pagination> 
										</nav>
									</div>
								</div>
								<button class="btn btn-creat fr size_130" data-toggle="modal" data-placement="bottom" data-target="#dataExportDaumNewsRequestPopup" role="button">스케줄 등록</button>
							</div>
						</div>
					</div>
				</div>

				<!--시각화 요청 관리-->
				<div class="tab-pane fade tab_inner " id="student_list" role="tabpanel" aria-labelledby="student">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 시각화 요청 관리
						</p>
					</div>
					<button type="button" class="fr btn search-btn3" v-on:click="selectApprovalVizRequest(1)">검색</button>
					<input type="name" class="fr form-control search_box width_030" id="inputPassword" placeholder="검색어 입력" v-model="vizSearchWrd">
					<!--안쪽탭-->
					<div class="inner_tab mt_30">
						<div class="fr">
							<a v-on:click="vizDataSort(0)" v-bind:class="[vizSort==0 ? 'font_blue':'']">전체</a> | 
							<a v-on:click="vizDataSort(1)" v-bind:class="[vizSort==1 ? 'font_blue':'']">승인 대기</a> | 
							<a v-on:click="vizDataSort(2)" v-bind:class="[vizSort==2 ? 'font_blue':'']">승인 완료</a> |
							<a v-on:click="vizDataSort(3)" v-bind:class="[vizSort==3 ? 'font_blue':'']">승인 거부</a>
						</div>
						<div class="tab-content fl wsize_100" id="student_tabContent">
							<!--RSS 뉴스 데이터 -->
							<div class="tab-pane fade show active" id="student_list_now" role="tabpanel" aria-labelledby="now-tab">
								<div class="table" id="style-3">
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
										<tr v-for="(list,index) in selectApprovalVizRequestList">
											<td>{{vizReqPaging.records-(vizReqPaging.currentPage-1)*vizReqPaging.perPage-index}}</td>
											<td class="text-left">
											<a v-on:click="infoApprovalVizlist(list.dataCode)">{{list.datasetName}}</a></td>
											<td>{{list.dataEnrollDate}}</td>
											<td class="text_red" v-if="list.status == 'P'">승인대기 중</td>
											<td class="text_red" v-if="list.status == 'Y'">승인완료</td>
											<td class="text_red" v-if="list.status == 'R'">승인거부</td>
										</tr>
									</table>
									<form id="pageChange" method="post"></form>
								</div>
								<!-- 페이징 -->
								<div class="buttons mt_35">
									<nav aria-label="pagination example" class="dis_in">
										<b-pagination ref="vizTable" for="table" align="center" size="md" :total-rows="vizReqPaging.records" v-model="vizReqPaging.currentPage" :per-page="vizReqPaging.perPage" limit="10" v-show="vizReqPaging.records > 0">
										</b-pagination>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/admin/dataManage/popup/dataCollectionRequestPopup.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/admin/dataManage/popup/dataExportRequestPopup.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/admin/dataManage/popup/dataExportRequestShoppingPopup.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/admin/dataManage/popup/dataExportDaumNewsRequestPopup.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/admin/dataManage/script/dataApprovalManagementScript.jsp"></jsp:include>
