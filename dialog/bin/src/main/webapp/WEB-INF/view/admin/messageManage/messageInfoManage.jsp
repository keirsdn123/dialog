<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="full_box wsize_90" id="mesInfo">			
	<div class="under_title mb_5 ">
				<p class="fl mt_5"><span>|</span> 쪽지 상세</p>
			</div>
			<div class="cb"></div>
<!---------------------------  쪽지 상세조회  ---------------------------------->
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
	<!---------------------------  목록  ---------------------------------->			
			<a href="/selectMessageManage" class="btn btn-creat fr size_100 mr_5" role="button">목록</a> 
		

			
</div>
<jsp:include page="/WEB-INF/view/admin/messageManage/script/messageInfoManageScript.jsp"></jsp:include>
