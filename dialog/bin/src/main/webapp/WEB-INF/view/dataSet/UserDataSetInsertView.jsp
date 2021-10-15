<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div>
	<div class="full_box wsize_90" id="UserDataInsert">
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
						<col width="20%" />
						<col width="10%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목(데이터명)</th>
							<td colspan="4"><input type="text" class="wsize_100 form-control" name="datasetName"/></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>1분류</td>
							<td>
								<select class="form-control class_select100 fl" v-model="categorySeq">
									<option disabled value="0">카테고리 선택</option> 
								    <option v-for= "category in getCategoryList" v-bind:value="category.categorySeq" v-if="category.categorySeq != 7 && category.categorySeq != 8 && category.categorySeq != 0">{{category.categoryNme}}</option>
								</select> 
							</td>	
							<td>2분류</td>	
							<td>	
								 <treeselect v-model="value" :multiple="true" :options="options" placeholder="카테고리 선택" :limit="5"/>
							</td>
						</tr>
						<tr>
							<td colspan="5"><textarea class="form-control rounded-0" rows="18" name="datasetInfo"></textarea></td>
						</tr>
						<tr>
							<th>출처</th>
							<td colspan="4">
								<input type="text" class="form-control size_250" name="datasetFrom"/>
							</td>
						</tr>
					   	<tr id="temporary">
	                       <th>첨부파일</th>
	                       <td colspan="4">
								<div class="filebox bs3-primary">
			                     	<input class="upload-name" value="파일업로드" disabled="disabled">
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
			<!--버튼-->
			<div class="buttons mt_15" role="group" aria-label="...">
				<a class="btn btn-creat size_100 fr" role="button" v-on:click="insertDataset()">등록</a>
				<a class="btn btn-cencle size_100 fr mr_5 " role="button" v-on:click="dataSetList()">취소</a>
			</div>
			<!--//버튼-->
		</div>
	</div>
</div>
<!--//내용전체-->
<div id="loading"><img id="loading_image" src="/resources/img/icon/loading.gif"></div>
<jsp:include page="/WEB-INF/view/dataSet/script/UserDataSetInsertViewScript.jsp"></jsp:include>