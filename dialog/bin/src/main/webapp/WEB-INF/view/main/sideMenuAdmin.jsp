<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="side_menu bg_gray">
	<div class="side_top">
		<a href="/">
		</a>
		<div class="academy_selectbox">
			<select class="form-control academy_select bg_gray">
				<option value="1">-</option>
				<option value="2">-</option>
				<option value="3">-</option>
			</select>
		</div>

		<div class="academy_selectbox mt_0">
			<span class="today_box">Today</span> <span class="today_date">2018.06.26.</span>

		</div>

		<div class="use_data">
			<ul>
				<li>BASIC</li>
				<li>|</li>
				<li><span class="text_red">300/365</span>일 <span class="ml_5"
					title="학생수"><img src="/resources/img/icon/students.png"
						style="width: 15%;"/ > 32</span></li>
			</ul>
		</div>
	</div>

	<ul class="nav nav-stacked sub_menu" id="exampleAccordion">
		<li><a class="nav-link-collapse collapsed" data-toggle="collapse"
			href="#collapseManage" data-parent="#exampleAccordion"> <img
				src="/resources/img/icon/manage.png" />개발 소스 파일 관리
		</a>
			<ul class="sidenav-second-level collapse sub_inner"
				style="height: 0;" id="collapseManage">
				<li><a href="/developSourceList">개발소스파일관리</a></li>
				<li><a href="/goType2">goType2</a></li>
				<li><a href="/goLogIn">login</a></li>
				<li><a href="/memJoin">memjoin</a></li>
				<li><a href="statistics.html">메뉴1-1</a></li>
			</ul></li>
		<li><a class="nav-link-collapse collapsed" data-toggle="collapse"
			href="#collapseStudent" data-parent="#exampleAccordion"> <img
				src="/resources/img/icon/student.png" />데이터 셋
		</a>
			<ul class="sidenav-second-level collapse sub_inner"
				style="height: 0;" id="collapseStudent">
				<li><a href="/goList">메뉴2-1</a></li>
				<li><a href="class.html">메뉴2-1</a></li>
				<li><a href="attendance.html">메뉴2-1</a></li>
				<li><a href="Score.html">메뉴2-1</a></li>
				<li><a href="album.html">메뉴2-1</a></li>
				<li><a href="Praise.html">메뉴2-1</a></li>
			</ul></li>
		<li><a class="nav-link-collapse collapsed" data-toggle="collapse"
			href="#collapseStudy" data-parent="#exampleAccordion"> <img
				src="/resources/img/icon/study.png" />메뉴3
		</a>
			<ul class="sidenav-second-level collapse sub_inner"
				style="height: 0;" id="collapseStudy">
				<li><a href="Tools.html">메뉴3-1</a></li>
				<li><a href="Tools_admin.html">메뉴3-1</a></li>
				<li><a href="Examquestion.html">메뉴3-1</a></li>
				<li><a href="Exam.html">메뉴3-1</a></li>
				<li><a href="homework.html">메뉴3-1</a></li>
				<li><a href="resources.html">메뉴3-1</a></li>
				<li><a href="question.html">메뉴3-1</a></li>
				<li><a href="Booklist.html">메뉴3-1</a></li>
			</ul></li>
		<li><a class="nav-link-collapse collapsed" data-toggle="collapse"
			href="#collapseCommunicate" data-parent="#exampleAccordion"> <img
				src="/resources/img/icon/communication.png" />메뉴4
		</a>
			<ul class="sidenav-second-level collapse sub_inner"
				style="height: 0;" id="collapseCommunicate">
				<li><a href="notice.html">메뉴4-1</a></li>
				<li><a href="Chats.html">메뉴4-1</a></li>
				<li><a href="#">메뉴4-1</a></li>
			</ul></li>
		<li><a class="nav-link-collapse collapsed" data-toggle="collapse"
			href="#collapseEdit" data-parent="#exampleAccordion"> <img
				src="/resources/img/icon/my.png" />메뉴5
		</a>
			<ul class="sidenav-second-level collapse sub_inner"
				style="height: 0;" id="collapseEdit">
				<li><a href="page_setting.html">메뉴5-1</a></li>
				<li><a href="Info.html">메뉴5-1</a></li>
				<li><a href="Orderlist.html">메뉴5-1</a></li>
				<li><a href="setting.html">메뉴5-1</a></li>
			</ul></li>
	</ul>

</div>
