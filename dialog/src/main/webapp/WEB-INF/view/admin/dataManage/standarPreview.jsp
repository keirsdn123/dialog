<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="standarPre">
	<div class="full_box wsize_90">
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> {{standarTbTitle}} 테이블 미리보기
			</p>
		</div>
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i
					class="fa fa-chevron-right"></i></span>일시 표준화 데이터</li>
		</ul>
		<div class="payment_way3">
			<div class="fl wsize_100 mt_10" id="style-3"
				style="height: 110px; overflow: auto; border: 1px solid #ddd;">
				<table class="table table-gray02 mb_0 tbSize">
					<thead>
						<tr>
							<th>시각화코드</th>
							<th>데이터코드</th>
							<th>col1</th>
							<th>col1설명</th>
							<th>col2</th>
							<th>col2설명</th>
							<th>col3</th>
							<th>col3설명</th>
							<th>col4</th>
							<th>col4설명</th>
							<th>col5</th>
							<th>col5설명</th>
							<th>col6</th>
							<th>col7</th>
							<th>col8</th>
							<th>col9</th>
							<th>col10</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="sclist in standDatasetCoList">
							<td>{{sclist.pauseStandarSeq}}</td>
							<td>{{sclist.dataCode}}</td>
							<td>{{sclist.pauseStandarColumn1}}</td>
							<td>{{sclist.pauseStandarColumn1Lable}}</td>
							<td>{{sclist.pauseStandarColumn2}}</td>
							<td>{{sclist.pauseStandarColumn2Lable}}</td>
							<td>{{sclist.pauseStandarColumn3}}</td>
							<td>{{sclist.pauseStandarColumn3Lable}}</td>
							<td>{{sclist.pauseStandarColumn4}}</td>
							<td>{{sclist.pauseStandarColumn4Lable}}</td>
							<td>{{sclist.pauseStandarColumn5}}</td>
							<td>{{sclist.pauseStandarColumn5Lable}}</td>
							<td>{{sclist.pauseStandarColumn6}}</td>
							<td>{{sclist.pauseStandarColumn7}}</td>
							<td>{{sclist.pauseStandarColumn8}}</td>
							<td>{{sclist.pauseStandarColumn9}}</td>
							<td>{{sclist.pauseStandarColumn10}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 일시 표준화 데이터 상세-->
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i
					class="fa fa-chevron-right"></i></span>일시 표준화 데이터 상세</li>
		</ul>
		<div class="payment_way3">
			<div class="fl wsize_100 mt_10" id="style-3"
				style="height: 400px; overflow: auto; border: 1px solid #ddd;">
				<table class="table table-gray02 mb_0 tbSize">
					<thead>
						<tr>
							<th>시각화코드</th>
							<th>seq</th>
							<th>col1</th>
							<th>col2</th>
							<th>col3</th>
							<th>col4</th>
							<th>col5</th>
							<th>col6</th>
							<th>col7</th>
							<th>col8</th>
							<th>col9</th>
							<th>col10</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(slist, value) in standDatasetList">
							<td>{{slist.pauseStandarSeq}}</td>
							<td>{{slist.pauseStandarDetailSeq}}</td>
							<td>{{slist.pauseStandarColumn1d}}</td>
							<td>{{slist.pauseStandarColumn2d}}</td>
							<td>{{slist.pauseStandarColumn3d}}</td>
							<td>{{slist.pauseStandarColumn4d}}</td>
							<td>{{slist.pauseStandarColumn5d}}</td>
							<td>{{slist.pauseStandarColumn6d}}</td>
							<td>{{slist.pauseStandarColumn7d}}</td>
							<td>{{slist.pauseStandarColumn8d}}</td>
							<td>{{slist.pauseStandarColumn9d}}</td>
							<td>{{slist.pauseStandarColumn10d}}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 시각화 설정 -->
		<ul class="screat_num ta_left">
			<li><span class="mr_5 re_num" aria-hidden="true"><i class="fa fa-chevron-right"></i></span>시각화 설정</li>
		</ul>
		<div class="payment_way3">
			<!--그래프 들어간다. -->
			<div class="wsize_100 mt_30" style="height: auto;">
				<div class="wsize_70 fl bd_r bd_l bd_bd">
					<div class="wsize100fl" style="height: 550px;">
						<svg id="graph" width="100%" height="547" style="box-shadow:2px 2px 5px 1px rgba(0,0,0,0.1);"> </svg>
					</div>
				</div>
				<div class="wsize_30 fl">
					<div class="wsize100fl" style="height: 457px;">
						<div class="fl wsize_100">
							<div class="fl wsize_40" style="font-weight: bold">
								<span>ㅣ</span>범주값 선택
							</div>
							<label class="fl wsize_40" style="background-color: #545454; color: white; height: 28px;" id="xcolTitle" name="xcolTitle"> </label>
							<a class ="fl" style ="background-color: #545454; color: white; width:30px; height:28px;" v-on:click="delXValue">X</a>
							<div class="fr wsize_90 mt_5 bd_bd bd_t" style="min-height: 85px; height: 100px; overflow: auto;">
								<div v-for="nme in  columnList" class="xcol" id="xcol1" value="pause_standar_column1" v-on:click="takeXValue(nme.pauseStandarColumn1,col1)">
									{{nme.pauseStandarColumn1}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol2" value="pause_standar_column2" v-on:click="takeXValue(nme.pauseStandarColumn2,col2)">
									{{nme.pauseStandarColumn2}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol3" value="pause_standar_column3" v-on:click="takeXValue(nme.pauseStandarColumn3,col3)">
									{{nme.pauseStandarColumn3}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol4" value="pause_standar_column4" v-on:click="takeXValue(nme.pauseStandarColumn4,col4)">
									{{nme.pauseStandarColumn4}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol5" value="pause_standar_column5" v-on:click="takeXValue(nme.pauseStandarColumn5,col5)">
									{{nme.pauseStandarColumn5}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol6" value="pause_standar_column6" v-on:click="takeXValue(nme.pauseStandarColumn6,col6)">
									{{nme.pauseStandarColumn6}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol7" value="pause_standar_column7" v-on:click="takeXValue(nme.pauseStandarColumn7,col7)">
									{{nme.pauseStandarColumn7}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol8" value="pause_standar_column8" v-on:click="takeXValue(nme.pauseStandarColumn8,col8)">
									{{nme.pauseStandarColumn8}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol9" value="pause_standar_column9" v-on:click="takeXValue(nme.pauseStandarColumn9,col9)">
									{{nme.pauseStandarColumn9}}
								</div>
								<div v-for="nme in  columnList" class="xcol" id="xcol10" value="pause_standar_column10" v-on:click="takeXValue(nme.pauseStandarColumn10,col10)">
									{{nme.pauseStandarColumn10}}
								</div>
							</div>
							
							<div class="fl wsize_40 mt_5" style="font-weight: bold">
								<span>ㅣ</span>수치값 선택
							</div>
							<label class="fl wsize_40 mt_5" style="background-color: #545454; color: white; height: 28px;" id="ycolTitle" name="ycolTitle"> </label>
							<a class ="fl mt_5" style ="background-color: #545454; color: white; width:30px; height:28px;" v-on:click="delYValue">X</a>
							<div class="fr wsize_90" style="margin-top: 5px;">
								<div class="fl wsize_100 mt_5 bd_bd bd_t" style="min-height: 85px; height: 100px; overflow: auto;">
									<div v-for="nme in  columnList" class="ycol" id="ycol1" value="pause_standar_column1" v-on:click="takeYValue(nme.pauseStandarColumn1,col1)">
										{{nme.pauseStandarColumn1}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol2" value="pause_standar_column2" v-on:click="takeYValue(nme.pauseStandarColumn2,col2)">
										{{nme.pauseStandarColumn2}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol3" value="pause_standar_column3" v-on:click="takeYValue(nme.pauseStandarColumn3,col3)">
										{{nme.pauseStandarColumn3}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol4" value="pause_standar_column4" v-on:click="takeYValue(nme.pauseStandarColumn4,col4)">
										{{nme.pauseStandarColumn4}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol5" value="pause_standar_column5" v-on:click="takeYValue(nme.pauseStandarColumn5,col5)">
										{{nme.pauseStandarColumn5}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol6" value="pause_standar_column6" v-on:click="takeYValue(nme.pauseStandarColumn6,col6)">
										{{nme.pauseStandarColumn6}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol7" value="pause_standar_column7" v-on:click="takeYValue(nme.pauseStandarColumn7,col7)">
										{{nme.pauseStandarColumn7}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol8" value="pause_standar_column8" v-on:click="takeYValue(nme.pauseStandarColumn8,col8)">
										{{nme.pauseStandarColumn8}}</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol9" value="pause_standar_column9" v-on:click="takeYValue(nme.pauseStandarColumn9,col9)">
										{{nme.pauseStandarColumn9}}
									</div>
									<div v-for="nme in  columnList" class="ycol" id="ycol10" value="pause_standar_column10" v-on:click="takeYValue(nme.pauseStandarColumn10,col10)">
										{{nme.pauseStandarColumn10}}
									</div>
								</div>
							</div>
							
							<div class="fl wsize_40 mt_5" style="font-weight: bold">
								<span>ㅣ</span>범례값 선택
							</div>
							<label type="text" class="fl wsize_40 mt_5" style="background-color: #545454; color: white; height: 28px;" id="x1colTitle" name="x1colTitle"> </label>
							<a class ="fl mt_5" style ="background-color: #545454; color: white; width:30px; height:28px;" v-on:click="delZValue">X</a>
							<div class="fr wsize_90" style="margin-top: 5px;">
								<div class="fl wsize_100 mt_5 bd_bd bd_t" style="min-height: 85px; height: 100px; overflow: auto;">
									
									<div v-for="nme in  columnList" class="x1col" id="zcol6" value="pause_standar_column6" v-on:click="takeZValue(nme.pauseStandarColumn6,col6)">
										{{nme.pauseStandarColumn6}}
									</div>
									<div v-for="nme in  columnList" class="x1col" id="zcol7" value="pause_standar_column7" v-on:click="takeZValue(nme.pauseStandarColumn7,col7)">
										{{nme.pauseStandarColumn7}}
									</div>
									<div v-for="nme in  columnList" class="x1col" id="zcol8" value="pause_standar_column8" v-on:click="takeZValue(nme.pauseStandarColumn8,col8)">
										{{nme.pauseStandarColumn8}}
									</div>
									<div v-for="nme in  columnList" class="x1col" id="zcol9" value="pause_standar_column9" v-on:click="takeZValue(nme.pauseStandarColumn9,col9)">
										{{nme.pauseStandarColumn9}}
									</div>
									<div v-for="nme in  columnList" class="x1col" id="zcol10" value="pause_standar_column10" v-on:click="takeZValue(nme.pauseStandarColumn10,col10)">
										{{nme.pauseStandarColumn10}}
									</div>
								</div>
							</div>

							<div class="fl wsize_100 mt_5">
								<div class="fl wsize_40" style="font-weight: bold;">
									<span>ㅣ</span>조건값 선택
								</div>
								<select class="wsize_80" id="condition" name="condition" v-model="condition">
									<option value="0" selected>조건선택</option>
									<option value="1">SUM</option>
									<option value="2">AVG</option>
									<option value="3">MAX</option>
									<option value="4">MIN</option>
									<option value="5">COUNT</option>
								</select>
							</div>

							<div class="fl wsize_100 mt_20" v-for="nme in columnList">
								<div class="wsize_40 ml_20">그래프 종류 선택</div>
			<!--bar Chart 버튼 -->
								<div class="wsize_5 fl ml_40 hsize_100" style="min-width: 33px;" v-for="nme in  columnList">
									<button type="button" v-on:click="makeChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition, 1)" id="barChart" class="wsize_100 hsize_100 bgwhite" style="border: none;">
										<img src="/resources/img/chart/bar.png" class="wsize_100 hsize_100">
									</button>
								</div>

			<!--Area Chart 버튼 -->
								<div class="wsize_5 fl hsize_100 ml_10" style="min-width: 33px;" v-for="nme in  columnList">
									<button type="button" v-on:click="areaChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition, 3)" id="areaChart" class="wsize_100 hsize_100 bgwhite" style="border: none;">
										<img src="/resources/img/chart/areaChart.png" class="wsize_100 hsize_100">
									</button>
								</div>
			<!--Stack Area Chart 버튼 -->
								<div class ="wsize_5 fl hsize_100 ml_10" style="min-width:33px;" v-for="nme in  columnList">
			                        <button type="button" v-on:click="stackAreaChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition)" id ="stackAreaChart" class ="wsize_100 hsize_100 bgwhite" style="border: none;">
			                           <img src ="/resources/img/chart/lineCharts.png" class="wsize_100 hsize_100">
			                        </button>
                     			</div>
			<!--Pie Chart 버튼 -->
								<div class="wsize_5 fl hsize_100 ml_10" style="min-width: 33px;"v-for="nme in  columnList">
									<button type="button" v-on:click="pieChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition, 4)" id="pieChart" class="wsize_100 hsize_100 bgwhite" style="border: none;">
										<img src="/resources/img/chart/pie.png" class="wsize_100 hsize_100">
									</button>
								</div>
			<!--Donut Chart 버튼 -->
								<div class="wsize_5 fl hsize_100 ml_10" style="min-width: 33px;" v-for="nme in  columnList">
									<button type="button" v-on:click="donutChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition, 5)" id="donutChart" class="wsize_100 hsize_100 bgwhite" style="border: none;">
										<img src="/resources/img/chart/donut.png" class="wsize_100 hsize_100">
									</button>
								</div>
			<!--GroupBar Chart 버튼 -->
								<div class="wsize_5 fl hsize_100 ml_10" style="min-width: 33px;" v-for="nme in  columnList">
									<button type="button" v-on:click="groupChartView(nme.pauseStandarSeq, nme.normalDataStandardTableTitle, condition, 6)" id="groupChart" class="wsize_100 hsize_100 bgwhite" style="border: none;">
										<img src="/resources/img/chart/group.png" class="wsize_100 hsize_100">
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 시각화 승인 버튼 -->
		<div class="buttons mt_10">
			<button class="btn btn-creat fr" v-on:click="insertViz">시각화 승인</button>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/view/admin/dataManage/script/standarPreViewScript.jsp"></jsp:include>
