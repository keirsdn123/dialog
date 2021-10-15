<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="full_box wsize_90">

		<div id="queList">
<!---------------------------  사용자  --------------------------->
			   <div v-if="memberList.memberRatingCode < 3">
						<div class="under_title mb_5 ">
							<p class="fl mt_5">
								<span>|</span> 문의사항
							</p>
						</div>
					
					<div class="tab-pane fade show active" id="teacher_list_now" role="tabpanel" aria-labelledby="now-tab" >
							<div class="cb bd_d"></div>
						
							<div class="cb bd_d"></div>
							<table class="table table-board">
								<colgroup>
									<col width="5%" />
								</colgroup>
								<tr>
									<th>No</th>
									<th>Title</th>
									<th>Name</th>
									<th>Date</th>
									<th>분류</th>
									<th>Views</th>
							   </tr>
								
								<tr v-for="(list,index) in questionList" style="table-layout:fixed" >
									<td>{{pagingInfo.records-(pagingInfo.currentPage-1)*pagingInfo.perPage-index}}</td>
									<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
										<a v-on:click="queInfo(list.noticeCode)">
												{{list.noticeTitle}}
										</a>
										<a v-if="list.noticeFileTitle!=null">
											<img src="resources/img/sample/file.png" style="width:5%; height:30%">
										</a>
									</td>
									<td>{{list.memberName}}</td>
									<td><i style="font-size: 12px;">{{list.noticeDate}}</i></td>
									<td>{{list.noticeStatus}}</td>
									<td>{{list.noticeViews}}</td>								
								</tr>														
							</table>
							<br>						
							<a href="/questionInsert" class="btn btn-creat fr size_140 mr_5" role="button">등록</a> 
				</div>
			</div>	
																																																
<!---------------------------  관리자 --------------------------->
				<div v-else-if="memberList.memberRatingCode == 3">
					<div class="under_title mb_5 ">
						<p class="fl mt_5">
							<span>|</span> 문의사항 관리
						</p>
					</div>
						<div class="tab-pane fade show active" id="teacher_list_now" role="tabpanel" aria-labelledby="now-tab" >
								
							<br>		
								<div class="fr wsize_50">
									<select class="form-control class_select fl wsize_20 ml_002" v-model="searchType">
										<option v-for="option in options" v-bind:value="option.value">{{option.text}}</option>
									</select>
									<input type="name" class="form-control search_box wsize_60 ml_001" id="inputPassword" placeholder="검색어 입력" v-model="searchContent">
									<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="selectQuestionList()">검색</button>
								</div>
								<div class="fr mt_003 mr_050">
									<a v-on:click="noticeViewSort(0)" v-bind:class="[noticeSort==0 ? 'font_blue' : '']">전체</a> |
									<a v-on:click="noticeViewSort(1)" v-bind:class="[noticeSort==1 ? 'font_blue' : '']">미 답변</a> | 
									<a v-on:click="noticeViewSort(2)" v-bind:class="[noticeSort==2 ? 'font_blue' : '']">답변완료</a> |
								</div>		
										

								<div class="wsize_100 mt_70">
									<table class="table table-board">
										<colgroup>
											<col width="5%" />
										</colgroup>
										<tr>
											<th>
												<input type="checkbox" id="recAllCheck" v-on:click="recAllCheck" v-bind:checked="requestorSeqList.length == questionList.length && questionList.length > 0" >
												<label for="recAllCheck"></label>
										   </th>
											<th>No</th>
											<th>Title</th>
											<th>Name</th>
											<th>Date</th>
											<th>분류</th>
											<th>Views</th>
									   </tr>
										
										<tr v-for="(list,index) in questionList" style="table-layout:fixed" >
											<td>									 
												 <input type="checkbox" v-model="requestorSeqList" id="recCheck" v-on:click="select" v-bind:value="list.noticeCode" >
												<label for="checkbox"></label>									
											</td>
											<td>{{index+1}}</td>
											<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
												<a v-on:click="queInfo(list.noticeCode)">
														{{list.noticeTitle}}
												</a>
												<a v-if="list.noticeFileTitle!=null">
													<img src="resources/img/sample/file.png" style="width:5%; height:30%">
												</a>
											</td>
											<td>{{list.memberName}}</td>
											<td><i style="font-size: 12px;">{{list.noticeDate}}</i></td>
											<td>{{list.noticeStatus}}</td>
											<td>{{list.noticeViews}}</td>								
										</tr>														
									</table>
								 </div>

								</table>

								<br> 
									<a href="/questionInsert" class="btn btn-creat fr size_140 mr_5" role="button">등록</a>
									<a  v-on:click="QusDel(requestorSeqList)" style="margin-left: 10px" class="btn btn-cencle fr size_100 mr_5" role="button">삭제</a>
						</div>	

				</div>	
				<div class="buttons mt_35" v-show="pagingInfo.records > 0">
					<nav aria-label="pagination example" class="dis_in">
						<b-pagination   ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage"
									limit="10">
   						</b-pagination>
					</nav>					
				</div>
			</div>
			
</div>
<form id="pageChange" method="post"></form>
<jsp:include page="/WEB-INF/view/user/question/script/questionListScript.jsp"></jsp:include>



