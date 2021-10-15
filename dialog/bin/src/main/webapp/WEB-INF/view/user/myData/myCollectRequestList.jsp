<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->

<!-- <div id="collectRequestList"> -->

<!-- 	<div class="full_box wsize_90"> -->
<!-- 		<div class="under_title mb_5 "> -->
<!-- 			<p class="fl mt_5"> -->
<!-- 				<span>|</span> 나의 요청 목록 -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 		<!--          <div class="under_title mb_5 fr"> --> -->
<!-- 		<!--검색--> -->
<!-- 		<div class="ml_875 wsize_50"> -->
<!-- 			<input type="name" class="form-control search_box wsize_60" -->
<!-- 				id="inputPassword" placeholder="검색어 입력"> -->
<!-- 			<button type="button" class="btn search-btn wsize_20">검색</button> -->
<!-- 		</div> -->
<!-- 		<!--          </div> --> -->
<!-- 		<!--탭--> -->
<!-- 		<div class="inner_tab"> -->
<!-- 			<ul class="nav nav-tabs inner_tab_menu wsize_70" id="teacher_tab" -->
<!-- 				role="tablist"> -->
<!-- 				<li class="nav-item"><a class="nav-link active show" -->
<!-- 					style="border-bottom: 0 !important;" id="now-tab" data-toggle="tab" -->
<!-- 					href="#teacher_list_now" role="tab" aria-controls="home" -->
<!-- 					aria-selected="true">다음 뉴스 데이터</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" -->
<!-- 					style="border-bottom: 0 !important;" id="last-tab" -->
<!-- 					data-toggle="tab" href="#teacher_list_last" role="tab" -->
<!-- 					aria-controls="profile" aria-selected="false">기타 데이터</a></li> -->
<!-- 			</ul> -->
<!-- 			<div class="tab-content" id="teacher_tabContent"> -->

<!-- 				다음 뉴스 데이터 -->
<!-- 				<div class="tab-pane fade show active" id="teacher_list_now" -->
<!-- 					role="tabpanel" aria-labelledby="now-tab"> -->
<!-- 					<div class="cb bd_d"></div> -->
<!-- 					<div class="fr mt_25"> -->
<!-- 						<a href="">전체</a> | <a href="">수집 대기</a> | <a href="">수집 중</a> | <a -->
<!-- 							href="">수집 완료</a> -->
<!-- 					</div> -->
<!-- 					<table class="table table-board mt_10"> -->
<!-- 						<colgroup> -->
<!-- 							<col width="5%" /> -->
<!-- 						</colgroup> -->
<!-- 						<tr> -->
<!-- 							<th>NO</th> -->
<!-- 							<th>단어</th> -->
<!-- 							<th>요청 날짜</th> -->
<!-- 							<th>수집 기간</th> -->
<!-- 							<th>현재 상태</th> -->
<!-- 						</tr> -->
<!-- 						<tr v-for="daumRequest in selectMyDaumCollectRequestList" v-on:click= "infoDaumList(daumRequest.daumNewsDataCollectRequestCode)"> -->
<!-- 							<td>{{daumRequest.daumNewsDataCollectRequestCode}}</td> -->
<!-- 							<td class="bold color_b">{{daumRequest.daumNewsRequestCollectWord}}</td> -->
<!-- 							<td>{{daumRequest.daumNewsRequestCollectDate}}</td> -->
<!-- 							<td><span>{{daumRequest.daumNewsRequestCollectStartDate}}~{{daumRequest.daumNewsRequestCollectEndDate}}</span></td> -->
<!-- 							<td class="text_red" v-if = "daumRequest.daumNewsRequestCollectStatus == 'N'"> -->
<!-- 								수집 대기 -->
<!-- 							</td> -->
<!-- 							<td class="text_red" v-if = "daumRequest.daumNewsRequestCollectStatus == 'S'"> -->
<!-- 								수집 중 -->
<!-- 							</td> -->
<!-- 							<td class="text_red" v-if = "daumRequest.daumNewsRequestCollectStatus == 'Y'"> -->
<!-- 								수집 완료 -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->
<!-- 				기타 데이터 -->
<!-- 				<div class="tab-pane fade" id="teacher_list_last" role="tabpanel" -->
<!-- 					aria-labelledby="last-tab"> -->
<!-- 					<div class="cb bd_d"></div> -->
<!-- 					<div class="fr mt_25"> -->
<!-- 						<a href="">전체</a> | <a href="">수집 대기</a> | <a href="">수집 중</a> | <a -->
<!-- 							href="">수집 완료</a> | <a href="">수집 거부</a> -->
<!-- 					</div> -->
<!-- 					<table class="table table-board mt_10"> -->
<!-- 						<colgroup> -->
<!-- 							<col width="5%;" /> -->
<!-- 							<col width="32%;" /> -->
<!-- 							<col width="32%;" /> -->
<!-- 							<col width="31%;" /> -->
<!-- 						</colgroup> -->
<!-- 						<tr> -->
<!-- 							<th>NO</th> -->
<!-- 							<th>사이트명</th> -->
<!-- 							<th>요청 날짜</th> -->
<!-- 							<th>현재 상태</th> -->
<!-- 						</tr> -->
<!-- 					<tr v-for="(actRequest) in selectMyActCollectRequestList"  v-on:click= "infoActList(actRequest.actDataCollectRequestCode)"> -->
<!-- 							<td>{{actRequest.actDataCollectRequestCode}}</td> -->
<!-- 							<td>{{actRequest.actRequestCollectSiteName}}</td> -->
<!-- 							<td>{{actRequest.actRequestCollectDate}}</td> -->
<!-- 							<td class="text_red" v-if = "actRequest.actRequestCollectStatus == 'N'"> -->
<!-- 								수집 대기 -->
<!-- 							</td> -->
<!-- 							<td class="text_red" v-if = "actRequest.actRequestCollectStatus == 'S'"> -->
<!-- 								수집 중 -->
<!-- 							</td> -->
<!-- 							<td class="text_red" v-if = "actRequest.actRequestCollectStatus == 'Y'"> -->
<!-- 								수집 완료 -->
<!-- 							</td> -->
<!-- 							<td class="text_red" v-if = "actRequest.actRequestCollectStatus == 'D'"> -->
<!-- 								수집 거부 -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<!--페이징 --> -->
<!-- 		<div class="buttons mt_35"> -->
<!-- 			<nav aria-label="pagination example" class="dis_in"> -->
<!-- 			<ul class="pagination pg-blue mb-0"> -->

<!-- 				First -->
<!-- 				<li class="page-item disabled"><a class="page-link">First</a></li> -->

<!-- 				Arrow left -->
<!-- 				<li class="page-item disabled"><a class="page-link" -->
<!-- 					aria-label="Previous"> <span aria-hidden="true"> &laquo; -->
<!-- 					</span> <span class="sr-only">Previous</span> -->
<!-- 				</a></li> -->
<!-- 				Numbers -->
<!-- 				<li class="page-item active"><a class="page-link">1</a></li> -->
<!-- 				<li class="page-item"><a class="page-link">2</a></li> -->
<!-- 				<li class="page-item"><a class="page-link">3</a></li> -->
<!-- 				<li class="page-item"><a class="page-link">4</a></li> -->
<!-- 				<li class="page-item"><a class="page-link">5</a></li> -->
<!-- 				Arrow right -->
<!-- 				<li class="page-item"><a class="page-link" aria-label="Next"> -->
<!-- 						<span aria-hidden="true"> &raquo; </span> <span class="sr-only">Next</span> -->
<!-- 				</a></li> -->
<!-- 				Last -->
<!-- 				<li class="page-item"><a class="page-link">Last</a></li> -->
<!-- 			</ul> -->
<!-- 			</nav> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<%-- <jsp:include page= "/WEB-INF/view/user/myData/script/collectRequestDataSelectScript.jsp"></jsp:include> --%>
