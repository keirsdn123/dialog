<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<div class="full_box wsize_90" id="selectInfo">
	<!---------------------------  아이디   ---------------------------------->
	<div class="under_title mb_5 bd_bd">
	</div>
		<div class="under_title mb_5 ">
			<p class="fl mt_5">
				<span>|</span> 아이디 찾기
			</p>

		</div>
		<p class="content_summary">고객님의 정보와 일치하는 아이디 목록입니다.</p>
		<div class="under_title mb_5 ">
			<p>
				${memberId}
			</p>
		</div>
		<div class="buttons mt_20">
			<a class="btn btn-creat size_150 fr" role="button"	href="/login">로그인</a> 
			<a class="btn btn-cencle size_150 fr mr_5"  role="button" href="/selectInfo">되돌아가기</a>
		</div>
	
</div>
