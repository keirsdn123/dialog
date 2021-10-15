<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 799번째줄 부터 클릭시 그래프 생성 -->


<script>
   var vm = new Vue({
       el:"#datalistView" ,
       data: {
        dbDatasetColNmeList : [],
		infoRawDataColumn : [], //raw데이터 컬럼(정기)
		infoRawDataRecode : [], //raw데이터 레코드 리스트(정기)
		regularDataCode : '', //정기테이블seq
		regularDataTableLoot : '', //정기테이블 관계
		regularDataTableTitle : '', //정기테이블명
		rD : {}, //정기테이블 정보
		regularData : [], //정기테이블 정보 리스트
		dbTitle : {}, //가져온 db 타이틀
		dbData : [], // 가져온 db 데이터
		changeData: [], // 바뀐 데이터
    	normalDataInfo : {},
        normalDataCateInfo : {},          
        fileColNameList : {},
        fileColTypeList : {},
        fileDataList : [],
        columnList: {}, //데이터 미리보기
       //columnInfo: {},
        columnNme : [], //columnList 안에 있는 첫행에 있는 이름
        vColumnList : [], //칼럼리스트
        // columnName: '',      
         list: [],
         xcolName: '', //(범주)db의 pause_standar_column1 의 값을 가지고 있다. 사실상 범주 값에서 선택한 값을 의미한다.
         ycolName: '', //위에것과 동일(수치)
         x1colName: '', //위에것과 동일 (범례)
         xcolInfo: '', //(범주)db의 pause_standar_column_lable의 값을 의미
         ycolInfo: '', //(수치)위의것과 동일
         x1colInfo: '', // (범례)위의것과 동일
         pauseStandarSeq:'',
         condition: 0, //조건(sum,max,min,avg,count)
         reportDisplaySet:0, //목록버튼을 눌렀을때 사용됨("나만의 데이터셋"에서 상세조회 한경우와 "데이터셋"에서 상세조회한 경우를 구분하기 위한것.)
         normalDataStandardTableTitle: '',   
          //checkedColumnIndex: [],
          //selectedColumnType: {},               
          dataCode : ${dataCode}, //해당 하는 데이터셋 게시글의 seq
          displaySet: ${displaySet}, //상세조회 ->목록 시 화면 지정 0:데이터셋 목록  , 1:나의데이터셋 , 2:요청 목록
          pauseStandarX : '', //상세조회시 바로 표시되는 범주값
         pauseStandarY : '', //상세조회시 바로 표시되는 수치값
         pauseStandarLable : '', //상세조회시 바로 표시되는 범례값
         pauseStandarCondition : '', //상세조회시 바로 표시되는 조건값
         pauseStandarStyle : '', //상세조회시 바로 표시되는 그래프
         viz_whether: '', //시각화 여부
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
         referenceDReportList:[], //연관 보고서값
         fileColNameList : {},
		//업로드된 파일의 칼럼별 타입 리스트
		 fileColTypeList : {},
		//업로드된 파일의 데이터가 행 별로 담긴 리스트
		 fileDataList : [],
		 previewData : [],
		 vDataPreview : [], //그래프에 해당하는 데이터를 보여준다.
	     checkedColumnIndex : [],
         type : '${typeNormalRegularly}',
          
         //시각화 요청 설명
         requestVizContent:'',
         memberCode: ${memberCode},
         memberRatingCode:${memberRatingCode},

       },
       methods: {
    	   //데이터셋 상세조회시 보이는 데이터셋의 정보들
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
                     vm.normalDataInfo=data.dataDetailInfos; //데이터셋의 상세정보들
                     vm.normalDataCateInfo=data.dataCategoryInfos; //데이터셋의 카테고리 '일시','정기'인지 판별
                     document.all.previewBar.style.display = "none";
                     
					if(vm.type == '일시'){						
						if(vm.normalDataInfo.vizWhether=="Y"){
							//일시 데이터일 경우 시각화가 보인다.
							vm.selectDBPreviewTitle();
							//만들엊인 그래프를 미리 볼 수 있는 메서드.
 							
						}
					}
					else if(vm.type == '정기'){
						$("#viz").hide();
						$("#file").hide();
						document.all.previewBar.style.display = "";
						document.all.mainVizBox.style.display = "none";
						document.all.vDb_preview.style.display = "none";
						
						vm.selectRegularPreviewList();
					}
					console.log(vm.normalDataInfo.vizWhether)
					 if(vm.normalDataInfo.vizWhether=="Y"){
                   	  if(vm.type == '일시'){
						 vm.selectVTitle();
						 return document.all.mainVizBox.style.display = "";     //정기는 현재 시각화가 없으니 여기 위치
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
          
          //정기미리보기(데이터이다 그래프 아님.)
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
							title: '미리보기 실패.',
		                    type: 'error',
		                    confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						})
		    		}
        	  })
          },
          //시각화 데이터 미리보기 db 제목 가지고 오기
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
        	  		  vm.selectDBPreviewCol(vm.dbTitle);//가져온 제목에 해당하는 정보를 가져온다.
        	  	  },
        	  	error : function() {
					alert("에러다dd");
				}
        	  })
          },
          // 가져온 제목에 해당하는 데이터를 가져오는 function
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
        					console.log("가져온다가져온다"+vm.dbData);
        					vm.vColumnList.push(value.columnNme);
        				});
        				
        				var changeData = vm.dbData.toString(); //가져온 dbData를 String 형태로 변환후 changeData 변수에 담는다.
        				console.log("가져온다가져온다"+changeData);
        				vm.selectDBdataList(changeData,dbTitle);
      
        			},
        			error : function() {
						alert("에러다dd");
					}
        		})
          },
          //시각화된 그래프의 데이터를 보여주는 function.
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
 		//테이블구조에 따른 raw데이터레코드 조회
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
						title: 'raw데이터 조회 실패.',
		                   type: 'error',
		                   confirmButtonColor: '#3085d6',
		                   confirmButtonText: '확인',
		                   confirmButtonClass: 'btn',
		                   allowOutsideClick:false,
					       allowEscapeKey:false,
					})
				}
			})
		},
			
          //일시미리보기
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
          //목록(데이터셋 목록으로 가기)
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
          //시각화 요청
          requestDataSetViz: function(){
           
            var vm = this;
            swal({
               title: "시각화 요청 하시겠습니까?",
                    type: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: '돌아가기',
                    confirmButtonText: '요청하기',
                    confirmButtonClass: 'btn',
                    cancelButtonClass: 'btn btn-cencle',
                    allowOutsideClick:false, //밖에 클릭해도 안 없어짐
                    allowEscapeKey:false, //esc 눌러도 안 없어짐
                    
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
                              title: "시각화 요청 완료",
                              type: 'success',
                              confirmButtonColor: '#3085d6',
                              confirmButtonText: '확인',
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
                          title: "시각화 요청 실패",
                        type: 'error',
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: '확인',
                        confirmButtonClass: 'btn',
                        })
                       }
                    })
               }
            }).catch(swql.noop);
          },
          //보고서으로 갑니다.
           reportInfoView: function(code){
             
              $("#pageChange").html(
                      "<input type='hidden' name='reportCode' value="+code+">"
                      +"<input type='hidden' name='reportDisplaySet' value="+vm.reportDisplaySet+">"
                    );
                    $("#pageChange").attr("action","/report/reportView");
                    $("#pageChange").submit();
             },
          //데이터 다운로드
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
          //selectbox 만드는 script, 여기서 시각화 생성때 선택한 그래프가 바로 보인다.
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
                     //상세조회시 바로보이는 바차트 1
                     vm.selectBarChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 2) {
                     //상세조회시 바로보이는 라인차트 2
                     vm.selectLineChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 3){
                     //상세조회시 바로보이는 영역차트 3
                     vm.selectAreaChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  }else if (list[i].pauseStandarStyle == 4) {
                     //상세조회시 바로보이는 파이차트 4
                     vm.selectPieChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 5) {
                     //상세조회시 바로보이는 도넛차트 5
                     vm.selectDonutChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 6) {
                     //상세조회시 바로보이는 그룹바차트 6
                     vm.selectGroupBarChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarLable, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  } else if (list[i].pauseStandarStyle == 7) {
                     //상세조회시 바로보이는 다중라인차트 7
                     vm.selectStackAreaChart(list[i].pauseStandarX, list[i].pauseStandarY, list[i].pauseStandarLable, list[i].pauseStandarCondition, list[i].pauseStandarSeq, list[i].normalDataStandardTableTitle);
                  }   
                  
                  //가져온 값들이 빈값(null)일 경우 삭제
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
             error:function(request,status,error){ //ajax 오류인경우  
                   //  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            })
         },
         //범주, 수치, 범례를 선택한 경우 푸르스름한(스카이블루 색상) 박스에 담기는 function
         takeXValue: function (xcol,xseq,xInfo){
               $("#xcolTitle").empty(); //클릭시 먼저 xcolTitle의 이름의 lable 에 있는 값을 비운다.
                 $("#xcolTitle").append(xcol); //그다음 선택한 값(xcol)을 xcolTitle에 담는다.
                 this.xcolName = xseq; //선택한 xseq값을 xcolNamedp 담는다.
                 this.xcolInfo = xInfo; //선택한 값의 xInfo 값을 담는다.
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
         //X버튼 누를시 실행되는 function
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
         //연관보고서 나타내는 function
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
         //조건, 범주, 수치, 범례 바로 불러오기
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
         //상세조회시 보이는 Bar-Chart
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
                              table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                              table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                              table += "</table>";
                              return table;
                           },
                        })
                  .render();
               },
                error:function(request,status,error){ //ajax 오류인경우  
                   //     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
                 
         //상세조회시 바로보이는 라인차트
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
//                         table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
//                         table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
//                         table += "</table>";
//                         return table;
//                      },
//                   })
//                   .render();
//                },
//                 error:function(request,status,error){ //ajax 오류인경우  
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
                         table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                         table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                         table += "</table>";
                         return table;
                      },
                   })
                   .render();
                },
                 error:function(request,status,error){ //ajax 오류인경우  
                      //   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  }
             });
          },
         
         
         //상세조회시 보이는 Pie-Chart
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
                           table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                           table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                           table += "</table>";
                           return table;
                        },
                     })
                         .render();    
               },
                error:function(request,status,error){ //ajax 오류인경우  
                  //      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         
         //상세조회시 보이는 Donut-Chart
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
                           table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                           table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                           table += "</table>";
                           return table;
                        },
                     })
                         .render();    
               },
                error:function(request,status,error){ //ajax 오류인경우  
                     //   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         //상세조회시 보이는 groupBar      
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
                           table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.x + "</td></tr>";
                           table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.y + "</td></tr>";
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
                error:function(request,status,error){ //ajax 오류인경우  
                     //   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         
         //상세조회시 보이는 다중 LineChart      
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
                           table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.x + "</td></tr>";
                           table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.y + "</td></tr>";
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
                error:function(request,status,error){ //ajax 오류인경우  
                      //  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                 }
            });
         },
         //여기서부터 클릭하면 시작       
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
                              table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                              table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                              table += "</table>";
                              return table;
                           },
                        })
                        .color("ycolName")
                        .render();
               },
                error:function(request,status,error){ //ajax 오류인경우     
                  alert("Bar-Chart생성 실패")
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
//                               table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
//                               table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
//                               table += "</table>";
//                               return table;
//                            },
//                         })
//                         .render();
                                                      
//                      },
//                 error:function(request,status,error){ //ajax 오류인경우  
//                    alert("Line-Chart생성 실패")
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
                                 table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                                 table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                                 table += "</table>";
                                 return table;
                              },
                           })
                           .render();
                                                         
                        },
                   error:function(request,status,error){ //ajax 오류인경우  
                      alert("Area-Chart생성 실패")
                          }                        
                   })                              
               },
                        
            //   파이차트 시작
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
                                 table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                                 table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                                 table += "</table>";
                                 return table;
                              },
                           })
                                 .render();                                                      
                           
                               },
                                error:function(request,status,error){ //ajax 오류인경우  
                                   alert("Pie-Chart생성 실패")
                                 }
                                        
                             })                              
                         },
                              
               // 도넛 차트 시작                     
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
                                    table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
                                    table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
                                    table += "</table>";
                                    return table;
                                 },
                              })
                                    .render();                                                                                          
                                       //도넛 차트 끝
                              },
                               error:function(request,status,error){ //ajax 오류인경우  
                                  alert("Donut-Chart생성 실패")
                                }
                                       
                            })                              
                        },
                              
               //그룹바 차트 가지고 오기
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
                              table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.x + "</td></tr>";
                              table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.y + "</td></tr>";
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
                      error:function(request,status,error){ //ajax 오류인경우  
                         alert("Groupbar-Chart생성 실패 : 범주를 선택 하십시오.")
                       }                                             
                   })                              
               },                              
               //다중lineChart
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
                              table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.x + "</td></tr>";
                              table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.y + "</td></tr>";
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
                      error:function(request,status,error){ //ajax 오류인경우  
                         alert("다중 LineChart 생성 실패 : 범주를 선택 하십시오.");
                       }                                             
                   })                              
               },
          dataSetDelete:function(code){
	      	var vm = this;
	      	alert("삭제코드 = "+code);
	      	alert("vm.dataCode= "+vm.dataCode);
			swal({
				title: "데이터 셋을 정말 삭제 하시겠습니까?",
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
					alert(vm.dataCode);
					$.ajax({
						url:"/deleteDataSet", 		
					  	data :{
						  "dataCode":vm.dataCode,
					  	},
					  	type:'post',
					  	success: function(){
					  		swal({
               					title: "데이터 셋 삭제 완료",
		                   		type: 'success',
		                   		confirmButtonColor: '#3085d6',
		                   		confirmButtonText: '확인',
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
					                	title: "데이터 셋 삭제 실패",
				                   		type: 'error',
				                   		confirmButtonColor: '#3085d6',
				                   		confirmButtonText: '확인',
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
		if(type == '일시'){
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
		   else if(type == '정기'){
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
//		       if(type == '일시'){
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