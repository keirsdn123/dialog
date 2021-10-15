<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90">

		<div id="adminMesList">

			<div class="under_title mb_5 ">
				<p class="fl mt_5">
					<span>|</span> 쪽지함 관리
				</p>
			</div>
<!---------------------------  쪽지 전체 조회  ---------------------------------->
			<div class="inner_tab">

				<div class="tab-content fl wsize_100" id="teacher_tabContent">
					<!--받은 쪽지함 -->
						<div class="fr wsize_50">
								<select class="form-control class_select fl wsize_20 ml_002" v-model="searchType">
									<option v-for="option in options" v-bind:value="option.value">{{option.text}}</option>
								</select>
								<input type="name" class="form-control search_box wsize_60 ml_001" id="inputPassword" placeholder="검색어 입력" v-model="searchContent">
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="selectMessageAdmin()">검색</button>
							</div>
						<div class="wsize_100 mt_50">		
							<table class="table table-board mt_10">
								<colgroup>
									<col width="5%" />
								</colgroup>
								<tr>
									<th>
										<input type="checkbox" id="recAllCheck" v-on:click="recAllCheck" v-bind:checked="requestorSeqList.length == messageList.length && messageList.length > 0" >
										<label for="recAllCheck"></label>
								   </th>
								   	<th>No. </th>
									<th>보낸 이</th>
									<th>받은 이 </th>
									<th>내용</th>
									<th>날짜</th>
							   </tr>
								
								<tr v-for="(list,index) in messageList" style="table-layout:fixed" >
									<td>									 
											 <input type="checkbox" v-model="requestorSeqList" id="recCheck" v-on:click="select" v-bind:value="list.messageSeq" >
											<label for="checkbox"></label>									
									</td>
									<td>{{index+1}}</td>
									<td>{{list.senId}}</td>
									<td>{{list.recId}}</td>
									<td>
										<div style='width:300px; min-width:300px; text-overflow:ellipsis; margin: 0 auto; overflow:hidden; white-space:nowrap;'>
											<a v-on:click="mesgInfo(list.messageSeq)">
													{{list.mesContent}}
											</a>
										</div>
									</td>
									<td><i style="font-size: 12px;">{{list.mesDate}}</i></td>								
								</tr>														
							</table>
						  </div>	
						<br> 
						<a href="/adminMessageInsert" class="btn btn-creat fr size_140 mr_5" role="button">쪽지보내기</a> 
						<a  v-on:click="mesgDel(requestorSeqList)" style="margin-left: 20%" class="btn btn-cencle fr size_100 mr_5" role="button">삭제</a>
					<div class="buttons mt_35" v-show="pagingInfo.records > 0">
						<nav aria-label="pagination example" class="dis_in">
							<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage"
										limit="10">
	   						</b-pagination>
						</nav>					
					</div>	
					
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/admin/messageManage/script/messageListManageScript.jsp"></jsp:include>




