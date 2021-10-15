<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div  id="proFile">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 내 정보
			</p>
		</div>
		
		<div class="cb"></div>
		<!---------------------------  회원 정보 --------------------------->
		
		<div class="photo_write">
			<table class="table table-ddd02 mt_10">
				<colgroup>
					<col width="150px" />
					<col width="calc(50% - 150px)" />
					<col width="150px" />
					<col width="calc(50% - 150px)" />
				</colgroup>
		<!----------------------------사용자 이름 변경--------------------------------->
					<tr>
						<th scope="row">
							<div class="thcell">
							     	  사용자 <span class="word_br">이름</span>
							     </div>
						</th>				
						<td>
							<div class="tdcell">
								<p id="p_txt_myLetterEmail" class="contxt_tit">{{info.memberName}}</p>
								<br>	
								<div id="d_myName" style="display: none;">
									<p class="contxt_desc" style="font-size: 1rem;  display: iline-block; color: #333;font-weight: 600;">변경할 사용자 이름을 입력하세요.</p>
									<form>							
									<p class="contxt_webctrl">
										<input type="text" name="myLetterEmail" v-model="updateInfo.memberName" v-bind:placeholder="info.memberName" value="" style="width:254px">
									</p>
									<br>
									<p id="e_myLetterEmail" class="contxt_alert"></p>
									<p class="btn_area_btm">
										<button class="btn search-btn wsize_10" v-on:click="updateInformation"><b class="btn3">수정</b></button>
										<button class="btn search-btn wsize_10 ml_001" onclick="display('p_myName','d_myName');" type="reset">취소</button>
									</p>
									</form>
								</div>								
								<p id="p_myName" class="btn_area_btm" style="display: block;">
									<a  onclick="display('p_myName','d_myName');"><img src= "/resources/img/icon/pencil-edit-button.png"></a>
								</p>
							</div>
						</td>
					</tr>
		<!----------------------------사용자 아이디--------------------------------->
					<tr>
						<th>아이디</th>
						<td>
							<div class="tdcell">
								<p id="p_txt_myLetterEmail" class="contxt_tit">{{info.memberId}}</p>
								<br>	

								<div id="d_myId" style="display: none;">
									<p class="contxt_desc" style="font-size: 1rem;  display: iline-block; color: #333;font-weight: 600;">변경할 아이디를 입력하세요 .</p>	
									<form>						
									<p class="contxt_webctrl">
										<input type="text" name="myLetterEmail" v-bind:placeholder="info.memberId" v-model="updateInfo.memberId" value="" style="width:254px">
									</p>
									<br>
									<p id="e_myLetterEmail" class="contxt_alert"></p>
									<p class="btn_area_btm">
										<button class="btn search-btn wsize_10" v-on:click="updateInformation">수정</button>
										<button class="btn search-btn wsize_10 ml_001" onclick="display('p_myId','d_myId');" type="reset">취소</button>
									</p>
									</form>
								</div>
								<p id="p_myId" class="btn_area_btm" style="display: block;">
									<a onclick="display('p_myId','d_myId');"><img src= "/resources/img/icon/pencil-edit-button.png"></a>
								</p>
							</div>
						</td>
					</tr>
		<!----------------------------사용자 이메일 변경--------------------------------->			
					<tr>
						<th>이메일</th>
						<td>
							<div class="tdcell">
								<p id="p_txt_myLetterEmail" class="contxt_tit">{{info.memberEmailAddress}}</p>
								<br>	

								<div id="d_myLetterEmail" style="display: none;">
									<p class="contxt_desc" style="font-size: 1rem;  display: iline-block; color: #333;font-weight: 600;">변경할 이메일 주소를 입력하세요.(예 : abc@naver.com)</p>	
									<form>						
									<p class="contxt_webctrl">
										<input type="text" name="myLetterEmail" v-model="updateInfo.memberEmail" v-bind:placeholder="info.memberEmailAddress" style="width:254px">
									</p>
									<br>
									<p id="e_myLetterEmail" class="contxt_alert"></p>
									<p class="btn_area_btm">
										<button v-on:click="updateInformation" class="btn search-btn wsize_10">수정</button>
										<button onclick="display('p_myLetterEmail','d_myLetterEmail');" type="reset" class="btn search-btn wsize_10 ml_001">취소</button>
									</p>
									</form>
								</div>
								<br>
								<p id="p_myLetterEmail" class="btn_area_btm" style="display: block;">
									<a  onclick="display('p_myLetterEmail','d_myLetterEmail');" ><img src= "/resources/img/icon/pencil-edit-button.png"></a>
								</p>
							</div>
						</td>
					</tr>
			</table>
		</div>
			<div class="buttons mt_20">
				<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/selectmyPage">되돌아가기</a>
			</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/user/myPage/script/proFileListScript.jsp"></jsp:include>