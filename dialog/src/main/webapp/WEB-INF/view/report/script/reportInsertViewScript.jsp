<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.bar{
	fill: skyblue;
}
.bar:hover {
	fill : steelblue;
}
.toolTip {
    position: absolute;
    border-radius: 4px 4px 4px 4px;
    background-color: skyblue;
    padding: 5px;
    text-align: center;
    font-size: 11px;
    min-width: 30px;
}
/* .circle:hover{ */
/* 	fill : skyblue; */
/* } */
/* .dot:hover{ */
/* 	fill : skyblue; */
/* } */

.arc text {
  font: 10px sans-serif;
  text-anchor: middle;
}

.arc path {
  stroke: #fff;
}
</style>


<script>
//연습


//이제 컬럼명 들고와서 selectbox 만들기!
var vm = new Vue({
	el : '#mainBox',
	data : {	
			columnList: {},
			columnInfo: {},
			columnName: '',		
			list: [],
			xcolName: '',
			ycolName: '',	


	},
	methods:{
		makeSelectBox : function() {
			
			var vm = this;
			$.ajax({
				url: "/getSelectBox",
				type : "post",
				async: false,
				success : function(list){
					
					console.log(list);
					vm.columnList = list;
				},
			 error:function(){ //ajax 오류인경우  
	        }
			})
		},

		makeChartView : function(){
			 $('svg').html("");
			 var vm = this;			 
			//var queryString = $("form[name=mins]").serialize();		
			//var barColor = d3.interpolateViridis;
			var ReportDomain = this;
			$.ajax({
						
				url: "/makeChartView",
				data:{
					"xcolName" : vm.xcolName,
					"ycolName" : vm.ycolName,
				}, 
				type: "post",
				//async: false,
				success : function(list){
					//alert(JSON.stringify(list));
					//vm.test = alist;
					console.log(list);
				
					
		               var svg = d3.select("#kim"), //svg 크기 구하는것
		              	 margin = {top: 20, right: 20, bottom: 30, left: 40},
		                   width = +svg.attr("width") - margin.left - margin.right,
		                   height = +svg.attr("height") - margin.top - margin.bottom;
		            
		               var x = d3.scaleBand().rangeRound([0, width]).padding(0.1), //x축 넓이
		                   y = d3.scaleLinear().range([height, 0]); // y축 넓이
		             		                   
		               var sequentialScale = d3.scaleSequential()   //색
		                  .domain([width, 0])
		             
		            
		               var g = svg.append("g")
		                   .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		               
		               x.domain(list.map(function(d) { return d.xcolName; })); //x축에 들어가는값
		               y.domain([0, d3.max(list, function(d) { return d.ycolName; })]); //y축에 들어가는값
		               
		               g.append("g")
		                   .attr("class", "axis axis--x")
		                   .attr("transform", "translate(0," + height + ")")
		                   .call(d3.axisBottom(x));
		               
		               

		               g.append("g")
		                   .attr("class", "axis axis--y")
		                   .call(d3.axisLeft(y))
		                .append("text")
		                   .attr("transform", "rotate(-90)")
		                   .attr("y", 6)
		                   .attr("dy", "0.71em")
		                   .attr("text-anchor", "end")
		                   .text("ycolName");

		               g.selectAll(".bar")
		                  .data(list)
		                  .enter().append("rect")
		                  .attr("class", "bar")
		                  .attr("x", function(d) { return x(d.xcolName); })
		                  .attr("y", function(d) { return y(d.ycolName); })
		                  .attr("width", x.bandwidth())
		                  .attr("height", function(d) { return height - y(d.ycolName); })
		                  .text(function(d) { return d.ycolName; })  
				            .on("mouseover", function() { tooltip.style("display", null); })
				            .on("mouseout",  function() { tooltip.style("display", "none"); })
				            .on("mousemove", function(d) {
				                tooltip.style("left", (d3.event.pageX+10)+"px");
				                tooltip.style("top",  (d3.event.pageY-10)+"px");
				                tooltip.html("X값 : " + d.xcolName + "<br/>" + "Y값 : " + d.ycolName);
				            });
				            
		               var tooltip = d3.select("body")
			              .append("div")
			              .attr("class", "toolTip")
			              .style("display", "none");
		               

		               function replay(list) {
		            	   var slices = [];
		            	   for (var i = 0; i < list.length; i++) {
		            	     slices.push(data.slice(0, i+1));
		            	   }
		            	   slices.forEach(function(slice, index){
		            	     setTimeout(function(){
		            	       draw(slice);
		            	     }, index * 300);
		            	   });
		            	 }
		               	         
		                  													
				},
				 error:function(request,status,error){ //ajax 오류인경우  
// 		               alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);    
		               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
			});
		},
			// 		line-chart
		lineChartView : function(){
			 $('svg').html("");
			 var vm = this;
			var queryString = $("form[name=mins]").serialize();		
			//var barColor = d3.interpolateViridis;		
			$.ajax({
						
				url: "/makeChartView",
				data: queryString,
				type: "post",
				//async: false,
				success : function(list){
					//alert(JSON.stringify(list));
					//vm.test = alist;
					console.log(list);
				
				var svg = d3.select("#kim"),
				    margin = {top: 120, right: 20, bottom: 30, left: 50},
				    width = +svg.attr("width") - margin.left - margin.right,
				    height = +svg.attr("height") - margin.top - margin.bottom,
				    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

				  var x = d3.scaleBand().rangeRound([0, width]).padding(1), //x축 넓이
                  y = d3.scaleLinear().range([height, 0]); // y축 넓이

				
				var line = d3.line()
					//.curve(d3.curveBasis)
				    .x(function(d) { return x(d.xcolName); })
				    .y(function(d) { return y(d.ycolName); });
				
				   x.domain(list.map(function(d) { return d.xcolName; })); //x축에 들어가는값
		           y.domain([0, d3.max(list, function(d) { return d.ycolName; })]); //y축에 들어가는값

				  g.append("g")
				      .attr("transform", "translate(0," + height + ")")
				      .call(d3.axisBottom(x))
				    .select(".domain")
				      .remove();

				  g.append("g")
				      .call(d3.axisLeft(y))
				    .append("text")
				      .attr("fill", "#000")
				      .attr("transform", "rotate(-90)")
				      .attr("y", 6)
				      .attr("dy", "0.71em")
				      .attr("text-anchor", "end")
				      .text("ycolName");

				  g.append("path")
				      .datum(list)
				      .attr("fill", "none")
				      .attr("stroke", "steelblue")
				      .attr("stroke-linejoin", "round")
				      .attr("stroke-linecap", "round")
				      .attr("stroke-width", 3)
				      .attr("d", line);			
					
// 				  g.selectAll(".dot")
// 		            .data(list)
// 			        .enter()
// 			          .append("circle")
// 			            .attr("fill", "blue")
// 			            .attr("r", 4)
//  			            .attr("cx", function(d) { return x(d.xcolName); })
//  			            .attr("cy", function(d) { return y(d.ycolName); })
				  	//	.attr(margin-top:20);
			        
			        //Input text
			        g.selectAll(".dot")
			         .data(list)
			        .enter().append("circle")
			        	.attr("r", 7)
			        	.attr("fill", "blue")
// 			          .append("text")
// 			            .attr('text-anchor', 'middle')
			            .attr("cx", function(d) { return x(d.xcolName); })
			            .attr("cy", function(d) { return y(d.ycolName); })
			            .attr('dy', '-10')
			            .text(function(d) { return d.ycolName; })  
			            .on("mouseover", function() { tooltip.style("display", null); })
			            .on("mouseout",  function() { tooltip.style("display", "none"); })
			            .on("mousemove", function(d) {
			                tooltip.style("left", (d3.event.pageX+10)+"px");
			                tooltip.style("top",  (d3.event.pageY-10)+"px");
			                tooltip.html("X값 : " + d.xcolName + "<br/>" + "Y값 : " + d.ycolName);
			            });
			            
			          var tooltip = d3.select("body")
			              .append("div")
			              .attr("class", "toolTip")
			              .style("display", "none");
			
				},
				 error:function(request,status,error){ //ajax 오류인경우  
		               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
							
			 })										
		},
// 		파이차트 시작
		pieChartView : function(){
			 $('svg').html("");
			 var vm = this;
			var queryString = $("form[name=mins]").serialize();		
			$.ajax({
						
				url: "/makeChartView",
				data: queryString,
				type: "post",				
				success : function(list){
							
					var svg = d3.select("#kim"),
				    width = +svg.attr("width"),
				    height = +svg.attr("height"),
				    radius = Math.min(width, height) / 2,
				    g = svg.append("g")
				    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

					
					var color = d3.scaleOrdinal(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
					
					var arc = d3.arc()
				    .outerRadius(radius - 10)
				    .innerRadius(0);
					
					var label = d3.arc()
				    .outerRadius(radius - 40)
				    .innerRadius(radius - 40);

					
					var pie = d3.pie()
					.sort(null)
					.value(function (d) {
					return d.ycolName;
					});
					
												
					var g = g.selectAll(".arc")
					    .data(pie(list))
					    .enter().append("g")
					    .attr("class", "arc")
						.text(function(d) { return d.data.xcolName; })
					//	.text(function(d) { return d.data.ycolName; })  
				        .on("mouseover", function() { tooltip.style("display", null); })
				        .on("mouseout",  function() { tooltip.style("display", "none"); })
				        .on("mousemove", function(d) {
				            tooltip.style("left", (d3.event.pageX+10)+"px");
				            tooltip.style("top",  (d3.event.pageY-10)+"px");
				            tooltip.html("X값 : " + d.data.xcolName + "<br/>" + "Y값 : " + d.data.ycolName);
				         });
				            
		               var tooltip = d3.select("body")
			              .append("div")
			              .attr("class", "toolTip")
			              .style("display", "none");
					
					g.append("path")
					    .attr("d", arc)
					    .style("fill", function (d) {
					    return color(d.data.xcolName);
					});
					
					g.append("text")
					    .attr("transform", function (d) {
					    return "translate(" + arc.centroid(d) + ")";
					})
					    .attr("dy", ".35em")
					    .style("text-anchor", "middle")
					    .text(function (d) {
					    return d.data.xcolName;
					});																										
										//파이 차트 끝
									},
									 error:function(request,status,error){ //ajax 오류인경우  
							               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							        }
												
								 })										
							},
					// 도넛 차트 시작							
							donutChartView : function(){
								 $('svg').html("");
								 var vm = this;
								var queryString = $("form[name=mins]").serialize();		
								$.ajax({
											
									url: "/makeChartView",
									data: queryString,
									type: "post",				
									success : function(list){
												
										var svg = d3.select("#kim"),
									    width = +svg.attr("width"),
									    height = +svg.attr("height"),
									    radius = Math.min(width, height) / 2,
									    g = svg.append("g")
									    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

										
										var color = d3.scaleOrdinal(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
										
										var arc = d3.arc()
									    .outerRadius(radius - 10)
									    .innerRadius(radius - 50);
										
										var label = d3.arc()
									    .outerRadius(radius - 40)
									    .innerRadius(radius - 40);

										
										var pie = d3.pie()
										.sort(null)
										.value(function (d) {
										return d.ycolName;
										});
										
																	
										var g = g.selectAll(".arc")
										    .data(pie(list))
										    .enter().append("g")
										    .attr("class", "arc");
										   
										
										g.append("path")
										    .attr("d", arc)
										    .style("fill", function (d) {
										    return color(d.data.xcolName);
										})
										
										
										g.append("text")
										    .attr("transform", function (d) {
										    return "translate(" + arc.centroid(d) + ")";
										})
										    .attr("dy", ".35em")
										    .style("text-anchor", "middle")
										    .text(function (d) {
										    return d.data.ycolName;
										});																																						
															//도넛 차트 끝
														},
														 error:function(request,status,error){ //ajax 오류인경우  
												               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
												        }
																	
													 })										
												}
	},
	filters : {

    },
    watch : {
       
    },

	mounted: function () {
		var vm = this;
		vm.makeSelectBox();
	},
});

</script>