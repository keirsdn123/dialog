<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
   var vm = new Vue({
      el:"#schList" ,
      data: {
        getSchList : {},
        scheduelInfo : {},
        scheCode : '',
        scheWorkTitle : '',
        scheWorkCycle : '',
        scheStatusCode : '',
        scheType : '',
        retryCount : '',
        scheDate : '',
        scheWriter : '',
        seconds :'',
    	minutes :'',
    	hours :'',
    	day :'',  
    	month :'',
    	year : '',
    	eachSecondsFl : '',
    	eachSecondsSe : '',
    	eachMinutesFl : '',
    	eachMinutesSe : '',
    	eachHoursFl : '',
    	eachHoursSe : '',
    	eachDayFl : '',
    	eachDaySe : '',
    	eachMonthFl : '',
    	eachMonthSe : '',
    	eachYearFl : '',
    	eachYearSe : '', 	
    	scheCron : '',
    	scheLogInfo : {},
    	scheErrorInfo : {},
    	pagingInfo: {
            currentPage: 1,
            records: 0,
            perPage: 10,
        },
      },
      methods: {
		  selectScheRowCount : function(){
				var vm = this;
				$.ajax({
		    		url:'/selectScheRowCount',
		    		data:{
		    		},
		    		type:'post',
		    		success: function(records){
		    			vm.pagingInfo.records = records;
		    		},
		    		error: function(){
	    				alert("selectNormalDataRowCount 에러");
	    			}
		    	});
			},
         //스케줄 목록조회
         selectScheList : function(){
            var vm = this;
            $.ajax({
             url: "/selectSche",
               data :{
            	   "perPage" : vm.pagingInfo.perPage,
   				   "currentPage" : vm.pagingInfo.currentPage,
               },
               type:'post',
               success: function(list){
                  console.log(list);
                  vm.getSchList = list;
               },
               
               error : function(){
                  alert("에러");
               }
            })
         },
        //스케줄 로그 상세조회 (오류)
         scheErrorLog : function(seq) {
       		 var vm = this;
                $.ajax({
                 url: "/selectScheErrorLog?scheCode="+seq,
                   data :{
                   },
                   type:'post',
                   success: function(list){
                      console.log(list);
                      vm.scheErrorInfo = list;
                   },
                   error : function(){
                      alert("에러");
                   }
                })
         }, 
         
        //스케줄 상세조회
        scheduleinfo : function(seq) {
       		 var vm = this;
                $.ajax({
                 url: "/scheduleinfo?scheCode="+seq,
                   data :{
                   },
                   type:'post',
                   success: function(list){
                      console.log(list);
                      list.scheCron;
                      var strArray = list.scheCron.split(' ');
                      console.log(strArray[0],strArray[1],strArray[2],strArray[3],strArray[4],strArray[5]);
                      vm.seconds = strArray[0];
                      vm.minutes = strArray[1];
                      vm.hours = strArray[2];
                      vm.day = strArray[3];
                      vm.month = strArray[4];
                      var yearBefore = strArray[5].substring(1, 5);
                      vm.year = yearBefore;
                      
                      vm.scheduelInfo = list;
                   },
                   error : function(){
                      alert("에러");
                   }
                })
         },
         //스케줄 재시작
         scheduleRestart: function (seq) {
            var vm = this;
            swal({
					title: "스케줄 동작을 재시작 하시겠습니까?",
			        type: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '재시작하기',
			        cancelButtonText: '돌아가기',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			        allowEscapeKey:false, //esc 눌러도 안 없어짐
			}).then(function(isConfirm){
				if(isConfirm){
		            $.ajax({
		               url: "/restartSche",
		               data: {
		                  "scheCode" : seq,
		               },
		               type: 'post',
		               success: function () {
		            	   swal({
				                title: "스케줄 재시작 완료",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
			                    allowOutsideClick:false,
						        allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
		                  		location.href = "/scheduleList";
								}
							}).catch(swal.noop);	
		               },
		               error: function () {
		            		swal({
				                title: "스케줄 재시작 실패",
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
         //스케줄 중지
         scheduleStop: function (seq) {
          	var vm = this;
            swal({
					title: "스케줄 동작을 중지 하시겠습니까?",
			        type: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '중지하기',
			        cancelButtonText: '돌아가기',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			        allowEscapeKey:false, //esc 눌러도 안 없어짐
			}).then(function(isConfirm){
				if(isConfirm){
		            $.ajax({
		               url: "/stopSche",
		               data: {
		                  "scheCode" : seq,
		               },
		               type: 'post',
		               success: function () {
		            	   swal({
				                title: "스케줄 동작 중지 완료",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
			                    allowOutsideClick:false,
						        allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
		                  		location.href = "/scheduleList";
								}
							}).catch(swal.noop);	
		               },
		               error: function () {
		            		swal({
				                title: "스케줄 동작 중지 실패",
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
         //스케줄 삭제 
         deleteSche: function (seq) {
             var vm = this;
             swal({
 					title: "스케줄 동작을 삭제 하시겠습니까?",
 			        type: 'question',
 			        showCancelButton: true,
 			        confirmButtonColor: '#3085d6',
 			        cancelButtonColor: '#d33',
 			        confirmButtonText: '삭제하기',
 			        cancelButtonText: '돌아가기',
 			        confirmButtonClass: 'btn',
 			        cancelButtonClass: 'btn btn-cencle',
 			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
 			        allowEscapeKey:false, //esc 눌러도 안 없어짐
 			}).then(function(isConfirm){
 				if(isConfirm){	
	             $.ajax({
	                url: "/deleteSche",
	                data: {
	                   "scheCode" : seq,
	                },
	                type: 'post',
	                success: function () {
	                 	swal({
			                title: "스케줄 동작 삭제 완료",
		                    type: 'success',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){	
	                 			vm.selectScheList();
							}
						}).catch(swal.noop);	
	                },
	                error: function () {
	                	swal({
			                title: "스케줄 동작 삭제 실패",
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
          
          //스케줄 로그 조회
  		  scheduleLogSelect: function () {
  			  var vm = this;
  			  $.ajax({
  				  url: '/selectScheduleLog',
  				  data: {
  			  	  },
  				  type: 'post',
  				  success: function (list) {
  					  console.log(list);
  					  vm.scheLogInfo = list;
  				  },
  				  error: function () {
  					  alert("에러");
  				  }
  			  })
  		  },
		  //스케줄 수정
          scheduleUpdate: function ()  {
        	  var textEffectiveness = /^[0-9]*$/; //숫자만 입력 허용 정규식
              
              var vm = this;
	           if($('#updateCron').children('option:selected').text() == "작업선택"){
	        	$("#updateCron").focus();   
	        	swal({
		                title: "작업을 선택해주십시오.",
	                    type: 'error',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인',
	                    confirmButtonClass: 'btn',
				})
	            return false;	
	           }
	           if(vm.effectiveness==0){
	            swal({
			                title: "데이터수집요청 목록을 선택해주십시오.",
		                    type: 'error',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
				})
	            return false;
	           }
	           
	           //직접입력 유효성 검사
	           if($('#updateCron').children('option:selected').text() == "일시적지정"){    
		           if (vm.seconds <0 || vm.seconds > 59 || vm.seconds =='' || !textEffectiveness.test(vm.seconds)) {
		          	 $(".seconds").focus();
		          	 swal({
				                title: "값의 허용 범위를 초과하셨습니다.",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
					 })
		             return false;
		           }
		           if (vm.minutes <0 || vm.minutes > 59 || vm.minutes =='' || !textEffectiveness.test(vm.minutes)) {
		             $(".minutes").focus();
		             swal({
				                title: "값의 허용 범위를 초과하셨습니다.",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
				     })
		             return false;
		           }
		           if (vm.hours <0 || vm.hours > 23 || vm.hours =='' || !textEffectiveness.test(vm.hours)) {
		             $(".hours").focus();
		             swal({
				                title: "값의 허용 범위를 초과하셨습니다.",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
					 })
		             return false;
		           }
		           if (vm.day < 1|| vm.day > 31 || vm.day =='' || !textEffectiveness.test(vm.day)) {
		             $(".day").focus();
		             swal({
				                title: "값의 허용 범위를 초과하셨습니다.",
			                    type: 'error',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
					 })
		             return false;
		           }
			       if (vm.month < 1||vm.month > 12 || vm.month =='' || !textEffectiveness.test(vm.month)) {
			         $(".months").focus();
			         swal({
					            title: "값의 허용 범위를 초과하셨습니다.",
				                type: 'error',
				                confirmButtonColor: '#3085d6',
			     	            confirmButtonText: '확인',
				                confirmButtonClass: 'btn',
				     })
			         return false;
			       }
			       if (vm.year <= 2017 || vm.year > 2099 || vm.year =='' || !textEffectiveness.test(vm.year)) {
			         $(".year").focus();
			         swal({
				  	            title: "값의 허용 범위를 초과하셨습니다.",
				   	            type: 'error',
				                confirmButtonColor: '#3085d6',
				                confirmButtonText: '확인',
				                confirmButtonClass: 'btn',
				     })
			         return false;
			       }
            	}
	           
	            //증분지정 유효성 검사 
	           	if($('#updateCron').children('option:selected').text() == "증분지정"){
	           		

	           		if($('#updateEachSeconds').children('option:selected').text() == "범위지정" && $('#updateEachMinutes').children('option:selected').text() == "범위지정" && $('#updateEachHours').children('option:selected').text() == "범위지정" && $('#updateEachDay').children('option:selected').text() == "범위지정" && $('#updateEachMonth').children('option:selected').text() == "범위지정" ){
	           			swal({
			                title: "범위를 지정해주십시오.",
		                    type: 'error',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
						})
			            return false;
	           		}
	           		
	           	 	if($('#updateEachSeconds').children('option:selected').text() == "매초마다"){
			           if (vm.eachSecondsFl <0 || vm.eachSecondsFl > 59 || vm.eachSecondsFl =='') {
			          	 $(".eachSecondsFl").focus();
			          	 swal({
					                title: "값의 허용 범위를 초과하셨습니다.",
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
						 })
			             return false;
			           }
			           if (vm.eachSecondsSe <0 || vm.eachSecondsSe > 59 || vm.eachSecondsSe =='') {
				          	 $(".eachSecondsSe").focus();
				          	 swal({
						                title: "값의 허용 범위를 초과하셨습니다.",
					                    type: 'error',
					                    confirmButtonColor: '#3085d6',
					                    confirmButtonText: '확인',
					                    confirmButtonClass: 'btn',
							 })
				             return false;
				       }
	           	 	}
		           
	           	 	if($('#updateEachMinutes').children('option:selected').text() == "매분마다"){
		           	 	if (vm.eachMinutesFl <0 || vm.eachMinutesFl > 59 || vm.eachMinutesFl =='') {
			             	$(".eachMinutesFl").focus();
			             	swal({
					                title: "값의 허용 범위를 초과하셨습니다.",
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
					     	})
			             	return false;
			           }
			           if (vm.eachMinutesSe <0 || vm.eachMinutesSe > 59 || vm.eachMinutesSe =='') {
				             $(".eachMinutesSe").focus();
				             swal({
						                title: "값의 허용 범위를 초과하셨습니다.",
					                    type: 'error',
					                    confirmButtonColor: '#3085d6',
					                    confirmButtonText: '확인',
					                    confirmButtonClass: 'btn',
						     })
				             return false;
				       }
	           	 	}
		           
		           
	           	    if($('#updateEachHours').children('option:selected').text() == "매시간마다"){
		           
			           if (vm.eachHoursFl <0 || vm.eachHoursFl > 23 || vm.eachHoursFl =='') {
			             $(".eachHoursFl").focus();
			             swal({
					                title: "값의 허용 범위를 초과하셨습니다.",
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
						 })
			             return false;
			           }
			           if (vm.eachHoursSe <0 || vm.eachHoursSe > 23 || vm.eachHoursSe =='') {
				             $(".eachHoursSe").focus();
				             swal({
						                title: "값의 허용 범위를 초과하셨습니다.",
					                    type: 'error',
					                    confirmButtonColor: '#3085d6',
					                    confirmButtonText: '확인',
					                    confirmButtonClass: 'btn',
							 })
				             return false;
				       }
	           	    }
	           	    
	           	 	if($('#updateEachDay').children('option:selected').text() == "매일마다"){
			           if (vm.eachDayFl < 1|| vm.eachDayFl > 31 || vm.eachDayFl =='') {
			             $(".eachDayFl").focus();
			             swal({
					                title: "값의 허용 범위를 초과하셨습니다.",
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
						 })
			             return false;
			           }
			           if (vm.eachDaySe < 1|| vm.eachDaySe > 31 || vm.eachDaySe =='') {
				             $(".eachDaySe").focus();
				             swal({
						                title: "값의 허용 범위를 초과하셨습니다.",
					                    type: 'error',
					                    confirmButtonColor: '#3085d6',
					                    confirmButtonText: '확인',
					                    confirmButtonClass: 'btn',
							 })
				             return false;
				       }
			        }
	           	 	
	           	 	if($('#updateEachMonth').children('option:selected').text() == "매월마다"){
				       if (vm.eachMonthFl < 1||vm.eachMonthFl > 12 || vm.eachMonthFl =='') {
				         $(".eachMonthFl").focus();
				         swal({
						            title: "값의 허용 범위를 초과하셨습니다.",
					                type: 'error',
					                confirmButtonColor: '#3085d6',
				     	            confirmButtonText: '확인',
					                confirmButtonClass: 'btn',
					     })
				         return false;
				       }
				       if (vm.eachMonthSe < 1||vm.eachMonthSe > 12 || vm.eachMonthSe =='') {
					         $(".eachMonthSe").focus();
					         swal({
							            title: "값의 허용 범위를 초과하셨습니다.",
						                type: 'error',
						                confirmButtonColor: '#3085d6',
					     	            confirmButtonText: '확인',
						                confirmButtonClass: 'btn',
						     })
					         return false;
					   }
	           	 	}
	           	 	
			       
            	}
	           	
	         // 직접입력 스케줄 등록
	         if($('#updateCron').children('option:selected').text() == "일시적지정"){
	       	    swal({
	       	    	title: "스케줄을 수정 하시겠습니까?",
	       	    	text: vm.year + "년도 " + vm.month + "월 " + vm.day + "일 " + vm.hours + "시 " + vm.minutes + "분 " + vm.seconds + "초에 작동이 시작됩니다.",
	 					type: 'question',
	  			        showCancelButton: true,
	  			        confirmButtonColor: '#3085d6',
	  			        cancelButtonColor: '#d33',
	  			        confirmButtonText: '수정하기',
	  			        cancelButtonText: '돌아가기',
	  			        confirmButtonClass: 'btn',
	  			        cancelButtonClass: 'btn btn-cencle',
	  			        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
	  			        allowEscapeKey:false, //esc 눌러도 안 없어짐
       	     
  				}).then(function(isConfirm){
  				if(isConfirm){
       			 $.ajax({
 		                url: "/selectOverlap",
 		                data: {
 		                   "scheCron" : vm.seconds + ' ' +vm.minutes +' '+ vm.hours +' '+ vm.day +' '+ vm.month +' ?'+ vm.year,
 		                },
 		                type: 'post',
 		                success: function (scheOverlap) {
 		                	  console.log(scheOverlap);
 		                   if(scheOverlap.scheOverlap > 0){
	  		                	 swal({
	  				                title: "스케줄 실행주기 중복",
	  			                    type: 'error',
	  			                    confirmButtonColor: '#3085d6',
	  			                    confirmButtonText: '확인',
	  			                    confirmButtonClass: 'btn',
	  							 })
 		                	     return false;
 		                   }
 		                   else{
 		                	    $.ajax({
 		    		              url: "/updateSche",
 		    		              data: {
 		    		            	 "scheCode":vm.scheduelInfo.scheCode,
 		    		                 "scheCron" : vm.seconds + ' ' +vm.minutes +' '+ vm.hours +' '+ vm.day +' '+ vm.month +' ?'+ vm.year,
 		    		                 "scheWorkCycle" : vm.year + "년도 " + vm.month + "월 " + vm.day + "일 " + vm.hours + "시 " + vm.minutes + "분 " + vm.seconds + "초 ",
 		    		                 "scheCode":vm.scheduelInfo.scheCode,
 		    		              },
 		    		              type: 'post',
 		    		              success: function () {
 		    		            	swal({
	  					                title: "스케줄 수정 완료 " ,
	  				                    type: 'success',
	  				                    confirmButtonColor: '#3085d6',
	  				                    confirmButtonText: '확인',
	  				                    confirmButtonClass: 'btn',
	  				                    allowOutsideClick:false,
	  							        allowEscapeKey:false,
	  								}).then(function(isConfirm){
	  									if(isConfirm){
	  										location.href = "/scheduleList";
	  									}
	  								}).catch(swal.noop);
 		    		              },
 		    		              error: function () {
 		    		             	swal({
	  		  			                title: "스케줄 수정 실패",
	  		  		                    type: 'error',
	  		  		                    confirmButtonColor: '#3085d6',
	  		  		                    confirmButtonText: '확인',
	  		  		                    confirmButtonClass: 'btn',
 		  							})
 		    		              }
 		    		           })
 		                   }
 		                },
 		                error: function () {
 		                	swal({
		  			         title: "스케줄 수정 실패",
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
	         
				// 증분지정 스케줄 등록 
           	if($('#updateCron').children('option:selected').text() == "증분지정"){
           		
           		if($('#updateEachSeconds').children('option:selected').text() == "매초마다"){
           			swal({
		       	    		title: "스케줄을 수정 하시겠습니까?",
				       	   	text: vm.eachSecondsFl + "초에 시작해서 " + vm.eachSecondsSe + "초 간격으로 작동이 시작됩니다.",
	       	    			type: 'question',
			  			    showCancelButton: true,
			  			    confirmButtonColor: '#3085d6',
			  			    cancelButtonColor: '#d33',
			  			    confirmButtonText: '수정하기',
			  		    	cancelButtonText: '돌아가기',
			  			    confirmButtonClass: 'btn',
			  			    cancelButtonClass: 'btn btn-cencle',
			  		        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			  		        allowEscapeKey:false, //esc 눌러도 안 없어짐
	       	     
		  				}).then(function(isConfirm){
		  				
		  				if(isConfirm){
		       			 $.ajax({
			 		     		url: "/selectOverlap",
			 		            data: {
			 		            	"scheCron" : vm.eachSecondsFl + '/' +vm.eachSecondsSe +'* * * * ?',
			 		            },
			 		            type: 'post',
		 		                success: function (scheOverlap) {
		 		                	  console.log(scheOverlap);
		 		                   if(scheOverlap.scheOverlap > 0){
			  		                	 swal({
			  				                title: "스케줄 실행주기 중복",
			  			                    type: 'error',
			  			                    confirmButtonColor: '#3085d6',
			  			                    confirmButtonText: '확인',
			  			                    confirmButtonClass: 'btn',
			  							 })
		 		                	     return false;
		 		                   }
		 		                   else{
		 		                	    $.ajax({
		 		    		              url: "/updateSche",
		 		    		              data: {
		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
		 		    		                 "scheCron" : vm.eachSecondsFl + '/' +vm.eachSecondsSe +' * * * * ?',
		 		    		                 "scheWorkCycle" : vm.eachSecondsFl + "초에 시작해서 " + vm.eachSecondsSe + "초 간격으로 작동이 시작됩니다.",
		 		    		                 "scheCode":vm.scheduelInfo.scheCode,
		 		    		              },
		 		    		              type: 'post',
		 		    		              success: function () {
		 		    		            	swal({
			  					                title: "스케줄 수정 완료 " ,
			  				                    type: 'success',
			  				                    confirmButtonColor: '#3085d6',
			  				                    confirmButtonText: '확인',
			  				                    confirmButtonClass: 'btn',
			  				                    allowOutsideClick:false,
			  							        allowEscapeKey:false,
			  								}).then(function(isConfirm){
			  									if(isConfirm){
			  										location.href = "/scheduleList";
			  									}
			  								}).catch(swal.noop);
		 		    		              },
		 		    		              error: function () {
		 		    		             	swal({
			  		  			                title: "스케줄 수정 실패",
			  		  		                    type: 'error',
			  		  		                    confirmButtonColor: '#3085d6',
			  		  		                    confirmButtonText: '확인',
			  		  		                    confirmButtonClass: 'btn',
		 		  							})
		 		    		              }
		 		    		           })
		 		                   }
		 		                },
		 		                error: function () {
		 		                	swal({
				  			         title: "스케줄 수정 실패",
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
           		
           		if($('#updateEachMinutes').children('option:selected').text() == "매분마다"){
           			swal({
		       	    		title: "스케줄을 수정 하시겠습니까??",
				       	   	text: vm.eachMinutesFl + "분에 시작해서 " + vm.eachMinutesSe + "분 간격으로 작동이 시작됩니다.",
	       	    			type: 'question',
			  			    showCancelButton: true,
			  			    confirmButtonColor: '#3085d6',
			  			    cancelButtonColor: '#d33',
			  			    confirmButtonText: '수정하기',
			  		    	cancelButtonText: '돌아가기',
			  			    confirmButtonClass: 'btn',
			  			    cancelButtonClass: 'btn btn-cencle',
			  		        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			  		        allowEscapeKey:false, //esc 눌러도 안 없어짐
	       	     
		  				}).then(function(isConfirm){
		  				
		  				if(isConfirm){
		       			 $.ajax({
			 		     		url: "/selectOverlap",
			 		            data: {
			 		            	"scheCron" : "0 " + vm.eachMinutesFl + '/' +vm.eachMinutesSe +' * * * ?',
			 		            },
			 		            type: 'post',
		 		                success: function (scheOverlap) {
		 		                	  console.log(scheOverlap);
		 		                   if(scheOverlap.scheOverlap > 0){
			  		                	 swal({
			  				                title: "스케줄 실행주기 중복",
			  			                    type: 'error',
			  			                    confirmButtonColor: '#3085d6',
			  			                    confirmButtonText: '확인',
			  			                    confirmButtonClass: 'btn',
			  							 })
		 		                	     return false;
		 		                   }
		 		                   else{
		 		                	    $.ajax({
		 		    		              url: "/updateSche",
		 		    		              data: {
		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
		 		    		                 "scheCron" : "0 " + vm.eachMinutesFl + '/' +vm.eachMinutesSe +' * * * ?',
		 		    		                 "scheWorkCycle" : vm.eachMinutesFl + "분에 시작해서 " + vm.eachMinutesSe + "분 간격으로 작동이 시작됩니다.",
		 		    		                 "scheCode":vm.scheduelInfo.scheCode,
		 		    		              },
		 		    		              type: 'post',
		 		    		              success: function () {
		 		    		            	swal({
			  					                title: "스케줄 수정 완료 " ,
			  				                    type: 'success',
			  				                    confirmButtonColor: '#3085d6',
			  				                    confirmButtonText: '확인',
			  				                    confirmButtonClass: 'btn',
			  				                    allowOutsideClick:false,
			  							        allowEscapeKey:false,
			  								}).then(function(isConfirm){
			  									if(isConfirm){
			  										location.href = "/scheduleList";
			  									}
			  								}).catch(swal.noop);
		 		    		              },
		 		    		              error: function () {
		 		    		             	swal({
			  		  			                title: "스케줄 수정 실패",
			  		  		                    type: 'error',
			  		  		                    confirmButtonColor: '#3085d6',
			  		  		                    confirmButtonText: '확인',
			  		  		                    confirmButtonClass: 'btn',
		 		  							})
		 		    		              }
		 		    		           })
		 		                   }
		 		                },
		 		                error: function () {
		 		                	swal({
				  			         title: "스케줄 수정 실패",
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
           		
           		 if($('#updateEachHours').children('option:selected').text() == "매시간마다"){
           			swal({
		       	    		title: "스케줄을 수정 하시겠습니까??",
				       	   	text: vm.eachHoursFl + "시에 시작해서 " + vm.eachHoursSe + "시간 간격으로 작동이 시작됩니다.",
	       	    			type: 'question',
			  			    showCancelButton: true,
			  			    confirmButtonColor: '#3085d6',
			  			    cancelButtonColor: '#d33',
			  			    confirmButtonText: '수정하기',
			  		    	cancelButtonText: '돌아가기',
			  			    confirmButtonClass: 'btn',
			  			    cancelButtonClass: 'btn btn-cencle',
			  		        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			  		        allowEscapeKey:false, //esc 눌러도 안 없어짐
	       	     
		  				}).then(function(isConfirm){
		  				
		  				if(isConfirm){
		       			 $.ajax({
			 		     		url: "/selectOverlap",
			 		            data: {
			 		            	"scheCron" : "0 0 " + vm.eachHoursFl + '/' +vm.eachHoursSe +' * * ?',
			 		            },
			 		            type: 'post',
		 		                success: function (scheOverlap) {
		 		                	  console.log(scheOverlap);
		 		                   if(scheOverlap.scheOverlap > 0){
			  		                	 swal({
			  				                title: "스케줄 실행주기 중복",
			  			                    type: 'error',
			  			                    confirmButtonColor: '#3085d6',
			  			                    confirmButtonText: '확인',
			  			                    confirmButtonClass: 'btn',
			  							 })
		 		                	     return false;
		 		                   }
		 		                   else{
		 		                	    $.ajax({
		 		    		              url: "/updateSche",
		 		    		              data: {
		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
		 		    		                 "scheCron" : "0 0 " + vm.eachHoursFl + '/' +vm.eachHoursSe +' * * ?',
		 		    		                 "scheWorkCycle" : vm.eachHoursFl + "시에 시작해서 " + vm.eachHoursSe + "시간 간격으로 작동이 시작됩니다.",
		 		    		                 "scheCode":vm.scheduelInfo.scheCode,
		 		    		              },
		 		    		              type: 'post',
		 		    		              success: function () {
		 		    		            	swal({
			  					                title: "스케줄 수정 완료 " ,
			  				                    type: 'success',
			  				                    confirmButtonColor: '#3085d6',
			  				                    confirmButtonText: '확인',
			  				                    confirmButtonClass: 'btn',
			  				                    allowOutsideClick:false,
			  							        allowEscapeKey:false,
			  								}).then(function(isConfirm){
			  									if(isConfirm){
			  										location.href = "/scheduleList";
			  									}
			  								}).catch(swal.noop);
		 		    		              },
		 		    		              error: function () {
		 		    		             	swal({
			  		  			                title: "스케줄 수정 실패",
			  		  		                    type: 'error',
			  		  		                    confirmButtonColor: '#3085d6',
			  		  		                    confirmButtonText: '확인',
			  		  		                    confirmButtonClass: 'btn',
		 		  							})
		 		    		              }
		 		    		           })
		 		                   }
		 		                },
		 		                error: function () {
		 		                	swal({
				  			         title: "스케줄 수정 실패",
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
           		
           		if($('#updateEachDay').children('option:selected').text() == "매일마다"){
           			swal({
		       	    		title: "스케줄을 수정 하시겠습니까??",
				       	   	text: vm.eachDayFl + "일에 시작해서 " + vm.eachDaySe + "일 간격으로 작동이 시작됩니다.",
	       	    			type: 'question',
			  			    showCancelButton: true,
			  			    confirmButtonColor: '#3085d6',
			  			    cancelButtonColor: '#d33',
			  			    confirmButtonText: '수정하기',
			  		    	cancelButtonText: '돌아가기',
			  			    confirmButtonClass: 'btn',
			  			    cancelButtonClass: 'btn btn-cencle',
			  		        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			  		        allowEscapeKey:false, //esc 눌러도 안 없어짐
	       	     
		  				}).then(function(isConfirm){
		  				
		  				if(isConfirm){
		       			 $.ajax({
			 		     		url: "/selectOverlap",
			 		            data: {
			 		            	"scheCron" : "0 0 0 " + vm.eachDayFl + '/' +vm.eachDaySe +' * ?',
			 		            },
			 		            type: 'post',
		 		                success: function (scheOverlap) {
		 		                	  console.log(scheOverlap);
		 		                   if(scheOverlap.scheOverlap > 0){
			  		                	 swal({
			  				                title: "스케줄 실행주기 중복",
			  			                    type: 'error',
			  			                    confirmButtonColor: '#3085d6',
			  			                    confirmButtonText: '확인',
			  			                    confirmButtonClass: 'btn',
			  							 })
		 		                	     return false;
		 		                   }
		 		                   else{
		 		                	    $.ajax({
		 		    		              url: "/updateSche",
		 		    		              data: {
		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
		 		    		                 "scheCron" : "0 0 0 " + vm.eachDayFl + '/' +vm.eachDaySe +' * ?',
		 		    		                 "scheWorkCycle" : vm.eachDayFl + "일에 시작해서 " + vm.eachDaySe + "일 간격으로 작동이 시작됩니다.",
		 		    		                 "scheCode":vm.scheduelInfo.scheCode,
		 		    		              },
		 		    		              type: 'post',
		 		    		              success: function () {
		 		    		            	swal({
			  					                title: "스케줄 수정 완료 " ,
			  				                    type: 'success',
			  				                    confirmButtonColor: '#3085d6',
			  				                    confirmButtonText: '확인',
			  				                    confirmButtonClass: 'btn',
			  				                    allowOutsideClick:false,
			  							        allowEscapeKey:false,
			  								}).then(function(isConfirm){
			  									if(isConfirm){
			  										location.href = "/scheduleList";
			  									}
			  								}).catch(swal.noop);
		 		    		              },
		 		    		              error: function () {
		 		    		             	swal({
			  		  			                title: "스케줄 수정 실패",
			  		  		                    type: 'error',
			  		  		                    confirmButtonColor: '#3085d6',
			  		  		                    confirmButtonText: '확인',
			  		  		                    confirmButtonClass: 'btn',
		 		  							})
		 		    		              }
		 		    		           })
		 		                   }
		 		                },
		 		                error: function () {
		 		                	swal({
				  			         title: "스케줄 수정 실패",
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
           		
           		if($('#updateEachMonth').children('option:selected').text() == "매월마다"){
           			swal({
		       	    		title: "스케줄을 수정 하시겠습니까??",
				       	   	text: vm.eachMonthFl + "월에 시작해서 " + vm.eachMonthSe + "월 1일 간격으로 작동이 시작됩니다.",
	       	    			type: 'question',
			  			    showCancelButton: true,
			  			    confirmButtonColor: '#3085d6',
			  			    cancelButtonColor: '#d33',
			  			    confirmButtonText: '수정하기',
			  		    	cancelButtonText: '돌아가기',
			  			    confirmButtonClass: 'btn',
			  			    cancelButtonClass: 'btn btn-cencle',
			  		        allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			  		        allowEscapeKey:false, //esc 눌러도 안 없어짐
	       	     
		  				}).then(function(isConfirm){
		  				
		  				if(isConfirm){
		       			 $.ajax({
			 		     		url: "/selectOverlap",
			 		            data: {
			 		            	"scheCron" : '0 0 0 1 ' + vm.eachMonthFl + '/' +vm.eachMonthSe +' ?',
			 		            },
			 		            type: 'post',
		 		                success: function (scheOverlap) {
		 		                	  console.log(scheOverlap);
		 		                   if(scheOverlap.scheOverlap > 0){
			  		                	 swal({
			  				                title: "스케줄 실행주기 중복",
			  			                    type: 'error',
			  			                    confirmButtonColor: '#3085d6',
			  			                    confirmButtonText: '확인',
			  			                    confirmButtonClass: 'btn',
			  							 })
		 		                	     return false;
		 		                   }
		 		                   else{
		 		                	    $.ajax({
		 		    		              url: "/updateSche",
		 		    		              data: {
		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
		 		    		                 "scheCron" : '0 0 0 1 ' + vm.eachMonthFl + '/' +vm.eachMonthSe +' ?',
		 		    		                 "scheWorkCycle" : vm.eachMonthFl + "월에 시작해서 " + vm.eachMonthSe + "월 1일 간격으로 작동이 시작됩니다.",
		 		    		                 "scheCode":vm.scheduelInfo.scheCode,
		 		    		              },
		 		    		              type: 'post',
		 		    		              success: function () {
		 		    		            	swal({
			  					                title: "스케줄 수정 완료 " ,
			  				                    type: 'success',
			  				                    confirmButtonColor: '#3085d6',
			  				                    confirmButtonText: '확인',
			  				                    confirmButtonClass: 'btn',
			  				                    allowOutsideClick:false,
			  							        allowEscapeKey:false,
			  								}).then(function(isConfirm){
			  									if(isConfirm){
			  										location.href = "/scheduleList";
			  									}
			  								}).catch(swal.noop);
		 		    		              },
		 		    		              error: function () {
		 		    		             	swal({
			  		  			                title: "스케줄 수정 실패",
			  		  		                    type: 'error',
			  		  		                    confirmButtonColor: '#3085d6',
			  		  		                    confirmButtonText: '확인',
			  		  		                    confirmButtonClass: 'btn',
		 		  							})
		 		    		              }
		 		    		           })
		 		                   }
		 		                },
		 		                error: function () {
		 		                	swal({
				  			         title: "스케줄 수정 실패",
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
         	}
         },
      },
      filters: {
         
      },
      watch: {
         teamSeqList : function (sdsd){
             console.log(sdsd);
          }
       },
      mounted: function () {
         var vm = this;
         vm.scheduleLogSelect();
         vm.selectScheRowCount();
         vm.selectScheList();
			this.$refs.table.$on('change', function(page){
				if (vm.pagingInfo.currentPage != page) {
					vm.pagingInfo.currentPage = page;
					vm.selectScheList();
				}
			});
      },
   });
   
   $(document).ready(function(){
	   $(".direct").hide();
	   $("#updateEach").hide();
	   		
	   		//페이지 로드 시 직접입력 SELECT BOX 값 주기
		    for(var i=0; i<60; i++){
				$("#updateSeconds").append("<option>"+i+"</option>");
			}
		    
		    for(var i=0; i<60; i++){
				$("#updateMinutes").append("<option>"+i+"</option>");
			}
		    
		    for(var i=0; i<24; i++){
				$("#updateHours").append("<option>"+i+"</option>");
			}
		    
		    for(var i=1; i<32; i++){
				$("#updateDay").append("<option>"+i+"</option>");
			}
		    
		    for(var i=1; i<13; i++){
				$("#updateMonths").append("<option>"+i+"</option>");
			}
		    
		    for(var i=2018; i<2100; i++){
				$("#updateYear").append("<option>"+i+"</option>");
			}
		    
		    // SELECT BOX 직접입력 시 Input 태그 활성화 
		    $('#updateSeconds').change(function() {
		    	if($("#updateSeconds").children('option:selected').text() == "직접입력"){
					$(".seconds").css("display","");
				    $("#updateSeconds").css("display","none");
				}
		    });
		    $('#updateMinutes').change(function() {
		    	if($("#updateMinutes").children('option:selected').text() == "직접입력"){
					$(".minutes").css("display","");
				    $("#updateMinutes").css("display","none");
				}
		    });
		    $('#updateHours').change(function() {
		    	if($("#updateHours").children('option:selected').text() == "직접입력"){
		    		
					$(".hours").css("display","");
				    $("#updateHours").css("display","none");
				}
		    });
		    $('#updateDay').change(function() {
		    	if($("#updateDay").children('option:selected').text() == "직접입력"){
		    		
					$(".day").css("display","");
				    $("#updateDay").css("display","none");
				}
		    });
		    $('#updateMonths').change(function() {
		    	if($("#updateMonths").children('option:selected').text() == "직접입력"){
		    		
					$(".months").css("display","");
				    $("#updateMonths").css("display","none");
				}
		    });
		    $('#updateYear').change(function() {
		    	if($("#updateYear").children('option:selected').text() == "직접입력"){
		    		
					$(".year").css("display","");
				    $("#updateYear").css("display","none");
				}
		    });
		  
	   		$('#updateCron').change(function() {
	   			
	   			if($(this).children('option:selected').text() == "작업선택"){
	   				 $("#updateDirect").show();
	   			     $("#updateEach").hide();
	   			     $(".direct").hide();
	   			}
	   			
				if($(this).children('option:selected').text() == "일시적지정"){
					$("#updateDirect").show();
					$("#updateEach").hide();
					$(".direct").show();
					 
					//직접입력 INPUT 태그 숨기기
					$(".seconds").css("display","none");
					$(".minutes").css("display","none");
					$(".hours").css("display","none");
					$(".day").css("display","none");
					$(".months").css("display","none");
					$(".year").css("display","none");
					 
					$("#updateSeconds").css("display","");
					$("#updateMinutes").css("display","");
					$("#updateHours").css("display","");
					$("#updateDay").css("display","");
					$("#updateMonths").css("display","");
					$("#updateYear").css("display","");
					 
				}
				if($(this).children('option:selected').text() == "증분지정"){
					$("#updateDirect").hide();
					$("#updateEach").show();
					
					//범위 SELECT BOX 비활성화
					$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").hide(); 
					$(".eachDay").hide(); 
					$(".eachMonth").hide();
					
					//범위 SELECT BOX 초기화 
					$(".eachSecondsFl").val('');
					$(".eachSecondsSe").val('');
					$(".eachMinutesFl").val('');
					$(".eachMinutesSe").val('');
					$(".eachHoursFl").val('');
					$(".eachHoursSe").val('');
					$(".eachDayFl").val('');
					$(".eachDaySe").val('');
					$(".eachMonthFl").val('');
					$(".eachMonthSe").val('');
					
					//SELECT BOX 범위지정 초기화
					$("#updateEachSeconds option:eq(0)").prop("selected", true);
					$("#updateEachMinutes option:eq(0)").prop("selected", true);
					$("#updateEachHours option:eq(0)").prop("selected", true);
					$("#updateEachDay option:eq(0)").prop("selected", true);
					$("#updateEachMonth option:eq(0)").prop("selected", true);
					
					//범위 SELECT BOX 제거 
					$("#updateEachSeconds").removeAttr("disabled");
					$("#updateEachMinutes").removeAttr("disabled");
		   			$("#updateEachHours").removeAttr("disabled");
		   			$("#updateEachDay").removeAttr("disabled");
		   			$("#updateEachMonth").removeAttr("disabled");
				}
				
		});
	   		
	   	$('#updateEachSeconds').change(function() {
	   		if($(this).children('option:selected').text() == "범위지정"){
	   			//초 입력 SELECT BOX 숨기기
	   			$(".eachSeconds").hide();
	   			
	   			//초 제외 SELECT BOX 활성화 
	   		 	$("#updateEachMinutes").removeAttr("disabled");
	   			$("#updateEachHours").removeAttr("disabled");
	   			$("#updateEachDay").removeAttr("disabled");
	   			$("#updateEachMonth").removeAttr("disabled");
	   		
	   		}
	   		if($(this).children('option:selected').text() == "매초마다"){
	   			//초 입력 SELECT BOX 보이기
	   			$(".eachSeconds").show();
	   			
	   			//초 입력 SELECT BOX 제외 숨기기
	   			$(".eachMinutes").hide(); 
				$(".eachHours").hide(); 
				$(".eachDay").hide(); 
				$(".eachMonth").hide(); 
				
				//초 제외 SELECT BOX 범위지정 값으로 초기화 
				$("#updateEachMinutes option:eq(0)").prop("selected", true);
				$("#updateEachHours option:eq(0)").prop("selected", true);
				$("#updateEachDay option:eq(0)").prop("selected", true);
				$("#updateEachMonth option:eq(0)").prop("selected", true);
				
				//초 제외 SELECT BOX 비활성화
				$("#updateEachMinutes").attr("disabled", "disabled");
				$("#updateEachHours").attr("disabled", "disabled");
				$("#updateEachDay").attr("disabled", "disabled");
				$("#updateEachMonth").attr("disabled", "disabled");
				
				//입력 SELECT BOX 값 주기
				for(var i=0; i<60; i++){
					$(".eachSecondsFl").append("<option>"+i+"</option>");
					$(".eachSecondsSe").append("<option>"+i+"</option>");
				}
	   		}
	   	});
		$('#updateEachMinutes').change(function() {
	   		if($(this).children('option:selected').text() == "범위지정"){
	   			$(".eachMinutes").hide();
	   			
	   			$("#updateEachSeconds").removeAttr("disabled");
	   			$("#updateEachHours").removeAttr("disabled");
	   			$("#updateEachDay").removeAttr("disabled");
	   			$("#updateEachMonth").removeAttr("disabled");
	   		}
	   		if($(this).children('option:selected').text() == "매분마다"){
	   			$(".eachMinutes").show();
	   			$(".eachSeconds").hide();
	   			$(".eachHours").hide(); 
				$(".eachDay").hide(); 
				$(".eachMonth").hide(); 
				
				$("#updateEachSeconds option:eq(0)").prop("selected", true);
				$("#updateEachHours option:eq(0)").prop("selected", true);
				$("#updateEachDay option:eq(0)").prop("selected", true);
				$("#updateEachMonth option:eq(0)").prop("selected", true);
				
				$("#updateEachSeconds").attr("disabled", "disabled");
				$("#updateEachHours").attr("disabled", "disabled");
				$("#updateEachDay").attr("disabled", "disabled");
				$("#updateEachMonth").attr("disabled", "disabled");
				
				for(var i=0; i<60; i++){
					$(".eachMinutesFl").append("<option>"+i+"</option>");
					$(".eachMinutesSe").append("<option>"+i+"</option>");
				}
	   		}
	   	});
		$('#updateEachHours').change(function() {
	   		if($(this).children('option:selected').text() == "범위지정"){
	   			$(".eachHours").hide();
	   			
	   			$("#updateEachSeconds").removeAttr("disabled");
	   			$("#updateEachMinutes").removeAttr("disabled");
	   			$("#updateEachDay").removeAttr("disabled");
	   			$("#updateEachMonth").removeAttr("disabled");
	   		}
	   		if($(this).children('option:selected').text() == "매시간마다"){
	   			$(".eachSeconds").hide();
				$(".eachMinutes").hide(); 
				$(".eachHours").show(); 
				$(".eachDay").hide(); 
				$(".eachMonth").hide(); 
				
				$("#updateEachSeconds option:eq(0)").prop("selected", true);
				$("#updateEachMinutes option:eq(0)").prop("selected", true);
				$("#updateEachDay option:eq(0)").prop("selected", true);
				$("#updateEachMonth option:eq(0)").prop("selected", true);
				
				$("#updateEachSeconds").attr("disabled", "disabled");
				$("#updateEachMinutes").attr("disabled", "disabled");
				$("#updateEachDay").attr("disabled", "disabled");
				$("#updateEachMonth").attr("disabled", "disabled");
				
				for(var i=0; i<60; i++){
					$(".eachHoursFl").append("<option>"+i+"</option>");
					$(".eachHoursSe").append("<option>"+i+"</option>");
				}
	   		}
	   	});
		$('#updateEachDay').change(function() {
	   		if($(this).children('option:selected').text() == "범위지정"){
	   			$(".eachDay").hide();
	   			
	   			$("#updateEachSeconds").removeAttr("disabled");
	   			$("#updateEachMinutes").removeAttr("disabled");
	   			$("#updateEachHours").removeAttr("disabled");
	   			$("#updateEachMonth").removeAttr("disabled");
	   		}
	   		if($(this).children('option:selected').text() == "매일마다"){
	   			$(".eachSeconds").hide();
				$(".eachMinutes").hide(); 
				$(".eachHours").hide(); 
				$(".eachDay").show(); 
				$(".eachMonth").hide(); 
				
				$("#updateEachSeconds option:eq(0)").prop("selected", true);
				$("#updateEachMinutes option:eq(0)").prop("selected", true);
				$("#updateEachHours option:eq(0)").prop("selected", true);
				$("#updateEachMonth option:eq(0)").prop("selected", true);
				
				$("#updateEachSeconds").attr("disabled", "disabled");
				$("#updateEachMinutes").attr("disabled", "disabled");
				$("#updateEachHours").attr("disabled", "disabled");
				$("#updateEachMonth").attr("disabled", "disabled");
				
				for(var i=1; i<32; i++){
					$(".eachDayFl").append("<option>"+i+"</option>");
					$(".eachDaySe").append("<option>"+i+"</option>");
				}
	   		}
	   	});
		$('#updateEachMonth').change(function() {
	   		if($(this).children('option:selected').text() == "범위지정"){
	   			$(".eachMonth").hide();
	   			
	   			$("#updateEachSeconds").removeAttr("disabled");
	   			$("#updateEachMinutes").removeAttr("disabled");
	   			$("#updateEachHours").removeAttr("disabled");
	   			$("#updateEachDay").removeAttr("disabled");
	   		}
	   		if($(this).children('option:selected').text() == "매월마다"){
	   			$(".eachSeconds").hide();
				$(".eachMinutes").hide(); 
				$(".eachHours").hide(); 
				$(".eachDay").hide(); 
				$(".eachMonth").show(); 
				
				$("#updateEachSeconds option:eq(0)").prop("selected", true);
				$("#updateEachMinutes option:eq(0)").prop("selected", true);
				$("#updateEachHours option:eq(0)").prop("selected", true);
				$("#updateEachDay option:eq(0)").prop("selected", true);
				
				$("#updateEachSeconds").attr("disabled", "disabled");
				$("#updateEachMinutes").attr("disabled", "disabled");
				$("#updateEachHours").attr("disabled", "disabled");
				$("#updateEachDay").attr("disabled", "disabled");
				
				for(var i=1; i<13; i++){
					$(".eachMonthFl").append("<option>"+i+"</option>");
					$(".eachMonthSe").append("<option>"+i+"</option>");
				}
	   		}
	   	});
	});
   
</script>