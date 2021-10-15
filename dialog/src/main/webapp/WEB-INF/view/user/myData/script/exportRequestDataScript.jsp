<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
var vm = new Vue({
	el: "#exportRequestList",
	data: {
		selectRssDtSetList : [],	//반출 요청 Rss데이터셋 리스트
		selectShopDtSetList : [],	//반출 요청 쇼핑데이터셋 리스트
		selectDaumDtSetList : [], //반출 요청 다음뉴스데이터셋 리스트
		
		exportCollectWord : '',	//반출 요청 검색 단어
		exportCollectStartDate : '',	//반출 요청 시작 일시
		exportCollectEndDate : '',	//반출 요청 종료 일시
		exportCollectRemarks : '',	//반출 요청 비고란
		dataCode : 0,	//데이터셋 seq
		
		
		exportShopCollectWord : '',	//반출 요청 쇼핑 검색 단어
		exportShopCollectStartDate : '',	//반출 요청 쇼핑 시작 일시
		exportShopCollectEndDate : '',	//반출 요청 쇼핑 종료 일시
		exportShopCollectRemarks : '',	//반출 요청 쇼핑 비고란
		
		exportDaumCollectWord:'',
		exportDaumCollectStartDate:'',
		exportDaumCollectEndDate:'',
		exportDaumCollectRemarks:'',
		
	},
	methods: {
		//반출 요청 Rss데이터셋 조회
		selectRssDtSet: function () {
			var vm = this;
			$.ajax({
				url: '/selectRssDtSet',
				data: {
				},
				type: 'post',
				success: function (list) {
					vm.selectRssDtSetList = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},
		//반출 요청 쇼핑데이터셋 조회
		selectShopDtSet: function () {
			var vm = this;
			$.ajax({
				url: '/selectShopDtSet',
				data: {
				},
				type: 'post',
				success: function (list) {
					vm.selectShopDtSetList = list;
				},
				error: function () {
					alert("에러");
				}
			})
		},
		
		// rss 반출 요청 등록
		insertRssExportRequest: function (type) {
			var vm = this;
			if(this.dataCode == "" && this.dataCode == 0){
				swal({
					title: "데이터 셋을 선택하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			if(this.exportCollectWord == ""){
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
			if(this.exportCollectStartDate == "" && this.exportCollectStartDate.length < 10){
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
				title: "데이터 반출 요청 하시겠습니까?",
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
					url: '/insertExportRequest',
	 				data: {
	 					"exportCollectWord" : vm.exportCollectWord,
	 					"exportCollectStartDate" : vm.exportCollectStartDate,
	 					"exportCollectEndDate" : vm.exportCollectEndDate,
	 					"dataCode" : vm.dataCode,
	 					"exportCollectRemarks" : vm.exportCollectRemarks,
	 					"exportCollectType" : "RSS뉴스",
	 				},
	 				type: 'post',
		  		  	success: function(){
			  		  	swal({
			                  title: "데이터 반출 요청 완료",
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
		                title: "데이터 반출 요청 실패",
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
		
		// 쇼핑 반출 요청 등록
		insertShopExportRequest: function (type, exportType) {
			var vm = this;
			if(this.dataCode == "" && this.dataCode == 0){
				swal({
					title: "데이터 셋을 선택하세요",
					type: 'warning',
					confirmButtonColor: '#3085d6',
					confirmButtonText: '확인',
					confirmButtonClass: 'btn',
					allowOutsideClick:false,
					allowEscapeKey:false,
				})
				return;
			}
			if(this.exportShopCollectWord == ""){
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
			if(this.exportShopCollectStartDate == "" && this.exportShopCollectStartDate.length < 10){
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
			if(this.exportShopCollectEndDate == "" && this.exportShopCollectEndDate.length < 10){
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
				title: "데이터 반출 요청 하시겠습니까?",
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
					url: '/insertExportRequest',
	 				data: {
	 					"exportCollectWord" : vm.exportShopCollectWord,
	 					"exportCollectStartDate" : vm.exportShopCollectStartDate,
	 					"exportCollectEndDate" : vm.exportShopCollectEndDate,
	 					"exportCollectRemarks" : vm.exportShopCollectRemarks,
	 					"dataCode" : vm.dataCode,
	 					"exportCollectType" : "네이버쇼핑"
	 				},
	 				type: 'post',
		  		  	success: function(){
			  		  	swal({
			                  title: "데이터 반출 요청 완료",
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
			                title: "데이터 반출 요청 실패",
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
		
		insertDaumExportRequest: function (type) {
			var vm = this;
			if(vm.dataCode ==0){
				swal({
	                title: "반출할 데이터셋을 선택하세요.",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
				})
			}
			else{
				swal({
					title: "데이터 반출 요청 하시겠습니까?",
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
						url: '/insertExportRequest',
		 				data: {
		 					"exportCollectWord" : vm.exportDaumCollectWord,
		 					"exportCollectStartDate" : vm.exportDaumCollectStartDate,
		 					"exportCollectEndDate" : vm.exportDaumCollectEndDate,
		 					"exportCollectRemarks" : vm.exportDaumCollectRemarks,
		 					"dataCode" : vm.dataCode,
		 					"exportCollectType" : "다음뉴스"
		 				},
		 				type: 'post',
			  		  	success: function(){
				  		  	swal({
				                  title: "데이터 반출 요청 완료",
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
			                title: "데이터 반출 요청 실패",
		                    type: 'error',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
						})
			  		  	}
			  		})
				}
				}).catch(swal.noop);
			}
			
		},
		
		// 데이터셋 클릭시 색
		backColor: function (code) {
			var vm = this;
			vm.dataCode = code;
			console.log(vm.dataCode);
			
		},
		
		clickDaumDt: function (code) {
			var vm = this;
			vm.dataCode = code;
			console.log(vm.dataCode);
			$.ajax({
				url: '/selectDaumDtSetInfo',
				data: {
					'dataCode' : code
				},
				type: 'post',
				success: function (list) {
					vm.exportDaumCollectWord = list.daumNewsRequestCollectWord;
					vm.exportDaumCollectStartDate = list.daumNewsRequestCollectStartDate;
					vm.exportDaumCollectEndDate = list.daumNewsRequestCollectEndDate;
				},
				error: function () {
					alert("에러");
				}
			})
			
		},
		
		// 수집 기간 버튼 날짜
		dateChange: function (textName1, textName2, dateKind, type) {
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
		    if(type == "rss"){
		    	this.exportCollectStartDate = nowDate;
				this.exportCollectEndDate = thisDate;
		    }
		    else if(type == "shopping"){
				this.exportShopCollectStartDate = nowDate;
				this.exportShopCollectEndDate = thisDate;
		    }
		},
		
		//수집 기간 초기화 버튼
		dateReset : function (type){
			if(type == 'rss'){
				this.exportCollectStartDate = "";
				this.exportCollectEndDate = "";
			}
			else if(type == 'shopping'){
				this.exportShopCollectStartDate = "";
				this.exportShopCollectEndDate = "";
			}
		},
		selectDaumDtSet : function(){
			var vm = this;
			$.ajax({
				url: '/selectDaumDtSet',
				data: {
				},
				type: 'post',
				success: function (list) {
					vm.selectDaumDtSetList = list;
				},
				error: function () {
					alert("에러");
				}
			})
		}

	},
	
	filters: {
		
	},
	watch: {
	},
	mounted: function () {
		var vm = this;
		vm.selectRssDtSet();
		vm.selectShopDtSet();
		vm.selectDaumDtSet();
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
