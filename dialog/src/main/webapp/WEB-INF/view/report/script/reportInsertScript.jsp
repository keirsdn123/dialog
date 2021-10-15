<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
var vm = new Vue({
   el: "#reportInsert" ,
   data : {
      getCategoryList:[], //카테고리 가지고옴
      categorySeq: '',
      value : [],
     // dataCodeList: [],
      options: [],
      id: '',
      dataBox : [], //실질적인 연관데이터셋의 seq가 있는곳(보이지 않음)
      dataBox2: [], //참조한 연관데이터셋의 이름이 보인다
      dataCodeList : [],
      label: '',
      array: {},
      defaultRatingCode: 0, 
      selectDataList : [], //팝업창의 데이터셋 불러오기
      selectRatingList : [],
      selectCategory : [], //팝업창의 카테고리별 데이터셋 가지고오기
      dataSort: 0, // 정렬
      dataSearchWrd : '', // 검색어
      selectdSearchDataSet : [],
      fileCheck:false,
      compareCode:'',
   },
   methods : {
      selectCategoryList : function(){
         var vm = this;
         $.ajax({
            url: "/getCategotyList", //DataSetAjaxController 에 있다.
            data: {               
            },
            type: 'post',
            success: function(list){
               vm.getCategoryList = list;
            },
            error : function () {
               alert("카테고리 안된다.");
            }
         })
      },   
      dataList : function(){
         var vm = this;
         $.ajax({
            url : "/selectDataList", //팝업시 보이는 데이터 리스트
            data : {
               
            },
            type : 'post',
            success: function(list){
               vm.selectDataList = list;               
            },
            error : function(){
               alert("hhh");
            }
         })
      },
    	//크롤링 요청		
//       goCrwalRequest : function(){
//     	  var vm = this;
// 			 $.ajax({
// 					url: "/SelectMemberInfo", 
// 				  	data :{
				  		
// 				  	},
// 				  	type:'post',
// 				  	success: function(memberInfo){
// 				  		console.log(memberInfo);
// 				  		if(memberInfo.memberId==null){
// 				  			swal({
// 				  				type: 'warning',
// 				  				title : "로그인후 등록이 가능합니다.",
// 			  					confirmButtonColor: '#3085d6',
// 		                        confirmButtonText: '확인',
// 		                        confirmButtonClass: 'btn',
// 		                        allowOutsideClick:false,
// 		  			            allowEscapeKey:false,
// 				  			}).then(function(isConfirm){
// //				  				if(isConfirm){
// //				  					window.location.href="/report/reportList";
// //				  				}
// 				  			}).catch(swal.noop);	  			
// 				  		}
				  		
// 				  		if(memberInfo.memberRatingCode==2){
// 				  			window.location.href="/myData/insertViewCollectRequest";
// 				  		} else 
// 				  			swal({
// 				  				type: 'warning',
// 				  				title : "접근권한이 없습니다!",
// 			  					confirmButtonColor: '#3085d6',
// 		                        confirmButtonText: '확인',
// 		                        confirmButtonClass: 'btn',
// 		                        allowOutsideClick:false,
// 		  			            allowEscapeKey:false,
// 				  			}).then(function(isConfirm){
// //				  				if(isConfirm){
// //				  					window.location.href="/report/reportList";
// //				  				}
// 				  			}).catch(swal.noop);	  	
// 				  	},
// 				  	error : function(){
// 				  		alert("hhhh");
// 				  	}
// 				  })	   
//       },
      //데이터셋 등록으로 가는 function
//       goDataSetInsert : function(){
// 			 var vm = this;
// 			 $.ajax({
// 					url: "/SelectMemberInfo", 		
// 				  	data :{
				  		
// 				  	},
// 				  	type:'post',
// 				  	success: function(memberInfo){
// 				  		console.log(memberInfo);
// 				  		if(memberInfo.memberId==null){
// 				  			swal({
// 				  				type: 'warning',
// 				  				title : "로그인후 등록이 가능합니다.",
// 			  					confirmButtonColor: '#3085d6',
// 		                        confirmButtonText: '확인',
// 		                        confirmButtonClass: 'btn',
// 		                        allowOutsideClick:false,
// 		  			            allowEscapeKey:false,
// 				  			}).then(function(isConfirm){
// // 				  				if(isConfirm){
// // 				  					window.location.href="/report/reportList";
// // 				  				}
// 				  			}).catch(swal.noop);	  			
// 				  		}
				  		
// 				  		if(memberInfo.memberRatingCode==3 ){
// 				  			window.location.href="/dataSet/dataSetInsertView";
// 				  		} else 
// 				  			window.location.href = "/dataSet/UserDataSetInsertView"
// 				  	},
// 				  	error : function(){
// 				  		alert("hhhh");
// 				  	}
// 				  })	  
//       },
      //회원의 등급에 따라 "정기적파일","크롤링요청" 버튼의 존재 유무
      viewButtom : function(){
         var vm = this;
         $.ajax({
            url: "/selectcompareRating",
            data : {
               
            },
            type : 'post',
            success : function(list){
               if(list == 1){   //회원 등급이 1일 경우                                                
                  document.all.viewRegular.style.display="none"; //정기적파일 버튼
                  document.all.crwalRequest.style.display="none"; //크롤링 요청 버튼           
               }
            }         
         })
      },
      seletCategory : function(){
         var vm = this;
         $.ajax({
            url : "/selectCategory",
            data : {
               
            },
            type : 'post',
            success : function(list){
               vm.selectCategory = list;
               
               
            },
            error : function() {
               alert("hhhh");
            }
         })
      },
      //접속한 회원의 등급을 가져오는 function
      AuthorityList : function(){
          var vm = this;
          $.ajax({
            url: "/selectRatingList",       
             data :{
             },
             type:'post',
             success: function(list){
                ("왜 jsp가 안되는 것이냐 궁금하도다");
                vm.selectRatingList = list;
             },
             error : function(){
                alert("hhhh");
             }
          })
         },
         //연관데이터셋 불러오기 팝업창 중앙의 데이터셋에 대한 정보를 가져옴
      dataCate: function(seq){
         var vm = this;
         $.ajax({
            url : "/selectDataCate",
            data : {
               "categorySeq" : seq,
            },
            type: 'post',
            success: function(list){
               vm.selectDataList = list;
            },
            error : function(){
               alert("hhh");
            }
         })
      },
      datasetBox : function(seq){
         var vm = this;
         $.ajax({
            url:"/selectDataSetBox", //선택한 데이터셋 연관 참조 데이터에 td 줄에 들어간다.
            data : {
               "dataCode" : seq,
            },
            type : 'post',
            success : function(list){
			//연관 참조데이터 중복 검사
               $.grep(list,function(value, index){           	
            	     for(var i = 0; i<vm.dataBox2.length; i++){
//             	    	 alert(vm.dataBox2[i]);
            	    	 if(vm.dataBox2[i] == value.dataCode){
            	    		 swal({
                                 title: "데이터셋 참조 오류",
                                 text:"중복된 데이터셋 선택입니다.",
                                  type: 'warning',
                                  confirmButtonColor: '#3085d6',
                                  confirmButtonText: '확인',
                                  confirmButtonClass: 'btn',
                        	}).then(function(isConfirm){
                          if(isConfirm){
                        	  vm.openPop();
                          }
                        });
            	    		 
            	    		 return;
            	    	 }
            	     }
            	       vm.dataBox.push(value.datasetName);
                       vm.dataBox2.push(value.dataCode);
            	              	  
                });
                      
               console.log(vm.dataBox2);
               
            },
            
            error : function(){
               alert("데이터셋 박스 고장났다.");
            }
         })
      },
      //연관데이터셋 팝업창의 일시적 데이터 클릭시 실행
      selectFileType1 : function(){ 
         var vm = this;
         $.ajax({
            url:"/selectFileType1", //일시적 데이터 클릭시 실행
            data : {
               
            },
            type: 'post',
            success: function(list){
               vm.selectDataList = list;
            }
         })
      },
      //연관데이터셋 팝업창의 정기적 데이터 클릭시 실행
      selectFileType2: function(){ 
         var vm = this;
         $.ajax({
            url:"/selectFileType2", //정기적 데이터 클릭시 실행
            data : {
               
            },
            type: 'post',
            success: function(list){
               vm.selectDataList = list;
            }
         })
      },
      //연관데이터셋의 팝업창의 나만의 데이터 클릭시 실행
      selectMyFile: function(){ 
         var vm =this;
         $.ajax({
            url:"/selectMyFile", //나만의 데이터 클릭시 실행
            data : {
               
            },
            type: 'post',
            success: function(list){
               vm.selectDataList = list;
            }
         })
      },
      //연관데이터셋 팝업창의 검색
      selectDtSearchDataSet: function () {
         var vm = this;
         $.ajax({
            url: '/selectDtSearchDataSet',
            data: {
               "dataSort" : vm.dataSort,
               "dataSearchWrd" : vm.dataSearchWrd,
            },
            type: 'post',
            success: function (list) {
               console.log(list);
               vm.selectDataList = list;
            },
            error: function () {
               alert("에러");
            }
         })
      },
      //팝업창의 "크롤링 요청" 버튼 누를시 발생되는 function
      goCrwalRequest : function(){
          var vm = this;
           $.ajax({
                url: "/SelectMemberInfo",       
                  data :{
                     
                  },
                  type:'post',
                  success: function(memberInfo){
                     console.log(memberInfo);
                     if(memberInfo.memberId==null){
                        swal({
                           type: 'warning',
                           title : "로그인후 등록이 가능합니다.",
                           confirmButtonColor: '#3085d6',
                               confirmButtonText: '확인',
                               confirmButtonClass: 'btn',
                               allowOutsideClick:false,
                              allowEscapeKey:false,
                        }).then(function(isConfirm){
//                           if(isConfirm){
//                              window.location.href="/report/reportList";
//                           }
                        }).catch(swal.noop);              
                     }
                     
                     if(memberInfo.memberRatingCode==2){
                        window.location.href="/myData/insertViewCollectRequest";
                     } else 
                        swal({
                           type: 'warning',
                           title : "접근권한이 없습니다!",
                           confirmButtonColor: '#3085d6',
                               confirmButtonText: '확인',
                               confirmButtonClass: 'btn',
                               allowOutsideClick:false,
                              allowEscapeKey:false,
                        }).then(function(isConfirm){
//                           if(isConfirm){
//                              window.location.href="/report/reportList";
//                           }
                        }).catch(swal.noop);        
                  },
                  error : function(){
                     alert("hhhh");
                  }
               })      
       },
       //팝업창의 "데이터셋 등록" 버튼 누를시 실행되는 function
      goDataSetInsert : function(){
          var vm = this;
          $.ajax({
               url: "/SelectMemberInfo",       
                 data :{
                    
                 },
                 type:'post',
                 success: function(memberInfo){
                    console.log(memberInfo);
                    if(memberInfo.memberId==null){
                       swal({
                          type: 'warning',
                          title : "로그인후 등록이 가능합니다.",
                          confirmButtonColor: '#3085d6',
                              confirmButtonText: '확인',
                              confirmButtonClass: 'btn',
                              allowOutsideClick:false,
                             allowEscapeKey:false,
                       }).then(function(isConfirm){
//                           if(isConfirm){
//                              window.location.href="/report/reportList";
//                           }
                       }).catch(swal.noop);              
                    }
                    
                    if(memberInfo.memberRatingCode==3 ){
                       window.location.href="/dataSet/dataSetInsertView";
                    } else 
                       window.location.href = "/dataSet/UserDataSetInsertView"
                 },
                 error : function(){
                    alert("hhhh");
                 }
              })     
      },
      //보고서 등록 창에 보여지는 참조한 연관데이터셋을 지우는것(x버튼 누르면 실행되는 function)
      delData : function (index) {
         var vm = this;
         vm.dataBox.splice(index,1);
         vm.dataBox2.splice(index,1);
      },
      //연관참조데이터셋(팝업창)여는 function
      openPop : function(){
         $("#report_pop").modal();
         vm.seletCategory();
         vm.dataList();
         vm.viewButtom();
      },
      //보고서 등록
      insertReportFrm : function(){
         var vm = this;      
      	 
         //보고서의 이름이 없을때
         if($("#reportName").val()==""){
            swal({
                     title: "보고서 등록 오류",
                     text:"제목을 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            
         }
         //1차 카테고리를 지정하지 않았을시.
         else if(vm.categorySeq==0){
            swal({
                     title: "보고서 등록 오류",
                     text:"1차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            
         }      
         //1차 카테고리는 지정하되 2차카테고리를 지정하지 않았을때
         else if(vm.value==null){
            swal({
                     title: "보고서 등록 오류",
                     text:"2차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            
         }
         //연관 참조데이터를 등록하지 않았을때
         else if(vm.dataCodeList==null){
            swal({
                     title: "보고서 등록 오류",
                     text:"연관 참조 데이터를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            
         }
         //파일 업로드를 하지 않았을시.(파일은 1개만 업로드 된다.)
         else if(vm.fileCheck == false){
            swal({
                     title: "보고서 등록 오류",
                     text:"파일 업로드를 하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
            });
            
         } else {
        	 //모든 조건을 만족했을시 실행. 현재 reportInsert.jsp는 "insertReportFrm"이라는 이름의 form형식으로 되어 있다.
         var formData = new FormData($("#insertReportFrm")[0]);
       //vm.categorySeq 는 'cateCode1'이라는 이름으로 formData에 들어간다. 밑에 것도 똑같다.
         formData.append('cateCode1',vm.categorySeq); 
         formData.append('cateList',vm.value); 
         formData.append('dataCodeList',vm.dataBox2);
         formData.append('memberRatingCode',vm.defaultRatingCode);
         
         jQuery.ajaxSettings.traditional = true;
         
          $.ajax({
                type : "POST",
                url : "/insertReport",
                data : formData,      
                processData: false,
                contentType: false,
             beforeSend: function(){
                
               $("#loading").show();
             },
             success : function() {
               $("#loading").hide();
               swal({
                        title: "보고서 등록 완료",
                         type: 'success',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: '확인',
                         confirmButtonClass: 'btn',
                         allowOutsideClick:false,
                        allowEscapeKey:false,
               }).then(function(isConfirm){
                  if(isConfirm){
                     window.location.href='/report/reportList';
                  }
               }).catch(swal.noop);
             },
            error : function(xhr, status, error) {
               $("#loading").hide();
               swal({
                        title: "데이터 셋 등록 오류",
                         type: 'warning',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: '확인',
                         confirmButtonClass: 'btn',
               });
            }          
            })
         }
      },
      
   },
//    dataSetInsertView : function(){
//       $("#pgChange").html(
//          "<input type='hidden' name='dataCode' value="+code+">"
//           );
//         $("#pgChange").attr("action","/dataSet/dataSetInsertView");
//         $("#pgChange").submit();
//    },
   
   filters: {
      
   },
   watch: {
      categorySeq:function(seq){
          var vm = this;
          var categorySeq = seq;
          console.log(categorySeq);
          vm.value=null;
          $.ajax({
                  url: "/getCategoryList",
                    data:{inputseq:categorySeq},
                    type:'GET',
                    success: function(list){
                        if(list.length!=0){
                           vm.options=[];
                         vm.array={};
                     $.each(list,function(i, e){
                             vm.id = e.categorySeq;
                             vm.label = e.categoryNme;
                             array = {
                                   id:vm.id,
                                   label:vm.label
                                };
                               vm.options.push(array)
                        })   
                           }
                        else{
                           vm.options=[];
                           vm.value=0;
                        }
                  },
                      error : function(){
                         alert("hhhh");
                    }
                })
          },      
   },
   mounted : function(){
      var vm = this;
         vm.selectCategoryList();
         vm.AuthorityList();
   },
});
//파일 업로드시 파일 이름 조회
   $(document).ready(function(){
      var fileTarget = $('.filebox .upload-hidden');
      fileTarget.on('change', function(){
         if(window.FileReader){
             var filename = $(this)[0].files[0].name;
          } 
         else {
             var filename = $(this).val().split('/').pop().split('\\').pop();
         }
         $(this).siblings('.upload-name').val(filename);
         vm.fileCheck=true;
      });
   }); 
         
</script>