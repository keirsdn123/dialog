<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>
	<div id = "myPageList" class="full_box wsize_90">			 
			 <div class="under_title mb_5 ">
						<p class="fl mt_5"><span>|</span> 마이페이지 </p>						
			</div>			
				<div class="cb"></div>	
<!---------------------------  회원정보  ---------------------------------->
				<div class="edit_account mr_10" >
	               <div class="wsize_100">
						<div class="under_title mb_25 wsize_48">
								<p class="fl mt_5 "><span><i class="fa  fa-th-list"></i></span> 내 정보 </p>
						</div>
						<div>
							<table class="table table-ddd02 mt_10" style="text-align:center">
								<colgroup>
									<col width="120px" />
									<col width="calc(50% - 120px)" />
									<col width="180px" />
									<col width="calc(50% - 180px)" />
								</colgroup>
									<tr>
										<th scope="row">
											<div class="thcell">
											     	   <span style="font-weight: 600">이름</span>
											     </div>
										</th>				
										<td>
											<div class="tdcell">
												<p id="p_txt_myLetterEmail" class="contxt_tit">{{info.memberName}}</p>
											</div>
										</td>
									</tr>
									<tr>
										<th style="font-weight: 600">아이디</th>
										<td>
											<div class="tdcell">
												<p id="p_txt_myLetterEmail" class="contxt_tit">{{info.memberId}}</p>
											</div>
										</td>
									</tr>
									<tr>
										<th style="font-weight: 600">회원 등급</th>
										<td v-if=info.memberRatingCode==1 >
										 준회원
										</td>	
										<td v-if=info.memberRatingCode==2 >
										 정회원
										</td>						
									</tr>
							</table>
							<div style="margin-top:20%" >
								<a href="/proFileList">회원정보 및 수정  <i class="fa fa-caret-right" style="font-size:12px;" aria-hidden="true"></i></a>
								<a v-on:click="updateMyPassword" style="margin-left:10%">비밀번호 변경  <i class="fa fa-caret-right" style="font-size:12px;" aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
	            </div>

<!---------------------------  데이터 목록  ---------------------------------->            
            <div class="edit_account" >
				<div class="wsize_100">
					<div class="under_title mb_25 wsize_48">
							<p class="fl mt_5 "><span><i class="fa  fa-th-list"></i></span> 나의 데이터 </p>
						</div>
						<div class="fr mt_10 mr_10">
							<a href="/dataSet/mydataList">
								<p class="fl mr_10">more </p>
								<p class="fl mr_5 mt_002"><i class="fa fa-angle-right"></i></p>
							</a>
						</div>
						<div>
							<table class="table table-board">
								<thead>
									<tr>
										<th>No.</th>
										<th>제목</th>
										<th>등록 날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="(mydata,index) in selectMyData">
										<td>{{index+1}}</td>
										<td>{{mydata.datasetName}} </td>
										<td>{{mydata.dataEnrollDate}}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
            </div>
            
               
            </div>
		
</body>
<jsp:include page="/WEB-INF/view/user/myPage/script/mypageListScript.jsp"></jsp:include>