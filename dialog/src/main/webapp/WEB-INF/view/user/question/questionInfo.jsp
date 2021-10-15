<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div id="questionView">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 mb_25">
			<p class="fl mt_5 "><span>|</span> 문의사항 상세조회 </p>
		</div>
		<div class="cb"></div>
		<div class="photo_view">
			<div style="height:auto;">

				<!-- 작성자 -->
				  	<div class="photo_Info pd_0 mt_30">
						<span class="photowriter">작성자</span> <span class="photowriter_name fl ml_10">{{noticeInfo.memberName}}</span>
					</div>
				<!-- 조회수 -->
					<div class="hits">
						<span class="fl mr_5">조회수</span> <span class="fl mr_10">{{noticeInfo.noticeViews}}</span>
					</div>
					<!-- 등록일 -->
					
					<div class="notice_date mr_30">
						<p class="photodate fr">등록일 {{noticeInfo.noticeDate}}</p>
					</div>

				<div class="cb">
				</div>

				<!---------------------------  내용 표 --------------------------->
				<div>
					<table class="table table-ddd">
						<colgroup>
							<col width="150px" />
		                    <col width="calc(50% - 150px)"/>
						</colgroup>
						<tr>
							<th>제목</th>
							<td style="text-align:left;">{{noticeInfo.noticeTitle}}</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
								<div class="fl mr_15" v-for="(list, index) in noticeFileInfo">
									<a v-on:click="noticeFileDownload(index)"><span class="fl mr_10 mt_5">{{list.noticeFileOriginalTitle}}</span></a>								
								</div>
							</td>
						
						</tr>
					</table>
				</div>
				<!---------------------------  내용 --------------------------->
				
				<div>
					<ul class="screat_num ta_left">
						<li><span>|</span> 내용</li>
					</ul>
					<div class="payment_way3 ta_left" style="height: auto;">
<!-- 						<input type="text" class="form-control wsize_100 fl" v-bind:value="value.vizRequests" readonly> -->
						<table class="table fl wsize_100" style="font-family:'NanumGothic'">
							<tr>
								<td>{{noticeInfo.noticeContent}}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
		
			<!---------------------------  작성자일 경우 --------------------------->
			<div  style="margin-top:5%" v-if="noticeInfo.memberCode==memberCode">				
				<a v-on:click="noticeDel(noticeInfo.noticeCode)" class="btn btn-creat fr size_100" style="margin-top:10px" role="button">삭제</a> 
				<a href="/question" class="btn btn-creat fr size_100 mr_5" style="margin-top:10px" role="button">목록</a> 
			</div>
			<!---------------------------  작성자가 아닌 경우 --------------------------->
			<div  style="margin-top:5%" v-else if="noticeInfo.memberCode==memberCode">
				<a href="/question" class="btn btn-creat fr size_100 mr_5" style="margin-top:10px" role="button">목록</a> 			
			</div>
				
		<div class="cb"></div>		

		<!----------------------------답글------------------------------>
			
			
			<div class="comment">
				<ul class="screat_num ta_left">
						<li><span>|</span> 답글</li>
				</ul>
				<div class="payment_way3 ta_left" style="height: auto;">
						<table class="table table-ddd01 fl wsize_100" style="font-weight:600;">
							<tr class="active" >
								<th class="text-center" style="width:65%;"><b>내용</b></th>
								<th class="text-center" style="width:25%;"><b>등록일</b></th>
								<th v-if="memberRatingCode==3" class="text-center" style="width:10%;"><b>삭제</b></th>
							</tr>
							<tr   v-for="(re) in reList">
			              		<td style="text-align:center">{{re.noticeReContent}}</td>
			              		<td>{{re.noticeReDate}}</td>
			              		<td v-if="memberRatingCode==3"  style="text-align: center;">
			              			<img src= "/resources/img/icon/delete-button.png" v-on:click="deleteNoticeRe(re.noticeReCode)">	
			              		</td>
							</tr>
						</table>
				</div>
			</div>
		<!----------------------------답글작성란 (관리자만)------------------------------>
			<div  v-if="memberRatingCode==3">
					<ul class="screat_num ta_left">
								<li><span>|</span> 답글작성</li>
					</ul>
					<ul class="comment_w">
						<!--댓글작성 공간-->
						<li>
						<div class="write_box">
							 <div class="form-group">				
								<textarea class="form-control fl wsize_100 rounded-0" rows="2" v-model="noticeReContent"
									style="float: left; width: 80%; float: left;">
								</textarea>
								<a class="btn btn-creat size_120 fr" role="button"	v-on:click="insertReNotice">등록하기</a> 				
							</div>
						</div>
						
						</li>
					</ul>
			</div>	
			
		</div>

		</div>						
	</div>
	<form id="pageChange" method="post">
	</form>
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/user/question/script/questionInfoScript.jsp"></jsp:include>

