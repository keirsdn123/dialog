<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="cateManage">
	<div class="full_box wsize_90">
		
		<div class="col-md-3 fl bd_r min_h710">
			<div class="under_title mb_5 ">
				<p class="fl mt_5">
					<span>|</span> 카테고리 관리
				</p>
			</div>
			
			<div class="fl ta_left mt_10" id="cateTree"></div>
		</div>
		
		<div class="col-md-4 fl bd_r min_h710" style="margin-left: 4%;">
			<div class="under_title mb_5">
				<p class="fl mt_5" style="border-bottom:2px solid #f44e4d">메인 카테고리</p>
			</div>
			
			<div class="wsize_100 fl ta_left mt_10">
				<table class="table table-hover wsize_100 fl">
					<tr v-for="pc in parentCate" v-bind:class="{trSelect : selector == pc.cateCode}">
						<td v-if="(pc.cateCode !=0) && (pc.cateCode !=1000)">
						
							<div v-on:mouseover="showIcon(pc.cateCode,1)" v-on:mouseout="hideIcon(pc.cateCode,1)">
								<a style="color: black" v-bind:id="'list' + pc.cateCode" v-on:click="selectChild(pc.cateCode, pc.cateTitle)">{{pc.cateTitle}}</a>
								<img src= "/resources/img/icon/pencil-edit-button.png" v-bind:id="'pen' + pc.cateCode" class="dp_n1" v-on:click="updateShow(pc.cateCode,1)">
								<img src= "/resources/img/icon/delete-button.png" v-bind:id="'del' + pc.cateCode" class="dp_n1" v-on:click="deleteCate(pc.cateCode,1)">	
							</div>
							
							<div class="dp_n1" v-bind:id="'div' + pc.cateCode">
								<input type="text" class="form-control search_box wsize_40" v-bind:placeholder="pc.cateTitle" v-model="updateTitle1">
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="updateCate(pc.cateCode,1)">변경</button>
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="cancelShow(pc.cateCode,1)">취소</button>
							</div>
							
						</td>
					</tr>
				</table>
			</div>
			
			<div class="wsize_100 fl">
				<input type="text" id="aa" class="form-control search_box wsize_50 dp_n1" placeholder="메인 카테고리명을 입력하세요." v-model="cateTitle1">
				<button type="button" class="btn search-btn wsize_20 ml_001 dp_n1" id="aaa" v-on:click="insertCate()">추가</button>
				<button type="button" class="btn search-btn wsize_20 ml_001 dp_n1" id="aaaa" v-on:click="formShow(1)">취소</button>
				<a class="fl" v-on:click="formShow(1)" id="pC">+ 메인 카테고리 추가하기 </a>
			</div>
			
		</div>
		
		<div class="col-md-4 fl min_h710" style="margin-left: 4%;">
			<div class="under_title mb_5">
				<p id="pp" class="fl mt_5" style="border-bottom:2px solid #f44e4d">{{ppppp}}</p>
			</div>
			
			<div class="wsize_100 fl ta_left mt_10">
				<table class="table table-hover wsize_100 fl">
					<tr v-for="cc in childCate" v-bind:id="'childTr' + cc.cateCode">
						<td>
							<div v-on:mouseover="showIcon(cc.cateCode,2)" v-on:mouseout="hideIcon(cc.cateCode,2)">
								<a style="color: black" v-bind:id="'childList' + cc.cateCode">{{cc.cateTitle}}</a>
								<img src= "/resources/img/icon/pencil-edit-button.png" v-bind:id="'childPen' + cc.cateCode" class="dp_n1" v-on:click="updateShow(cc.cateCode,2)">
								<img src= "/resources/img/icon/delete-button.png" v-bind:id="'childDel' + cc.cateCode" class="dp_n1" v-on:click="deleteCate(cc.cateCode,2)">
							</div>
							<div class="dp_n1" v-bind:id="'childDiv' + cc.cateCode">
								<input type="text" class="form-control search_box wsize_40" v-bind:placeholder="cc.cateTitle" v-model="updateTitle2">
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="updateCate(cc.cateCode,2)">변경</button>
								<button type="button" class="btn search-btn wsize_20 ml_001" v-on:click="cancelShow(cc.cateCode,2)">취소</button>
							</div>
						</td>
					</tr>
				</table>
				<p id="ppp" style="color:#0275d8;">메인 카테고리를 선택해주세요.</p>
			</div>
			
			<div class="wsize_100 fl">
				<input type="text" id="bb" class="form-control search_box wsize_50 dp_n1" placeholder="하위 카테고리명을 입력하세요." v-model="cateTitle2">
				<button type="button" class="btn search-btn wsize_20 ml_001 dp_n1" id="bbb" v-on:click="insertCate2()">추가</button>
				<button type="button" class="btn search-btn wsize_20 ml_001 dp_n1" id="bbbb" v-on:click="formShow(2)">취소</button>
				<a class="fl dp_n1" v-on:click="formShow(2)" id="cC">+ 하위 카테고리 추가하기 </a>
			</div>
			
		</div>
		
	</div>
</div>

<jsp:include page="/WEB-INF/view/admin/cateManage/script/cateManageScript.jsp"></jsp:include>
