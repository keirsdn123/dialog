<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>

var vm = new Vue({
    el:"#reportList" ,
    data: {
    	selectReportList:[],
    	reportDisplaySet:0,
    	selectCategory : [],
    	getCategoryList:[], //�˾�â�� ī�װ� �������
		categorySeq: 0,
		pagingInfo: {
            currentPage: 1,
            records: 0,
            perPage: 10,
        },
        reportSort: 2, // ����
		reportSearchWrd : '', // �˻���
    },

    methods: {
		reportList : function(){
			 var vm = this;
   		  $.ajax({
   			url: "/selectReportList", 		
   		  	data :{
   		  		"reportSort" : vm.reportSort,
				"reportSearchWrd" : vm.reportSearchWrd,
	   		  	"currentPage" : vm.pagingInfo.currentPage,
				"perPage" : vm.pagingInfo.perPage,
   		  	},
   		  	type:'post',
   		  	success: function(list){
//    		  		console.log(list);
   		  		vm.selectReportList = list;
   		  	},
   		  	error : function(){
   		  		alert("���� ��� ����");
   		  	}
   		  })
		},
		//���� ī�װ� 
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
		//���� �� ����
		selectReportDataRowCount : function(){
			var vm = this;
			$.ajax({
				url : "/selectReportDataRowCount",
				data : {
					"categorySeq" : vm.categorySeq,
					"reportSearchWrd" : vm.reportSearchWrd,
					"reportSort" : vm.reportSort,
				},
				type: 'post',
				success: function(list){
					vm.pagingInfo.records = list;
				},
				error : function(){
					alert("hhh");
				}
			})
		},
		//�˻�
		selectDtSearchDataSet: function () {
			var vm = this;
			$.ajax({
				url: '/selectReportList',
				data: {
					"categorySeq" : vm.categorySeq,
					"reportSort" : vm.reportSort,
					"reportSearchWrd" : vm.reportSearchWrd,
					"currentPage" : vm.pagingInfo.currentPage,
					"perPage" : vm.pagingInfo.perPage,
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.selectReportDataRowCount();
					vm.selectReportList = list;
					
				},
				error: function () {
					alert("����");
				}
			})
		},
		//��Ͽ��� ī�װ� Ŭ����
		reportCate : function(seq) {
			var vm = this;
			$.ajax({
				url : "/selectReportCate",
				data : {
					"categorySeq" : seq,
					"reportSort" : vm.reportSort,
					"reportSearchWrd" : vm.reportSearchWrd,
				  	"currentPage" : vm.pagingInfo.currentPage,
					"perPage" : vm.pagingInfo.perPage,
				},
				type: 'post',
				success: function(list){
					vm.selectReportList = list;
					vm.categorySeq = seq;
					vm.selectReportDataRowCount();
				},
				error : function(){
					alert("hhh");
				}
			})
		},
		//���� ����ȸ
		reportListView : function(code){
		    $("#pageChange").html(
		      "<input type='hidden' name='reportCode' value="+code+">"
		      +"<input type='hidden' name='reportDisplaySet' value="+vm.reportDisplaySet+">"
		    );
		    $("#pageChange").attr("action","/report/reportView?reportDisplaySet="+vm.reportDisplaySet);
            $("#pageChange").submit(); 
		 },
		 //���� ���
		 goReportInsert : function(){
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
				  		if(memberInfo.memberRatingCode==1 || memberInfo.memberRatingCode==2 ){
				  			window.location.href="/report/reportInsert";
				  		}
				  		if(memberInfo.memberRatingCode==3 ){
				  			window.location.href="/report/adminReportInsert";
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
  	  vm.reportList();
  	  vm.seletCategory();
  	  vm.selectReportDataRowCount();
  	  this.$refs.table.$on('change', function(page){
		if (vm.pagingInfo.currentPage != page) {
			vm.pagingInfo.currentPage = page;
			vm.reportList();
		  }
	  });
    },

 });
</script>