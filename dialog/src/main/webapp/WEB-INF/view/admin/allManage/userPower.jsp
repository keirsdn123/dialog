<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<div class="dashboard">
	 <ul class="nav nav-tabs inner_tab_menu" id="teacher_tab" role="tablist">
							<li class="nav-item"> <a class="nav-link active show" id="now-tab" data-toggle="tab" href="#teacher_list_now" role="tab" aria-controls="home" aria-selected="true">권한 관리</a> </li>
							<li class="nav-item"> <a class="nav-link" id="last-tab" data-toggle="tab" href="#teacher_list_last" role="tab" aria-controls="profile" aria-selected="false">권한 변경</a> </li>											
						</ul>  
	   <div class="full_box size_1200">
	       <div class="under_title mb_5">
						<p class="fl"><span>|</span> 권한 관리 </p>
				 <div style="margin-left: 80%">  
			   		<select class="form-control class_select fl wsize_50">
						<option value="1">프리미엄</option>
						<option value="2">정회원</option>
						<option value="3">손님</option>
					</select>
				</div>
		  </div>

	    <table class="table table-gray02">
		  <colgroup>
                            	<col width="120px;" />
                                <col width="" />
	    	</colgroup>
			<thead>
		    <tr>
			   <th>메뉴</th>
			   <th> 메뉴관리</th>

			</tr>
			</thead>
			<tbody>
			<tr>
			    <th>데이터 셋</th>
				<td>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터등록</span>
	        </div>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터목록조회</span>
	        </div>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터 반출 요청</span>
	        </div>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터 수집 요청</span>
	        </div>
			   </td>
			</tr>
			<tr>
			    <th>보고서</th>
				<td>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터 등록</span>
	        </div>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터 목록 조회</span>
	        </div>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터 반출 요청</span>
	        </div>
			<div class="col-md-3 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">데이터 수집 요청</span>
	        </div>
			   </td>
			</tr>
			<tr>
			    <th>주제별 시각화</th>
				<td>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">수업자료</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">시험문제관리</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">시험지관리</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">과제</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">학습자료</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">질문</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">교재구매</span>
	        </div>
			   </td>
			</tr>
			<tr>
			    <th>나의 데이터    관리</th>
				<td>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">나의 DATA</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">나의 요청 목록</span>
	        </div>

			   </td>
			</tr>
			<tr>
			    <th>문의하기</th>
				<td>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">Q&A</span>
	        </div>

			   </td>
			</tr>
			
			<tr>
			    <th>My page</th>
				<td>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">관리</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">회원정보</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">주문리스트</span>
	        </div>
			<div class="col-md-2 fl pttop_05 pb_5">
				 <label class="input-toggle fl mt_3">
                 <input type="checkbox" checked>
                <span></span> </label>
	            <span class="fl ml_10">메뉴설정</span>
	        </div>
			   </td>
			</tr>
			</tbody>
		</table>
		
		<a href="resources_write.html" class="btn btn-creat size_100 fr" role="button">저장</a>		
	   </div>
	
	</div>

</body>
</html>