<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>      
 <div id="dataExport">   
   <div class="modal fade" id="dataExportRequestPopup" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width:1600px;">
         <div class="modal-content">
            <div class="modal-header bg_gray font_w">
               <h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">스케줄 등록 </h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">
                  &times; 
                  </span>
               </button>
            </div>
            <div class="modal-body">
               <div class="wsize_30 po_r bd_d05 table_sc03" id="style-3">
                  <div class="modal-header bg_blue font_w">
                  	 <div >
                     	<h5 class="modal-title fw_5 f_sq " id="examquestion_plusLabel">| 데이터 반출 요청 목록 - RSS 뉴스 데이터 - </h5>
                     </div>	
                  </div>
                  <div>
                  	<table class="table table-gray table-hover" >
                  		<tr v-for="(rssExportRequest, index) in selectApprovalRssRequestList" >
							<td class="bold color_b">
								<a v-on:click="exportInfo(rssExportRequest.dataExportRequestCode,rssExportRequest.datasetName, index)" >{{rssExportRequest.exportCollectWord}}<font :id="'exportButton'+index">▼</font></a>
								<div :id="'exportTab'+index" style="display:none" >
						 			<table class="table table-board02  mt_10">
										<tr>
											<th>수집단어</td>
											<td :id="'exportKeword'+index"></td>
										</tr>
										<tr>
											<th>요청날짜</td>
											<td :id="'exportRequestDate'+index"></td>
										</tr>
										<tr>
											<th>수집기간</td>
											<td :id="'exportCollectionDate'+index"></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				  </div>   
               </div>
                <div class="wsize_30  po_r bd_d05 table_sc03" id="style-3">
                  <div class="modal-header bg_blue font_w " >
                  	 <div>	
                   	 	<h5 class="modal_tile_01 fw_5 f_sq" id="examquestion_plusLabel">| 스케줄 등록 정보</h5>
                     </div>
                  </div>
                  <div class="po_r" id="style-3">
                    <div class="modal-header">
                     	 <div class="mg_auto">
                    	 	<h5 class="modal_tile_01 fw_5 f_sq"  >개발 소스 정보</h5>
                    	 </div>
                  	</div>
                  	<table class="mg_auto ta_center" cellpadding="8" >
                        <tr style="padding:10px">
                           <td class="table_tr_td_01">작업명 :</td><td><input type="text" style="width:200px; background-color: #e2e2e2;" v-model="scheWorkTitle"  readonly></td>
                        </tr>
                        <tr style="padding:10px">
                           <td class="table_tr_td_01">개발 소스 파일명 :</td><td><input type="text"  v-model="devSourceTitle" style="width:200px; background-color: #e2e2e2;" readonly></td>
                        </tr>
                        <tr style="padding:10px">
                           <td class="table_tr_td_01">개발 소스 파일 경로 :</td><td><input type="text" v-model="devSourceFilePath" style="width:200px; background-color: #e2e2e2;" readonly></td>
                        </tr>
                     </table>
                  </div>
                  <div class="po_r mt_60" id="style-3">
                     <div class="modal-header">
                    	 <div class="mg_auto">
                    	 	<h5 class="modal_tile_01 fw_5 f_sq ta_center">주기 설정</h5>
                  	 	</div>
                  	 </div>
                  	 <div>
                  	 	<table class="mg_auto ta_center" cellpadding="8">
                  	 		<tr>
                  	 			<td> 크론표현식 : </td>
                  	 			<td>
		                  	 		<select class="form-control" id="exportCron">
										<option>작업선택</option>
										<option>일시적지정</option>
									  	<option>증분지정</option>
									</select>
                  	 			</td>
                  	 		</tr>
						</table>
                  	 </div>
                     <table class="mg_auto ta_center" cellpadding="8" id="dataExportDirect">
                        <tr>
                           <td class="fl"> 초 (Seconds):</td>
                           <td ><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="0 ~ 59" readonly></td>
						   <td class="direct ">
						   		<input type="text"   class="form-control seconds" style="width:115px; text-align-last:center; display:none;"  v-model="seconds" value="">
						   		<select class="form-control seconds " id="dataExportSeconds" style="width:115px; text-align-last:center; " v-model="seconds">
									<option> - </option>
									<option>직접입력</option>
						   		</select>
						   </td>
						   
                        </tr>
                        <tr>
                           <td class="fl"> 분 (Minutes):</td>
                           <td ><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="0 ~ 59" readonly></td>
                           <td class="direct">
						   		<input type="text"   class="form-control minutes" style="width:115px; text-align-last:center; display:none;" v-model="minutes">
						   		<select class="form-control minutes" id="dataExportMinutes" style="width:115px; text-align-last:center;" v-model="minutes">
									<option>-</option>
									<option>직접입력</option>
						   		</select>
						   		
						   </td>
						   
                        </tr>
                        <tr>
                           <td class="fl"> 시 (Hours):</td>
                           <td ><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="0 ~ 23" readonly></td>
                           <td class="direct">
						   		<input type="text"   class="form-control hours" style="width:115px; text-align-last:center; display:none;" v-model="hours">
						   		<select class="form-control hours" id="dataExporttHours" style="width:115px; text-align-last:center;" v-model="hours">
									<option>-</option>
									<option>직접입력</option>
						   		</select>
						   </td>
						   
                        </tr>
                        <tr>
                           <td class="fl"> 일 (Day):</td>
                           <td ><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="1 ~ 31" readonly></td>
                           <td class="direct">
						   		<input type="text"   class="form-control day" style="width:115px; text-align-last:center; display:none;" v-model="day">
						   		<select class="form-control day" id="dataExportDay" style="width:115px; text-align-last:center;" v-model="day">
									<option>-</option>
									<option>직접입력</option>
						   		</select>
						   </td>
						   
                        </tr>
                        <tr>
                           <td class="fl"> 월 (Month):</td>
                           <td ><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="1-12 , JAN-DEC" readonly></td>
                           <td class="direct">
						   		<input type="text"   class="form-control months" style="width:115px; text-align-last:center; display:none;" v-model="month">
						   		<select class="form-control months" id="dataExportMonths" style="width:115px; text-align-last:center;" v-model="month">
									<option>-</option>
									<option>직접입력</option>
						   		</select>
						   </td>
						   
                        </tr>
                        <tr>
                           <td class="fl"> 년도 (Year):</td>
                           <td><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="empty, 1970-2099" readonly></td>
                           <td class="direct">
						   		<input type="text"  class="form-control year" style="width:115px; text-align-last:center; display:none;" v-model="year">
						   		<select class="form-control year" id="dataExportYear" style="width:115px; text-align-last:center;" v-model="year">
									<option>-</option>
									<option>직접입력</option>
						   		</select>
						   </td>
                        </tr>
                     </table> 
                     
                     <table class="mg_auto ta_center" cellpadding="8" id="dataExportEach">
                        <tr>
                           <td class="fl"> 초 (Seconds):</td>
						   
						   <td>
						   		<select class="form-control" id="dataExportEachSeconds">
									<option>범위지정</option>
							  		<option>매초마다</option>
						   		</select>
						   </td>
						   <td class="eachSeconds">
						   		<select class="form-control eachSecondsFl"   style="width:80px; text-align-last:center; display:inline" v-model="eachSecondsFl">
						   			<option>-</option>
						   		</select>
						   		-
						   		<select class="form-control eachSecondsSe"  style="width:80px; text-align-last:center; display:inline" v-model="eachSecondsSe">
						   			<option>-</option>
						   		</select>
						   </td>
                        </tr>
                        <tr>
                           <td class="fl"> 분 (Minutes):</td>
						   
						   <td>
						   		<select class="form-control" id="dataExportEachMinutes">
									<option>범위지정</option>
							  		<option>매분마다</option>
						   		</select>
						   </td>
						   <td class="eachMinutes">
						   		<select class="form-control eachMinutesFl"  style="width:80px; text-align-last:center; display:inline" v-model="eachMinutesFl">
						   			<option>-</option>
						   		</select>
						   		-
						   		<select class="form-control eachMinutesSe"  style="width:80px; text-align-last:center; display:inline" v-model="eachMinutesSe">
						   			<option>-</option>
						   		</select> 
						   </td>
                        </tr>
                        <tr>
                           <td class="fl"> 시 (Hours):</td>
						   
						   <td>
						   		<select class="form-control" id="dataExportEachHours">
									<option>범위지정</option>
							  		<option>매시간마다</option>
						   		</select>
						   </td>
						   <td class="eachHours">
						   		<select class="form-control eachHoursFl"  style="width:80px; text-align-last:center; display:inline" v-model="eachHoursFl">
						   			<option>-</option>
						   		</select>
						   		-
						   		<select class="form-control eachHoursSe"  style="width:80px; text-align-last:center; display:inline" v-model="eachHoursSe">
						   			<option>-</option>
						   		</select> 
						   </td>
                        </tr>
                        <tr>
                           <td class="fl"> 일 (Day):</td>
						   
						   <td>
						   		<select class="form-control" id="dataExportEachDay" >
									<option>범위지정</option>
							  		<option>매일마다</option>
						   		</select>
						   </td>
						   <td class="eachDay">
						   		<select class="form-control eachDayFl"  style="width:80px; text-align-last:center; display:inline" v-model="eachDayFl">
						   			<option>-</option>
						   		</select>
						   		-
						   		<select class="form-control eachDaySe"  style="width:80px; text-align-last:center; display:inline" v-model="eachDaySe">
						   			<option>-</option>
						   		</select> 
						   </td>
                        </tr>
                        <tr>
                           <td class="fl"> 월 (Month):</td>
						   
						   <td>
						   		<select class="form-control" id="dataExportEachMonth" >
									<option>범위지정</option>
							  		<option>매월마다</option>
						   		</select>
						   </td>
						   <td class="eachMonth">
						   		<select class="form-control eachMonthFl"  style="width:80px; text-align-last:center; display:inline" v-model="eachMonthFl">
						   			<option>-</option>
						   		</select>
						   		-
						   		<select class="form-control eachMonthSe"  style="width:80px; text-align-last:center; display:inline" v-model="eachMonthSe">
						   			<option>-</option>
						   		</select> 
						   </td>
                        </tr>
                     </table>
                  </div>   
               </div>
               <div class="wsize_40  po_r bd_d05 table_sc03" id="style-3">
                  <div class="modal-header bg_blue font_w">
                     <div>
                     	<h5 class="modal_tile_01 fw_5 f_sq text-center" id="examquestion_plusLabel">| 등록된 스케줄 목록</h5>
                     </div>	
                  </div>
                  <div>
                  	<table class="table table-board table-hover mt_10">
						<colgroup>
							<col width="150px;" />
							<col width="150px;" />
							<col width="100px;" />
							<col width="80px;" />
							<col width="80px;" />
						</colgroup>
						<tr>
							<th>작업명</th>
							<th>작동주기</th>
							<th>작동상태</th>
							<th>타입</th>
						</tr>
						<tr v-for="list in selectScheList">
							<td>{{list.scheWorkTitle}}</td>
							<td>{{list.scheWorkCycle}}</td>
							<td>
				            	<span v-if="list.scheStatusCode==0">작동대기</span>
				            	<span v-if="list.scheStatusCode==1">작동중</span>
				            	<span v-if="list.scheStatusCode==2" style="color:blue;">작동완료</span>
				            	<span v-if="list.scheStatusCode==3" style="color:red;">작동오류</span>
				            	<span v-if="list.scheStatusCode==4">작동중지</span>
				            	<span v-if="list.scheStatusCode==5">작동수정</span>
           					</td>
							<td>{{list.scheType}}</td>
						</tr>
					</table>
                  </div>
               </div>
               <div class="under_title">
               </div>
               </div>
               <!--//목록-->
		       <div class="cb"></div>
		       <div class="buttons">
					<nav aria-label="pagination example" class="dis_in">
						<b-pagination ref="table" for="table" align="center" size="md" :total-rows="pagingInfo.records" v-model="pagingInfo.currentPage" :per-page="pagingInfo.perPage" limit="10" v-show="pagingInfo.records > 0"></b-pagination>
					</nav>
			   </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-cencle size_100 fr" data-dismiss="modal">
                     	닫기
                  </button>
                  <button class="btn btn-creat size_100 fr" v-on:click ="scheduleInsert">
                     	등록
                  </button>
               </div>
            </div>
         </div>
      </div>      
   </div>
<jsp:include page="/WEB-INF/view/admin/dataManage/script/dataExportRequestPopupScript.jsp"></jsp:include>

