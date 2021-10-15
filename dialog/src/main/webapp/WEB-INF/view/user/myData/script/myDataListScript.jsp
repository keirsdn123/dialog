<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
      el:"#myDataList" ,
      data: {
    	  selectMydataSetList:[],
    	  selectMyReportList:[],
    	  displaySet:1,
    	  reportDisplaySet:1,
    	  myDataSet: {
              currentPage: 1,
              records: 0,
              perPage: 10,
          },
          myReport: {
              currentPage: 1,
              records: 0,
              perPage: 10,
          },
          dataSetSearchWrd:'',
          reportSearchWrd:'',
      },
      methods: {
			mydatasetList : function(){
    		  var vm = this;
    		  $.ajax({
    			url: "/selectMydataSetList",
    		  	data :{
    		  		"dataSetSearchWrd" : vm.dataSetSearchWrd,
					"currentPage" : vm.myDataSet.currentPage,
	    			"perPage" : vm.myDataSet.perPage,
    		  	},
    		  	type:'post',
    		  	success: function(list){
//     		  		console.log(list);
    		  		vm.selectMydataSetList = list.selectMyDataSetList;
    		  		vm.myDataSet.records = list.MydataSetRecords;
    		  	},
    		  	error : function(){
    		  		alert("hhhh");
    		  	}
    		  })
    	  },
			mydataSetListView : function(code,type){
    		  var vm = this;
              $("#pageChange").html(
                "<input type='hidden' name='dataCode' value="+code+">"
                +"<input type='hidden' name='displaySet' value="+vm.displaySet+">"
                +"<input type='hidden' name='typeNormalRegularly' value="+type+">"
              );
              $("#pageChange").attr("action","/dataSet/dataSetListView");
              $("#pageChange").submit();
           },
           searchMyDataSet:function(){
        	   var vm = this;
        	   vm.mydatasetList();
           },
////////////////////////////////여기서 부터 보고서////////////////////////////////////////////////////
          
			//나의 데이터 보고서 목록 보기
		   myReportList : function (){
     		  var vm = this;
     		  $.ajax({
     			url: "/selectMyReportList", //ReportAjaxController로 갑니다.
     		  	data :{
    		  		"reportSearchWrd" : vm.reportSearchWrd,
					"currentPage" : vm.myReport.currentPage,
	    			"perPage" : vm.myReport.perPage,
     		  	},
     		  	type:'post',
     		  	success: function(list){
//      		  		console.log(list);
     		  		vm.selectMyReportList = list.selectMyReportList;    
     		  		vm.myReport.records = list.MyReportRecords;
     		  	},
     		  	error : function(){
     		  		alert("hhhh");
     		  	}
     		  })
     	   },
     	   myReportListView : function(code){    		
              $("#pageChange").html(
                "<input type='hidden' name='reportCode' value="+code+">"
                +"<input type='hidden' name='reportDisplaySet' value="+vm.reportDisplaySet+">"
                
              );
              $("#pageChange").attr("action","/report/reportView");
              $("#pageChange").submit();
//      		  window.location.href="/my/infoViewMyCollectRequest?dataExportRequestCode="+rssSeq+"&&tabType="+type;
           },
           searchMyReport:function(){
        	   var vm = this;
        	   vm.myReportList();
           },

      },
      filters: {
      },
      watch: {
      },
      mounted: function () {
    	  var vm = this;
    	  vm.mydatasetList();
    	  vm.myReportList();
     	  $("#${last}").tab('show');
		this.$refs.myDataSet.$on('change', function(page){
			if (vm.myDataSet.currentPage != page) {
			   vm.myDataSet.currentPage = page;
			   vm.mydatasetList(); //조회 메서드
			}
		});
		this.$refs.myReport.$on('change', function(page){
			if (vm.myReport.currentPage != page) {
			   vm.myReport.currentPage = page;
			   vm.myReportList(); //조회 메서드
			}
		});
      },
   });
   
</script>