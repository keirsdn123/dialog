<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>

	<div class="modal fade" id="report_pop" tabindex="-1" role="dialog" aria-labelledby="examquestion_plusLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="max-width:1200px;">
		<div class="modal-content">
			<div class="modal-header bg_red font_w">
				<h5 class="modal-title fw_5 f_sq" id="examquestion_plusLabel">| 연관데이터셋 불러오기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
					&times; 
					</span>
				</button>
			</div>
			
			<div class="modal-body">			
			<!--전체내용-->
			<div class="wsize_100">
				<div class="wsize_100 fl">						 
				 <div class ="fl" style= "width:25%;">
				 	<div class ="fl" style ="margin-left: 4%; margin-top: 3%; height:450px; width:90%;">
				 	 	<div class ="fl" style ="width: 100%; height: 10%;">
				 	 		<div class="under_title mb_5 ">
				 	 			<p class="fl mt_5">카테고리  </p>
				 	 		</div>
				 	 	</div>
				 	 	
				 	 	<div class ="fl table_sc07" id="style-3" style ="margin-top: 3%; width: 100%; height:82.8%;">
				 	 		<table class="table table-gray table-hover">
								<tr>
									<th>code</th>
									<th>카테고리명</th>							
								</tr>
								
								<tr v-for="list in selectCategory">						
										<td>{{list.categorySeq}}</td>
										<td class="text-left"><a v-on:click="dataCate(list.categorySeq)">{{list.categoryNme}}</a></td>									
								</tr>
							</table>
							
				 	 	</div>
				 	</div>
				 </div>
				 
				 <div class ="fl" style="width:70%; height:100%;">
					<div class="under_title mb_5 ">
						<p class="fl mt_5"><span>|</span> 연관 참조 데이터 셋  </p>
					</div>
											
						<input type ="text" class="fl form-control size_330" style ="width:87%;"  v-model="dataSearchWrd" placeholder="찾고자 하는 데이터를 검색해주세요"/>
												
						<button type="button" class="fr btn search-btn size_100" v-on:click ="selectDtSearchDataSet()">
		                     	검색
		                </button>


				<div style ="margin-top: 1%; width: 100%; height: 5vh;">
						
							<div class="fr mt_10 wsize_100 mt_7">
															
								<button v-on:click="selectFileType1" class="ml_5 btn btn-cencle fl" id ="viewPause">
									일시적 파일
								</button>
								
								<button v-on:click="selectFileType2" class="ml_5 btn btn-cencle fl" id="viewRegular">
									정기적 파일
								</button>
								
								<button  v-on:click="selectMyFile" class="ml_5 btn btn-cencle fl" >
									내 데이터만 보기
								</button>
								
								<button type ="button" class = "btn btn-creat fr" v-on:click = "goCrwalRequest()">
						                           크롤링 요청
						         </button>
									
								<button type ="button" class = "mr_5 btn btn-creat fr" v-on:click = "goDataSetInsert()">
						                           데이터 등록
						        </button>

							</div>
							
							
						
					</div>
					
						<div class="fl table_sc07" id="style-3" style ="margin-top:15px; width:100%; height: 300px;">
							<table class="table table-gray table-hover">
								<tr>
									<th>NO</th>
									<th>제목</th>
									<th>데이터 타입</th>								
								</tr>
								
								<tr v-for="(list,index) in selectDataList" data-dismiss="modal" v-on:click="datasetBox(list.dataCode)">
									<td>{{index+1}}</td>
									<td class="text-left" >{{list.datasetName}}</td>
									<td>{{list.typeNormalRegularly}}</td>
								</tr>
							</table>
						</div>
												
						</div>
					</div>
				</div>
							
			</div>
				<div class="modal-footer">
					<button type="button" class="mr_5 btn btn-cencle" data-dismiss="modal">
						닫기
					</button>			
				</div>
			</div>
		</div>
	</div>

<form id ="pgChange" method="post"></form>