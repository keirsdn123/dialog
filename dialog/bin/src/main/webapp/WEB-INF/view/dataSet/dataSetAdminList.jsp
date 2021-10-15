<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>

    

<!-- 		<div class="full_box wsize_90"  id="datasetList"> -->
			
<!-- 			 <div class="under_title mb_5 "> -->
<!-- 				<ul class="tab"> -->
<!-- 					<li class="current" data-tab="tab1"><a href="#">카테고리</a></li> -->
<!-- 					<li data-tab="tab2"><a href="#">뉴스</a></li>							 -->
<!-- 				</ul>					 -->
<!-- 			</div> -->
<!-- 		    <div class="under_title mb_5 "> -->
<!-- 						<p class="fl mt_5"><span>|</span> 데이터 목록조회 </p> -->
<!-- 			</div> -->
<!-- 		<div id="tab1" class="tabcontent current"> -->
<!-- 			<div class ="wsize_100 fl mt_20" id ="current"style="height:600px;">											 -->
<!-- 					카테고리 시작 -->
<!-- 						<div class ="wsize_20 fl" id ="cateCon" style="margin:0 auto; height:100%; border: 1px solid #ddd; font-family:JejuGothic; box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);"> -->
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate1" style="height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;"> -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									문학 / 인문과학 -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate2" style=" height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;" > -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									문학 / 예술 -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate3" style="height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;" > -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									사회 / 사회과학 -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate4" style="height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;"> -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									자연 / 자연과학 -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate5" style="height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;"> -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									건강 / 보건 -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate6" style="height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;"> -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									공학 / 응용공학 -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!-- 							<div class ="wsize_100 fl bd_bd" id="cate7" style="height:50px;"> -->
<!-- 								<div class ="wsize_20 fl mt_15" style="min-width:30px;"> -->
<!-- 									- -->
<!-- 								</div> -->
<!-- 								<div class ="wsize_70 fl mt_15"> -->
<!-- 									기타 -->
<!-- 								</div> -->
<!-- 						</div> -->
<!-- 						뉴스 -->
<!-- 					</div> -->
<!-- 				<div class="wsize_78 hsize_100 fl ml_20">		 -->
<!-- 					<div class="wsize_100 fr mt_12"> -->
<!-- 						 <button type="button" class="btn search-btn size_100 fr">검색</button> -->
<!-- 						 <input type="name" class="form-control search_box wsize_50 fr" id="inputPassword" placeholder="검색어 입력"> -->
<!-- 						 <select class="form-control class_select fl wsize_20"> -->
<!-- 							<option value="1">작성자</option> -->
<!-- 							<option value="2">제목</option> -->
<!-- 							<option value="3">2016</option> -->
<!-- 						</select>								 -->
<!-- 					</div> -->
<!-- 					<div class="cb"></div> -->
<!-- 					<div class="wsize_100 mt_30" style="height:80%;"> -->
<!-- 						<table class="table table-board "> -->
<!-- 					           <colgroup> -->
<!-- 					          	  <col width="80px;" /> -->
<!-- 					              <col width="300px" /> -->
<!-- 					              <col width="100px;" /> -->
<!-- 					              <col width="100px;" /> -->
<!-- 								  <col width="100px;" /> -->
<!-- 					              <col width="100px;" /> -->
<!-- 					          </colgroup> -->
<!-- 					     <tr> -->
<!-- 					       <th>NO</th> -->
<!-- 					        <th>제목</th> -->
<!-- 					        <th>작성자</th> -->
<!-- 					         <th>날짜</th> -->
<!-- 							<th>시각화여부</th> -->
<!-- 							<th>타입</th> -->
<!-- 					     </tr> -->
<!-- 					     <tr v-for="(list,index) in selectDatasetList"> -->
<!-- 					             <td>{{index+1}}</td> -->
<!-- 					             <td class="text-left"><a v-on:click="dataSetListView(list.dataCode)">{{list.datasetName}}</a></td> -->
<!-- 					             <td>{{list.memberName}}</td> -->
<!-- 					              <td>{{list.dataEnrollDate}}</td> -->
<!-- 								<td>no</td> -->
<!-- 								<td>{{list.typeNormalRegularly}}</td> -->
<!-- 					     </tr> -->
<!-- 					     </table> -->
<!-- 				      	  <a href="/dataSet/dataSetInsertView" class="btn btn-creat mt_15 size_100 fr" role="button">등록</a> -->
<!-- 				      	 //목록 -->
<!-- 						 <div class="cb"></div> -->
<!-- 						 <form id="pageChange" method="post"></form> -->
<!-- 					</div> -->
<!-- 				</div>		   				 -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div id="tab2" class="tabcontent"> -->
<!-- 			<div class="wsize_100 hsize_100 fl ml_20">		 -->
<!-- 					<div class="wsize_100 fr mt_20"> -->
<!-- 						 <button type="button" class="btn search-btn size_100 fr">검색</button> -->
<!--   						 <input type="name" class="form-control search_box wsize_50 fr" id="inputPassword" placeholder="검색어 입력"> -->
<!-- 						 <select class="form-control class_select fl wsize_20"> -->
<!-- 							<option value="1">작성자</option> -->
<!-- 							<option value="2">제목</option> -->
<!-- 							<option value="3">2016</option> -->
<!-- 						</select>								 -->
<!-- 					</div> -->
<!-- 					<div class="cb"></div> -->
<!-- 					<div class="wsize_100 mt_30" style="height:80%;"> -->
<!-- 					<table class="table table-board "> -->
<!-- 				           <colgroup> -->
<!-- 				          	  <col width="80px;" /> -->
<!-- 				              <col width="300px" /> -->
<!-- 				              <col width="100px;" /> -->
<!-- 				              <col width="100px;" /> -->
<!-- 							  <col width="100px;" /> -->
<!-- 				              <col width="100px;" /> -->
<!-- 				          </colgroup> -->
<!-- 					     <tr> -->
<!-- 					       	<th>NO</th> -->
<!-- 					        <th>제목</th> -->
<!-- 					        <th>작성자</th> -->
<!-- 				         	<th>날짜</th> -->
<!-- 							<th>시각화여부</th> -->
<!-- 							<th>타입</th> -->
<!-- 					     </tr> -->
<!-- 					     <tr v-for="(list,index) in selectDatasetNewsList"> -->
<!-- 					             <td>{{index+1}}</td> -->
<!-- 					             <td class="text-left"><a v-on:click="dataSetListView(list.dataCode)">{{list.datasetName}}</a></td> -->
<!-- 					             <td>{{list.dataEnrollName}}</td> -->
<!-- 					              <td>{{list.dataEnrollDate}}</td> -->
<!-- 								<td>no</td> -->
<!-- 								<td>{{list.typeNormalRegularly}}</td> -->
<!-- 					     </tr> -->
<!-- 					     </table> -->
<!-- 		      			   <a href="/dataSet/dataSetInsertView" class="btn btn-creat mt_15 size_100 fr" role="button">등록</a> -->
<!-- 						 <div class="cb"></div> -->
<!-- 					</div> -->
<!-- 			 </div>						 -->
<!-- 		</div> -->
<!-- 	</div> -->
<!--   <form id="pageChange" method="post"></form> -->
<%-- <jsp:include page="/WEB-INF/view/dataSet/script/dataSetListScript.jsp"></jsp:include> --%>