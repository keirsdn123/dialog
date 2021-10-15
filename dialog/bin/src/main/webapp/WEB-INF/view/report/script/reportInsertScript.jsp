<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
var vm = new Vue({
   el: "#reportInsert" ,
   data : {
      getCategoryList:[], //�˾�â�� ī�װ� �������
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
      selectDataList : [], //�˾�â�� �����ͼ� �ҷ�����
      selectRatingList : [],
      selectCategory : [], //�˾�â�� ī�װ��� �����ͼ� ���������
      dataSort: 0, // ����
      dataSearchWrd : '', // �˻���
      selectdSearchDataSet : [],
      fileCheck:false,
      compareCode:'',
   },
   methods : {
      selectCategoryList : function(){
         var vm = this;
         $.ajax({
            url: "/getCategotyList", //DataSetAjaxController �� �ִ�.
            data: {               
            },
            type: 'post',
            success: function(list){
               vm.getCategoryList = list;
            },
            error : function () {
               alert("ī�װ� �ȵȴ�.");
            }
         })
      },   
      dataList : function(){
         var vm = this;
         $.ajax({
            url : "/selectDataList", //�˾��� ���̴� ������ ����Ʈ
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
				  				title : "�α����� ����� �����մϴ�.",
			  					confirmButtonColor: '#3085d6',
		                        confirmButtonText: 'Ȯ��',
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
				  				title : "���ٱ����� �����ϴ�!",
			  					confirmButtonColor: '#3085d6',
		                        confirmButtonText: 'Ȯ��',
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
				  				title : "�α����� ����� �����մϴ�.",
			  					confirmButtonColor: '#3085d6',
		                        confirmButtonText: 'Ȯ��',
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
                ("�� jsp�� �ȵǴ� ���̳� �ñ��ϵ���");
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
            url:"/selectDataSetBox", //������ �����ͼ� ���� ���� �����Ϳ� td �ٿ� ����.
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
               alert("�����ͼ� �ڽ� ���峵��.");
            }
         })
      },   
      selectFileType1 : function(){ 
         var vm = this;
         $.ajax({
            url:"/selectFileType1", //�Ͻ��� ������ Ŭ���� ����
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
            url:"/selectFileType2", //������ ������ Ŭ���� ����
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
            url:"/selectMyFile", //������ ������ Ŭ���� ����
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
               alert("����");
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
                           title : "�α����� ����� �����մϴ�.",
                           confirmButtonColor: '#3085d6',
                               confirmButtonText: 'Ȯ��',
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
                           title : "���ٱ����� �����ϴ�!",
                           confirmButtonColor: '#3085d6',
                               confirmButtonText: 'Ȯ��',
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
                          title : "�α����� ����� �����մϴ�.",
                          confirmButtonColor: '#3085d6',
                              confirmButtonText: 'Ȯ��',
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
                     title: "���� ��� ����",
                     text:"������ �Է��ϼ���",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Ȯ��',
                      confirmButtonClass: 'btn',
            });
            
         }
         else if(vm.categorySeq==0){
            swal({
                     title: "���� ��� ����",
                     text:"1�� ī�װ��� �Է��ϼ���",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Ȯ��',
                      confirmButtonClass: 'btn',
            });
            
         }      
         else if(vm.value==null){
            swal({
                     title: "���� ��� ����",
                     text:"2�� ī�װ��� �Է��ϼ���",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Ȯ��',
                      confirmButtonClass: 'btn',
            });
            
         }
         else if(vm.dataCodeList==null){
            swal({
                     title: "���� ��� ����",
                     text:"���� ���� �����͸� �Է��ϼ���",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: 'Ȯ��',
                      confirmButtonClass: 'btn',
            });
            
         }
         else if(vm.fileCheck == false){
            swal({
                     title: "���� ��� ����",
                     text:"���� ���ε带 �ϼ���",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Ȯ��',
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
                        title: "���� ��� �Ϸ�",
                         type: 'success',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: 'Ȯ��',
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
                        title: "������ �� ��� ����",
                         type: 'warning',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: 'Ȯ��',
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
//���� ���ε�� ���� �̸� ��ȸ
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