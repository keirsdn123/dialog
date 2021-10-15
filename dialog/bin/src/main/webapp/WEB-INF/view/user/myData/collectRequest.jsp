<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="collectRequest"> 
	<div class="full_box wsize_90">
		<div class="inner_tab mt_30 bd_bd">
			<ul class="nav nav-tabs inner_tab_menu wsize_80" id="teacher_tab"
				role="tablist">
				<li class="nav-item"><a class="nav-link active show" style="border-bottom: 0 !important;" id="now-tab" data-toggle="tab" href="#teacher_list_now" role="tab" aria-controls="home" aria-selected="true">다음 뉴스 데이터</a></li>
				<li class="nav-item"><a class="nav-link" style="border-bottom: 0 !important;" id="last-tab" data-toggle="tab" href="#teacher_list_last" role="tab" aria-controls="profile" aria-selected="false">기타 데이터</a></li>
			</ul>
			<div class="tab-content" id="teacher_tabContent">
				<!--다음 뉴스 데이터 -->
				<div class="tab-pane fade show active bd_d05" id="teacher_list_now" role="tabpanel" aria-labelledby="now-tab">
					<div class="fl photo_write mt_45 wsize_45">
						<table class="table table-ddd001">
							<colgroup>
								<col width="150px" />
								<col width="calc(50% - 150px)" />
								<col width="150px" />
								<col width="calc(50% - 150px)" />
							</colgroup>
							<tbody>
								<tr>
									<th class="bold font_1e">수집 단어</th>
									<td><input type="text" class="fr form-control" placeholder="검색어를 입력하세요" v-model="daumNewsRequestCollectWord"></td>
								</tr>
								<tr>
									<th></th>
								</tr>
								<tr>
									<th class="bold font_1e">비고란</th>
									<td><textarea class="form-control" placeholder="비고 사항을 입력하세요" rows="5" v-model="daumNewsRequestCollectRemarks"></textarea></td>
								</tr>
								<tr>
									<th></th>
								</tr>
								<tr>
									<th class="bold font_1e">수집 기간</th>
									<td>
										<input class="fl form-control date_cho mr_0 wsize_37 startDate mr_002" v-model="daumNewsRequestCollectStartDate">
										<p class="mr_5 mt_5 fl">~</p>
										<input class="fl form-control date_cho mr_0 wsize_37 endDate" v-model="daumNewsRequestCollectEndDate">
										<button type="button" class="btn search-btn fl size_90 ml_5" v-on:click = "dateReset">초기화</button>
									</td>
								</tr>
								<tr>
									<th></th>
									<td>
										<button type="button" class="fl btn search-btn2 size_100 ml_70" v-on:click ="dateChange(daumNewsRequestCollectStartDate, daumNewsRequestCollectEndDate, 'D');">1일</button>
										<button type="button" class="fl btn search-btn2 size_100 ml_5" v-on:click ="dateChange(daumNewsRequestCollectStartDate, daumNewsRequestCollectEndDate, 'W');">최근 1주</button>
										<button type="button" class="fl btn search-btn2 size_100 ml_5" v-on:click ="dateChange(daumNewsRequestCollectStartDate, daumNewsRequestCollectEndDate, 'M');">한 달</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="fl photo_write ml_43 wsize_30 line01 h_430">
						<div class="size_600 padding_10">
							<ul class="pd_0 width_100 ml1_76 ta_left dis_in">
								<br>
								<span class="font_08"> * 다음 사이트 내에서 요청하신 수집 단어, 수집 기간의 검색 결과에 따른 모든 뉴스 데이터를 수집합니다.<br>
									<p class="bg_f1">
										<br> - 수집 단어 : 수집 대상에 대한 수집 단어를 입력합니다.
										<br> - 수집 기간 : 수집할 뉴스의 발행 기간을 설정합니다.
										<br> - 비고란 : 비고 사항을 입력합니다.
										<br><br> * 데이터 수집 요청을 하면 언론사, 제목, 본문, 발행 일자, 기고자에 대한 메타 정보를 excel 파일로 받아보실 수 있습니다. 
										<br><br>
									</p> * <strong class="col_50">수집 단어는 한 단어만 요청하실 수 있으며 </strong>수집 단어를 여러 단어를 사용할 시 데이터의 정확도가 떨어집니다.<br><br>
								</span>
							</ul>
						</div>
					</div>
					<button type="button" class="btn btn-creat mt_375 fr" v-on:click="insertDaumCollectRequest(0)">데이터 수집 요청</button>
				</div>
				<!--기타 데이터-->
				<div class="tab-pane fade bd_d05" id="teacher_list_last" role="tabpanel" aria-labelledby="last-tab">
					<div class="fl photo_write mt_100 wsize_45">
						<table class="table table-ddd001 mt_050">
							<colgroup>
								<col width="150px" />
								<col width="calc(50% - 150px)" />
								<col width="150px" />
								<col width="calc(50% - 150px)" />
							</colgroup>
							<tbody>
								<tr>
									<th class="bold font_1e">수집 URL</th>
									<td><input type="text" class="fr form-control" placeholder="수집할 페이지의 URL을 입력하세요" v-model="actRequestCollectSiteUrl"></td>
								</tr>
								<tr>
									<th></th>
								</tr>
								<tr>
									<th class="bold font_1e">사이트 명</th>
									<td><input type="text" class="fr form-control" placeholder="사이트 명을 입력하세요" v-model="actRequestCollectSiteName"></td>
								</tr>
								<tr>
									<th></th>
								</tr>
								<tr>
									<th class="bold font_1e">상세 설명</th>
									<td><textarea class="form-control" rows="5" placeholder="상세 설명을 입력하세요" v-model="actRequestCollectDescription"></textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="fl photo_write ml_43 wsize_30 line01 h_430">
						<div class="size_600 padding_10">
							<ul class="pd_0 width_100 ml1_76 ta_left dis_in">
								<br>
								<span class="font_08"> * 지정한 URL 페이지의 텍스트를 수집하며, 페이지 내에
									링크로 연결된 문서가 있을 경우 연결되는 페이지의 문서까지 수집합니다.<br>
									<p class="bg_f1">
										<br> - 수집 URL <br> 예)
										Ex)https://search.naver.com/search.naver?where=nexearch<br>&sm=top_hty&fbm=0&ie=utf8&query=%EB%B2%84%EC%8A%A4
										<br> - 사이트 명 <br> 예) 네이버 <br>- 상세 설명 <br>
										예) 네이버 다이얼로그 검색 결과 페이지 크롤링해주세요.<br>
										<br>
									</p> * <strong class="col_50">요청하신 데이터는 수집이 거부될 수 있으며 </strong>수집이
									되더라도 수집 기간이 다소 오래 걸릴 수 있습니다.<br>
								</span>
							</ul>
						</div>
						</p>
					</div>
					<button type="button" class="btn btn-creat mt_375 fr" v-on:click="insertActCollectRequest(1)">데이터 수집 요청</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myData/script/collectRequestDataInsertScript.jsp"></jsp:include>