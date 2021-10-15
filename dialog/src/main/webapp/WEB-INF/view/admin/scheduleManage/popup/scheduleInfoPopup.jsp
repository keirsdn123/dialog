<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="schList">   
   <div class="modal fade" id="scheduelInfoPopup" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width:800px; max-height:450px">
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
               <div class="modal-header bg_blue font_w">
                  <h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">스케줄 정보 </h5>
               </div>
                  <div class="wsize_97 po_r bd_d05" style="height:440px" id="style-3">
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
		                  	 		<select class="form-control" id="updateCron">
										<option>작업선택</option>
										<option>일시적지정</option>
									  	<option>증분지정</option>
									</select>
                  	 			</td>
                  	 		</tr>
						</table>
                  	  </div>
                      <table class="mg_auto ta_center" cellpadding="8" id="updateDirect">
                        <tr>
                           <td class="fl"> 초 (Seconds):</td>
                           <td ><input type="text"  style="width:220px;background-color: #e2e2e2;"  value="0 ~ 59" readonly></td>
						   <td class="direct ">
						   		<input type="text"   class="form-control seconds" style="width:115px; text-align-last:center; display:none;"  v-model="seconds" value="">
						   		<select class="form-control seconds " id="updateSeconds" style="width:115px; text-align-last:center; " v-model="seconds">
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
						   		<select class="form-control minutes" id="updateMinutes" style="width:115px; text-align-last:center;" v-model="minutes">
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
						   		<select class="form-control hours" id="updateHours" style="width:115px; text-align-last:center;" v-model="hours">
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
						   		<select class="form-control day" id="updateDay" style="width:115px; text-align-last:center;" v-model="day">
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
						   		<select class="form-control months" id="updateMonths" style="width:115px; text-align-last:center;" v-model="month">
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
						   		<select class="form-control year" id="updateYear" style="width:115px; text-align-last:center;" v-model="year">
									<option>-</option>
									<option>직접입력</option>
						   		</select>
						   </td>
                        </tr>
                     </table>  
                     
                     <table class="mg_auto ta_center" cellpadding="8" id="updateEach">
                        <tr>
                           <td class="fl"> 초 (Seconds):</td>
						   
						   <td>
						   		<select class="form-control" id="updateEachSeconds">
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
						   		<select class="form-control" id="updateEachMinutes">
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
						   		<select class="form-control" id="updateEachHours">
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
						   		<select class="form-control" id="updateEachDay" >
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
						   		<select class="form-control" id="updateEachMonth" >
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
               <div class="under_title">
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-cencle size_100 fr" data-dismiss="modal">
                     	닫기
                  </button>
                  <button class="btn btn-creat size_100 fr" v-on:click ="scheduleUpdate">
                     	수정
                  </button>
               </div>
            </div>
         </div>
      </div>      
   </div>
   