<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<div style ="width: 100%; height:30vh; border: 1px solid black;">
 	
 		�׷��� �������� ���� �ڸ�`
 	
 	</div>
	
			
	<form name = "mins" method = "post">  
       <div id ="mainBox" style ="width:100%; height: 800px; ">
	      <div style= "width:100%; height: 80%; overflow:auto;">
	       <svg id="kim" width = "960" height = "600"></svg>	
	     </div>
	     
	     
	     	  <div style ="width:100%; height: 100px; border: 1px solid black;">    	 
	       	 <div class ="fl">
	       	 	 <select id="xcolName" name="xcolName">
	       	  	<option v-for="nme in columnList">
	       	  	 	{{nme.columnName}}
	       	  	</option>
	       	  	</select>
	       	  	
	       	 </div>
	       	 
	       	 <div class ="fl">
	       	 	 <select id="ycolName" name="ycolName">
	       	  	<option v-for="nme in columnList">
	       	  	 	{{nme.columnName}}
	       	  	</option>
	       	  	</select>
	       	  	
	       	 	
	       	 </div>
	       	  <button type="button" v-on:click="barChartView">�ٱ׷���</button>	       	  
	       	  <button type="button" v-on:click="lineChartView">���α׷���</button>
	       	  <button type="button" v-on:click="pieChartView">���̱׷���</button>
	       	   <button type="button" v-on:click="donutChartView">���ӱ׷���</button>
	      
	       	 </div>	
			      
       </div>	

      </form>
	
  <jsp:include page="/WEB-INF/view/report/script/reportInsertViewScript.jsp"></jsp:include>