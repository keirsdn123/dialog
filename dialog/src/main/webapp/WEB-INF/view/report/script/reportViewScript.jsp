<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
    el:"#reportView" ,
    data: {
       reportDataInfo : {},
       reportCateInfo : {},
       dataCode : '',
       compareCode : '',
       reportCode : ${reportCode},
       uMemberCode : ${uMemberCode},
       referenceDataSetList : [],
       reportDisplaySet:${reportDisplaySet},
       displaySet: 0,
       typeNormalRegularly:'',
    },

    methods: {
       //보고서 내용 조회
      selectReportView: function(){
         
         var vm = this;
         console.log("tlqkanjdla?"+vm.reportDisplaySet);
         $.ajax({
            url:'/selectReportView', 
            data : {
               "reportCode" : vm.reportCode,
            },
            type: 'post',
            success : function(data){
               console.log(data);
               vm.reportDataInfo = data.detailReportInfo;
               vm.reportCateInfo = data.reportCateInfo;
               console.log("아이시방 ㅋㅋㅋ"+vm.reportDataInfo.reportTitle);
               console.log(vm.reportDataInfo);
               console.log("u맴버코드"+vm.uMemberCode);
               console.log("리포트 맴버코드"+vm.reportDataInfo.memberCode);
               if(vm.reportDataInfo.memberCode == vm.uMemberCode){                                    
                  document.all.updateReport.style.display="";
               
                } else        
                   document.all.updateReport.style.display= "none";
                
                     
               if(vm.reportDataInfo.memberCode == vm.uMemberCode){                                    
                  document.all.deleteReport.style.display="";
               
                } else if(vm.uMemberCode == "1") {
                  document.all.deleteReport.style.display="";                   
                } else
                   document.all.deleteReport.style.display= "none";
                
   
            },
            error : function(){
               alert("보고서 상세조회 오류 펑펑~");
            }
         })
      },
        selectRFileDownload: function(){
           var vm = this;
           $.fileDownload("/selectRFileDownload", {
              httpMethod:"POST",
            aync: false,
            data: {
               "fileRoute" : vm.reportDataInfo.fileRoute,
               "originFileTitle" : vm.reportDataInfo.originFileTitle
            },
            prepareCallback: function () {
               $("#loading").show();
            },
            successCallback: function(cat){
               $('#loading').hide();
            },
            failCallback: function(){
               console.log("실패적");
               swal({
                        title: "파일 다운로드 오류",
                         type: 'warning',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: '확인',
                         confirmButtonClass: 'btn',
                        
               });
               $('#loading').hide();
            }
           })                      
       },
//        보고서 삭제버튼 눌렀을시
       deleteReport : function(){      
          var vm = this;
         swal({
                  title: "삭제 하시겠습니까?",
                  type: 'success',
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: '확인',
                  cancelButtonText: '취소',
                  confirmButtonClass: 'btn',
                  cancelButtonClass: 'btn btn-cencle',
                  allowOutsideClick:false,
                   allowEscapeKey:false,
         }).then(function(isConfirm){
            if(isConfirm){
               vm.inVisibleReport();
            }
         }).catch(swal.noop);
       },
//        확인 :   보고서 삭제
       inVisibleReport : function(){
          var vm = this;
          $.ajax({
             url:'/inVisibleReport',
             data:{
                "reportCode" : vm.reportCode,
             },
             type:'post',
             success: function(list){
                window.location.href="/report/reportList";
             }
          });
       },
       //보고서 목록으로 
       reportList : function(){
          var vm = this;
          console.log(vm.reportDisplaySet);
  
          if(vm.reportDisplaySet == 0){
             window.location.href="/report/reportList";
          }
          if(vm.reportDisplaySet == 1){
             window.location.href="/dataSet/mydataList?reportDisplaySet="+vm.reportDisplaySet;
          }
       },
       //연관데이터셋  조회
       selectReferenceDataSetList: function(){
          var vm = this;
          $.ajax({
             url:'/selectReferenceDataSetList',
             data:{
                "reportCode" : vm.reportCode,
             },
             type:'post',
             success: function(list){
                console.log(list);
                vm.referenceDataSetList = list;
             }
          });
       },
//        보고서 상세조회 -> 연관데이터셋 -> 데이터셋 상세조회로 이동 (진짜 이동)
       selectDataSetInfoView: function(code){
          var vm = this;
          var compareCode;
          compareCode = code.memberRatingCode; //연관데이터셋의 멤버코드
          dataCode = code.dataCode;
         $.ajax({
            url: "/selectcompareRating",       
              data :{
                 
              },
              type:'post',
              success: function(list){
                 console.log("list"+list);
                 console.log("compareCode"+compareCode);
                 if(list >= compareCode){
                    $("#pageChange").html(
                            "<input type='hidden' name='dataCode' value="+dataCode+">"
                            +"<input type='hidden' name='displaySet' value="+vm.displaySet+">"
                            +"<input type='hidden' name='typeNormalRegularly' value="+vm.typeNormalRegularly+">"
                          );
                          $("#pageChange").attr("action","/dataSet/dataSetListView");
                          $("#pageChange").submit();
                 } else if (list == 2 || list == 3) {
                    $("#pageChange").html(
                            "<input type='hidden' name='dataCode' value="+dataCode+">"
                            +"<input type='hidden' name='displaySet' value="+vm.displaySet+">"
                            +"<input type='hidden' name='typeNormalRegularly' value='"+vm.typeNormalRegularly+"'>"
                          );
                          $("#pageChange").attr("action","/dataSet/dataSetListView");
                          $("#pageChange").submit();
                 } else if(list < compareCode) {
                    swal({
                           title: "접근 권한이 없습니다!",
                            type: 'warning',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: '확인',
                            confirmButtonClass: 'btn',
                           
                  });
                 }
                                            
              },
              error : function(){
//                  alert("hhhh");
              }
         });
       },
//         보고서 상세조회 -> 연관데이터셋 -> 데이터셋 상세조회로 이동(전에 먼저 타입 셀렉해오기)
       dataSetInfoView: function(code){
          var vm = this;
          var compareCode;
          compareCode = code.memberRatingCode; //연관데이터셋의 멤버코드
          dataCode = code.dataCode;       
//           vm.selectDatasetType(dataCode);
          $.ajax({
             url:"/selectDatasetType",
             data:{
                "dataCode" : dataCode,
             },
             type:'post',
             success: function(type){
                vm.typeNormalRegularly = type;
                vm.selectDataSetInfoView(code);
             },
             error: function(){
                
             }
          });               
       },
         
         updateReport : function(code){
            $.ajax({
            url: "/SelectMemberInfo",       
              data :{
                 
              },
              type:'post',
              success: function(memberInfo){
                 console.log(memberInfo);
                 if(memberInfo.memberRatingCode==1 || memberInfo.memberRatingCode==2 ){
                   $("#pageChange").html(
                            "<input type='hidden' name='reportCode' value="+code+">"
                          );
                          $("#pageChange").attr("action","/report/reportUpdate");
                          $("#pageChange").submit();
                 }
                 if(memberInfo.memberRatingCode==3 ){
                    $("#pageChange").html(
                            "<input type='hidden' name='reportCode' value="+code+">"
                          );
                          $("#pageChange").attr("action","/report/adminReportUpdate");
                          $("#pageChange").submit();                          
                 }
              },
              error : function(){
                 alert("hhhh");
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
       vm.selectReportView();
       vm.selectReferenceDataSetList();
    },

 });

</script>