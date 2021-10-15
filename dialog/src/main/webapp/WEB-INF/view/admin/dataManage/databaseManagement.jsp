<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="dashboard">
	<div class="left_list_box pd_5">
		<div class="under_title mb_5 ">
			<p class="fl mt_5"><span>|</span> 파일 데이터 </p>
		</div>
	</div>
	<div class="right_box pd_5">
		<div class="fl under_title mb_5 ">
			<p class="fl mt_5"><span>|</span> 데이터 셋</p>
		</div>
		<div class="fl" style ="width:48%;">
			<!-- 		검색 -->
			<div class="fl wsize_100">
				<input type="name" class="form-control search_box" id="searchDataSet" placeholder="데이터 셋 명을 입력하세요.">
				<button type="button" class="btn search-btn">
					검색
				</button>
			</div>
			<!-- 		테이블 -->
			<div class="fl wsize_100 mt_7" id="style-3" style="height:300px; overflow:auto; border:1px solid #ddd;">
				<table class="table table-gray table-hover">
					<tr>
						<th>데이터코드</th>
						<th>데이터명</th>
						<th>상태</th>
						<th>DB_TABLE</th>
						<th>표준 DB_TABLE</th>
					</tr>
					<tr>
						<td>1001</td>
						<td>타이타닉 데이터</td>
						<td>N</td>
						<td>1001_타이타닉</td>
						<td>v_1001_타이타닉</td>
					</tr>
					<tr>
						<td>1002</td>
						<td>타이타닉 데이터</td>
						<td>N</td>
						<td>1001_타이타닉</td>
						<td>v_1001_타이타닉</td>
					</tr>
					<tr>
						<td>1003</td>
						<td>타이타닉 데이터</td>
						<td>N</td>
						<td>1001_타이타닉</td>
						<td>v_1001_타이타닉</td>
					</tr>
					<tr>
						<td>1004</td>
						<td>타이타닉 데이터</td>
						<td>N</td>
						<td>1001_타이타닉</td>
						<td>v_1001_타이타닉</td>
					</tr>
				</table>
			</div>
			<!-- 		테이블끝 -->
		</div>
		<div class="fl wsize_48 ml_10">
			<div class="fl under_title mb_5 ">
				<p class="fl ml_10"> 생성 DB </p>
			</div>
			<div class="fl wsize_100 mt_10" id="style-3" style="height:300px; overflow:auto; border:1px solid #ddd;">
				<table class="table table-gray02 mb_0" >
					<thead>
						<tr>
							<th>데이터코드</th>
							<th>seq</th>
							<th>나이</th>
							<th>성별</th>
							<th>생존여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1001</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1001</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1001</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1001</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1001</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1001</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="right_box mt_15 pd_5">
		<div class="under_title mb_5 ">
			<p class="fl mt_5"><span>|</span> 일시 표준화 데이터 </p>
		</div>
		<div id="style-3" style="max-height:200px; overflow:auto; border:1px solid #ddd;">
			<table class="table table-gray table-hover">
				<tr>
					<th nowrap="nowrap">시각화코드</th>
					<th nowrap="nowrap">데이터코드</th>
					<th>col1</th>
					<th nowrap="nowrap">col1설명</th>
					<th>col2</th>
					<th nowrap="nowrap">col2설명</th>
					<th>col3</th>
					<th nowrap="nowrap">col3설명</th>
					<th>col4</th>
					<th nowrap="nowrap">col4설명</th>
					<th>col5</th>
					<th nowrap="nowrap">col5설명</th>
					<th>col6</th>
					<th nowrap="nowrap">col6설명</th>
					<th>col7</th>
					<th nowrap="nowrap">col7설명</th>
					<th>col8</th>
					<th nowrap="nowrap">col8설명</th>
					<th>col9</th>
					<th nowrap="nowrap">col9설명</th>
					<th>col0</th>
					<th nowrap="nowrap">col0설명</th>					
				</tr>
				<tr>
					<td>1</td>
					<td>1001</td>
					<td>성별</td>
					<td>{남:1, 여:0}</td>
					<td>나이</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td>1001</td>
					<td>성별</td>
					<td>{남:1, 여:0}</td>
					<td>생존여부</td>
					<td>{사망:1, 생존:0}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="under_title mb_5 ">
			<p class="fl mt_15"> 일시 표준화 데이터 상세 </p>
		</div>
		<div class="fl wsize_100 mt_10" id="style-3" style="height:300px; overflow:auto; border:1px solid #ddd;">
				<table class="table table-gray02 mb_0">
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
						<tr>
							<th>1</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>1</td>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>1</td>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>1</td>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>1</td>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>1</td>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>남</td>
							<td>0</td>
						</tr>
						<tr>
							<th>1</th>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>1</td>
							<td>1</td>
							<td>26</td>
							<td>남</td>
							<td>0</td>
							<td>남</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<button type="button" class="btn btn-gray fr wsize_20 mt_10 mb_5">표준 데이터 편집</button>
			</div>
	</div>
</div>
