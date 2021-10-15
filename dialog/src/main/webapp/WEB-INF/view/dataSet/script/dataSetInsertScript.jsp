<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
 Vue.component('treeselect', VueTreeselect.Treeselect)
 var vm = new Vue({
     el:"#DataInsert" ,
     data: {
          getCategoryList:[],
          selectAuthorityList:[],
          selectCollectRequestList :[],   //다음 뉴스 수집 요청 목록 조회
          categorySeq:0,
          defaultRatingCode:0,
        daumNewsDataCollectRequestCode:0,
        daumNewsRequestCollectWord :'',
          value:[],
        options: [],
        id:'',
        label:'',
        array:{},
        fileCheck:false,
        selectDSourceList : [],   //개발 소스 리스트
       devSourceType : '',   //개발 소스 타입
       devSourceCode : 0,   //개발 소스 게시글 seq
       devSourceTitle : '',   //개발 소스 제목
       devSourceTitle1 : '',   //개발 소스 제목
       devSourceTitle2 : '',   //표준 소스 제목
       regularDataTableTitle : '',   //정기 데이터 테이블 명
       regularDataStandardTableTitle : '',   //정기 데이터 표준 테이블 명
       
       selectIndex:0,
       typeNormalRegularly :'일시',
       dataSetType:'',
       datasetName:'',
       datasetFrom:'',
       datasetInfo:'',
       
     },
     methods: {
          selectCategoryList : function(){
           var vm = this;
           $.ajax({
            url: "/getCategotyList",
              data :{
              },
              type:'post',
              success: function(list){
                 vm.getCategoryList = list;
              },
              error : function(){
                 alert("hhhh");
              }
           })
         },
      AuthorityList : function(){
       var vm = this;
       $.ajax({
         url: "/selectAuthorityList",       
          data :{
          },
          type:'post',
          success: function(list){
             ("왜 jsp가 안되는 것이냐 궁금하도다");
             vm.selectAuthorityList = list;
          },
          error : function(){
             alert("hhhh");
          }
       })
      },
      //데이터셋 일시 등록(관리자)
         insertDataset : function(){
            var vm = this;
         if($("#datasetName").val()==""){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"제목을 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
         }
         else if(vm.categorySeq==0){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"1차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
         }
         else if(vm.value==null){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"2차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
         }
         else if(vm.fileCheck == false){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"파일 업로드를 하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
            });
         }
         else if($("#datasetFrom").val()==""){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"출처를 입력하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
            });
         }
            else{
               var formData = new FormData($("#insertDatasetFrm")[0]);
            formData.append('cateCode1',vm.categorySeq);
            formData.append('cateList',vm.value);
            formData.append('memberRatingCode',vm.defaultRatingCode);
             $.ajax({
                   type : "POST",
                   url : "/insertDataset",
                   data : formData,      
                   processData: false,
                   contentType: false,   
                beforeSend: function(){
                  $("#loading").show();
                },
                success : function() {
                  $("#loading").hide();
                  swal({
                           title: "데이터 셋 등록 완료",
                            type: 'success',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: '확인',
                            confirmButtonClass: 'btn',
                            allowOutsideClick:false,
                           allowEscapeKey:false,
                  }).then(function(isConfirm){
                     if(isConfirm){
                        window.location.href='/dataSet/dataSetList';
                     }
                  }).catch(swal.noop);
                },
               error : function(xhr, status, error) {
                  $("#loading").hide();
                  swal({
                           title: "데이터 셋 등록 오류",
                           text:"유효성이 아니라 아작스 오류",
                            type: 'warning',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: '확인',
                            confirmButtonClass: 'btn',
                  });
               }
               })
            }
      },
      //데이터셋 정기 등록(관리자)
         insertRegularDataset : function(){
            var vm = this;
            if($("#datasetName").val()==""){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"제목을 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            return false;
         }
         else if(vm.categorySeq==0){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"1차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            return false;
         }
         else if(vm.value==null){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"2차 카테고리를 입력하세요",
                      type: 'warning',
                      confirmButtonColor: '#3085d6',
                      confirmButtonText: '확인',
                      confirmButtonClass: 'btn',
            });
            return false;
         }
         else if(vm.datasetInfo==""){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"내용을 입력하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
            });
            return false;
         }
         else if($("#datasetFrom").val()==""){
            swal({
                     title: "데이터 셋 등록 오류",
                     text:"출처를 입력하세요",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '확인',
                    confirmButtonClass: 'btn',
            });
            return false;
         }
         else{
            $.ajax({
                type : "POST",
                url : "/insertRegularDataset",
                traditional : true,
                data : {
                   'cateCode1' : vm.categorySeq,
                   'cateList' : vm.value,
                   'memberRatingCode' : vm.defaultRatingCode,
                   'dataSetType' : vm.dataSetType,
                   'scheCode' : vm.selectCollectRequestList[vm.selectIndex].scheduleCode,
                   'typeNormalRegularly' : vm.typeNormalRegularly,
                  'dataSetType': vm.dataSetType,
                  'datasetName' : vm.datasetName,
                  'datasetFrom' : vm.datasetFrom,
                  'datasetInfo' : vm.datasetInfo,
                },
             beforeSend: function(){
               $("#loading").show();
             },
             success : function() {
               $("#loading").hide();
               swal({
                        title: "데이터 셋 등록 완료",
                         type: 'success',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: '확인',
                         confirmButtonClass: 'btn',
                         allowOutsideClick:false,
                        allowEscapeKey:false,
               }).then(function(isConfirm){
                  if(isConfirm){
                     window.location.href='/dataSet/dataSetList';
                  }
               }).catch(swal.noop);
             },
            error : function(xhr, status, error) {
               $("#loading").hide();
               console.log(error);
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
      
      //취소 버튼 눌렀을 때
      dataSetList : function(){
          window.location.href="/dataSet/dataSetList";
       },
        //데이터셋 등록 개발 소스 조회
      selectDSource: function (type) {
         var vm = this;
         $.ajax({
            url: '/selectDSource',
            data: {
               "devSourceType" : type,
            },
            type: 'post',
            success: function (list) {
               vm.selectDSourceList = list;
            },
            error: function () {
               alert("에러");
            }
         })
      },    
      // 개발 소스 게시글 클릭시 색
      backColor: function (code, title, type) {
         var vm = this;
         vm.devSourceCode = code;
         vm.devSourceTitle1 = title;
         vm.devSourceType = type;
      },
      // 확인 버튼 클릭 시
      popupCheck: function () {
         var vm = this;
         if(vm.devSourceType == "수집"){
         vm.devSourceTitle = vm.devSourceTitle1;
         }
         else if(vm.devSourceType == "표준"){
         vm.devSourceTitle2 = vm.devSourceTitle1;
         }
      },
      
      //데이터 수집요청 목록 조회 (정기 _ 재훈)
      selectCollectRequestLists: function () {
         var vm = this;
         $.ajax({
            url: '/selectCollectRequestList',
            data: {
            },
            type: 'post',
            success: function (list) {
               console.log(list);
               vm.selectCollectRequestList = list;
            },
            error: function () {
               alert("에러");
            }
         })
      },
      //기타데이터셋 onchange (정기 _ 재훈)
//       onChange: function () {
//           $("#regular1").show();
//            $("#regular2").show();
//       },
//       text_limit: function(e){
//          var val = e.target.value;
//          if(val.length > 35){
//             $('#datasetName').val(val.substring(0,35));
//          }
//       },
     },
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
        
        value : function(value){
           console.log("value??" + value);
        }
     },
     mounted: function () {
           var vm = this;
           vm.selectCategoryList();
           vm.AuthorityList();
//            vm.selectDSource();
           vm.selectCollectRequestLists();
     },
  });
//데이터 셋 정기/일시 구분 jQuery
   $(document).ready(function(){
      $("#regularBtn").hide();
      $("#dataSetType").hide();
       $("#radio1").click(function(){
          $("#temporary").show();
          $("#temporaryBtn").show();
           $("#regularBtn").hide();
           $("#dataSetType").hide();
           vm.dataSetType ='';
       });
       $("#radio2").click(function(){
          
           $("#temporary").hide();
           $("#temporaryBtn").hide();
           $("#regular1").show();
           $("#regular2").show();
           $("#regularBtn").show();
           $("#dataSetType").show();
//           $("#collectRequestList").show();
//           $("#rssRequestList").show();
//           $("#shoppingRequestList").show();
//           $("#etcRequestList").show();
       });
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
//           $("#fileUl").remove();
          
          var formData = new FormData($("#insertDatasetFrm")[0]);
               $.ajax({
            url: "/dataSetFileCheck",
               data :formData,
               type:'post',
               processData: false,
               contentType: false,
               beforeSend: function(){
               $("#loading").show();
             },
               success: function(excelcheck){
                  $("#loading").hide();
                  switch(excelcheck){
                  case 1:
                    $("#fileUl").html(
                        "<font color='red'>파일 유효성을 만족하지 않습니다 . 시트 수는 하나만 가능합니다 파일의 시트 수를 확인해주세요</font>"
                    + "");
                    $("#fileUl").append(
                          "<input type='hidden' name='status' value='N'>"
                    );
                    break;
                 case 2:
                    $("#fileUl").html(
                        "<font color='red'>파일 유효성을 만족하지 않습니다 . 기준에 맞지 않는 데이터가 있습니다 파일을 확인해주세요</font>"
                    + "");
                        $("#fileUl").append(
                          "<input type='hidden' name='status' value='N'>"
                    );
                    break;
                 case 3:
                    $("#fileUl").html(
                        "<font color='red'>파일 유효성을 만족하지 않습니다 . 엑셀 또는 CSV 파일이 아닙니다.</font>"
                       + "");
                        $("#fileUl").append(
                          "<input type='hidden' name='status' value='N'>"
                    );
                       break;
                 case 4:
                    $("#fileUl").html(
                        "<font color='red'>첫 행 칼럼값이 올바르지 않습니다  파일을 확인해주세요 . </font>"
                       + "");
                        $("#fileUl").append(
                          "<input type='hidden' name='status' value='N'>"
                    );
                       break;   
                 case 0:
                    $("#fileUl").html(
                        "<font color='green'>유효성을 만족합니다. 추후 시각화 서비스를 이용하실 수 있습니다.</font>"
                    + "");
                        $("#fileUl").append(
                          "<input type='hidden' name='status' value='S'>"
                    );
                    break;      
                   }
               },
               error : function(xhr, status, error) {
                  
               $("#loading").hide();
               swal({
                        title: "파일 업로드 오류",
                         type: 'warning',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: '확인',
                         confirmButtonClass: 'btn',
               });
                 $("#fileUl").html(
                     "<font color='red'>파일 오류 </font>"
                 + "");
                 $("#fileUl").append(
                       "<input type='hidden' name='status' value='N'>"
                 );
             }
            })
       });
    }); 
</script>