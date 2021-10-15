<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="net.su.dialog.main.domain.User"%>

<div class="top_menu" id="topMenu">
<!--    <a class="whole_menu" roll="button" data-toggle="modal" data-target="#modalCoupon"> -->
<!--        <div class="whole_menu"></div> -->
<!--    </a> -->
<!---------------------------  사용자  ---------------------------------->
   <div class="admin_login" v-if="memInfo.memberRatingCode == 2 || memInfo.memberRatingCode == 1">
      <div class="top_right">
       <div class="alarm"  title="내알람">
            <a href="/selectMessage">
            	<img src="/resources/img/icon/message.png" style="height: 50px;margin-left: -70px;margin-top: -13px;width: 50px;">        
            </a>
            <div class="alarm_n" v-if="message != 0">{{message}}</div>
         </div>
         <div class="alarm">
         	<a href="/selectmyPage">
           		<img src="/resources/img/icon/mypage.png" style="height: 57px;margin-left: -38px;margin-top: -17px;width: 75px;">
            </a>
         </div>
         <div class="profile_name">{{memInfo.memberName}}님 어서오세요.
         </div>
         <a type="button" class="btn btn-login fl" href="/logout">로그아웃</a>
      </div>
   </div>
<!---------------------------  관리자  ---------------------------------->
   <div class="admin_login" v-else-if="memInfo.memberRatingCode == 3">
		<div class="top_right">
			<div class="alarm"  title="내알람">
	            <a href="/selectMessageManage">
	           		 <img src="/resources/img/icon/message.png" style="height: 50px;margin-left: -20px;margin-top:-13px;width: 50px;">     
	            </a>
	        </div>
	        <div class="profile_name">관리자님 어서오세요 </div>
	        <a type="button" class="btn btn-login fl" href="/logout">로그아웃</a>			
		</div>
	</div>
	
<!---------------------------  비로그인  ---------------------------------->
   <div class="non_login" v-else>
      <div class="top_right">
         <ul class="rang">
               <div class="profile_name">손님 어서오세요 </div>
         </ul>
         <a type="button" class="btn btn-login fl" href="/login">로그인</a>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/view/main/script/topMenuScript.jsp"></jsp:include>