<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div class="full_box wsize_90">

		<div id="mesList">

			<div class="under_title mb_5 ">
				<p class="fl mt_5">
					<span>|</span> 쪽지함
				</p>
			</div>

			<div class="inner_tab">
				<ul class="nav nav-tabs tab_menu_left" id="teacher_tab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active show" id="profitview" data-toggle="tab" href="#teacher_list_now"  v-on:click="selectMessageList()"  role="tab" aria-controls="home" aria-selected="true">받은 쪽지</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="balanceview" data-toggle="tab" href="#teacher_list_last" v-on:click="selectGiveMessageList()" role="tab" aria-controls="profile" aria-selected="false">보낸 쪽지</a>
					</li>
				</ul>

				<div class="tab-content fl wsize_100" id="teacher_tabContent">
					<!--받은 쪽지함 -->
					<div class="tab-pane fade show active" id="teacher_list_now" role="tabpanel" aria-labelledby="now-tab">
						<div class="cb bd_d"></div>
						<table class="table table-gray mt_5 wsize_100 table-hover">	
							<colgroup>
								<col width="5%" />
							</colgroup>
							<tr>
								<th>
									<input type="checkbox" id="recAllCheck" v-on:click="recAllCheck" v-bind:checked="requestorSeqList.length == messageList.length && messageList.length > 0" >
									<label for="recAllCheck"></label>
							   </th>
								<th>보낸 이</th>
								<th>내용</th>
								<th>날짜</th>
						   </tr>
							
							<tr v-for="list in messageList" style="table-layout:fixed;" v-if="list.messageViews=='N'">
								<td>									 
										 <input type="checkbox" v-model="requestorSeqList" id="recCheck" v-on:click="select" v-bind:value="list.messageSeq" >
										<label for="checkbox"></label>									
								</td>
								<td>{{list.senId}}</td>
								<td>
									<div  style='width:500px; min-width:500px; text-overflow:ellipsis; margin: 0 auto; overflow:hidden; white-space:nowrap;'>
										<a v-on:click="mesgInfo(list.messageSeq)">
												{{list.mesContent}}
										</a>
									</div>
								</td>
								<td><i style="font-size: 12px;">{{list.mesDate}}</i></td>								
							</tr>
							<tr v-for="list in messageList" style="table-layout:fixed; background:#cccccc69" v-if="list.messageViews=='Y'">
								<td>									 
										 <input type="checkbox" v-model="requestorSeqList" id="recCheck" v-on:click="select" v-bind:value="list.messageSeq" >
										<label for="checkbox"></label>									
								</td>
								<td>{{list.senId}}</td>
								<td>
									<div  style='width:500px; min-width:500px; text-overflow:ellipsis; margin: 0 auto; overflow:hidden; white-space:nowrap;'>
										<a v-on:click="mesgInfo(list.messageSeq)">
												{{list.mesContent}}
										</a>
									</div>
								</td>
								<td><i style="font-size: 12px;">{{list.mesDate}}</i></td>								
							</tr>

																					
						</table>
						<br> 
						<a href="/messageInsert" class="btn btn-creat fr size_140 mr_5" role="button">쪽지보내기</a> 
						<a  v-on:click="mesgDel(requestorSeqList)" style="margin-left: 20%" class="btn btn-cencle fr size_100 mr_5" role="button">삭제</a>
						<div class="buttons mt_35">
							<nav aria-label="pagination example" class="dis_in">
								<b-pagination ref="table" v-show="pagingInfo.records > 0" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage"
											limit="10">
		   						</b-pagination>
							</nav>					
						</div>		
					</div>
			<!--보낸 쪽지함 -->
					<div class="tab-pane fade" id="teacher_list_last" role="tabpanel" aria-labelledby="last-tab">
					  <div class="cb bd_d"></div>					
							<table class="table table-board mt_10">
								<colgroup>
									<col width="5%" />
								</colgroup>
								<tr>
									<th>
										<input type="checkbox" id="senAllCheck" v-on:click="senAllCheck" v-bind:checked="requestorSeqList.length == giveMessageList.length && giveMessageList.length > 0" >
										<label for="senAllCheck"></label>
									</th>
									<th>받은 이</th>
									<th>내용</th>
									<th>날짜</th>
								</tr>
								<tr v-for="glist in giveMessageList" style="table-layout:fixed">
									<td>
										<input type="checkbox" v-model="requestorSeqList" id="senCheck" v-on:click="select" v-bind:value="glist.messageSeq" >
										<label for="checkbox"></label>
									</td>
									<td>{{glist.recId}}</td>
										<td>
											<div style='width:500px; min-width:500px; text-overflow:ellipsis; margin: 0 auto; overflow:hidden; white-space:nowrap;'>
											<a v-on:click="mesgInfo(glist.messageSeq)">
												{{glist.mesContent}}
											</a>
											</div>
										</td>
									<td><i style="font-size: 12px;">{{glist.mesDate}}</i></td>
								</tr>
							</table>
								<br>  
							<a  v-on:click="senMessageDel(requestorSeqList)" style="margin-left: 20%" class="btn btn-creat fr size_100 mr_5" role="button">삭제</a>
							<div class="buttons mt_35" >
								<nav aria-label="pagination example" class="dis_in">
									<b-pagination ref="table2" v-show="pagingInfo2.records > 0" for="table" align="center" size="md" :total-rows="pagingInfo2.records" v-model="pagingInfo2.currentPage" :per-page="pagingInfo2.perPage"
												limit="10">
			   						</b-pagination>
								</nav>					
							</div>	
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/message/script/messageListScript.jsp"></jsp:include>




