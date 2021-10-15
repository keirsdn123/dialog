<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
var vm = new Vue({
	
	el:"#approvalRequestList" ,
	data: {
	selectApprovalVizRequestList:[],
	selectApprovalDaumRequestList : [],   //�������� ���� ��û ������ ����Ʈ
	selectApprovalActRequestList : [],   //��Ÿ ���� ��û ������ ����Ʈ
	selectApprovalDaumNewsRequestList : [],
	selectApprovalRssRequestList : [],   //rss���� ���� ��û ������ ����Ʈ
	selectApprovalShopRequestList : [],   //���� ���� ��û ������ ����Ʈ
	
	daumSort : 0,   // ���� �˻� ����
	actSort : 0,   // ��Ÿ �˻� ����
	rssSort : 0,   // rss �˻� ����
	shopSort : 0,   // ���� �˻� ����
	vizSort : 0,   //�ð�ȭ �˻� ����
	daumExportSort:0,
	
	daumSearchWrd: '', // ���� �˻���
	actSearchWrd: '', // ��Ÿ �˻���
	rssSearchWrd: '', // rss �˻���
	shopSearchWrd: '', // ���� �˻���
	vizSearchWrd : '',	//�ð�ȭ �˻���
	daumExportSearchWrd:'',
	 	
	//rss����¡
	rssReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	    //���� ����¡
	daumReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	    },
	    
	   //��Ÿ ����¡
	actReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	    //���� ����¡
	shopReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	    //�ð�ȭ ����¡
	vizReqPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
	    
	daumExportPaging: {
		currentPage: 1,
		records: 0,
		perPage: 10,
	},
      
      },
      methods: {
    	//�ð�ȭ ��û ��ȸ
  		selectApprovalVizRequest: function (searched) {
  			var vm = this;
  			if(searched==1){
  				vm.vizReqPaging.currentPage = 1;
  			}
  			$.ajax({
  				url: '/selectApprovalVizRequest',
  				data: {
  					"vizSort" : vm.vizSort,
					"vizSearchWrd" : vm.vizSearchWrd,
					"currentPage" : vm.vizReqPaging.currentPage,
	    			"perPage" : vm.vizReqPaging.perPage,
  				},
  				type: 'post',
  				success: function (list) {
  					console.log(list); 
  					vm.selectApprovalVizRequestList = list.selectVizRequstList;
  					vm.vizReqPaging.records = list.vizRequestRecords;
  				},
  				error: function () {
  				}
  			})
  		},
  		//�ð�ȭ �˻� �ɼ�
		vizDataSort: function (num) {
			var vm = this;
			vm.vizSort = num; 
			vm.vizReqPaging.currentPage=1;
			vm.selectApprovalVizRequest(0);
		},
		infoApprovalVizlist:function(code){
    	 	$("#pageChange").html(
             "<input type='hidden' name='dataCode' value="+code+">"
            );
           $("#pageChange").attr("action","/dataSet/infoViewDataSetManagement");
           $("#pageChange").submit();
         },
         
      // ���� ���� ������ ���� ��û ������ ��ȸ
		selectApprovalDaumRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalDaumRequest',
				data: {
					"daumSort" : vm.daumSort,
					"daumSearchWrd" : vm.daumSearchWrd,
					"currentPage" : vm.daumReqPaging.currentPage,
	    			"perPage" : vm.daumReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.selectApprovalDaumRequestList = list;
					vm.selectApprovalDaumRequestRecords();
				},
				error: function () {
// 					alert("����");
				}
			})
		},
		//���� ���� ���� ���� �˻� �ɼ�
		daumDataSort: function (num) {
			var vm = this;
			vm.daumReqPaging.currentPage=1;
			vm.daumSort = num; 
			vm.selectApprovalDaumRequest();
		},
		// ���� ������ ���� ��û �Խñ� ��
		selectApprovalDaumRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalDaumRequestRecords',
	    		data:{
	    			"daumSort" : vm.daumSort,
					"daumSearchWrd" : vm.daumSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.daumReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging ����");
    			}
	    	});
		},
		// ��Ÿ ������ ���� ��û ������ ��ȸ
		selectApprovalActRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalActRequest',
				data: {
					"actSort" : vm.actSort,
					"actSearchWrd" : vm.actSearchWrd,
					"currentPage" : vm.actReqPaging.currentPage,
	    			"perPage" : vm.actReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalActRequestList = list;
					vm.selectApprovalActRequestRecords();
				},
				error: function () {
// 					alert("����");
				}
			})
		},
		//��Ÿ ���� ���� �˻� �ɼ�
		actDataSort: function (num) {
			var vm = this;
			vm.actReqPaging.currentPage=1;
			vm.actSort = num; 
			vm.selectApprovalActRequest();
		},
		// ��Ÿ ������ ���� ��û �Խñ� ��
		selectApprovalActRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalActRequestRecords',
	    		data:{
	    			"actSort" : vm.actSort,
					"actSearchWrd" : vm.actSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.actReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging ����");
    			}
	    	});
		},
		// rss ������ ���� ��û ������ ��ȸ
		selectApprovalRssRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalRssRequest',
				data: {
					"rssSort" : vm.rssSort,
					"rssSearchWrd" : vm.rssSearchWrd,
					"currentPage" : vm.rssReqPaging.currentPage,
	    			"perPage" : vm.rssReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalRssRequestList = list;
					vm.selectApprovalRssRequestRecords();
				},
				error: function () {
// 					alert("����");
				}
			})
		},
		//rss ���� ���� �˻� �ɼ�
		rssDataSort: function (num) {
			var vm = this;
			vm.rssReqPaging.currentPage=1;
			vm.rssSort = num; 
			vm.selectApprovalRssRequest();
		},
		// rss ������ ���� ��û �Խñ� ��
		selectApprovalRssRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalRssRequestRecords',
	    		data:{
	    			"rssSort" : vm.rssSort,
					"rssSearchWrd" : vm.rssSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.rssReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging ����");
    			}
	    	});
		},
		// ���� ������ ���� ��û ������ ��ȸ
		selectApprovalShopRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalShopRequest',
				data: {
					"shopSort" : vm.shopSort,
					"shopSearchWrd" : vm.shopSearchWrd,
					"currentPage" : vm.shopReqPaging.currentPage,
	    			"perPage" : vm.shopReqPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalShopRequestList = list;
					vm.selectApprovalShopRequestRecords();
				},
				error: function () {
// 					alert("����");
				}
			})
		},
		//���� ���� ���� �˻� �ɼ�
		shopDataSort: function (num) {
			var vm = this;
			vm.shopReqPaging.currentPage=1;
			vm.shopSort = num; 
			vm.selectApprovalShopRequest();
		},
		// ���� ������ ���� ��û �Խñ� ��
		selectApprovalShopRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalShopRequestRecords',
	    		data:{
	    			"shopSort" : vm.shopSort,
					"shopSearchWrd" : vm.shopSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.shopReqPaging.records = data;
	    		},
	    		error: function(){
//     				alert("selectNormalDatabasePaging ����");
    			}
	    	});
		},
		
		//���� ���� ������ ���� ��û ��ȸ
		selectApprovalDaumNewsRequest: function () {
			var vm = this;
			$.ajax({
				url: '/selectApprovalDaumNewsRequest',
				data: {
					"daumSort" : vm.daumExportSort,
					"daumSearchWrd" : vm.daumExportSearchWrd,
					"currentPage" : vm.daumExportPaging.currentPage,
	    			"perPage" : vm.daumExportPaging.perPage
				},
				type: 'post',
				success: function (list) {
					vm.selectApprovalDaumNewsRequestList = list;
					vm.selectApprovalDaumNewsRequestRecords();
					$("#loading").hide();
				},
				error: function () {
					alert("����");
				}
			})
		},
		//�������� ���� ���� �˻� �ɼ�
		daumNewsSort: function (num) {
			var vm = this;
			vm.daumExportPaging.currentPage=1;
			vm.daumExportSort = num; 
			vm.selectApprovalDaumNewsRequest();
		},
		// �������� ������ ���� ��û �Խñ� ��
		selectApprovalDaumNewsRequestRecords: function(){
			var vm = this;
	    	$.ajax({
	    		url:'/selectApprovalDaumNewsRequestRecords',
	    		data:{
	    			"daumSort" : vm.daumExportSort,
					"daumSearchWrd" : vm.daumExportSearchWrd
	    		},
	    		type:'post',
	    		success: function(data){
	    			vm.daumExportPaging.records = data;
	    		},
	    		error: function(){
    				alert(" ����");
    			}
	    	});
		},
		
		// ��Ÿ ������ �Խñ� seq
		infoMActList: function (actSeq) {
			window.location.href="/myData/infoViewMCollectActRequest?actDataCollectRequestCode="+actSeq;
		},
		// ���� ���� ������ ������ �Խñ� seq
		infoMDaumList: function (daumSeq) {
			window.location.href="/myData/infoViewMCollectDaumRequest?daumNewsDataCollectRequestCode="+daumSeq;
		},
		// ���� ��û �Խñ� seq
		infoMExportList: function (rssSeq,type) {
			window.location.href="/myData/infoViewMExportRequest?dataExportRequestCode="+rssSeq+"&&tabType="+type;
		},
      },
      filters: {
      },
      watch: {
      },
      mounted: function () {
    	  var vm = this;
    	$("#${collectTab}").tab('show');
    	$("#${bigTab}").tab('show');
    	vm.selectApprovalDaumRequest();
    	vm.selectApprovalActRequest();
    	vm.selectApprovalRssRequest();
   		vm.selectApprovalShopRequest();
    	vm.selectApprovalDaumNewsRequest();
    	vm.selectApprovalVizRequest(0);
		this.$refs.vizTable.$on('change', function(page){
			if (vm.vizReqPaging.currentPage != page) {
				vm.vizReqPaging.currentPage = page;
				vm.selectApprovalVizRequest(0);
			}
		});
		this.$refs.shopTable.$on('change', function(page){
			if (vm.shopReqPaging.currentPage != page) {
				vm.shopReqPaging.currentPage = page;
				vm.selectApprovalShopRequest();
			}
		});
		this.$refs.daumTable.$on('change', function(page){
			if (vm.daumReqPaging.currentPage != page) {
				vm.daumReqPaging.currentPage = page;
				vm.selectApprovalDaumRequest();
			}
		});
		this.$refs.actTable.$on('change', function(page){
			if (vm.actReqPaging.currentPage != page) {
				vm.actReqPaging.currentPage = page;
				vm.selectApprovalActRequest();
			}
		});
		this.$refs.rssTable.$on('change', function(page){
			if (vm.rssReqPaging.currentPage != page) {
				vm.rssReqPaging.currentPage = page;
				vm.selectApprovalRssRequest();
			}
		});
		this.$refs.daumNewsTable.$on('change', function(page){
			if (vm.daumExportPaging.currentPage != page) {
				vm.daumExportPaging.currentPage = page;
				vm.selectApprovalDaumNewsRequest();
			}
		});
      },
   });
   
</script>