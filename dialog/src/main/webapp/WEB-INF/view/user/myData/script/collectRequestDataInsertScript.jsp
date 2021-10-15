<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#collectRequest",
	data: {
		daumNewsDataCollectRequestCode : 0,	//다음뉴스 수집 요청 게시글 SEQ
		daumNewsRequestCollectWord : '',	//다음 뉴스 수집 요청 검색 단어
		daumNewsRequestCollectStartDate : '',	//다음 뉴스 수집 요청 수집 기간
		daumNewsRequestCollectEndDate : '',	//다음 뉴스 수집 요청 수집 기간
		daumNewsRequestCollectRemarks : '',	//다음 뉴스 수집 요청 비고란
		memberCode : 0,	//회원 SEQ
		actRequestCollectSiteUrl : '',	//기타 수집 요청 사이트 url
		actRequestCollectSiteName : '',	//기타 수집 요청 사이트 명
		actRequestCollectDescription : '',	//기타 수집 요청 상세 설명
	},
	methods: {
		//다음 뉴스 데이터 수집 요청 등록
		insertDaumCollectRequest: function (type) {
			var vm = this;
			if(this.daumNewsRequestCollectWord == ""){
				swal({
					title: "수집 단어를 입력하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			if(this.daumNewsRequestCollectStartDate == "" && this.daumNewsRequestCollectStartDate.length < 10){
				swal({
					title: "수집 기간을 입력하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			if(this.daumNewsRequestCollectEndDate == "" && this.daumNewsRequestCollectEndDate.length < 10){
				swal({
					title: "수집 기간을 입력하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			swal({
				title: "데이터 수집 요청 하시겠습니까?",
			        type: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '확인',
			        cancelButtonText: '취소',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			        allowEscapeKey:false, //esc 눌러도 안 없어짐
			}).then(function(isConfirm){
			if(isConfirm){
				$.ajax({
					url: '/insertDaumCollectRequest',
	 				data: {
	 					"daumNewsRequestCollectWord" : vm.daumNewsRequestCollectWord,
	 					"daumNewsRequestCollectStartDate" : vm.daumNewsRequestCollectStartDate,
	 					"daumNewsRequestCollectEndDate" : vm.daumNewsRequestCollectEndDate,
	 					"daumNewsRequestCollectRemarks" : vm.daumNewsRequestCollectRemarks
	 				},
	 				type: 'post',
		  		  	success: function(){
			  		  	swal({
			                  title: "데이터 수집 요청 완료",
			                  text : "요청하신 데이터는 '나의 요청 목록'에서 확인할 수 있습니다.",
		                    type: 'success',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								window.location.href="/myData/listMyCollectList?tabType="+type;
							}
							
						}).catch(swal.noop);
		  		  		
		  		  	},
		  		  	error : function(){
		  		  	swal({
		                title: "데이터 수집 요청 실패",
	                    type: 'error',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인',
	                    confirmButtonClass: 'btn',
					})
		  		  	}
		  		})
			}
			}).catch(swal.noop);
		},
		// 기타 데이터 수집 요청 등록
		insertActCollectRequest: function (type) {
			var vm = this;
			if(this.actRequestCollectSiteUrl == ""){
				swal({
					title: "수집 URL을 입력하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			if(this.actRequestCollectSiteName == ""){
				swal({
					title: "사이트 명을 입력하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			if(this.actRequestCollectDescription == ""){
				swal({
					title: "상세 설명을 입력하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			swal({
				title: "데이터 수집 요청 하시겠습니까?",
			        type: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '확인',
			        cancelButtonText: '취소',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			        allowEscapeKey:false, //esc 눌러도 안 없어짐
			}).then(function(isConfirm){
			if(isConfirm){
				$.ajax({
					url: '/insertActCollectRequest',
	 				data: {
	 					"actRequestCollectSiteUrl" : vm.actRequestCollectSiteUrl,
	 					"actRequestCollectSiteName" : vm.actRequestCollectSiteName,
	 					"actRequestCollectDescription" : vm.actRequestCollectDescription,
	 				},
	 				type: 'post',
		  		  	success: function(){
			  		  	swal({
			                  title: "데이터 수집 요청 완료",
			                  text : "요청하신 데이터는 '나의 요청 목록'에서 확인할 수 있습니다.",
		                    type: 'success',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								window.location.href="/myData/listMyCollectList?tabType="+type;
							}
							
						}).catch(swal.noop);
		  		  		
		  		  	},
		  		  	error : function(){
		  		  	swal({
		                title: "데이터 수집 요청 실패",
	                    type: 'error',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인',
	                    confirmButtonClass: 'btn',
					})
		  		  	}
		  		})
			}
			}).catch(swal.noop);
		},
		// 수집 기간 버튼 날짜
		dateChange: function (textName1, textName2, dateKind) {
			// 현재 년,월,일 날짜
		    var nowDate  = new Date();
		    var nowYear  = nowDate.getFullYear();
		    var nowMonth = nowDate.getMonth() + 1;
		    var nowDay  = nowDate.getDate();

		    if(nowMonth < 10 ){nowMonth = "0" + nowMonth;}
		    if(nowDay < 10 ){nowDay = "0" + nowDay;}
		    var thisDate = nowYear + "-" + nowMonth + "-" + nowDay;

		    //1일
		    if(dateKind == "D"){
		       nowDate = nowYear + "-" + nowMonth + "-" + nowDay;
		    }
		    //최근 1주
		    else if(dateKind == "W"){
		       var weekDate = nowDate.getTime() - (7 * 24 * 60 * 60 * 1000);
		       nowDate.setTime(weekDate);
		       var weekYear  = nowDate.getFullYear();
		       var weekMonth = nowDate.getMonth() + 1;
		       var weekDay   = nowDate.getDate();  
		       if(weekMonth < 10 ){weekMonth = "0" + weekMonth;}
		       if(weekDay < 10 ){weekDay = "0" + weekDay;}
		       nowDate = weekYear + "-" + weekMonth + "-" + weekDay;
		    }
		    //한 달
		    else if(dateKind == "M"){
		       var monthDate = nowDate.getTime() - (30 * 24 * 60 * 60 * 1000);
		       nowDate.setTime(monthDate);
		       var monthYear  = nowDate.getFullYear();
		       var monthMonth = nowDate.getMonth() + 1;
		       var monthDay   = nowDate.getDate();  
		       if(monthMonth < 10 ){monthMonth = "0" + monthMonth;}
		       if(monthDay < 10 ){monthDay = "0" + monthDay;}
		       nowDate = monthYear + "-" + monthMonth + "-" + monthDay;
		    }
		    //입력
			this.daumNewsRequestCollectEndDate = thisDate;
			this.daumNewsRequestCollectStartDate = nowDate;
			
		},

		//수집 기간 초기화 버튼
		dateReset : function (){
			this.daumNewsRequestCollectEndDate = "";
			this.daumNewsRequestCollectStartDate = "";
		}
	},
	filters: {
		
	},
	watch: {
	},
	mounted: function () {
	},
});
//달력 디자인
$(".startDate").flatpickr({
// 	minDate: "2018-10-06",
	dateFormat: "Y-m-d",
});
$(".endDate").flatpickr({
// 	minDate: "2018-10-06",
	dateFormat: "Y-m-d",
});
</script>
