<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div>
	<div class="full_box wsize_90"  id="reportUpdate">
		<div class="under_title mb_10 ">
			<p class="fl mt_5">
				<span>|</span> 보고서 수정
			</p>
		</div>
		<div>
			<form id="updateReportFrm" method="post" enctype="multipart/form-data">
				<table class="table table-ddd02" class="" >
					<colgroup>
						<col width="15%" />
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="40%" />
					</colgroup>
					<tbody>
						<tr>			
							<th>서비스 형태</th>
						    <td colspan="4"> 
	                      	 	<label class="custom-control custom-radio fl">
	                      			<input id="radio1" name="typeNormalRegularly" type="radio" checked="checked" class="custom-control-input" value="일반보고서">
	                      			<span class="custom-control-indicator"></span>
	                     			<span class="custom-control-description">일반보고서</span>
	                    		</label>
	                    		<label class="custom-control custom-radio fl">
	                      			<input id="radio2" name="typeNormalRegularly" type="radio" class="custom-control-input" value="논문">
	                      			<span class="custom-control-indicator"></span>
	                     			<span class="custom-control-description">논문</span>
	                    		</label>
	                   	 	</td>
	                   	 </tr> 
	        
						<tr>
							<th>제목</th>
							<td colspan="4"><input type="text" class="wsize_100 form-control"  v-for="list in uReportInfo" v-model="list.reportTitle" name="reportName"></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>1분류</td>
							<td>
	<!-- 						 class="form-control class_select fl" -->
								<select class="form-control class_select100 fl" v-model="categorySeq">
									<option disabled value="">카테고리 선택</option>
								    <option v-for= "category in getCategoryList" v-bind:value="category.categorySeq">{{category.categoryNme}}</option>
								</select> 
							</td>	
							<td>2분류</td>	
							<td>	
								 <treeselect v-model="value" :multiple="true" :options="options"/>
							</td>
						</tr>
						<tr>
							<th>연관 참조 데이터</th>
							<td colspan ="4">
								<div class="filebox bs3-primary">									
									<div class="upload-name fl" v-for="(dataList, index) in dataBox" v-bind:value="dataList.dataCode">
										{{dataList}}
									<button type="button" id="delBtn" style="background-color: white; border: none; cursor:pointer;" v-on:click="delData(index)">
										X
									</button>
									</div>
													
									 <button type="button" class="btn btn-creat fl" style="margin-top:0.2px; margin-left:3px;"data-toggle ="modal" data-placement="bottom" title="연관 데이터 불러오기" v-on:click="openPop()">
										불러오기
									</button>																	
								</div>
								
								<div class="filebox bs3-primary" style="display:none;">
									<div class="upload-name fl" v-for="(dataListCode, index) in dataBox2" v-bind:value="dataListCode.dataCodeList">
										{{dataListCode}}
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="5"><textarea class="form-control rounded-0" rows="18" v-for="list in uReportInfo"  name="reportInfo">{{list.reportContent}}</textarea></td>
						</tr>
						
					   	<tr id="temporary">
	                       <th>보고서 첨부파일</th>
	                       <td colspan="4">
								<div class="filebox bs3-primary">
			                     	<input class="upload-name" value="파일업로드" disabled="disabled">
			                     	<label for="fileUpload">파일업로드</label> 
			                 		<input type="file" id="fileUpload" name="fileUpload" class="upload-hidden"> 
			            		</div>
	                       </td>
	                     </tr>
					</tbody>
				</table>
			</form>
			<!--버튼-->
			<div class="buttons mt_15" role="group" aria-label="...">
				<a class="btn btn-creat size_100 fr" role="button" v-on:click="updateReportFrm">수정</a>
				<a class="btn btn-cencle size_100 fr mr_5 " role="button">취소</a>		
			</div>
			
			<!--//버튼-->
		</div>
		  <jsp:include page="/WEB-INF/view/report/reportDataPopup.jsp"></jsp:include>
	</div>
</div>

<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/report/script/reportUpdateScript.jsp"></jsp:include>