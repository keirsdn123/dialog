<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="full_box wsize_90" id="mesInfo">			
			<div class="under_title mb_5 ">
				<p class="fl mt_5"><span>|</span> 쪽지 상세</p>
			</div>
			<div class="cb"></div>
			<!---------------------------  쪽지 상세 조회 --------------------------->
				<div class="photo_view">
					<div class="phototitle">
						<div class="photo_Info">
							<span class="photowriter">작성자</span> 
							<span class="photowriter_name fl mr_10">{{mesInfo.senId}}</span>
					    </div>
					</div>							
					<div class="notice_date">
						<p class="photodate fr">{{mesInfo.mesDate}}</p>
					</div>				
					<div>
						<ul class="screat_num ta_left">
							<li><span>|</span> 내용</li>
						</ul>
						<div class="payment_way3 ta_left" style="height: auto;">
							<table class="table fl wsize_100" style="font-family:'NanumGothic'">
								<tr>
									<td>{{mesInfo.mesContent}}</td>
								</tr>
							</table>
						</div>
					</div>
			</div>
			<div class="cb"></div>	
				<!---------------------------  받은 쪽지함인 경우 --------------------------->
			<div  style
			="margin-top:5%" v-if="mesInfo.recSeq==memberCode">				
				<a v-on:click="mesgDel(mesInfo.messageSeq)" class="btn btn-cencle fr size_100" role="button">삭제</a> 
				<a href="/selectMessage" class="btn btn-creat fr size_100 mr_5" role="button">목록</a> 
				<a v-on:click="messageReSend(mesInfo.senId)" class="btn btn-creat fr size_100 mr_5" role="button">답장</a>  
			</div>
	
				<!---------------------------  보낸 쪽지함인 경우 --------------------------->
			<div   style="margin-top:5%" v-else-if="mesInfo.senSeq==memberCode"> 				
				<a v-on:click="mesgDel(mesInfo.messageSeq)" class="btn btn-cencle fr size_100" role="button">삭제</a> 
				<a href="/selectMessage" class="btn btn-creat fr size_100 mr_5" role="button">목록</a> 
			</div>
			
</div>
<jsp:include page="/WEB-INF/view/user/message/script/messageInfoScript.jsp"></jsp:include>
