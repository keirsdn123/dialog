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
       //���� ���� ��ȸ
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
               console.log("���̽ù� ������"+vm.reportDataInfo.reportTitle);
               console.log(vm.reportDataInfo);
               console.log("u�ɹ��ڵ�"+vm.uMemberCode);
               console.log("����Ʈ �ɹ��ڵ�"+vm.reportDataInfo.memberCode);
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
               alert("���� ����ȸ ���� ����~");
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
               console.log("������");
               swal({
                        title: "���� �ٿ�ε� ����",
                         type: 'warning',
                         confirmButtonColor: '#3085d6',
                         confirmButtonText: 'Ȯ��',
                         confirmButtonClass: 'btn',
                        
               });
               $('#loading').hide();
            }
           })                      
       },
//        ���� ������ư ��������
       deleteReport : function(){      
          var vm = this;
         swal({
                  title: "���� �Ͻðڽ��ϱ�?",
                  type: 'success',
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'Ȯ��',
                  cancelButtonText: '���',
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
//        Ȯ�� :   ���� ����
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
       //���� ������� 
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
       //���������ͼ�  ��ȸ
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
//        ���� ����ȸ -> ���������ͼ� -> �����ͼ� ����ȸ�� �̵� (��¥ �̵�)
       selectDataSetInfoView: function(code){
          var vm = this;
          var compareCode;
          compareCode = code.memberRatingCode; //���������ͼ��� ����ڵ�
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
                           title: "���� ������ �����ϴ�!",
                            type: 'warning',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'Ȯ��',
                            confirmButtonClass: 'btn',
                           
                  });
                 }
                                            
              },
              error : function(){
//                  alert("hhhh");
              }
         });
       },
//         ���� ����ȸ -> ���������ͼ� -> �����ͼ� ����ȸ�� �̵�(���� ���� Ÿ�� �����ؿ���)
       dataSetInfoView: function(code){
          var vm = this;
          var compareCode;
          compareCode = code.memberRatingCode; //���������ͼ��� ����ڵ�
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