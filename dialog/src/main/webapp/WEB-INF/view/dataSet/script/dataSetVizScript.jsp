<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 799��°�� ���� Ŭ���� �׷��� ���� -->


<script>
   var vm = new Vue({
       el:"#datalistView" ,
       data: {
        dbDatasetColNmeList : [],
		infoRawDataColumn : [], //raw������ �÷�(����)
		infoRawDataRecode : [], //raw������ ���ڵ� ����Ʈ(����)
		regularDataCode : '', //�������̺�seq
		regularDataTableLoot : '', //�������̺� ����
		regularDataTableTitle : '', //�������̺��
		rD : {}, //�������̺� ����
		regularData : [], //�������̺� ���� ����Ʈ
		dbTitle : {}, //������ db Ÿ��Ʋ
		dbData : [], // ������ db ������
		changeData: [], // �ٲ� ������
    	normalDataInfo : {},
        normalDataCateInfo : {},          
        fileColNameList : {},
        fileColTypeList : {},
        fileDataList : [],
        columnList: {}, //������ �̸�����
       //columnInfo: {},
        columnNme : [], //columnList �ȿ� �ִ� ù�࿡ �ִ� �̸�
        vColumnList : [], //Į������Ʈ
        // columnName: '',      
         list: [],
         xcolName: '', //(����)db�� pause_standar_column1 �� ���� ������ �ִ�. ��ǻ� ���� ������ ������ ���� �ǹ��Ѵ�.
         ycolName: '', //�����Ͱ� ����(��ġ)
         x1colName: '', //�����Ͱ� ���� (����)
         xcolInfo: '', //(����)db�� pause_standar_column_lable�� ���� �ǹ�
         ycolInfo: '', //(��ġ)���ǰͰ� ����
         x1colInfo: '', // (����)���ǰͰ� ����
         pauseStandarSeq:'',
         condition: 0, //����(sum,max,min,avg,count)
         reportDisplaySet:0, //��Ϲ�ư�� �������� ����("������ �����ͼ�"���� ����ȸ �Ѱ��� "�����ͼ�"���� ����ȸ�� ��츦 �����ϱ� ���Ѱ�.)
         normalDataStandardTableTitle: '',   
          //checkedColumnIndex: [],
          //selectedColumnType: {},               
          dataCode : ${dataCode}, //�ش� �ϴ� �����ͼ� �Խñ��� seq
          displaySet: ${displaySet}, //����ȸ ->��� �� ȭ�� ���� 0:�����ͼ� ���  , 1:���ǵ����ͼ� , 2:��û ���
          pauseStandarX : '', //����ȸ�� �ٷ� ǥ�õǴ� ���ְ�
         pauseStandarY : '', //����ȸ�� �ٷ� ǥ�õǴ� ��ġ��
         pauseStandarLable : '', //����ȸ�� �ٷ� ǥ�õǴ� ���ʰ�
         pauseStandarCondition : '', //����ȸ�� �ٷ� ǥ�õǴ� ���ǰ�
         pauseStandarStyle : '', //����ȸ�� �ٷ� ǥ�õǴ� �׷���
         viz_whether: '', //�ð�ȭ ����
         col1 : "pause_standar_column1",
         col2 : "pause_standar_column2",
         col3 : "pause_standar_column3",
         col4 : "pause_standar_column4",
         col5 : "pause_standar_column5",
         col6 : "pause_standar_column6",
         col7 : "pause_standar_column7",
         col8 : "pause_standar_column8",
         col9 : "pause_standar_column9",
         col10 : "pause_standar_column10",
         col1Info : "pause_standar_column1_lable",
         col2Info : "pause_standar_column2_lable",
         col3Info : "pause_standar_column3_lable",
         col4Info : "pause_standar_column4_lable",
         col5Info : "pause_standar_column5_lable",
         referenceDReportList:[], //���� ������
         fileColNameList : {},
		//���ε�� ������ Į���� Ÿ�� ����Ʈ
		 fileColTypeList : {},
		//���ε�� ������ �����Ͱ� �� ���� ��� ����Ʈ
		 fileDataList : [],
		 previewData : [],
		 vDataPreview : [], //�׷����� �ش��ϴ� �����͸� �����ش�.
	     checkedColumnIndex : [],
         type : '${typeNormalRegularly}',
          
         //�ð�ȭ ��û ����
         requestVizContent:'',
         memberCode: ${memberCode},
         memberRatingCode:${memberRatingCode},

       },
       methods: {
    	   //�����ͼ� ����ȸ�� ���̴� �����ͼ��� ������
    	   selectDataListView: function(){
               var vm = this;
             	
               $.ajax({
                  url:'/selectDataListView', //dataSetListViewController
                  data:{
                     "dataCode" : vm.dataCode,
                     "typeNormalRegular" : vm.type,
                  },
                  type:'post',
                  success: function(data){
                     console.log(data);
                     vm.normalDataInfo=data.dataDetailInfos; //�����ͼ��� ��������
                     vm.normalDataCateInfo=data.dataCategoryInfos; //�����ͼ��� ī�װ� '�Ͻ�','����'���� �Ǻ�
                     document.all.previewBar.style.display = "none";
                     
					if(vm.type == '�Ͻ�'){						
						if(vm.normalDataInfo.vizWhether=="Y"){
							//�Ͻ� �������� ��� �ð�ȭ�� ���δ�.
							vm.selectDBPreviewTitle();
							//������� �׷����� �̸� �� �� �ִ� �޼���.
 							
						}
					}
					else if(vm.type == '����'){
						$("#viz").hide();
						$("#file").hide();
						document.all.previewBar.style.display = "";
						document.all.mainVizBox.style.display = "none";
						document.all.vDb_preview.style.display = "none";
						
						vm.selectRegularPreviewList();
					}
					console.log(vm.normalDataInfo.vizWhether)
					 if(vm.normalDataInfo.vizWhether=="Y"){
                   	  if(vm.type == '�Ͻ�'){
						 vm.selectVTitle();
						 return document.all.mainVizBox.style.display = "";     //����� ���� �ð�ȭ�� ������ ���� ��ġ
                   	  }               	 
                    } else {
                   	  document.all.mainVizBox.style.display= "none";
                   	  return document.all.vDb_preview.style.display = "none";
                    }
				
                  },
                  error: function(){
                   	
                  }
               });

          },
          
          //����̸�����(�������̴� �׷��� �ƴ�.)
          selectRegularPreviewList: function(){
        	  var vm = this;
        	  $.ajax({
        		  url: '/dataManage/infoRawData',
        		  data:{
        			  "dataCode" : vm.dataCode,
        			  "dataType" : vm.type,
        		  },
        		  type: 'post',
        		  beforeSend: function(){
	    			$("#loading").show();
	    			},
	    			success: function(info){
	    				vm.infoRawDataColumn = info.infoRawDataColumn;
						vm.infoRawDataRecode = info.infoRawDataRecode;
						
						$.each(info.selectRegularTb, function(i, e) {
							vm.regularDataCode = e.regularDataCode;							
							vm.regularDataTableLoot = e.regularDataTableLoot;
							vm.regularDataTableTitle = e.regularDataTableTitle;
							vm.rD = {
								id : vm.regularDataCode,
								parent : vm.regularDataTableLoot,
								text : vm.regularDataTableTitle
							};
							vm.regularData.push(vm.rD)
						})

						$('#rawTableTree').jstree("destroy");
						$('#rawTableTree').jstree({
							'plugins' : [ "wholerow" ],
							'core' : {
								'data' : vm.regularData,
								'themes' : {
									'name' : 'proton',
									'responsive' : true
								}
							}
						});
						
						$('#rawTableTree').on("select_node.jstree", function(e, data) {
							vm.regularDataTableTitle = data.node.text;
							vm.infoRd(vm.regularDataTableTitle, vm.type);
						});
						
						vm.regularDataCode = '';
						vm.regularDataTableTitle = '';
						vm.regularDataTableLoot = '';
						vm.regularData = [];
						vm.rD = {};
						
	    			},
		    		error: function(){
		    			$("#loading").hide();
						swal({
							title: '�̸����� ����.',
		                    type: 'error',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: 'Ȯ��',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						})
		    		}
        	  })
          },
          //�ð�ȭ ������ �̸����� db ���� ������ ����
          selectDBPreviewTitle : function(){
        	  var vm = this;
        	  $.ajax({
        		  url : '/selectDBPreviewTitle',
        	  	  data : {
        	  		  "dataCode" : vm.dataCode,
        	  	  },
        	  	 type: 'post',
        	  	  success : function(data) {
     	  		  	console.log("DSafasfads"+data.normalDataTableTitle);
        	  		  vm.dbTitle = data.normalDataTableTitle; 
        	  		  vm.selectDBPreviewCol(vm.dbTitle);//������ ���� �ش��ϴ� ������ �����´�.
        	  	  },
        	  	error : function() {
					alert("������dd");
				}
        	  })
          },
          // ������ ���� �ش��ϴ� �����͸� �������� function
          selectDBPreviewCol : function(dbTitle){
        		var vm = this;
        		$.ajax({
        			url : '/selectDBPreviewCol',
        			data : {
        				"normalDataTableTitle" : dbTitle,
        			},
        			 type: 'post',
        			success: function(data){       			
        				$.grep(data.columnList,function(value, index){
        					vm.dbData.push("`"+value.columnNme+"`");
        					console.log("�����´ٰ����´�"+vm.dbData);
        					vm.vColumnList.push(value.columnNme);
        				});
        				
        				var changeData = vm.dbData.toString(); //������ dbData�� String ���·� ��ȯ�� changeData ������ ��´�.
        				console.log("�����´ٰ����´�"+changeData);
        				vm.selectDBdataList(changeData,dbTitle);
      
        			},
        			error : function() {
						alert("������dd");
					}
        		})
          },
          //�ð�ȭ�� �׷����� �����͸� �����ִ� function.
          selectDBdataList : function(changeData, dbTitle){
        	  var vm = this;
        	  $.ajax({
        		  url: '/selectDBdataList',
        	  	  data: {
        	  		  "changeData" : changeData,
        	  		  "normalDataTableTitle" : dbTitle,
        	  	  },
        	  	 type: 'post',
        	  	  success : function(data){
        	  		  vm.vDataPreview = data;
        	  	  }
        	  })
          },
 		//���̺����� ���� raw�����ͷ��ڵ� ��ȸ
		infoRd : function(title,type) {
			var vm = this;
			$.ajax({
				url : '/dataManage/infoRd',
				data : {
					"normalDataTableTitle" : title,
					"dataType" : type,
				},
				type : 'post',
				beforeSend: function(){
					$("#loading").show();
				},
				success : function(info) {
					$("#loading").hide();
					vm.infoRawDataColumn = info.infoRawDataColumn;
					vm.infoRawDataRecode = info.infoRawDataRecode;

				},
				error : function() {
					$("#loading").hide();
					swal({
						title: 'raw������ ��ȸ ����.',
		                   type: 'error',
		                   confirmButtonColor: '#3085d6',
		                   confirmButtonText: 'Ȯ��',
		                   confirmButtonClass: 'btn',
		                   allowOutsideClick:false,
					       allowEscapeKey:false,
					})
				}
			})
		},
			
          //�Ͻù̸�����
//           selectFilePreviewList: function(){
// 	    		var vm = this;
// 	    		$.ajax({
// 	    			url:'/dataSetCreatePea/selectFilePreviewList',
// 	    			data:{
// 	    				"dataCode" : vm.dataCode,
// 	    			},
// 	    			type:'post',
// 	    			success: function(list){
// 	    				vm.fileColNameList = list.columnNameList;
// 	    				vm.fileColTypeList = list.columnTypeList;
// 	    				vm.fileDataList = list.dataValueLists;
// 	    				vm.previewData = list.previewList;
// 	    				vm.checkedColumnIndex = list.dataIndexList;
// //	    				vm.selectedColumnType = list.columnTypeList;
	    				
// 	    				console.log(vm.fileColTypeList);
// //	    				console.log(vm.fileColNameList);
// //	    				console.log(vm.fileDataList);
// //	    				console.log(vm.checkedColumnIndex);
// 	    			},
// 	    			beforeSend: function(){
// 	    				$("#loading").show();
// 	    			},
// 	    			complete: function(){
// 	    				$('#loading').hide();
// 	    			},
// 	    			error: function(){
	    				
// 	    			}
// 	    		});
// 	    	},
          //���(�����ͼ� ������� ����)
          dataSetList : function(){
             var vm = this;
             console.log(vm.displaySet);
             if(vm.displaySet == 1){
                window.location.href="/dataSet/mydataList";
             }
             if(vm.displaySet == 2){
                window.location.href="/myData/listMyCollectList?tabType="+4;
             }
             if(vm.displaySet == 0){
                window.location.href="/dataSet/dataSetList";
             }
          },
          //�ð�ȭ ��û
          requestDataSetViz: function(){
           
            var vm = this;
            swal({
               title: "�ð�ȭ ��û �Ͻðڽ��ϱ�?",
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: '���ư���',
                    confirmButtonText: '��û�ϱ�',
                    confirmButtonClass: 'btn',
                    cancelButtonClass: 'btn btn-cencle',
                    allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
                    allowEscapeKey:false, //esc ������ �� ������
                    
               }).then(function(isConfirm){
                  if(isConfirm){
                  $.ajax({
                  url: "/updateDataSetRequestViz",       
                    data :{
                      "dataCode" : vm.dataCode,
                      "requestVizContent" : vm.requestVizContent,
                    },
                    type:'post',
                    success: function(){
                       swal({
                              title: "�ð�ȭ ��û �Ϸ�",
                              type: 'success',
                              confirmButtonColor: '#3085d6',
                              confirmButtonText: 'Ȯ��',
                              confirmButtonClass: 'btn',
                              allowOutsideClick:false,
                           allowEscapeKey:false,
                     }).then(function(isConfirm){
                        if(isConfirm){
                           window.location.href="/dataSet/dataSetList";
                        }
                     }).catch(swql.noop);
                    },
                    error : function(){
                       swal({
                          title: "�ð�ȭ ��û ����",
                        type: 'error',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'Ȯ��',
                        confirmButtonClass: 'btn',
                        })
                       }
                    })
               }
            }).catch(swql.noop);
          },
          //�������� ���ϴ�.
           reportInfoView: function(code){
             
              $("#pageChange").html(
                      "<input type='hidden' name='reportCode' value="+code+">"
                      +"<input type='hidden' name='reportDisplaySet' value="+vm.reportDisplaySet+">"
                    );
                    $("#pageChange").attr("action","/report/reportView");
                    $("#pageChange").submit();
             },
          //������ �ٿ�ε�
          selectDFileDownload: function(){
             var vm = this;
              $.fileDownload("/selectDFileDownload", {
                 httpMethod:"POST",
               aync: false,
               data: {
                  "filePath" : vm.normalDataInfo.filePath,
                  "fileOriginalName" : vm.normalDataInfo.fileOriginalName
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
          //selectbox ����� script, ���⼭ �ð�ȭ ������ ������ �׷����� �ٷ� ���δ�.
         makeSelectBox : function() {      
         var vm = this;            
         $.ajax({
            url: "/getSelectBox", //datasetVizAjaxController
            type : "post",
            data : {
               "dataCode" : vm.dataCode,
            },
            async: false,
            success : function(list){                                    
               vm.columnList = list;   
                                        
               for (var i = 0; i<list.length; i++){
               
                  if(list[i].pauseStandarStyle == 1){
                     //����ȸ�� �ٷκ��̴� ����Ʈ 1
                     vm.selectBarChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 2) {
                     //����ȸ�� �ٷκ��̴� ������Ʈ 2
                     vm.selectLineChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 3){
                     //����ȸ�� �ٷκ��̴� ������Ʈ 3
                     vm.selectAreaChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  }else if (list[i].pauseStandarStyle == 4) {
                     //����ȸ�� �ٷκ��̴� ������Ʈ 4
                     vm.selectPieChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 5) {
                     //����ȸ�� �ٷκ��̴� ������Ʈ 5
                     vm.selectDonutChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 6) {
                     //����ȸ�� �ٷκ��̴� �׷����Ʈ 6
                     vm.selectGroupBarChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarLable, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 7) {
                     //����ȸ�� �ٷκ��̴� ���߶�����Ʈ 7
                     vm.selectStackAreaChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarLable, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  }   
                  
                  //������ ������ ��(null)�� ��� ����
                  if(list[i].pauseStandarColumn1 == null){                                       
                     $("#col1").remove();
                  }
                  if(list[i].pauseStandarColumn2 == null){                                       
                     $("#col2").remove();
                  }
                  if(list[i].pauseStandarColumn3 == null){                                          
                     $("#col3").remove();
                  }
                  if(list[i].pauseStandarColumn4 == null){                                        
                     $("#col4").remove();
                  }
                  if(list[i].pauseStandarColumn5 == null){                                          
                     $("#col5").remove();
                  }
                  if(list[i].pauseStandarColumn6 == null){                                          
                     $("#col6").remove();
                  }
                  if(list[i].pauseStandarColumn7 == null){                                         
                     $("#col7").remove();
                  }
                  if(list[i].pauseStandarColumn8 == null){                                          
                     $("#col8").remove();
                  }
                  if(list[i].pauseStandarColumn9 == null){                                       
                     $("#col9").remove();
                  }
                  if(list[i].pauseStandarColumn10 == null){                                         
                     $("#col10").remove();
                  }
               }
            },
             error:function(request,status,error){ //ajax �����ΰ��  
                   //  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            })
         },
         //����, ��ġ, ���ʸ� ������ ��� Ǫ��������(��ī�̺�� ����) �ڽ��� ���� function
         takeXValue: function (xcol,xseq,xInfo){
               $("#xcolTitle").empty(); //Ŭ���� ���� xcolTitle�� �̸��� lable �� �ִ� ���� ����.
                 $("#xcolTitle").append(xcol); //�״��� ������ ��(xcol)�� xcolTitle�� ��´�.
                 this.xcolName = xseq; //������ xseq���� xcolNamedp ��´�.
                 this.xcolInfo = xInfo; //������ ���� xInfo ���� ��´�.
                 console.log(this.xcolName);
                 console.log(this.xcolInfo);
         },
         takeYValue: function (ycol,yseq,yInfo){
               $("#ycolTitle").empty();
                 $("#ycolTitle").append(ycol);
                 this.ycolName = yseq;
                 this.ycolInfo = yInfo;
                 console.log(this.ycolInfo);
         },
         takeZValue: function (zcol,z1col,z1Info){
               $("#x1colTitle").empty();
                 $("#x1colTitle").append(zcol);
                 this.x1colName = z1col;
                 this.x1colInfo = z1Info;
                 console.log(this.x1colInfo);
         },
         //X��ư ������ ����Ǵ� function
         delXValue: function (){ 
        	 $("#xcolTitle").empty();
        	 this.xcolName = '';
        	 this.xcolInfo = '';
        	 console.log(this.xcolName);
        	 
         },
         delYValue: function (){
        	 $("#ycolTitle").empty();
        	 this.ycolName = '';
        	 this.ycolInfo = '';
        	  console.log(this.ycolName);
         },
         delZValue: function (){
        	 $("#x1colTitle").empty();
        	 this.x1colName = '';
        	 this.x1colInfo = '';
        	  console.log(this.x1colName);
         },
         //�������� ��Ÿ���� function
         selectReferenceDReportList: function(){
             var vm = this;
             $.ajax({
                url:'/selectDReferenceReportList',
                data:{
                   "dataCode" : vm.dataCode,
                },
                type:'post',
                success: function(list){
                   console.log(list);
                   vm.referenceDReportList = list;
                }
             });
          },
         //����, ����, ��ġ, ���� �ٷ� �ҷ�����
         selectVTitle : function(){
        	 var vm = this;
        	 $.ajax({
        		 url:"/selectVTitle",
        		 data : { 
        			 "dataCode" : vm.dataCode,
        		 },
        		 type: "post",
        		 success : function(list){      			
        				 $("#xcolTitle").append(list.pauseStandarX);
        				 $("#ycolTitle").append(list.pauseStandarY);
        				 $("#x1colTitle").append(list.pauseStandarLable);
        				
        				 vm.xcolName = list.vizPauseStandarX;
        				 vm.ycolName = list.vizPauseStandarY;
        				 vm.x1colName = list.vizPauseStandarLable;
        				 vm.xcolInfo = list.vizPauseStadarXInfo;
        				 vm.x1colInfo = list.vizPauseStadarX1Info;
        				vm.condition = list.pauseStandarCondition; 
        				console.log(this.xcolName);
        			 }        			 
        		
        	 })
         },
         //����ȸ�� ���̴� Bar-Chart
         selectBarChart : function(x, y,condition, seq, title) {
            var vm = this;      
            $.ajax({
               url: "/selectBLChart",
               data : {
                  "xcolName" : x,
                  "ycolName" : y,
                  "condition" : condition,
                  "pauseStandarSeq" : seq,
                  "normalDataStandardTableTitle" : title,
               },
               type: "post",
               success : function(list) {
                  console.log(list);
                  new d3plus.BarChart()
                  .select("#graph")
                  .data(list)
                  .x("xcolName")
                  .y("ycolName")
                  .color("ycolName")
                  .tooltipConfig({
                           body: function(d) {
                              var table = "<table class = 'tooltip-table'>";
                              table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                              table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                              table += "</table>";
                              return table;
                           },
                        })
                  .render();
               },
                error:function(request,status,error){ //ajax �����ΰ��  
                   //     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
                 
         //����ȸ�� �ٷκ��̴� ������Ʈ
//          selectLineChart : function(x, y,condition, seq, title) {
//             var vm = this;      
//             $.ajax({
//                url: "/selectBLChart",
//                data : {
//                   "xcolName" : x,
//                   "ycolName" : y,
//                   "condition" : condition,
//                   "pauseStandarSeq" : seq,
//                   "normalDataStandardTableTitle" : title,
//                },
//                type: "post",
//                success : function(list) {
//                   new d3plus.LinePlot()
//                   .select("#graph")
//                   .data(list)
//                   .x("xcolName")
//                   .y("ycolName")
//                   .color("ycolName")
//                   .tooltipConfig({
//                      body: function(d) {
//                         var table = "<table class = 'tooltip-table'>";
//                         table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
//                         table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
//                         table += "</table>";
//                         return table;
//                      },
//                   })
//                   .render();
//                },
//                 error:function(request,status,error){ //ajax �����ΰ��  
//                       //  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//                  }
//             });
//          },
         
         
         selectAreaChart : function(x, y,condition, seq, title) {
             var vm = this;      
             $.ajax({
                url: "/selectBLChart",
                data : {
                   "xcolName" : x,
                   "ycolName" : y,
                   "condition" : condition,
                   "pauseStandarSeq" : seq,
                   "normalDataStandardTableTitle" : title,
                },
                type: "post",
                success : function(list) {
                   new d3plus.AreaPlot()
                   .select("#graph")
                   .data(list)
                   .x("xcolName")
                   .y("ycolName")
                   .color("ycolName")
                   .tooltipConfig({
                      body: function(d) {
                         var table = "<table class = 'tooltip-table'>";
                         table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                         table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                         table += "</table>";
                         return table;
                      },
                   })
                   .render();
                },
                 error:function(request,status,error){ //ajax �����ΰ��  
                      //   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  }
             });
          },
         
         
         //����ȸ�� ���̴� Pie-Chart
         selectPieChart : function(x, y, condition, seq, title) {
            console.log(title);
            var vm = this;      
            $.ajax({
               url: "/selectPDChart",
               data : {
                  "xcolName" : x,
                  "ycolName" : y,
                  "condition" : condition,
                  "pauseStandarSeq" : seq,
                  "normalDataStandardTableTitle" : title,
               },
               type: "post",
               success : function(list) {
                  console.log(list);
                    new d3plus.Pie()
                        .select("#graph")
                         .data(list)                           
                         .groupBy(["xcolName"])
                         .value("ycolName")
                         .tooltipConfig({
                        body: function(d) {
                           var table = "<table class = 'tooltip-table'>";
                           table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                           table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                           table += "</table>";
                           return table;
                        },
                     })
                         .render();    
               },
                error:function(request,status,error){ //ajax �����ΰ��  
                  //      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         
         //����ȸ�� ���̴� Donut-Chart
         selectDonutChart : function(x, y,condition, seq, title) {
            var vm = this;      
            $.ajax({
               url: "/selectPDChart",
               data : {
                  "xcolName" : x,
                  "ycolName" : y,
                  "condition" : condition,
                  "pauseStandarSeq" : seq,
                  "normalDataStandardTableTitle" : title,
               },
               type: "post",
               success : function(list) {
                  console.log(list);
                    new d3plus.Donut()
                        .select("#graph")
                         .data(list)                           
                         .groupBy(["xcolName"])
                         .value("ycolName")
                         .tooltipConfig({
                        body: function(d) {
                           var table = "<table class = 'tooltip-table'>";
                           table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                           table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                           table += "</table>";
                           return table;
                        },
                     })
                         .render();    
               },
                error:function(request,status,error){ //ajax �����ΰ��  
                     //   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         //����ȸ�� ���̴� groupBar      
         selectGroupBarChart : function(x, y, z, condition, seq, title) {
            console.log(z);
            var vm = this;      
            $.ajax({
               url: "/selectGChart",
               data : {
                  "xcolName" : x,
                  "x1colName" : z,
                  "ycolName" : y,
                  "condition" : condition,
                  "pauseStandarSeq" : seq,
                  "normalDataStandardTableTitle" : title,
               },
               type: "post",
               success : function(list) {
                  console.log(list);
                     new d3plus.BarChart()
                     .select("#graph")                        
                     .data(list)                                                            
                     .tooltipConfig({
                        body: function(d) {
                           var table = "<table class = 'tooltip-table'>";
                           table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.x + "</td></tr>";
                           table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.y + "</td></tr>";
                           table += "</table>";
                           return table;
                        },
                        
                        title : function(d){
                           var txt = d.id;
                           return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();;
                        }
                     })
                   .render()         
               },
                error:function(request,status,error){ //ajax �����ΰ��  
                     //   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         
         //����ȸ�� ���̴� ���� LineChart      
         selectStackAreaChart : function(x, y, z, condition, seq, title) {
            console.log(z);
            var vm = this;      
            $.ajax({
               url: "/selectGChart",
               data : {
                  "xcolName" : x,
                  "x1colName" : z,
                  "ycolName" : y,
                  "condition" : condition,
                  "pauseStandarSeq" : seq,
                  "normalDataStandardTableTitle" : title,
               },
               type: "post",
               success : function(list) {
                  console.log(list);
                     new d3plus.LinePlot()
                     .select("#graph")                        
                     .data(list)
                     .shapeConfig({
                    	 Line: {
                    		 strokeLinecap : "round",
                    		 strokeWidth: 6
                    	 }
                     })
                     .tooltipConfig({
                        body: function(d) {
                           var table = "<table class = 'tooltip-table'>";
                           table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.x + "</td></tr>";
                           table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.y + "</td></tr>";
                           table += "</table>";
                           return table;
                        },
                        
                        title : function(d){
                           var txt = d.id;
                           return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();;
                        }
                     })
                   .render()         
               },
                error:function(request,status,error){ //ajax �����ΰ��  
                      //  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         //���⼭���� Ŭ���ϸ� ����       
         //bar-chart
         makeChartView : function(seq, titles, condition){
             $('svg').html("");
             var vm = this;      
            console.log(condition);
            console.log(vm.condition);
            $.ajax({                  
               url: "/makeChartView",
               data:{
                  "xcolName" : vm.xcolName,
                  "ycolName" : vm.ycolName,
                  "xcolInfo" : vm.xcolInfo,
                  "ycolInfo" : vm.ycolInfo,
                  "pauseStandarSeq" : seq,
                  "normalDataStandardTableTitle" : titles,
                  "condition" : condition,
               }, 
               type: "post",
               beforeSend: function(){
                  $("#loading").show();
                },
               success : function(list){
                  //alert(JSON.stringify(list));
                  //vm.test = alist;
                  console.log(list);               
                        new d3plus.BarChart()
                        .select("#graph")
                        .data(list)
                         .x("xcolName")
                         .y("ycolName")
                         .tooltipConfig({
                           body: function(d) {
                              var table = "<table class = 'tooltip-table'>";
                              table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                              table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                              table += "</table>";
                              return table;
                           },
                        })
                        .color("ycolName")
                        .render();
               },
                error:function(request,status,error){ //ajax �����ΰ��     
                  alert("Bar-Chart���� ����")
                 }
            });
         },
         // line-chart
//          lineChartView : function(seq, titles, condition){
//              $('svg').html("");
//              var vm = this;
//             //var queryString = $("form[name=mins]").serialize();      
//             //var barColor = d3.interpolateViridis;      
//             $.ajax({
                     
//                url: "/makeChartView",
//                data:{
//                   "xcolName" : vm.xcolName,
//                   "ycolName" : vm.ycolName,
//                   "xcolInfo" : vm.xcolInfo,
//                   "ycolInfo" : vm.ycolInfo,
//                   "pauseStandarSeq" : seq,
//                   "normalDataStandardTableTitle" : titles,
//                   "condition" : condition,
//                }, 
//                type: "post",
//                success : function(list){
                  
//                   console.log(list);
//                         new d3plus.LinePlot()
//                         .select("#graph")
//                         .data(list)
//                         .x("xcolName")
//                         .y("ycolName")
//                         .color("ycolName")
//                         .tooltipConfig({
//                            body: function(d) {
//                               var table = "<table class = 'tooltip-table'>";
//                               table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
//                               table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
//                               table += "</table>";
//                               return table;
//                            },
//                         })
//                         .render();
                                                      
//                      },
//                 error:function(request,status,error){ //ajax �����ΰ��  
//                    alert("Line-Chart���� ����")
//                        }                        
//                 })                              
//             },
            
            // area-chart
            areaChartView : function(seq, titles, condition){
                $('svg').html("");
                var vm = this;
               //var queryString = $("form[name=mins]").serialize();      
               //var barColor = d3.interpolateViridis;      
               $.ajax({
                        
                  url: "/makeChartView",
                  data:{
                     "xcolName" : vm.xcolName,
                     "ycolName" : vm.ycolName,
                     "xcolInfo" : vm.xcolInfo,
                     "ycolInfo" : vm.ycolInfo,
                     "pauseStandarSeq" : seq,
                     "normalDataStandardTableTitle" : titles,
                     "condition" : condition,
                  }, 
                  type: "post",
                  success : function(list){
                     
                     console.log(list);
                           new d3plus.AreaPlot()
                           .select("#graph")
                           .data(list)
                           .x("xcolName")
                           .y("ycolName")
                           .color("ycolName")
                           .tooltipConfig({
                              body: function(d) {
                                 var table = "<table class = 'tooltip-table'>";
                                 table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                                 table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                                 table += "</table>";
                                 return table;
                              },
                           })
                           .render();
                                                         
                        },
                   error:function(request,status,error){ //ajax �����ΰ��  
                      alert("Area-Chart���� ����")
                          }                        
                   })                              
               },
                        
            //   ������Ʈ ����
               pieChartView : function(seq, titles, condition){
                      $('svg').html("");
                      var vm = this;         
                     $.ajax({
                              
                        url: "/pieChartView",
                        data:{
                           "xcolName" : vm.xcolName,
                           "ycolName" : vm.ycolName,
                           "xcolInfo" : vm.xcolInfo,
                           "ycolInfo" : vm.ycolInfo,
                           "pauseStandarSeq" : seq,
                           "normalDataStandardTableTitle" : titles,
                       "condition" : condition,
                        }, 
                        type: "post",            
                        success : function(list){
                           
                              console.log(list);
                           new d3plus.Pie()
                                 .select("#graph")
                                 .data(list)                           
                                 .groupBy(["xcolName"])
                                 .value("ycolName")                              
                                 .tooltipConfig({
                              body: function(d) {
                                 var table = "<table class = 'tooltip-table'>";
                                 table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                                 table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                                 table += "</table>";
                                 return table;
                              },
                           })
                                 .render();                                                      
                           
                               },
                                error:function(request,status,error){ //ajax �����ΰ��  
                                   alert("Pie-Chart���� ����")
                                 }
                                        
                             })                              
                         },
                              
               // ���� ��Ʈ ����                     
               donutChartView : function(seq, titles, condition){
                   $('svg').html("");
                   var vm = this;
                  //var queryString = $("form[name=mins]").serialize();      
                  $.ajax({
                           
                     url: "/pieChartView",
                     data:{
                        "xcolName" : vm.xcolName,
                        "ycolName" : vm.ycolName,
                        "xcolInfo" : vm.xcolInfo,
                        "ycolInfo" : vm.ycolInfo,
                        "pauseStandarSeq" : seq,
                        "normalDataStandardTableTitle" : titles,
                        "condition" : condition,
                     }, 
                     type: "post",            
                     success : function(list){
                              
                           console.log(list);
                              new d3plus.Donut()
                                    .select("#graph")
                                    .data(list)                           
                                    .groupBy(["xcolName"])
                                    .value("ycolName")
                                    .tooltipConfig({
                                 body: function(d) {
                                    var table = "<table class = 'tooltip-table'>";
                                    table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                                    table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                                    table += "</table>";
                                    return table;
                                 },
                              })
                                    .render();                                                                                          
                                       //���� ��Ʈ ��
                              },
                               error:function(request,status,error){ //ajax �����ΰ��  
                                  alert("Donut-Chart���� ����")
                                }
                                       
                            })                              
                        },
                              
               //�׷�� ��Ʈ ������ ����
               groupChartView : function(seq, titles, condition){
                   $('svg').html("");
                   var vm = this;
                  //var queryString = $("form[name=mins]").serialize();      
                  $.ajax({
                           
                     url: "/groupChartView",
                     data:{
                        "xcolName" : vm.xcolName,               
                        "x1colName" : vm.x1colName,
                        "ycolName" : vm.ycolName,
                        "xcolInfo" : vm.xcolInfo,
                        "ycolInfo" : vm.ycolInfo,
                        "x1colInfo" : vm.x1colInfo,
                        "pauseStandarSeq" : seq,
                        "normalDataStandardTableTitle" : titles,
                        "condition" : condition,
                     }, 
                     type: "post",            
                     success : function(groupMap){
                        console.log(groupMap);
                        
                        new d3plus.BarChart()
                        .select("#graph")                        
                        .data(groupMap)                                                            
                        .tooltipConfig({
                           body: function(d) {
                              var table = "<table class = 'tooltip-table'>";
                              table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.x + "</td></tr>";
                              table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.y + "</td></tr>";
                              table += "</table>";
                              return table;
                           },
                           
                           title : function(d){
                              var txt = d.id;
                              return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();;
                           }
                        })
                      .render()                     
                     },
                      error:function(request,status,error){ //ajax �����ΰ��  
                         alert("Groupbar-Chart���� ���� : ���ָ� ���� �Ͻʽÿ�.")
                       }                                             
                   })                              
               },                              
               //����lineChart
               stackAreaChartView : function(seq, titles, condition){
                   $('svg').html("");
                   var vm = this;
                  //var queryString = $("form[name=mins]").serialize();      
                  $.ajax({
                           
                     url: "/groupChartView",
                     data:{
                        "xcolName" : vm.xcolName,               
                        "x1colName" : vm.x1colName,
                        "ycolName" : vm.ycolName,
                        "xcolInfo" : vm.xcolInfo,
                        "ycolInfo" : vm.ycolInfo,
                        "x1colInfo" : vm.x1colInfo,
                        "pauseStandarSeq" : seq,
                        "normalDataStandardTableTitle" : titles,
                        "condition" : condition,
                     }, 
                     type: "post",            
                     success : function(groupMap){
                        console.log(groupMap);
                        
                        new d3plus.LinePlot()
                        .select("#graph")                        
                        .data(groupMap)
                        .shapeConfig({
                       	 Line: {
                       		 strokeLinecap : "round",
                       		 strokeWidth: 6
                       	 }
                        })
                        .tooltipConfig({
                           body: function(d) {
                              var table = "<table class = 'tooltip-table'>";
                              table += "<tr><td class  ='title'>x��:</td><td class='groupMap'>" + d.x + "</td></tr>";
                              table += "<tr><td class  ='title'>y��:</td><td class='groupMap'>" + d.y + "</td></tr>";
                              table += "</table>";
                              return table;
                           },
                           
                           title : function(d){
                              var txt = d.id;
                              return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();;
                           }
                        })
                      .render()                    
                     },
                      error:function(request,status,error){ //ajax �����ΰ��  
                         alert("���� LineChart ���� ���� : ���ָ� ���� �Ͻʽÿ�.");
                       }                                             
                   })                              
               },
          dataSetDelete:function(code){
	      	var vm = this;
	      	alert("�����ڵ� = "+code);
	      	alert("vm.dataCode= "+vm.dataCode);
			swal({
				title: "������ ���� ���� ���� �Ͻðڽ��ϱ�?",
		        type: 'question',
		        showCancelButton: true,
		        confirmButtonColor: '#3085d6',
		        cancelButtonColor: '#d33',
		        confirmButtonText: '�����ϱ�',
		        cancelButtonText: '���ư���',
		        confirmButtonClass: 'btn',
		        cancelButtonClass: 'btn btn-cencle',
		        allowOutsideClick:false, //�ۿ� Ŭ���ص� �� ������
		        allowEscapeKey:false, //esc ������ �� ������
		        
			}).then(function(isConfirm){
				if(isConfirm){
					alert(vm.dataCode);
					$.ajax({
						url:"/deleteDataSet", 		
					  	data :{
						  "dataCode":vm.dataCode,
					  	},
					  	type:'post',
					  	success: function(){
					  		swal({
               					title: "������ �� ���� �Ϸ�",
		                   		type: 'success',
		                   		confirmButtonColor: '#3085d6',
		                   		confirmButtonText: 'Ȯ��',
		                   		confirmButtonClass: 'btn',
		                   		allowOutsideClick:false,
						        allowEscapeKey:false,
							}).then(function(isConfirm){
								if(isConfirm){
									window.location.href="/dataSet/dataSetList";
								}
							}).catch(swql.noop);
				    		  	},
				    		  	error : function(){
						  		  	swal({
					                	title: "������ �� ���� ����",
				                   		type: 'error',
				                   		confirmButtonColor: '#3085d6',
				                   		confirmButtonText: 'Ȯ��',
				                   		confirmButtonClass: 'btn',
									})
				    		  	}
				   		  	})
						}
				}).catch(swql.noop);
          	}
       },       
       filters: {
       },
       watch: {   
       },
       mounted: function () {
         var vm = this;
         vm.selectDataListView();
         console.log(vm.normalDataInfo.memberCode);
         console.log(vm.normalDataInfo);
         console.log(vm.memberCode);
         vm.makeSelectBox();
         vm.selectReferenceDReportList();
       },
    });
   
   $(document).ready(function(){
	   	var type = '${typeNormalRegularly}';
		if(type == '�Ͻ�'){
		   $("#file_table").hide();
		   $("#up_icon").hide();
		      
		   $(".file_preview").click(function(){
	       $("#file_table").toggle();
		   $("#up_icon").toggle();
	       $("#down_icon").toggle();
//		          $("#down_icon").css("display","none");
//		          $("#up_icon").css("display","block");
		  });
		}
		   else if(type == '����'){
		          $("#file_table").hide();
		          $("#up_icon").hide();
		          $("#styleK").hide();
		          
		          $(".file_preview").click(function(){
		              $("#regularPreview").toggle();
		             $("#up_icon").toggle();
		              $("#down_icon").toggle();
		              $("#styleK").toggle();
		          });
		       }
		    });  
		       $(document).ready(function(){
//		          var type = '${typeNormalRegularly}';
//		       if(type == '�Ͻ�'){
		         $("#vData_table").hide();
		         $("#vDataUp_icon").hide();
		         $("#styleK").hide();
		         
		         $(".vDb_preview").click(function(){
		          $("#vData_table").toggle();
		         $("#vDataUp_icon").toggle();
		          $("#vDataDown_icon").toggle();
		          $("#styleK").toggle()
		        });
		      //}      
		    });  
</script>