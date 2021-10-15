<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="standar_popint" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width:800px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">| 데이터 가공</h5>
			</div>
<!-- 팝업바디 -->
			<div class="modal-body" >
<!-- 유형선택 -->
				<div class="po_r" id="style-3" >
					<table class="table table-sss02 wsize_100">
						<tr>
							<th> <span class="red02">＊</span>표준화 유형</th>
							<td class="text-left">
								<span>수치데이터</span>
							</td>
						</tr>
						<tr>
							<th> <span class="red02">＊</span>표준화 컬럼명칭</th>
							<td class="text-left">
								<span v-for="ss in selecColumn">{{ss.columnName}}</span>
							</td>
						</tr>
						<tr>
							<th> <span class="red02">＊</span>선택된 컬럼</th>
							<td class="text-left">
								<span v-for="ss in selecColumn">{{ss.columnName}}</span>
							</td>
						</tr>
					</table>
				</div>
<!-- 가공 방식 선택 -->
				<div class="wsize_100 fl po_r" style="border: 1px solid #66696e;">
			        <div class="wsize_50 fl div_bg">변경 할 값</div> <div class="wsize_50 fl div_bg">변경 후 값</div>		        	
		         		<div class ="mt_10 div_set" style ="height: 25vh; width: 100%;">
		         		
		         			<div class ="wsize_100 fl pd_10 hwsize_30 mt_10">
				            	<select class="form-control class_select100 fl size_130" id="rangeList">
									<option v-for="proc in processList" v-bind:value="proc.processList">{{proc.processList}}</option>
								</select> 
								<span class="fl" style="margin-left: 3px;"><b>~&nbsp;</b></span>
								<select class="form-control class_select100 fl size_130" id="rangeList2">
									<option v-for="proc in processList" v-bind:value="proc.processList">{{proc.processList}}</option>
								</select>					
								<i class="fa fa-chevron-right fl pd_10"></i>
								<i class="fa fa-chevron-right fl pd_10"></i>
								<i class="fa fa-chevron-right fl pd_10"></i>								
								<input type="number" class="form-control size_280 fl" min="0" id="between">
			            		<input type="button" class="fl btn-creat size_80 btn_set" value="추가" v-on:click="processAdd(4)">
				            </div>
				                    	
				            <div class = "wsize_100 fl pd_10 hwsize_30">
				            	<input type="text" class="form-control size_280 fl" value="NULL값" readonly >
				            	<i class="fa fa-chevron-right fl pd_10"></i>
								<i class="fa fa-chevron-right fl pd_10"></i>
								<i class="fa fa-chevron-right fl pd_10"></i>		
				            	<input type="number" class="form-control size_280 fl" min="0" max="100" id="null2" value="0">
				            	<input type="button" class="fl btn-creat size_80 btn_set" value="추가" v-on:click="processAdd(2)">	
				            </div>
				            
				            <div class = "wsize_100 fl pd_10 hwsize_30">
				            	<input type="text" class="form-control size_280 fl" value="그외 값" readonly>
				            	<i class="fa fa-chevron-right fl pd_10"></i>
								<i class="fa fa-chevron-right fl pd_10"></i>
								<i class="fa fa-chevron-right fl pd_10"></i>		
								<input type="number" class="form-control size_280 fl" min="0" max="100" id="else2" value="0">
								<input type="button" class="fl btn-creat size_80 btn_set" value="완료" v-on:click="setElse">
				            </div>
			        	</div>
				</div>		
<!-- 쿼리 문 미리보기 -->
				<div class="wsize_100 fl po_r bd_d mt_10" id="style-3"  >
					<textarea class="form-control rounded-0" rows="6" style="background-color: white" readonly>{{processQueryText}}</textarea>
				</div>
			</div>
<!-- 모달footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-cencle" v-on:click="cancelPopup(4)">닫기</button>
				<button type="button" class="btn btn-creat" v-on:click="saveStandar(4)">저장</button>
			</div>
		</div>
	</div>
</div>
