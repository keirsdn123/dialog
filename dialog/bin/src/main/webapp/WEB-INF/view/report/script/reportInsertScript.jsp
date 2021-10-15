<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
var vm = new Vue({
   el: "#reportInsert" ,
   data : {
      getCategoryList:[], //팝업창의 카테고리 가지고옴
      categorySeq: '',
      value : [],
      dataCodeList: [],
      options: [],
      id: '',
      dataBox : [],
      dataBox2: [],
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
//				  				if(isConfirm){
//				  					window.location.href="/report/reportList";
//				  				}
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
//				  				if(isConfirm){
//				  					window.location.href="/report/reportList";
//				  				}
				  			}).catch(swal.noop);	  	
				  	},
				  	error : function(){
				  		alert("hhhh");
				  	}
				  })	   
      },
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
// 				  				if(isConfirm){
// 				  					window.location.href="/report/reportList";
// 				  				}
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
      viewButtom : function(){
         var vm = this;
         $.ajax({
            url: "/selectcompareRating",
            data : {
               
            },
            type : 'post',
            success : function(list){
               if(list == 1){                                                   
                  document.all.viewRegular.style.display="none";
                  document.all.crwalRequest.style.display="none";            
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
               
               
               $.grep(list,function(value, index){
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
      delData : function (index) {
         var vm = this;
         vm.dataBox.splice(index,1);
         vm.dataBox2.splice(index,1);
      },
      openPop : function(){
         $("#report_pop").modal();
         vm.seletCategory();
         vm.dataList();
         vm.viewButtom();
      },      
      insertReportFrm : function(){
         var vm = this;      
      
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
         var formData = new FormData($("#insertReportFrm")[0]);
         
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