<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	var vm = new Vue({
		el : "#standarPre",
		data : {
			standDatasetCoList: [],		//db데이터셋 컬럼명 리스트
			standDatasetList: [],		//db데이터셋 리스트
	
			dataCode: ${dataCode},		//데이터셋코드
			standarTbTitle: "${standarTbTitle}",		//표준데이터상세 테이블명
			
			
			list:[],
			xcolName: '', 	// x축
			ycolName :'',	// y축
			x1colName : '',	// z축(범례)
			condition :0,	// 시각화 조건  <1번 : sum> <2번 : avg> <3번: max> <4번: min> <5번: count>
			pauseStandarSeq : '',	// 시각화 테이블의 seq
			normalDataStandardTableTitle : '',  // 시각화 테이블의 제목
			columnList :{}, // 가져온 값들 (가격, 이름 등등)
			chartType : 0,	//차트유형
			col1 : "pause_standar_column1",
			col2 : "pause_standar_column2",
			col3 : "pause_standar_column3",
			col4 : "pause_standar_column4",
			col5 : "pause_standar_column5",
			col6 : "pause_standar_column6",
			col7 : "pause_standar_column7",
			col8 : "pause_standar_column8",
			col9 : "pause_standar_column9",
			col10 :"pause_standar_column10",
		},	
		methods : {
<!--표준 일시 리스트 조회-->			
		selectStandDatasetCoList : function() {

			var vm = this;
			$.ajax({
				url : '/dataSetCreate/selectStandDatasetCoList',
				data: {
					"dataCode" : vm.dataCode,
					"standarTbTitle" : vm.standarTbTitle,
				},
				type: "POST",
				success : function(standMap) {
					 vm.standDatasetCoList = standMap.standColList;	
					 vm.standDatasetList = standMap.standList;
	
				},
				error : function() {
					alert("standarPreView스크립트 오류");
				}
			})
		},
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
		               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	}
				})
			},
		//bar-chart
		makeChartView : function(seq, titles, condition, chartType){
			$('svg').html("");
			var vm = this;		
			console.log("이게뭐야"+titles);
			this.chartType = chartType;
			$.ajax({						
				url: "/makeChartView",
				data:{
					"xcolName" : vm.xcolName,
					"ycolName" : vm.ycolName,
					"pauseStandarSeq" : seq,
					"normalDataStandardTableTitle" : titles,
					"condition" : condition,
				}, 
				type: "post",
				beforeSend: function(){
					$("#loading").show();
				 },
				success : function(list){				
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
					alert("Bar-Chart생성 실패")
		        }
			});
		},
		// line-chart
// 		lineChartView : function(seq, titles, condition, chartType){
// 			$('svg').html("");
// 			var vm = this;
			
// 			this.chartType = chartType;
// 			$.ajax({
						
// 				url: "/makeChartView",
// 				data:{
// 					"xcolName" : vm.xcolName,
// 					"ycolName" : vm.ycolName,
// 					"pauseStandarSeq" : seq,
// 					"normalDataStandardTableTitle" : titles,
// 					"condition" : condition,
// 				}, 
// 				type: "post",
// 				success : function(list){

// 							new d3plus.LinePlot()
// 							.select("#graph")
// 							.data(list)
// 							.x("xcolName")
// 							.y("ycolName")
// 							.tooltipConfig({
// 								body: function(d) {
// 									var table = "<table class = 'tooltip-table'>";
// 									table += "<tr><td class  ='title'>x축:</td><td class='groupMap'>" + d.xcolName + "</td></tr>";
// 									table += "<tr><td class  ='title'>y축:</td><td class='groupMap'>" + d.ycolName + "</td></tr>";
// 									table += "</table>";
// 									return table;
// 								},
// 							})
// 							.render();
																	
// 						},
// 				 error:function(request,status,error){ //ajax 오류인경우  
// 					 alert("Line-Chart생성 실패")
// 		       	 	}								
// 				 })										
// 			},             
		
			// area-chart
			areaChartView : function(seq, titles, condition, chartType){
				 $('svg').html("");
				 var vm = this;
				
				 this.chartType = chartType;
				$.ajax({
							
					url: "/makeChartView",
					data:{
						"xcolName" : vm.xcolName,
						"ycolName" : vm.ycolName,
						"pauseStandarSeq" : seq,
						"normalDataStandardTableTitle" : titles,
						"condition" : condition,
					}, 
					type: "post",
					success : function(list){
		
								new d3plus.AreaPlot()
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
								.render();
																		
							},
					 error:function(request,status,error){ //ajax 오류인경우  
						 alert("Area-Chart생성 실패")
			       	 	}								
				})										
			},
						
		//	파이차트 시작
		   pieChartView : function(seq, titles, condition, chartType){
	             $('svg').html("");
	             var vm = this;	
	             
	             this.chartType = chartType;
	            $.ajax({
	                     
	               url: "/pieChartView",
	               data:{
	                  "xcolName" : vm.xcolName,
	                  "ycolName" : vm.ycolName,
	                  "pauseStandarSeq" : seq,
	                  "normalDataStandardTableTitle" : titles,
					  "condition" : condition,
	               }, 
	               type: "post",            
	               success : function(list){

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
			donutChartView : function(seq, titles, condition, chartType){
				 $('svg').html("");
				 var vm = this;
				 
				 this.chartType = chartType;
		
				$.ajax({
							
					url: "/makeChartView",
					data:{
						"xcolName" : vm.xcolName,
						"ycolName" : vm.ycolName,
						"pauseStandarSeq" : seq,
						"normalDataStandardTableTitle" : titles,
						"condition" : condition,
					}, 
					type: "post",				
					success : function(list){

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
			groupChartView : function(seq, titles, condition, chartType){
				 $('svg').html("");
				 var vm = this;
				 
				 this.chartType = chartType;
		
				$.ajax({
							
					url: "/groupChartView",
					data:{
						"xcolName" : vm.xcolName,					
						"x1colName" : vm.x1colName,
						"ycolName" : vm.ycolName,
						"pauseStandarSeq" : seq,
						"normalDataStandardTableTitle" : titles,
						"condition" : condition,
					}, 
					type: "post",				
					success : function(groupMap){

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
						 alert("Groupbar-Chart생성 실패 : 범례를 선택해주세요!")
			        }															
				 })										
			},										
			//stackAreaChart
			stackAreaChartView : function(seq, titles, condition, chartType){
				 $('svg').html("");
				 var vm = this;

				 this.chartType = chartType;	
				$.ajax({
							
					url: "/groupChartView",
					data:{
						"xcolName" : vm.xcolName,					
						"x1colName" : vm.x1colName,
						"ycolName" : vm.ycolName,
						"pauseStandarSeq" : seq,
						"normalDataStandardTableTitle" : titles,
						"condition" : condition,
					}, 
					type: "post",				
					success : function(groupMap){

						
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
						 alert("다중 Line-Chart생성 실패 : 범례를 선택해주세요!");
			        }															
				 })										
			},
			takeXValue: function (xcol,xseq){
				$("#xcolTitle").empty();
		        $("#xcolTitle").append(xcol);
		        this.xcolName = xseq;

			},
			takeYValue: function (ycol,yseq){
					$("#ycolTitle").empty();
			        $("#ycolTitle").append(ycol);
			        this.ycolName = yseq;
	
			},
			takeZValue: function (zcol,z1col){
					$("#x1colTitle").empty();
			        $("#x1colTitle").append(zcol);
			        this.x1colName = z1col;
	
			},
			delXValue: function (){
				
				$("#xcolTitle").empty();
				this.xcolName = '';
				this.xcolInfo = '';
			},
			delYValue: function (){
				
				$("#ycolTitle").empty();
				this.ycolName = '';
				this.ycolInfo = '';
			},
			delZValue: function (){
				
				$("#x1colTitle").empty();
				this.x1colName = '';
				this.x1colInfo = '';
			},
			insertViz: function(){
				var vm = this;
	
				if(!this.xcolName || !this.ycolName || this.chartType == 6 && !this.x1colName || this.chartTYpe == 7 && !this.x1colName || !this.chartType){
					swal({
						text:"기본으로 설정할 시각화를 선택하세요.",
	                    type: 'warning',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인',
	                    confirmButtonClass: 'btn',
	                    allowOutsideClick:false, //밖에 클릭해도 안 없어짐
	                    allowEscapeKey:false, //esc 눌러도 안 없어짐
					});
				}
				else{
			
					$.ajax({
						url : '/dataSetCreate/updateViz',
						data: {
							"pauseStandarX" : vm.xcolName,
							"pauseStandarY" : vm.ycolName,
							"pauseStandarLable" : vm.x1colName,
							"pauseStandarCondition" : vm.condition,
							"pauseStandarStyle" : vm.chartType,
							"dataCode" : vm.dataCode,
						},
						type: "POST",
						success : function() {
							
							swal({
								text:"시각화 승인완료",
			                    type: 'success',
			                    confirmButtonColor: '#3085d6',
			                    confirmButtonText: '확인',
			                    confirmButtonClass: 'btn',
			                    allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			                    allowEscapeKey:false, //esc 눌러도 안 없어짐
							}).then(function(){
								vm.selectViewViz();	
							});		
			
						},
						error : function() {
							alert("standarPreView스크립트 오류");
						}
					})
				}	
			},
			selectViewViz: function(){
				window.location.href = "/dataSetPea/selectVizRequestList";
			},
		},
		filters : {

		},
		watch : {
			
		},
		mounted : function() { //dom을 다 읽고 vue객체가 생성되었다는 뜻ready와 비슷(?)
			var vm = this;
			vm.selectStandDatasetCoList();
			vm.makeSelectBox();
		},
	});
	
</script>