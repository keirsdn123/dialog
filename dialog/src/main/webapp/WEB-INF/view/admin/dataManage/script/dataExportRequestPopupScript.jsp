<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<script>
var vm = new Vue({
      el:"#dataExport" ,
      data: {
    	  selectApprovalVizRequestList:[],
    	  selectApprovalDaumRequestList : [],	//다음뉴스 수집 요청 조회 관리자 리스트
    	  selectApprovalActRequestList : [],	//기타 수집 요청 조회 관리자 리스트
    	  selectApprovalRssRequestList : [],   //rss뉴스 반출 요청 관리자 리스트
      	  dataCollectionInfo : {},
      	  dataExportInfo : {},
      	  selectScheList : [],
      	  scheCron : '',
      	  scheWorkTitle : '',
      	  devSourceTitle : 'RSS 뉴스 모듈 ',
      	  seconds :'',
    	  minutes :'',
    	  hours :'',
    	  day :'',  
    	  month :'',
    	  year : '',
      	  effectiveness : 0,
      	  code : '',
      	  devSourceFilePath: '',
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
     	  pagingInfo: {
             currentPage: 1,
             records: 0,
             perPage: 10,
          },
      	  
      },
      methods: {
    	//다음 뉴스 클래스 폴더 절대경로 조회 
    	selectDaumNewsFormalFilePath: function () {
    		var vm = this;
    		$.ajax({
    			url: '/selectDaumNewsFormalFilePath',
    			data: {
    			},
    			type: 'post',
    			success: function (list) {
    				vm.devSourceFilePath = list;
    			},
    			error: function () {
//     				alert("에러");
    			}
    		})
    	}, 
      //RSS 뉴스 데이터 반출 요청 관리자 조회
		selectApprovalRssScheRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalRssScheRequest',
				data: {
				},
				type: 'post',
				success: function (list) {
					console.log(list);  
					vm.selectApprovalRssRequestList = list;
				},
				error: function () {
// 					alert("에러");
				}
			})
		},
		
		//데이터 반출 요청 상세조회 
		exportInfo : function (seq,datasetName, index){
			var vm = this;
			$.ajax({
				url: '/infoDataExport?dataExportRequestCode='+seq,
				data: {
				},
				type: 'post',
				success: function (list) {
					vm.dataExportInfo = list;
					document.getElementById("exportKeword"+index).innerHTML = vm.dataExportInfo.exportCollectWord;
					document.getElementById("exportRequestDate"+index).innerHTML = vm.dataExportInfo.exportCollectDate;
					document.getElementById("exportCollectionDate"+index).innerHTML = vm.dataExportInfo.exportCollectStartDate +"~" + vm.dataExportInfo.exportCollectEndDate;
					var con = document.getElementById("exportTab"+index);
					  if(con.style.display=='none'){
					        con.style.display = 'block';
					    	vm.effectiveness = 1;
					    	
					    	vm.scheWorkTitle = datasetName;
					  }else{
					        con.style.display = 'none';
					    	vm.effectiveness = 0;
					    	
					    	vm.scheWorkTitle = '';
					  }
					  if($('#exportButton'+index).text() == '▼'){
						  $('#exportButton'+index).text('▲');
					  }
					  else {
						  $('#exportButton'+index).text('▼');
					  }
					
				},
				error: function() {
// 					alert("에러");
				}
			})
			
		},
		
	    //스케줄 목록조회
        selectScheLists : function(){
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
                 vm.selectScheList = list;
              },
              
              error : function(){
//                  alert("에러");
              }
           })
        },
        
        //스케줄 등록
        scheduleInsert: function () {
            var textEffectiveness = /^[0-9]*$/; //숫자만 입력 허용 정규식
         	
            var vm = this;
 	           if($('#exportCron').children('option:selected').text() == "작업선택"){
 	        	$("#exportCron").focus();   
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
 			                title: "데이터반출요청 목록을 선택해주십시오.",
 		                    type: 'error',
 		                    confirmButtonColor: '#3085d6',
 		                    confirmButtonText: '확인',
 		                    confirmButtonClass: 'btn',
 				})
 	            return false;
 	           }
 	           
 	           //직접입력 유효성 검사
 	           if($('#exportCron').children('option:selected').text() == "일시적지정"){    
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
 	           	if($('#exportCron').children('option:selected').text() == "증분지정"){
 	           		

 	           		if($('#dataExportEachSeconds').children('option:selected').text() == "범위지정" && $('#dataExportEachMinutes').children('option:selected').text() == "범위지정" && $('#dataExportEachHours').children('option:selected').text() == "범위지정" && $('#dataExportEachDay').children('option:selected').text() == "범위지정" && $('#dataExportEachMonth').children('option:selected').text() == "범위지정" ){
 	           			swal({
 			                title: "범위를 지정해주십시오.",
 		                    type: 'error',
 		                    confirmButtonColor: '#3085d6',
 		                    confirmButtonText: '확인',
 		                    confirmButtonClass: 'btn',
 						})
 			            return false;
 	           		}
 	           		
 	           	 	if($('#dataExportEachSeconds').children('option:selected').text() == "매초마다"){
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
 		           
 	           	 	if($('#dataExportEachMinutes').children('option:selected').text() == "매분마다"){
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
 		           
 		           
 	           	    if($('#dataExportEachHours').children('option:selected').text() == "매시간마다"){
 		           
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
 	           	    
 	           	 	if($('#dataExportEachDay').children('option:selected').text() == "매일마다"){
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
 	           	 	
 	           	 	if($('#dataExportEachMonth').children('option:selected').text() == "매월마다"){
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
 	         if($('#exportCron').children('option:selected').text() == "일시적지정"){
         	    swal({
         	    	title: "스케줄을 등록하시겠습니까?",
         	    	text: vm.year + "년도 " + vm.month + "월 " + vm.day + "일 " + vm.hours + "시 " + vm.minutes + "분 " + vm.seconds + "초에 작동이 시작됩니다.",
   					type: 'question',
    			        showCancelButton: true,
    			        confirmButtonColor: '#3085d6',
    			        cancelButtonColor: '#d33',
    			        confirmButtonText: '등록하기',
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
   		                	      url: "/dataExportinsertSche",
	    			              data: {
	    			                 "scheWorkTitle" : vm.scheWorkTitle,
	    			                 "scheCron" : vm.seconds + ' ' +vm.minutes +' '+ vm.hours +' '+ vm.day +' '+ vm.month +' ?'+ vm.year,
	    			                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
	    			                 "scheWorkCycle" : vm.year + "년도 " + vm.month + "월 " + vm.day + "일 " + vm.hours + "시 " + vm.minutes + "분 " + vm.seconds + "초 ",
	    			                 "scheType" : 'RSS 뉴스 반출',
	    			              },
   		    		              type: 'post',
   		    		              success: function () {
   		    		            	swal({
 	  					                title: "스케줄 등록 완료 " ,
 	  				                    type: 'success',
 	  				                    confirmButtonColor: '#3085d6',
 	  				                    confirmButtonText: '확인',
 	  				                    confirmButtonClass: 'btn',
 	  				                    allowOutsideClick:false,
 	  							        allowEscapeKey:false,
 	  								}).then(function(isConfirm){
 	  									if(isConfirm){
 	  										location.href = "/myData/dataApprovalManagement";
 	  									}
 	  								}).catch(swal.noop);
   		    		              },
   		    		              error: function () {
   		    		             	swal({
 	  		  			                title: "스케줄 등록 실패",
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
 		  			         title: "스케줄 등록 실패",
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
             	if($('#exportCron').children('option:selected').text() == "증분지정"){
             		
             		if($('#dataExportEachSeconds').children('option:selected').text() == "매초마다"){
             			swal({
 		       	    		title: "스케줄을 등록하시겠습니까?",
 				       	   	text: vm.eachSecondsFl + "초에 시작해서 " + vm.eachSecondsSe + "초 간격으로 작동이 시작됩니다.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '등록하기',
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
 		 		    		              url: "/dataExportinsertSche",
 		 		    		              data: {
 		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
 		 		    		                 "scheCron" : vm.eachSecondsFl + '/' +vm.eachSecondsSe +' * * * * ?',
 		 		    		                 "scheWorkCycle" : vm.eachSecondsFl + "초에 시작해서 " + vm.eachSecondsSe + "초 간격으로 작동이 시작됩니다.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
		 		    		                 "scheType" : 'RSS 뉴스 반출',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "스케줄 등록 완료 " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: '확인',
 			  				                    confirmButtonClass: 'btn',
 			  				                    allowOutsideClick:false,
 			  							        allowEscapeKey:false,
 			  								}).then(function(isConfirm){
 			  									if(isConfirm){
 			  										location.href = "/myData/dataApprovalManagement";
 			  									}
 			  								}).catch(swal.noop);
 		 		    		              },
 		 		    		              error: function () {
 		 		    		             	swal({
 			  		  			                title: "스케줄 등록 실패",
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
 				  			         title: "스케줄 등록 실패",
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
             		
             		if($('#dataExportEachMinutes').children('option:selected').text() == "매분마다"){
             			swal({
 		       	    		title: "스케줄을 등록하시겠습니까?",
 				       	   	text: vm.eachMinutesFl + "분에 시작해서 " + vm.eachMinutesSe + "분 간격으로 작동이 시작됩니다.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '등록하기',
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
 		 		    		              url: "/dataExportinsertSche",
 		 		    		              data: {
 		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
 		 		    		                 "scheCron" : "0 " + vm.eachMinutesFl + '/' +vm.eachMinutesSe +' * * * ?',
 		 		    		                 "scheWorkCycle" : vm.eachMinutesFl + "분에 시작해서 " + vm.eachMinutesSe + "분 간격으로 작동이 시작됩니다.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
		 		    		                 "scheType" : 'RSS 뉴스 반출',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "스케줄 등록 완료 " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: '확인',
 			  				                    confirmButtonClass: 'btn',
 			  				                    allowOutsideClick:false,
 			  							        allowEscapeKey:false,
 			  								}).then(function(isConfirm){
 			  									if(isConfirm){
 			  										location.href = "/myData/dataApprovalManagement";
 			  									}
 			  								}).catch(swal.noop);
 		 		    		              },
 		 		    		              error: function () {
 		 		    		             	swal({
 			  		  			                title: "스케줄 등록 실패",
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
 				  			         title: "스케줄 등록 실패",
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
             		
             		 if($('#dataExportEachHours').children('option:selected').text() == "매시간마다"){
             			swal({
 		       	    		title: "스케줄을 등록하시겠습니까?",
 				       	   	text: vm.eachHoursFl + "시에 시작해서 " + vm.eachHoursSe + "시간 간격으로 작동이 시작됩니다.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '등록하기',
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
 		 		    		              url: "/dataExportinsertSche",
 		 		    		              data: {
 		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
 		 		    		                 "scheCron" : "0 0 " + vm.eachHoursFl + '/' +vm.eachHoursSe +' * * ?',
 		 		    		                 "scheWorkCycle" : vm.eachHoursFl + "시에 시작해서 " + vm.eachHoursSe + "시간 간격으로 작동이 시작됩니다.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
		 		    		                 "scheType" : 'RSS 뉴스 반출',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "스케줄 등록 완료 " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: '확인',
 			  				                    confirmButtonClass: 'btn',
 			  				                    allowOutsideClick:false,
 			  							        allowEscapeKey:false,
 			  								}).then(function(isConfirm){
 			  									if(isConfirm){
 			  										location.href = "/myData/dataApprovalManagement";
 			  									}
 			  								}).catch(swal.noop);
 		 		    		              },
 		 		    		              error: function () {
 		 		    		             	swal({
 			  		  			                title: "스케줄 등록 실패",
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
 				  			         title: "스케줄 등록 실패",
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
             		
             		if($('#dataExportEachDay').children('option:selected').text() == "매일마다"){
             			swal({
 		       	    		title: "스케줄을 등록하시겠습니까?",
 				       	   	text: vm.eachDayFl + "일에 시작해서 " + vm.eachDaySe + "일 간격으로 작동이 시작됩니다.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '등록하기',
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
 		 		    		              url: "/dataExportinsertSche",
 		 		    		              data: {
 		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
 		 		    		                 "scheCron" : "0 0 0 " + vm.eachDayFl + '/' +vm.eachDaySe +' * ?',
 		 		    		                 "scheWorkCycle" : vm.eachDayFl + "일에 시작해서 " + vm.eachDaySe + "일 간격으로 작동이 시작됩니다.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
		 		    		                 "scheType" : 'RSS 뉴스 반출',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "스케줄 등록 완료 " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: '확인',
 			  				                    confirmButtonClass: 'btn',
 			  				                    allowOutsideClick:false,
 			  							        allowEscapeKey:false,
 			  								}).then(function(isConfirm){
 			  									if(isConfirm){
 			  										location.href = "/myData/dataApprovalManagement";
 			  									}
 			  								}).catch(swal.noop);
 		 		    		              },
 		 		    		              error: function () {
 		 		    		             	swal({
 			  		  			                title: "스케줄 등록 실패",
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
 				  			         title: "스케줄 등록 실패",
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
             		
             		if($('#dataExportEachMonth').children('option:selected').text() == "매월마다"){
             			swal({
 		       	    		title: "스케줄을 등록하시겠습니까?",
 				       	   	text: vm.eachMonthFl + "월에 시작해서 " + vm.eachMonthSe + "월 1일 간격으로 작동이 시작됩니다.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '등록하기',
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
 		 		    		              url: "/dataExportinsertSche",
 		 		    		              data: {
 		 		    		                 "scheWorkTitle" : vm.scheWorkTitle,
 		 		    		                 "scheCron" : '0 0 0 1 ' + vm.eachMonthFl + '/' +vm.eachMonthSe +' ?',
 		 		    		                 "scheWorkCycle" : vm.eachMonthFl + "월에 시작해서 " + vm.eachMonthSe + "월 1일 간격으로 작동이 시작됩니다.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
 		 		    		                 "scheType" : 'RSS 뉴스 반출',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "스케줄 등록 완료 " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: '확인',
 			  				                    confirmButtonClass: 'btn',
 			  				                    allowOutsideClick:false,
 			  							        allowEscapeKey:false,
 			  								}).then(function(isConfirm){
 			  									if(isConfirm){
 			  										location.href = "/myData/dataApprovalManagement";
 			  									}
 			  								}).catch(swal.noop);
 		 		    		              },
 		 		    		              error: function () {
 		 		    		             	swal({
 			  		  			                title: "스케줄 등록 실패",
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
 				  			         title: "스케줄 등록 실패",
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
       },
       mounted: function () {
     	  var vm = this;
     	  vm.selectApprovalRssScheRequest();
     	  vm.selectScheLists();
     	  vm.selectDaumNewsFormalFilePath();
       },
    });
   
	$(document).ready(function(){
		   $(".direct").hide();
		   $("#dataExportEach").hide();
		   		
		   		//페이지 로드 시 직접입력 SELECT BOX 값 주기
			    for(var i=0; i<60; i++){
					$("#dataExportSeconds").append("<option>"+i+"</option>");
				}
			    
			    for(var i=0; i<60; i++){
					$("#dataExportMinutes").append("<option>"+i+"</option>");
				}
			    
			    for(var i=0; i<24; i++){
					$("#dataExporttHours").append("<option>"+i+"</option>");
				}
			    
			    for(var i=1; i<32; i++){
					$("#dataExportDay").append("<option>"+i+"</option>");
				}
			    
			    for(var i=1; i<13; i++){
					$("#dataExportMonths").append("<option>"+i+"</option>");
				}
			    
			    for(var i=2018; i<2100; i++){
					$("#dataExportYear").append("<option>"+i+"</option>");
				}
			    
			    // SELECT BOX 직접입력 시 Input 태그 활성화 
			    $('#dataExportSeconds').change(function() {
			    	if($("#dataExportSeconds").children('option:selected').text() == "직접입력"){
						$(".seconds").css("display","");
					    $("#dataExportSeconds").css("display","none");
					}
			    });
			    $('#dataExportMinutes').change(function() {
			    	if($("#dataExportMinutes").children('option:selected').text() == "직접입력"){
						$(".minutes").css("display","");
					    $("#dataExportMinutes").css("display","none");
					}
			    });
			    $('#dataExporttHours').change(function() {
			    	if($("#dataExporttHours").children('option:selected').text() == "직접입력"){
			    		
						$(".hours").css("display","");
					    $("#dataExporttHours").css("display","none");
					}
			    });
			    $('#dataExportDay').change(function() {
			    	if($("#dataExportDay").children('option:selected').text() == "직접입력"){
			    		
						$(".day").css("display","");
					    $("#dataExportDay").css("display","none");
					}
			    });
			    $('#dataExportMonths').change(function() {
			    	if($("#dataExportMonths").children('option:selected').text() == "직접입력"){
			    		
						$(".months").css("display","");
					    $("#dataExportMonths").css("display","none");
					}
			    });
			    $('#dataExportYear').change(function() {
			    	if($("#dataExportYear").children('option:selected').text() == "직접입력"){
			    		
						$(".year").css("display","");
					    $("#dataExportYear").css("display","none");
					}
			    });
			  
		   		$('#exportCron').change(function() {
		   			
		   			if($(this).children('option:selected').text() == "작업선택"){
		   				 $("#dataExportDirect").show();
		   			     $("#dataExportEach").hide();
		   			     $(".direct").hide();
		   			}
		   			
					if($(this).children('option:selected').text() == "일시적지정"){
						$("#dataExportDirect").show();
						$("#dataExportEach").hide();
						$(".direct").show();
						 
						//직접입력 INPUT 태그 숨기기
						$(".seconds").css("display","none");
						$(".minutes").css("display","none");
						$(".hours").css("display","none");
						$(".day").css("display","none");
						$(".months").css("display","none");
						$(".year").css("display","none");
						 
						$("#dataExportSeconds").css("display","");
						$("#dataExportMinutes").css("display","");
						$("#dataExporttHours").css("display","");
						$("#dataExportDay").css("display","");
						$("#dataExportMonths").css("display","");
						$("#dataExportYear").css("display","");
						 
					}
					if($(this).children('option:selected').text() == "증분지정"){
						$("#dataExportDirect").hide();
						$("#dataExportEach").show();
						
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
						$("#dataExportEachSeconds option:eq(0)").prop("selected", true);
						$("#dataExportEachMinutes option:eq(0)").prop("selected", true);
						$("#dataExportEachHours option:eq(0)").prop("selected", true);
						$("#dataExportEachDay option:eq(0)").prop("selected", true);
						$("#dataExportEachMonth option:eq(0)").prop("selected", true);
						
						//범위 SELECT BOX 제거 
						$("#dataExportEachSeconds").removeAttr("disabled");
						$("#dataExportEachMinutes").removeAttr("disabled");
			   			$("#dataExportEachHours").removeAttr("disabled");
			   			$("#dataExportEachDay").removeAttr("disabled");
			   			$("#dataExportEachMonth").removeAttr("disabled");
					}
					
			});
		   		
		   	$('#dataExportEachSeconds').change(function() {
		   		if($(this).children('option:selected').text() == "범위지정"){
		   			//초 입력 SELECT BOX 숨기기
		   			$(".eachSeconds").hide();
		   			
		   			//초 제외 SELECT BOX 활성화 
		   		 	$("#dataExportEachMinutes").removeAttr("disabled");
		   			$("#dataExportEachHours").removeAttr("disabled");
		   			$("#dataExportEachDay").removeAttr("disabled");
		   			$("#dataExportEachMonth").removeAttr("disabled");
		   		
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
					$("#dataExportEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportEachHours option:eq(0)").prop("selected", true);
					$("#dataExportEachDay option:eq(0)").prop("selected", true);
					$("#dataExportEachMonth option:eq(0)").prop("selected", true);
					
					//초 제외 SELECT BOX 비활성화
					$("#dataExportEachMinutes").attr("disabled", "disabled");
					$("#dataExportEachHours").attr("disabled", "disabled");
					$("#dataExportEachDay").attr("disabled", "disabled");
					$("#dataExportEachMonth").attr("disabled", "disabled");
					
					//입력 SELECT BOX 값 주기
					for(var i=0; i<60; i++){
						$(".eachSecondsFl").append("<option>"+i+"</option>");
						$(".eachSecondsSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportEachMinutes').change(function() {
		   		if($(this).children('option:selected').text() == "범위지정"){
		   			$(".eachMinutes").hide();
		   			
		   			$("#dataExportEachSeconds").removeAttr("disabled");
		   			$("#dataExportEachHours").removeAttr("disabled");
		   			$("#dataExportEachDay").removeAttr("disabled");
		   			$("#dataExportEachMonth").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "매분마다"){
		   			$(".eachMinutes").show();
		   			$(".eachSeconds").hide();
		   			$(".eachHours").hide(); 
					$(".eachDay").hide(); 
					$(".eachMonth").hide(); 
					
					$("#dataExportEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportEachHours option:eq(0)").prop("selected", true);
					$("#dataExportEachDay option:eq(0)").prop("selected", true);
					$("#dataExportEachMonth option:eq(0)").prop("selected", true);
					
					$("#dataExportEachSeconds").attr("disabled", "disabled");
					$("#dataExportEachHours").attr("disabled", "disabled");
					$("#dataExportEachDay").attr("disabled", "disabled");
					$("#dataExportEachMonth").attr("disabled", "disabled");
					
					for(var i=0; i<60; i++){
						$(".eachMinutesFl").append("<option>"+i+"</option>");
						$(".eachMinutesSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportEachHours').change(function() {
		   		if($(this).children('option:selected').text() == "범위지정"){
		   			$(".eachHours").hide();
		   			
		   			$("#dataExportEachSeconds").removeAttr("disabled");
		   			$("#dataExportEachMinutes").removeAttr("disabled");
		   			$("#dataExportEachDay").removeAttr("disabled");
		   			$("#dataExportEachMonth").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "매시간마다"){
		   			$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").show(); 
					$(".eachDay").hide(); 
					$(".eachMonth").hide(); 
					
					$("#dataExportEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportEachDay option:eq(0)").prop("selected", true);
					$("#dataExportEachMonth option:eq(0)").prop("selected", true);
					
					$("#dataExportEachSeconds").attr("disabled", "disabled");
					$("#dataExportEachMinutes").attr("disabled", "disabled");
					$("#dataExportEachDay").attr("disabled", "disabled");
					$("#dataExportEachMonth").attr("disabled", "disabled");
					
					for(var i=0; i<60; i++){
						$(".eachHoursFl").append("<option>"+i+"</option>");
						$(".eachHoursSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportEachDay').change(function() {
		   		if($(this).children('option:selected').text() == "범위지정"){
		   			$(".eachDay").hide();
		   			
		   			$("#dataExportEachSeconds").removeAttr("disabled");
		   			$("#dataExportEachMinutes").removeAttr("disabled");
		   			$("#dataExportEachHours").removeAttr("disabled");
		   			$("#dataExportEachMonth").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "매일마다"){
		   			$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").hide(); 
					$(".eachDay").show(); 
					$(".eachMonth").hide(); 
					
					$("#dataExportEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportEachHours option:eq(0)").prop("selected", true);
					$("#dataExportEachMonth option:eq(0)").prop("selected", true);
					
					$("#dataExportEachSeconds").attr("disabled", "disabled");
					$("#dataExportEachMinutes").attr("disabled", "disabled");
					$("#dataExportEachHours").attr("disabled", "disabled");
					$("#dataExportEachMonth").attr("disabled", "disabled");
					
					for(var i=1; i<32; i++){
						$(".eachDayFl").append("<option>"+i+"</option>");
						$(".eachDaySe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportEachMonth').change(function() {
		   		if($(this).children('option:selected').text() == "범위지정"){
		   			$(".eachMonth").hide();
		   			
		   			$("#dataExportEachSeconds").removeAttr("disabled");
		   			$("#dataExportEachMinutes").removeAttr("disabled");
		   			$("#dataExportEachHours").removeAttr("disabled");
		   			$("#dataExportEachDay").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "매월마다"){
		   			$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").hide(); 
					$(".eachDay").hide(); 
					$(".eachMonth").show(); 
					
					$("#dataExportEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportEachHours option:eq(0)").prop("selected", true);
					$("#dataExportEachDay option:eq(0)").prop("selected", true);
					
					$("#dataExportEachSeconds").attr("disabled", "disabled");
					$("#dataExportEachMinutes").attr("disabled", "disabled");
					$("#dataExportEachHours").attr("disabled", "disabled");
					$("#dataExportEachDay").attr("disabled", "disabled");
					
					for(var i=1; i<13; i++){
						$(".eachMonthFl").append("<option>"+i+"</option>");
						$(".eachMonthSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
		});
   
   
   
   
   
   
   
   
   
</script>