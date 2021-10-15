<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<div class="full_box wsize_90" id="DataInsert">
		<div class="under_title mb_10 ">
			<p class="fl mt_5">
				<span>|</span> 데이터 셋 등록
			</p>
		</div>
		<div>
			<form id="insertDatasetFrm" method="post" enctype="multipart/form-data">
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
							<th>작성자</th>
							<td>관리자</td>
							<th>서비스 형태</th>
							<td colspan="2"> 
								<label class="custom-control custom-radio fl">
									<input id="radio1" name="typeNormalRegularly" type="radio" checked="checked" class="custom-control-input" value="일시" v-model="typeNormalRegularly">
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description">일시</span>
								</label>
								<label class="custom-control custom-radio fl">
									<input id="radio2" name="typeNormalRegularly" type="radio" class="custom-control-input" value="정기" v-model="typeNormalRegularly">
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description">정기</span>
								</label>
							</td>
						</tr>
						<tr id="dataSetType">
							<th>데이터셋 종류</th>
							<td colspan="4">
								<label class="custom-control custom-radio fl">
									<input id="radio3" name="typeDataSet" type="radio" class="custom-control-input" value="daumNews" v-model="dataSetType">
									<span class="custom-control-indicator"></span>
									<span class="custom-control-description">다음뉴스 데이터셋</span>
								</label>
<!-- 								<label class="custom-control custom-radio fl"> -->
<!-- 									<input id="radio4" name="typeDataSet" type="radio" class="custom-control-input" value="rss" v-model="dataSetType"> -->
<!-- 									<span class="custom-control-indicator"></span> -->
<!-- 									<span class="custom-control-description">RSS 데이터셋</span> -->
<!-- 								</label> -->
<!-- 								<label class="custom-control custom-radio fl"> -->
<!-- 									<input id="radio5" name="typeDataSet" type="radio" class="custom-control-input" value="shopping" v-model="dataSetType"> -->
<!-- 									<span class="custom-control-indicator"></span> -->
<!-- 									<span class="custom-control-description">쇼핑 데이터셋</span> -->
<!-- 								</label> -->
<!-- 								<label class="custom-control custom-radio fl"> -->
<!-- 									<input id="radio6" name="typeDataSet" type="radio" class="custom-control-input" value="etc" v-model="dataSetType"> -->
<!-- 									<span class="custom-control-indicator"></span> -->
<!-- 									<span class="custom-control-description">기타 데이터셋</span> -->
<!-- 								</label> -->
							</td>
						</tr>
<!-- 						<tr id="regular1"> -->
<!-- 	                       <th>수집 소스 파일 참조</th> -->
<!-- 	                       <td colspan="4"> -->
<!--                        			<input type="text" class="form-control size_250 fl" disabled = "disabled" v-model = "devSourceTitle"/> -->
<!-- 								<button type="button" class="btn btn-creat fl ml_1 mt_0" data-toggle="modal" data-target="#developSource" v-on:click="selectDSource('수집')">+</button> -->
<!-- 	                       </td> -->
<!-- 	                     </tr> -->
<!-- 	                     <tr id="regular2"> -->
<!-- 	                       <th>표준 소스 파일 참조 </th> -->
<!-- 	                       <td colspan="4"> -->
<!-- 	                       		<input type="text" class="form-control size_250 fl" disabled = "disabled" v-model = "devSourceTitle2"/> -->
<!-- 	                      		<button type="button" class="btn btn-creat fl ml_1 mt_0" data-toggle="modal" data-target="#developSource" v-on:click="selectDSource('표준')">+</button> -->
<!-- 	                       </td>  -->
<!-- 	                     </tr> -->
						<tr id="collectRequestList" v-show="dataSetType =='daumNews'">
							<th>다음뉴스 데이터셋</th>
							<td colspan="4">
								<select class="form-control class_select100" v-model="selectIndex">
									<option v-for="(collectReuqestList,index) in selectCollectRequestList" v-bind:value="index">
										요청번호 :{{collectReuqestList.daumNewsDataCollectRequestCode}}
										, 요청키워드 :{{collectReuqestList.daumNewsRequestCollectWord}}
										, 요청 시작날짜:{{collectReuqestList.daumNewsRequestCollectStartDate}}
										, 요청 종료날짜:{{collectReuqestList.daumNewsRequestCollectEndDate}}
										, 요청자:{{collectReuqestList.memberId}}
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>공개범위</th>
							<td colspan="4">
								<select class="form-control class_select100 " v-model="defaultRatingCode">
									<option v-for="selectAuthority in selectAuthorityList" v-bind:value="selectAuthority.memberRatingCode">{{selectAuthority.ratingName}}</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>제목(데이터명)</th>
							<td colspan="4"><input type="text" class="wsize_100 form-control" name="datasetName" id="datasetName" v-model="datasetName" maxlength="35"></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>1분류</td>
							<td>
<!-- 						 class="form-control class_select fl" -->
								<select class="form-control class_select100 fl" v-model="categorySeq">
									<option disabled value="0">카테고리 선택</option> 
									<option v-for= "category in getCategoryList" v-bind:value="category.categorySeq" v-if="category.categorySeq != 0">{{category.categoryNme}}</option>
								</select> 
							</td>	
							<td>2분류</td>	
							<td>	
								<treeselect v-model="value" :multiple="true" :options="options" placeholder="카테고리 선택" :limit="5" />
							</td>
						</tr>
						<tr>
							<td colspan="5"><textarea class="form-control rounded-0" rows="18" name="datasetInfo" v-model="datasetInfo" maxlength="10000"></textarea></td>
						</tr>
						<tr>
							<th>출처</th>
							<td colspan="4">
								<input type="text" class="form-control size_250" name="datasetFrom" id="datasetFrom" v-model="datasetFrom" maxlength="25">
							</td>
						</tr>
						<tr id="temporary" v-show="typeNormalRegularly =='일시'">
							<th>첨부파일</th>
							<td colspan="4">
								<div class="filebox bs3-primary">
			                     	<input class="upload-name"  disabled="disabled">
			                     	<label for="fileUpload">파일업로드</label>
			                 		<input type="file" id="fileUpload" name="fileUpload" class="upload-hidden"> 
									<div id="fileUl">
									</div>
			            		</div>
	                       </td>
	                     </tr>
					</tbody>
				</table>
			</form>
			<!--일시 버튼-->
			<div class="buttons mt_15" role="group" aria-label="..." id = "temporaryBtn">
				<a class="btn btn-creat size_100 fr" role="button" v-on:click="insertDataset">등록</a>
				<a class="btn btn-cencle size_100 fr mr_5 " role="button" v-on:click="dataSetList">취소</a>
			</div>
			<!--//일시 버튼-->
			
			<!--정기 버튼-->
			<div class="buttons mt_15" role="group" aria-label="..." id = "regularBtn">
				<a class="btn btn-creat size_100 fr" role="button" v-on:click = "insertRegularDataset">등록</a>
				<a class="btn btn-cencle size_100 fr mr_5 " role="button" v-on:click="dataSetList">취소</a>
			</div>
			<!--//정기 버튼-->
		</div>
		<jsp:include page="/WEB-INF/view/dataSet/popup/developSourcePopup.jsp"></jsp:include>
	</div>
</div>
<!--//내용전체-->
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/dataSet/script/dataSetInsertScript.jsp"></jsp:include>