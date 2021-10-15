<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="side_menu bg_gray" id="MenuCode">
	<div class="side_top">
		<a href="/"><img src="/resources/img/logo/DIALOG LOGO.png" width="250" height="100"></a>
	</div>
	<ul class="nav nav-stacked sub_menu" id="exampleAccordion">
		<li v-for="menu in MenuList" v-if="menu.menuRoot == 0" >
			<a class="nav-link-collapse collapsed" data-toggle="collapse" v-bind:href="'#collapseComponents'+menu.menuCode" data-parent="#exampleAccordion"> <img src="/resources/img/icon/manage.png" />{{menu.menuTitle}}<i class="fa fa-angle-right fr" aria-hidden="true"></i></a>
			<ul class="sidenav-second-level collapse sub_inner" v-bind:class="{show : checkUrl(menu)}" v-bind:id="'collapseComponents'+menu.menuCode"> 
				<li v-for="smallMenu in menu.smallList">
<!-- 						<a  v-if=" midmenu.menuRoot == menu.menuCode"  v-bind:href="midmenu.menuUrl">{{midmenu.menuTitle}}</a> -->
					<a v-bind:class="{aactive : setActive(smallMenu.menuUrl)}" v-on:click="selectMenuDetail(smallMenu.menuUrl,smallMenu.menuCode)">{{smallMenu.menuTitle}}</a>
				</li>
			</ul>
		</li>
	</ul>
	
<!-- 	<ul class="nav nav-stacked sub_menu" id="exampleAccordion"> -->
<!-- 		<li v-for="menu in MenuList" v-if="menu.menuRoot == 0" > -->
<!-- 			<a class="nav-link-collapse collapsed" data-toggle="collapse" v-bind:href="'#collapseComponents'+menu.menuCode" data-parent="#exampleAccordion" v-on:click="setAactive('#collapseComponents'+menu.menuCode)" > <img src="/resources/img/icon/manage.png" />{{menu.menuTitle}}<i class="fa fa-angle-right fr" aria-hidden="true"></i></a> -->
<!-- 			<ul  class="sidenav-second-level collapse sub_inner" v-bind:class="{show : checkUrl(menu)}"v-bind:id="'collapseComponents'+menu.menuCode">  -->
<!-- 				<li v-for="midmenu in MenuList" v-if=" midmenu.menuRoot == menu.menuCode"> -->
<!--					<a  v-if=" midmenu.menuRoot == menu.menuCode"  v-bind:href="midmenu.menuUrl">{{midmenu.menuTitle}}</a> -->
<!-- 					<a v-on:click="selectMenuDetail(midmenu.menuUrl,midmenu.menuCode)">{{midmenu.menuTitle}}</a> -->
<!-- 				</li> -->
<!-- 			</ul> -->
<!-- 		</li> -->
<!-- 	</ul> -->
	<form id="menudetail" method="POST"> </form>
	</div>
	<jsp:include page="/WEB-INF/view/main/script/sideMenuScript.jsp"></jsp:include>