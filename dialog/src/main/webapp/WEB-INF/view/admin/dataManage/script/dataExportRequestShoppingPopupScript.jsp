<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<script>
var vm = new Vue({
      el:"#dataExportShopping" ,
      data: {
    	  selectApprovalVizRequestList:[],
    	  selectApprovalDaumRequestList : [],	//�������� ���� ��û ��ȸ ������ ����Ʈ
    	  selectApprovalActRequestList : [],	//��Ÿ ���� ��û ��ȸ ������ ����Ʈ
    	  selectApprovalRssRequestList : [],   //rss���� ���� ��û ������ ����Ʈ
    	  selectApprovalShopRequestLists : [],   //���� ���� ��û ������ ����Ʈ
      	  dataCollectionInfo : {},
      	  dataExportInfo : {},
      	  selectScheList : [],
      	  scheCron : '',
      	  scheWorkTitle : '',
      	  devSourceTitle : '���̹� ���� ��� ',
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
      	  effectiveness : 0,
      	  code : '',
      	  devSourceFilePath : '',
      	  pagingInfo: {
              currentPage: 1,
              records: 0,
              perPage: 10,
          },
      	  
      },
      methods: {
    	//���� ���� Ŭ���� ���� ������ ��ȸ 
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
//       				alert("����");
      			}
      		})
      	},
    	 // ���� ������ ���� ��û ������ ��ȸ
         selectApprovalShopScheRequest: function () {
            var vm = this;
            $.ajax({
               url: '/selectApprovalShopScheRequest',
               data: {
               },
               type: 'post',
               success: function (list) {
            	  console.log(list);
                  vm.selectApprovalShopRequestLists = list;
               },
               error: function () {
//                   alert("����");
               }
            })
         },
		
	    //������ �����ȸ
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
//                  alert("����");
              }
           })
        },
        
    	//������ ���� ��û ����ȸ 
		exportInfo : function (seq,datasetName,index){
			var vm = this;
			$.ajax({
				url: '/infoDataExport?dataExportRequestCode='+seq,
				data: {
				},
				type: 'post',
				success: function (list) {
					vm.dataExportInfo = list;
					document.getElementById("exportKewordShopping"+index).innerHTML = vm.dataExportInfo.exportCollectWord;
					document.getElementById("exportRequestDateShopping"+index).innerHTML = vm.dataExportInfo.exportCollectDate;
					document.getElementById("exportCollectionDateShopping"+index).innerHTML = vm.dataExportInfo.exportCollectStartDate +"~" + vm.dataExportInfo.exportCollectEndDate;
					var con = document.getElementById("exportTabShopping"+index);
					  if(con.style.display=='none'){
					        con.style.display = 'block';
					    	vm.effectiveness = 1;
					    	console.log(datasetName);
					    	
					    	vm.scheWorkTitle = datasetName;
					    		
					  }else{
					        con.style.display = 'none';
					    	vm.effectiveness = 0;
					    	
					    	vm.scheWorkTitle = '';
					    	
					  }
					  if($('#exportButtonShopping'+index).text() == '��'){
						  $('#exportButtonShopping'+index).text('��');
					  }
					  else {
						  $('#exportButtonShopping'+index).text('��');
					  }
					  
				},
				error: function() {
// 					alert("����");
				}
			})
			
		},
		
		//������ ���
        scheduleInsert: function () {
            var textEffectiveness = /^[0-9]*$/; //���ڸ� �Է� ��� ���Խ�
         	
            var vm = this;
 	           if($('#exportShoppingCron').children('option:selected').text() == "�۾�����"){
 	        	$("#exportShoppingCron").focus();   
 	        	swal({
 		                title: "�۾��� �������ֽʽÿ�.",
 	                    type: 'error',
 	                    confirmButtonColor: '#3085d6',
 	                    confirmButtonText: 'Ȯ��',
 	                    confirmButtonClass: 'btn',
 				})
 	            return false;	
 	           }
 	           if(vm.effectiveness==0){
 	            swal({
 			                title: "�����͹����û ����� �������ֽʽÿ�.",
 		                    type: 'error',
 		                    confirmButtonColor: '#3085d6',
 		                    confirmButtonText: 'Ȯ��',
 		                    confirmButtonClass: 'btn',
 				})
 	            return false;
 	           }
 	           
 	           //�����Է� ��ȿ�� �˻�
 	           if($('#exportShoppingCron').children('option:selected').text() == "�Ͻ�������"){    
 		           if (vm.seconds <0 || vm.seconds > 59 || vm.seconds =='' || !textEffectiveness.test(vm.seconds)) {
 		          	 $(".seconds").focus();
 		          	 swal({
 				                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 			                    type: 'error',
 			                    confirmButtonColor: '#3085d6',
 			                    confirmButtonText: 'Ȯ��',
 			                    confirmButtonClass: 'btn',
 					 })
 		             return false;
 		           }
 		           if (vm.minutes <0 || vm.minutes > 59 || vm.minutes =='' || !textEffectiveness.test(vm.minutes)) {
 		             $(".minutes").focus();
 		             swal({
 				                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 			                    type: 'error',
 			                    confirmButtonColor: '#3085d6',
 			                    confirmButtonText: 'Ȯ��',
 			                    confirmButtonClass: 'btn',
 				     })
 		             return false;
 		           }
 		           if (vm.hours <0 || vm.hours > 23 || vm.hours =='' || !textEffectiveness.test(vm.hours)) {
 		             $(".hours").focus();
 		             swal({
 				                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 			                    type: 'error',
 			                    confirmButtonColor: '#3085d6',
 			                    confirmButtonText: 'Ȯ��',
 			                    confirmButtonClass: 'btn',
 					 })
 		             return false;
 		           }
 		           if (vm.day < 1|| vm.day > 31 || vm.day =='' || !textEffectiveness.test(vm.day)) {
 		             $(".day").focus();
 		             swal({
 				                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 			                    type: 'error',
 			                    confirmButtonColor: '#3085d6',
 			                    confirmButtonText: 'Ȯ��',
 			                    confirmButtonClass: 'btn',
 					 })
 		             return false;
 		           }
 			       if (vm.month < 1||vm.month > 12 || vm.month =='' || !textEffectiveness.test(vm.month)) {
 			         $(".months").focus();
 			         swal({
 					            title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 				                type: 'error',
 				                confirmButtonColor: '#3085d6',
 			     	            confirmButtonText: 'Ȯ��',
 				                confirmButtonClass: 'btn',
 				     })
 			         return false;
 			       }
 			       if (vm.year <= 2017 || vm.year > 2099 || vm.year =='' || !textEffectiveness.test(vm.year)) {
 			         $(".year").focus();
 			         swal({
 				  	            title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 				   	            type: 'error',
 				                confirmButtonColor: '#3085d6',
 				                confirmButtonText: 'Ȯ��',
 				                confirmButtonClass: 'btn',
 				     })
 			         return false;
 			       }
              	}
 	           
 	            //�������� ��ȿ�� �˻� 
 	           	if($('#exportShoppingCron').children('option:selected').text() == "��������"){
 	           		

 	           		if($('#dataExportShoppingEachSeconds').children('option:selected').text() == "��������" && $('#dataExportShoppingEachMinutes').children('option:selected').text() == "��������" && $('#dataExportShoppingEachHours').children('option:selected').text() == "��������" && $('#dataExportShoppingEachDay').children('option:selected').text() == "��������" && $('#dataExportShoppingEachMonth').children('option:selected').text() == "��������" ){
 	           			swal({
 			                title: "������ �������ֽʽÿ�.",
 		                    type: 'error',
 		                    confirmButtonColor: '#3085d6',
 		                    confirmButtonText: 'Ȯ��',
 		                    confirmButtonClass: 'btn',
 						})
 			            return false;
 	           		}
 	           		
 	           	 	if($('#dataExportShoppingEachSeconds').children('option:selected').text() == "���ʸ���"){
 			           if (vm.eachSecondsFl <0 || vm.eachSecondsFl > 59 || vm.eachSecondsFl =='') {
 			          	 $(".eachSecondsFl").focus();
 			          	 swal({
 					                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 				                    type: 'error',
 				                    confirmButtonColor: '#3085d6',
 				                    confirmButtonText: 'Ȯ��',
 				                    confirmButtonClass: 'btn',
 						 })
 			             return false;
 			           }
 			           if (vm.eachSecondsSe <0 || vm.eachSecondsSe > 59 || vm.eachSecondsSe =='') {
 				          	 $(".eachSecondsSe").focus();
 				          	 swal({
 						                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 					                    type: 'error',
 					                    confirmButtonColor: '#3085d6',
 					                    confirmButtonText: 'Ȯ��',
 					                    confirmButtonClass: 'btn',
 							 })
 				             return false;
 				       }
 	           	 	}
 		           
 	           	 	if($('#dataExportShoppingEachMinutes').children('option:selected').text() == "�źи���"){
 		           	 	if (vm.eachMinutesFl <0 || vm.eachMinutesFl > 59 || vm.eachMinutesFl =='') {
 			             	$(".eachMinutesFl").focus();
 			             	swal({
 					                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 				                    type: 'error',
 				                    confirmButtonColor: '#3085d6',
 				                    confirmButtonText: 'Ȯ��',
 				                    confirmButtonClass: 'btn',
 					     	})
 			             	return false;
 			           }
 			           if (vm.eachMinutesSe <0 || vm.eachMinutesSe > 59 || vm.eachMinutesSe =='') {
 				             $(".eachMinutesSe").focus();
 				             swal({
 						                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 					                    type: 'error',
 					                    confirmButtonColor: '#3085d6',
 					                    confirmButtonText: 'Ȯ��',
 					                    confirmButtonClass: 'btn',
 						     })
 				             return false;
 				       }
 	           	 	}
 		           
 		           
 	           	    if($('#dataExportShoppingEachHours').children('option:selected').text() == "�Žð�����"){
 		           
 			           if (vm.eachHoursFl <0 || vm.eachHoursFl > 23 || vm.eachHoursFl =='') {
 			             $(".eachHoursFl").focus();
 			             swal({
 					                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 				                    type: 'error',
 				                    confirmButtonColor: '#3085d6',
 				                    confirmButtonText: 'Ȯ��',
 				                    confirmButtonClass: 'btn',
 						 })
 			             return false;
 			           }
 			           if (vm.eachHoursSe <0 || vm.eachHoursSe > 23 || vm.eachHoursSe =='') {
 				             $(".eachHoursSe").focus();
 				             swal({
 						                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 					                    type: 'error',
 					                    confirmButtonColor: '#3085d6',
 					                    confirmButtonText: 'Ȯ��',
 					                    confirmButtonClass: 'btn',
 							 })
 				             return false;
 				       }
 	           	    }
 	           	    
 	           	 	if($('#dataExportShoppingEachDay').children('option:selected').text() == "���ϸ���"){
 			           if (vm.eachDayFl < 1|| vm.eachDayFl > 31 || vm.eachDayFl =='') {
 			             $(".eachDayFl").focus();
 			             swal({
 					                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 				                    type: 'error',
 				                    confirmButtonColor: '#3085d6',
 				                    confirmButtonText: 'Ȯ��',
 				                    confirmButtonClass: 'btn',
 						 })
 			             return false;
 			           }
 			           if (vm.eachDaySe < 1|| vm.eachDaySe > 31 || vm.eachDaySe =='') {
 				             $(".eachDaySe").focus();
 				             swal({
 						                title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 					                    type: 'error',
 					                    confirmButtonColor: '#3085d6',
 					                    confirmButtonText: 'Ȯ��',
 					                    confirmButtonClass: 'btn',
 							 })
 				             return false;
 				       }
 			        }
 	           	 	
 	           	 	if($('#dataExportShoppingEachMonth').children('option:selected').text() == "�ſ�����"){
 				       if (vm.eachMonthFl < 1||vm.eachMonthFl > 12 || vm.eachMonthFl =='') {
 				         $(".eachMonthFl").focus();
 				         swal({
 						            title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 					                type: 'error',
 					                confirmButtonColor: '#3085d6',
 				     	            confirmButtonText: 'Ȯ��',
 					                confirmButtonClass: 'btn',
 					     })
 				         return false;
 				       }
 				       if (vm.eachMonthSe < 1||vm.eachMonthSe > 12 || vm.eachMonthSe =='') {
 					         $(".eachMonthSe").focus();
 					         swal({
 							            title: "���� ��� ������ �ʰ��ϼ̽��ϴ�.",
 						                type: 'error',
 						                confirmButtonColor: '#3085d6',
 					     	            confirmButtonText: 'Ȯ��',
 						                confirmButtonClass: 'btn',
 						     })
 					         return false;
 					   }
 	           	 	}
 	           	 	
 			       
              	}
 	           	
 	         // �����Է� ������ ���
 	         if($('#exportShoppingCron').children('option:selected').text() == "�Ͻ�������"){
         	    swal({
         	    	title: "�������� ����Ͻðڽ��ϱ�?",
         	    	text: vm.year + "�⵵ " + vm.month + "�� " + vm.day + "�� " + vm.hours + "�� " + vm.minutes + "�� " + vm.seconds + "�ʿ� �۵��� ���۵˴ϴ�.",
   					type: 'question',
    			        showCancelButton: true,
    			        confirmButtonColor: '#3085d6',
    			        cancelButtonColor: '#d33',
    			        confirmButtonText: '����ϱ�',
    			        cancelButtonText: '���ư���',
    			        confirmButtonClass: 'btn',
    			        cancelButtonClass: 'btn btn-cencle',
    			        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
    			        allowEscapeKey:false, //esc ������ �� ������
         	     
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
 	  				                title: "������ �����ֱ� �ߺ�",
 	  			                    type: 'error',
 	  			                    confirmButtonColor: '#3085d6',
 	  			                    confirmButtonText: 'Ȯ��',
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
	    			                 "scheWorkCycle" : vm.year + "�⵵ " + vm.month + "�� " + vm.day + "�� " + vm.hours + "�� " + vm.minutes + "�� " + vm.seconds + "�� ",
	    			                 "scheType" : '���̹� ���� ����',
	    			              },
   		    		              type: 'post',
   		    		              success: function () {
   		    		            	swal({
 	  					                title: "������ ��� �Ϸ� " ,
 	  				                    type: 'success',
 	  				                    confirmButtonColor: '#3085d6',
 	  				                    confirmButtonText: 'Ȯ��',
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
 	  		  			                title: "������ ��� ����",
 	  		  		                    type: 'error',
 	  		  		                    confirmButtonColor: '#3085d6',
 	  		  		                    confirmButtonText: 'Ȯ��',
 	  		  		                    confirmButtonClass: 'btn',
   		  							})
   		    		              }
   		    		           })
   		                   }
   		                },
   		                error: function () {
   		                	swal({
 		  			         title: "������ ��� ����",
 		  		              type: 'error',
 		  		                  confirmButtonColor: '#3085d6',
 		  		                 confirmButtonText: 'Ȯ��',
 		  		                 confirmButtonClass: 'btn',
 		  					})
   		                }
   		             })
    					}
    				}).catch(swal.noop);
            		}
 	         
 				// �������� ������ ��� 
             	if($('#exportShoppingCron').children('option:selected').text() == "��������"){
             		
             		if($('#dataExportShoppingEachSeconds').children('option:selected').text() == "���ʸ���"){
             			swal({
 		       	    		title: "�������� ����Ͻðڽ��ϱ�?",
 				       	   	text: vm.eachSecondsFl + "�ʿ� �����ؼ� " + vm.eachSecondsSe + "�� �������� �۵��� ���۵˴ϴ�.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '����ϱ�',
 			  		    	cancelButtonText: '���ư���',
 			  			    confirmButtonClass: 'btn',
 			  			    cancelButtonClass: 'btn btn-cencle',
 			  		        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
 			  		        allowEscapeKey:false, //esc ������ �� ������
 	       	     
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
 			  				                title: "������ �����ֱ� �ߺ�",
 			  			                    type: 'error',
 			  			                    confirmButtonColor: '#3085d6',
 			  			                    confirmButtonText: 'Ȯ��',
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
 		 		    		                 "scheWorkCycle" : vm.eachSecondsFl + "�ʿ� �����ؼ� " + vm.eachSecondsSe + "�� �������� �۵��� ���۵˴ϴ�.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
 		 		    		                 "scheType" : '���̹� ���� ����',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "������ ��� �Ϸ� " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: 'Ȯ��',
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
 			  		  			                title: "������ ��� ����",
 			  		  		                    type: 'error',
 			  		  		                    confirmButtonColor: '#3085d6',
 			  		  		                    confirmButtonText: 'Ȯ��',
 			  		  		                    confirmButtonClass: 'btn',
 		 		  							})
 		 		    		              }
 		 		    		           })
 		 		                   }
 		 		                },
 		 		                error: function () {
 		 		                	swal({
 				  			         title: "������ ��� ����",
 				  		              type: 'error',
 				  		                  confirmButtonColor: '#3085d6',
 				  		                 confirmButtonText: 'Ȯ��',
 				  		                 confirmButtonClass: 'btn',
 				  					})
 		 		                }
 		 		             })
 		  					}
 		  				}).catch(swal.noop);
 	            		}
             		
             		if($('#dataExportShoppingEachMinutes').children('option:selected').text() == "�źи���"){
             			swal({
 		       	    		title: "�������� ����Ͻðڽ��ϱ�?",
 				       	   	text: vm.eachMinutesFl + "�п� �����ؼ� " + vm.eachMinutesSe + "�� �������� �۵��� ���۵˴ϴ�.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '����ϱ�',
 			  		    	cancelButtonText: '���ư���',
 			  			    confirmButtonClass: 'btn',
 			  			    cancelButtonClass: 'btn btn-cencle',
 			  		        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
 			  		        allowEscapeKey:false, //esc ������ �� ������
 	       	     
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
 			  				                title: "������ �����ֱ� �ߺ�",
 			  			                    type: 'error',
 			  			                    confirmButtonColor: '#3085d6',
 			  			                    confirmButtonText: 'Ȯ��',
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
 		 		    		                 "scheWorkCycle" : vm.eachMinutesFl + "�п� �����ؼ� " + vm.eachMinutesSe + "�� �������� �۵��� ���۵˴ϴ�.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
 		 		    		                 "scheType" : '���̹� ���� ����',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "������ ��� �Ϸ� " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: 'Ȯ��',
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
 			  		  			                title: "������ ��� ����",
 			  		  		                    type: 'error',
 			  		  		                    confirmButtonColor: '#3085d6',
 			  		  		                    confirmButtonText: 'Ȯ��',
 			  		  		                    confirmButtonClass: 'btn',
 		 		  							})
 		 		    		              }
 		 		    		           })
 		 		                   }
 		 		                },
 		 		                error: function () {
 		 		                	swal({
 				  			         title: "������ ��� ����",
 				  		              type: 'error',
 				  		                  confirmButtonColor: '#3085d6',
 				  		                 confirmButtonText: 'Ȯ��',
 				  		                 confirmButtonClass: 'btn',
 				  					})
 		 		                }
 		 		             })
 		  					}
 		  				}).catch(swal.noop);
 	            		}
             		
             		 if($('#dataExportShoppingEachHours').children('option:selected').text() == "�Žð�����"){
             			swal({
 		       	    		title: "�������� ����Ͻðڽ��ϱ�?",
 				       	   	text: vm.eachHoursFl + "�ÿ� �����ؼ� " + vm.eachHoursSe + "�ð� �������� �۵��� ���۵˴ϴ�.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '����ϱ�',
 			  		    	cancelButtonText: '���ư���',
 			  			    confirmButtonClass: 'btn',
 			  			    cancelButtonClass: 'btn btn-cencle',
 			  		        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
 			  		        allowEscapeKey:false, //esc ������ �� ������
 	       	     
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
 			  				                title: "������ �����ֱ� �ߺ�",
 			  			                    type: 'error',
 			  			                    confirmButtonColor: '#3085d6',
 			  			                    confirmButtonText: 'Ȯ��',
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
 		 		    		                 "scheWorkCycle" : vm.eachHoursFl + "�ÿ� �����ؼ� " + vm.eachHoursSe + "�ð� �������� �۵��� ���۵˴ϴ�.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
 		 		    		                 "scheType" : '���̹� ���� ����',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "������ ��� �Ϸ� " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: 'Ȯ��',
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
 			  		  			                title: "������ ��� ����",
 			  		  		                    type: 'error',
 			  		  		                    confirmButtonColor: '#3085d6',
 			  		  		                    confirmButtonText: 'Ȯ��',
 			  		  		                    confirmButtonClass: 'btn',
 		 		  							})
 		 		    		              }
 		 		    		           })
 		 		                   }
 		 		                },
 		 		                error: function () {
 		 		                	swal({
 				  			         title: "������ ��� ����",
 				  		              type: 'error',
 				  		                  confirmButtonColor: '#3085d6',
 				  		                 confirmButtonText: 'Ȯ��',
 				  		                 confirmButtonClass: 'btn',
 				  					})
 		 		                }
 		 		             })
 		  					}
 		  				}).catch(swal.noop);
 	            		}
             		
             		if($('#dataExportShoppingEachDay').children('option:selected').text() == "���ϸ���"){
             			swal({
 		       	    		title: "�������� ����Ͻðڽ��ϱ�?",
 				       	   	text: vm.eachDayFl + "�Ͽ� �����ؼ� " + vm.eachDaySe + "�� �������� �۵��� ���۵˴ϴ�.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '����ϱ�',
 			  		    	cancelButtonText: '���ư���',
 			  			    confirmButtonClass: 'btn',
 			  			    cancelButtonClass: 'btn btn-cencle',
 			  		        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
 			  		        allowEscapeKey:false, //esc ������ �� ������
 	       	     
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
 			  				                title: "������ �����ֱ� �ߺ�",
 			  			                    type: 'error',
 			  			                    confirmButtonColor: '#3085d6',
 			  			                    confirmButtonText: 'Ȯ��',
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
 		 		    		                 "scheWorkCycle" : vm.eachDayFl + "�Ͽ� �����ؼ� " + vm.eachDaySe + "�� �������� �۵��� ���۵˴ϴ�.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
 		 		    		                 "scheType" : '���̹� ���� ����',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "������ ��� �Ϸ� " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: 'Ȯ��',
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
 			  		  			                title: "������ ��� ����",
 			  		  		                    type: 'error',
 			  		  		                    confirmButtonColor: '#3085d6',
 			  		  		                    confirmButtonText: 'Ȯ��',
 			  		  		                    confirmButtonClass: 'btn',
 		 		  							})
 		 		    		              }
 		 		    		           })
 		 		                   }
 		 		                },
 		 		                error: function () {
 		 		                	swal({
 				  			         title: "������ ��� ����",
 				  		              type: 'error',
 				  		                  confirmButtonColor: '#3085d6',
 				  		                 confirmButtonText: 'Ȯ��',
 				  		                 confirmButtonClass: 'btn',
 				  					})
 		 		                }
 		 		             })
 		  					}
 		  				}).catch(swal.noop);
 	            		}
             		
             		if($('#dataExportShoppingEachMonth').children('option:selected').text() == "�ſ�����"){
             			swal({
 		       	    		title: "�������� ����Ͻðڽ��ϱ�?",
 				       	   	text: vm.eachMonthFl + "���� �����ؼ� " + vm.eachMonthSe + "�� 1�� �������� �۵��� ���۵˴ϴ�.",
 	       	    			type: 'question',
 			  			    showCancelButton: true,
 			  			    confirmButtonColor: '#3085d6',
 			  			    cancelButtonColor: '#d33',
 			  			    confirmButtonText: '����ϱ�',
 			  		    	cancelButtonText: '���ư���',
 			  			    confirmButtonClass: 'btn',
 			  			    cancelButtonClass: 'btn btn-cencle',
 			  		        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
 			  		        allowEscapeKey:false, //esc ������ �� ������
 	       	     
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
 			  				                title: "������ �����ֱ� �ߺ�",
 			  			                    type: 'error',
 			  			                    confirmButtonColor: '#3085d6',
 			  			                    confirmButtonText: 'Ȯ��',
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
 		 		    		                 "scheWorkCycle" : vm.eachMonthFl + "���� �����ؼ� " + vm.eachMonthSe + "�� 1�� �������� �۵��� ���۵˴ϴ�.",
 		 		    		                 "dataExportRequestCode" : vm.dataExportInfo.dataExportRequestCode,
 		 		    		                 "scheType" : '���̹� ���� ����',
 		 		    		              },
 		 		    		              type: 'post',
 		 		    		              success: function () {
 		 		    		            	swal({
 			  					                title: "������ ��� �Ϸ� " ,
 			  				                    type: 'success',
 			  				                    confirmButtonColor: '#3085d6',
 			  				                    confirmButtonText: 'Ȯ��',
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
 			  		  			                title: "������ ��� ����",
 			  		  		                    type: 'error',
 			  		  		                    confirmButtonColor: '#3085d6',
 			  		  		                    confirmButtonText: 'Ȯ��',
 			  		  		                    confirmButtonClass: 'btn',
 		 		  							})
 		 		    		              }
 		 		    		           })
 		 		                   }
 		 		                },
 		 		                error: function () {
 		 		                	swal({
 				  			         title: "������ ��� ����",
 				  		              type: 'error',
 				  		                  confirmButtonColor: '#3085d6',
 				  		                 confirmButtonText: 'Ȯ��',
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
    	  vm.selectApprovalShopScheRequest();
    	  vm.selectScheLists();
    	  vm.selectDaumNewsFormalFilePath();
      },
   });
   
	$(document).ready(function(){
		   $(".direct").hide();
		   $("#dataExportShoppingEach").hide();
		   		
		   		//������ �ε� �� �����Է� SELECT BOX �� �ֱ�
			    for(var i=0; i<60; i++){
					$("#dataExportShoppingSeconds").append("<option>"+i+"</option>");
				}
			    
			    for(var i=0; i<60; i++){
					$("#dataExportShoppingMinutes").append("<option>"+i+"</option>");
				}
			    
			    for(var i=0; i<24; i++){
					$("#dataExportShoppingHours").append("<option>"+i+"</option>");
				}
			    
			    for(var i=1; i<32; i++){
					$("#dataExportShoppingDay").append("<option>"+i+"</option>");
				}
			    
			    for(var i=1; i<13; i++){
					$("#dataExportShoppingMonths").append("<option>"+i+"</option>");
				}
			    
			    for(var i=2018; i<2100; i++){
					$("#dataExportShoppingYear").append("<option>"+i+"</option>");
				}
			    
			    // SELECT BOX �����Է� �� Input �±� Ȱ��ȭ 
			    $('#dataExportShoppingSeconds').change(function() {
			    	if($("#dataExportShoppingSeconds").children('option:selected').text() == "�����Է�"){
						$(".seconds").css("display","");
					    $("#dataExportShoppingSeconds").css("display","none");
					}
			    });
			    $('#dataExportShoppingMinutes').change(function() {
			    	if($("#dataExportShoppingMinutes").children('option:selected').text() == "�����Է�"){
						$(".minutes").css("display","");
					    $("#dataExportShoppingMinutes").css("display","none");
					}
			    });
			    $('#dataExportShoppingHours').change(function() {
			    	if($("#dataExportShoppingHours").children('option:selected').text() == "�����Է�"){
			    		
						$(".hours").css("display","");
					    $("#dataExportShoppingHours").css("display","none");
					}
			    });
			    $('#dataExportShoppingDay').change(function() {
			    	if($("#dataExportShoppingDay").children('option:selected').text() == "�����Է�"){
			    		
						$(".day").css("display","");
					    $("#dataExportShoppingDay").css("display","none");
					}
			    });
			    $('#dataExportShoppingMonths').change(function() {
			    	if($("#dataExportShoppingMonths").children('option:selected').text() == "�����Է�"){
			    		
						$(".months").css("display","");
					    $("#dataExportShoppingMonths").css("display","none");
					}
			    });
			    $('#dataExportShoppingYear').change(function() {
			    	if($("#dataExportShoppingYear").children('option:selected').text() == "�����Է�"){
			    		
						$(".year").css("display","");
					    $("#dataExportShoppingYear").css("display","none");
					}
			    });
			  
		   		$('#exportShoppingCron').change(function() {
		   			
		   			if($(this).children('option:selected').text() == "�۾�����"){
		   				 $("#dataExportShoppingDirect").show();
		   			     $("#dataExportShoppingEach").hide();
		   			     $(".direct").hide();
		   			}
		   			
					if($(this).children('option:selected').text() == "�Ͻ�������"){
						$("#dataExportShoppingDirect").show();
						$("#dataExportShoppingEach").hide();
						$(".direct").show();
						 
						//�����Է� INPUT �±� �����
						$(".seconds").css("display","none");
						$(".minutes").css("display","none");
						$(".hours").css("display","none");
						$(".day").css("display","none");
						$(".months").css("display","none");
						$(".year").css("display","none");
						 
						$("#dataExportShoppingSeconds").css("display","");
						$("#dataExportShoppingMinutes").css("display","");
						$("#dataExportShoppingHours").css("display","");
						$("#dataExportShoppingDay").css("display","");
						$("#dataExportShoppingMonths").css("display","");
						$("#dataExportShoppingYear").css("display","");
						 
					}
					if($(this).children('option:selected').text() == "��������"){
						$("#dataExportShoppingDirect").hide();
						$("#dataExportShoppingEach").show();
						
						//���� SELECT BOX ��Ȱ��ȭ
						$(".eachSeconds").hide();
						$(".eachMinutes").hide(); 
						$(".eachHours").hide(); 
						$(".eachDay").hide(); 
						$(".eachMonth").hide();
						
						//���� SELECT BOX �ʱ�ȭ 
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
						
						//SELECT BOX �������� �ʱ�ȭ
						$("#dataExportShoppingEachSeconds option:eq(0)").prop("selected", true);
						$("#dataExportShoppingEachMinutes option:eq(0)").prop("selected", true);
						$("#dataExportShoppingEachHours option:eq(0)").prop("selected", true);
						$("#dataExportShoppingEachDay option:eq(0)").prop("selected", true);
						$("#dataExportShoppingEachMonth option:eq(0)").prop("selected", true);
						
						//���� SELECT BOX ���� 
						$("#dataExportShoppingEachSeconds").removeAttr("disabled");
						$("#dataExportShoppingEachMinutes").removeAttr("disabled");
			   			$("#dataExportShoppingEachHours").removeAttr("disabled");
			   			$("#dataExportShoppingEachDay").removeAttr("disabled");
			   			$("#dataExportShoppingEachMonth").removeAttr("disabled");
					}
					
			});
		   		
		   	$('#dataExportShoppingEachSeconds').change(function() {
		   		if($(this).children('option:selected').text() == "��������"){
		   			//�� �Է� SELECT BOX �����
		   			$(".eachSeconds").hide();
		   			
		   			//�� ���� SELECT BOX Ȱ��ȭ 
		   		 	$("#dataExportShoppingEachMinutes").removeAttr("disabled");
		   			$("#dataExportShoppingEachHours").removeAttr("disabled");
		   			$("#dataExportShoppingEachDay").removeAttr("disabled");
		   			$("#dataExportShoppingEachMonth").removeAttr("disabled");
		   		
		   		}
		   		if($(this).children('option:selected').text() == "���ʸ���"){
		   			//�� �Է� SELECT BOX ���̱�
		   			$(".eachSeconds").show();
		   			
		   			//�� �Է� SELECT BOX ���� �����
		   			$(".eachMinutes").hide(); 
					$(".eachHours").hide(); 
					$(".eachDay").hide(); 
					$(".eachMonth").hide(); 
					
					//�� ���� SELECT BOX �������� ������ �ʱ�ȭ 
					$("#dataExportShoppingEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachHours option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachDay option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMonth option:eq(0)").prop("selected", true);
					
					//�� ���� SELECT BOX ��Ȱ��ȭ
					$("#dataExportShoppingEachMinutes").attr("disabled", "disabled");
					$("#dataExportShoppingEachHours").attr("disabled", "disabled");
					$("#dataExportShoppingEachDay").attr("disabled", "disabled");
					$("#dataExportShoppingEachMonth").attr("disabled", "disabled");
					
					//�Է� SELECT BOX �� �ֱ�
					for(var i=0; i<60; i++){
						$(".eachSecondsFl").append("<option>"+i+"</option>");
						$(".eachSecondsSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportShoppingEachMinutes').change(function() {
		   		if($(this).children('option:selected').text() == "��������"){
		   			$(".eachMinutes").hide();
		   			
		   			$("#dataExportShoppingEachSeconds").removeAttr("disabled");
		   			$("#dataExportShoppingEachHours").removeAttr("disabled");
		   			$("#dataExportShoppingEachDay").removeAttr("disabled");
		   			$("#dataExportShoppingEachMonth").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "�źи���"){
		   			$(".eachMinutes").show();
		   			$(".eachSeconds").hide();
		   			$(".eachHours").hide(); 
					$(".eachDay").hide(); 
					$(".eachMonth").hide(); 
					
					$("#dataExportShoppingEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachHours option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachDay option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMonth option:eq(0)").prop("selected", true);
					
					$("#dataExportShoppingEachSeconds").attr("disabled", "disabled");
					$("#dataExportShoppingEachHours").attr("disabled", "disabled");
					$("#dataExportShoppingEachDay").attr("disabled", "disabled");
					$("#dataExportShoppingEachMonth").attr("disabled", "disabled");
					
					for(var i=0; i<60; i++){
						$(".eachMinutesFl").append("<option>"+i+"</option>");
						$(".eachMinutesSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportShoppingEachHours').change(function() {
		   		if($(this).children('option:selected').text() == "��������"){
		   			$(".eachHours").hide();
		   			
		   			$("#dataExportShoppingEachSeconds").removeAttr("disabled");
		   			$("#dataExportShoppingEachMinutes").removeAttr("disabled");
		   			$("#dataExportShoppingEachDay").removeAttr("disabled");
		   			$("#dataExportShoppingEachMonth").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "�Žð�����"){
		   			$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").show(); 
					$(".eachDay").hide(); 
					$(".eachMonth").hide(); 
					
					$("#dataExportShoppingEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachDay option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMonth option:eq(0)").prop("selected", true);
					
					$("#dataExportShoppingEachSeconds").attr("disabled", "disabled");
					$("#dataExportShoppingEachMinutes").attr("disabled", "disabled");
					$("#dataExportShoppingEachDay").attr("disabled", "disabled");
					$("#dataExportShoppingEachMonth").attr("disabled", "disabled");
					
					for(var i=0; i<60; i++){
						$(".eachHoursFl").append("<option>"+i+"</option>");
						$(".eachHoursSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportShoppingEachDay').change(function() {
		   		if($(this).children('option:selected').text() == "��������"){
		   			$(".eachDay").hide();
		   			
		   			$("#dataExportShoppingEachSeconds").removeAttr("disabled");
		   			$("#dataExportShoppingEachMinutes").removeAttr("disabled");
		   			$("#dataExportShoppingEachHours").removeAttr("disabled");
		   			$("#dataExportShoppingEachMonth").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "���ϸ���"){
		   			$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").hide(); 
					$(".eachDay").show(); 
					$(".eachMonth").hide(); 
					
					$("#dataExportShoppingEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachHours option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMonth option:eq(0)").prop("selected", true);
					
					$("#dataExportShoppingEachSeconds").attr("disabled", "disabled");
					$("#dataExportShoppingEachMinutes").attr("disabled", "disabled");
					$("#dataExportShoppingEachHours").attr("disabled", "disabled");
					$("#dataExportShoppingEachMonth").attr("disabled", "disabled");
					
					for(var i=1; i<32; i++){
						$(".eachDayFl").append("<option>"+i+"</option>");
						$(".eachDaySe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
			$('#dataExportShoppingEachMonth').change(function() {
		   		if($(this).children('option:selected').text() == "��������"){
		   			$(".eachMonth").hide();
		   			
		   			$("#dataExportShoppingEachSeconds").removeAttr("disabled");
		   			$("#dataExportShoppingEachMinutes").removeAttr("disabled");
		   			$("#dataExportShoppingEachHours").removeAttr("disabled");
		   			$("#dataExportShoppingEachDay").removeAttr("disabled");
		   		}
		   		if($(this).children('option:selected').text() == "�ſ�����"){
		   			$(".eachSeconds").hide();
					$(".eachMinutes").hide(); 
					$(".eachHours").hide(); 
					$(".eachDay").hide(); 
					$(".eachMonth").show(); 
					
					$("#dataExportShoppingEachSeconds option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachMinutes option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachHours option:eq(0)").prop("selected", true);
					$("#dataExportShoppingEachDay option:eq(0)").prop("selected", true);
					
					$("#dataExportShoppingEachSeconds").attr("disabled", "disabled");
					$("#dataExportShoppingEachMinutes").attr("disabled", "disabled");
					$("#dataExportShoppingEachHours").attr("disabled", "disabled");
					$("#dataExportShoppingEachDay").attr("disabled", "disabled");
					
					for(var i=1; i<13; i++){
						$(".eachMonthFl").append("<option>"+i+"</option>");
						$(".eachMonthSe").append("<option>"+i+"</option>");
					}
		   		}
		   	});
		});
   
</script>