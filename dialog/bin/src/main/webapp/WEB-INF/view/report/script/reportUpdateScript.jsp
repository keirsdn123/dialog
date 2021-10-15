<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
var vm = new Vue({
	el: "#reportUpdate" ,
	data : {
		getCategoryList:[], //�˾�â�� ī�װ� �������
		categorySeq: '',
		categoryNme: '',
		value : [],
		seCategorySeq: [],
		options: [],
		id: '',
		dataBox : [],
		dataBox2: [],
		dataCodeList : [],
		label: '',
		array: {},
		defaultRatingCode: 0, 
		selectDataList : [], //�˾�â�� �����ͼ� �ҷ�����
		selectRatingList : {},
		selectCategory : [], //�˾�â�� ī�װ��� �����ͼ� ���������
		dataSort: 0, // ����
		dataSearchWrd : '', // �˻���
		selectdSearchDataSet : [],
		reportCode : ${reportCode},
		uReportInfo : {},
		reportTypeNormalPaper:'',
		originFileTitle: '',
	},
	methods : {
		//����Ѱ� �̸� �ҷ�����
		selectReportInfo : function(){
			var vm = this;
			$.ajax({
				url:"/selectReportInfo",
				data : {
					"reportCode" : vm.reportCode,
				},
				type : 'post',
				success: function(list){
					vm.uReportInfo = list;
					//vm.defaultRatingCode = list;
				},
				error : function() {
					alert("�Ⱥҷ�����?");
				}
			})
		},
		//���� ����(�Ϲݺ���/��)
		selectTypePaper : function(){
			var vm = this;
			$.ajax({
				url:"/selectTypePaper",
				data : {
					"reportCode" : vm.reportCode,
				},
				type : 'post',
				success: function(list){				
					for (var i = 0; i<list.length; i++){			
						vm.defaultRatingCode = list[i].memberRatingCode;				
						vm.reportTypeNormalPaper=list[i].reportTypeNormalPaper;
						if(vm.reportTypeNormalPaper == "�Ϲݺ���"){
							$("input:radio[name='typeNormalRegularly'][value='�Ϲݺ���']").prop("checked", true);
						} else
							$("input:radio[name='typeNormalRegularly'][value='��']").prop("checked", true);
					}
				},
				error : function() {
					alert("�Ⱥҷ�����?");
				}
			})
		},
		//���� ����(�����̸�)
		 selectOriginFileNme : function(){
			var vm = this;
			$.ajax({
				url:"/selectOriginFileNme",
				data : {
					"reportCode" : vm.reportCode,
				},
				type : 'post',
				success: function(list){	
					
					for (var i = 0; i<list.length; i++){
						vm.originFileTitle = list[i].originFileTitle;
						var filename = vm.originFileTitle;
						console.log(filename);
						 $(".upload-name").val(filename);
					}
					
				},
				error : function() {
					alert("�Ⱥҷ�����?");
				}
			})
		},
		//��� ����
		AuthorityList : function(){
			 var vm = this;
			 $.ajax({
				url: "/selectRatingList", 		
			 	data :{
			 	},
			 	type:'post',
			 	success: function(list){
			 		("�� jsp�� �ȵǴ� ���̳� �ñ��ϵ���");
			 		vm.selectRatingList = list;
			 	},
			 	error : function(){
			 		alert("hhhh");
			 	}
			 })
			},
		
		//ī�װ� ����
		selectCategoryList : function(){
			var vm = this;
			$.ajax({
				url: "/getCategotyList", //DataSetAjaxController �� �ִ�.
				data: {					
				},
				type: 'post',
				success: function(list){
					vm.getCategoryList = list;
				},
				error : function () {
					alert("ī�װ� �ȵȴ�.");
				}
			})
		},	
		
		//���� ���� ������
		dataList : function(){
			var vm = this;
			$.ajax({
				url : "/selectDataList",
				data : {
					
				},
				type : 'post',
				success: function(list){
					vm.selectDataList = list;
				},
				error : function(){
					alert("hhh");
				}
			})
		},
		
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

		dataCate: function(seq){
			var vm = this;
			$.ajax({
				url : "/selectDataCate",
				data : {
					"categorySeq" : seq,
				},
				type: 'post',
				success: function(list){
					vm.selectDataList = list;
				},
				error : function(){
					alert("hhh");
				}
			})
		},
		datasetBox : function(seq){
			var vm = this;
			$.ajax({
				url:"/selectDataSetBox", //������ �����ͼ� ���� ���� �����Ϳ� td �ٿ� ����.
				data : {
					"dataCode" : seq,
				},
				type : 'post',
				success : function(list){		
	
					$.grep(list,function(value, index){
						vm.dataBox.push(value.datasetName);
						vm.dataBox2.push(value.dataCode);
					});
					console.log(vm.dataBox2);
					
				},
				
				error : function(){
					alert("�����ͼ� �ڽ� ���峵��.");
				}
			})
		},
		//������ ���������ͼ� �̸� �ҷ��ɴϴ�
		updateDatasetBox : function(){
			var vm = this;
			$.ajax({
				url:"/selectUDataSetBox", //������ �����ͼ� ���� ���� �����Ϳ� td �ٿ� ����.
				data : {
					"reportCode" : vm.reportCode,
				},
				type : 'post',
				success : function(list){		
	
					$.grep(list,function(value, index){
						vm.dataBox.push(value.datasetName);
						vm.dataBox2.push(value.dataCode);
					});
					console.log(vm.dataBox2);
					
				},
				
				error : function(){
					alert("�����ͼ� �ڽ� ���峵��.");
				}
			})
		},
		selectFileType1 : function(){ 
			var vm = this;
			$.ajax({
				url:"/selectFileType1", //�Ͻ��� ������ Ŭ���� ����
				data : {
					
				},
				type: 'post',
				success: function(list){
					vm.selectDataList = list;
				}
			})
		},
		selectFileType2: function(){ 
			var vm = this;
			$.ajax({
				url:"/selectFileType2", //������ ������ Ŭ���� ����
				data : {
					
				},
				type: 'post',
				success: function(list){
					vm.selectDataList = list;
				}
			})
		},
		selectMyFile: function(){ 
			var vm =this;
			$.ajax({
				url:"/selectMyFile", //������ ������ Ŭ���� ����
				data : {
					
				},
				type: 'post',
				success: function(list){
					vm.selectDataList = list;
				}
			})
		},
		//�����ͼ� �˻�
		selectDtSearchDataSet: function () {
			var vm = this;
			$.ajax({
				url: '/selectDtSearchDataSet',
				data: {
					"dataSort" : vm.dataSort,
					"dataSearchWrd" : vm.dataSearchWrd,
				},
				type: 'post',
				success: function (list) {
					console.log(list);
					vm.selectDataList = list;
				},
				error: function () {
					alert("����");
				}
			})
		},
		//�������� ������ ���
		delData : function (index) {
			var vm = this;
			vm.dataBox.splice(index,1);
			vm.dataBox2.splice(index,1);
		},
		openPop : function(){
			$("#report_pop").modal();
			vm.seletCategory();
			vm.dataList();
		},
		//���� ����
		updateReportFrm : function(){
			var vm = this;			
			var formData = new FormData($("#updateReportFrm")[0]);
			alert(vm.value);
			alert(vm.dataBox2)
			formData.append('reportCode',vm.reportCode);
			formData.append('cateCode1',vm.categorySeq);
			formData.append('cateList',vm.value);
			formData.append('dataCodeList',vm.dataBox2);
			formData.append('memberRatingCode',vm.defaultRatingCode);
			
			jQuery.ajaxSettings.traditional = true;
			
			 $.ajax({
	             type : "POST",
	             url : "/updateReport",
	             data : formData,      
	             processData: false,
	             contentType: false,
				 beforeSend: function(){
					$("#loading").show();
				 },
				 success : function() {
					$("#loading").hide();
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
							window.location.href='/report/reportList';
						}
					}).catch(swal.noop);
				 },
				error : function(xhr, status, error) {
					$("#loading").hide();
					swal({
		                  title: "������ �� ���� ����",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: 'Ȯ��',
	                      confirmButtonClass: 'btn',
					});
				}
	         })			
		},
		updateCategorySeq : function(){
			var vm = this;
			
			$.ajax({
				url : "/selectUCategoryList",
				data: {
					"reportCode" : vm.reportCode,
				},
				type:'post',
				success: function(list){
					console.log(list);
					for (var i = 0; i<list.length; i++){
						vm.categorySeq=list[i].categorySeq;
						vm.updateSecCategorySeq(vm.categorySeq);
					}
					
				},
				error : function(){
 	   		  		alert("����������������������������");
	   		  		}
			})
		},
		updateSecCategorySeq : function(seq){
			var vm = this;
			console.log("ī�װ�1��"+seq);
			console.log("����seq"+vm.reportCode);
			
			$.ajax({
				url : "/selectUSecCategoryList",
				data: {
					"reportCode" : vm.reportCode,
					"categorySeq" : seq,
				},
				type:'post',
				success: function(list){
					console.log(list);
					vm.value=[];
 	   				 	   			
                   for(var i = 0; i<list.length; i++){
                	   console.log("�ƾƾƾӾ�!!!"+list[i].categorySeq);
                	   
                	   vm.id = list[i].categorySeq;
	                	                   
	               		vm.value.push(vm.id)
	               		console.log(vm.value);
                   }
	 	   				
							
				},
				error : function(){
 	   		  		alert("����������������������������");
	   		  		}
			})
		},
		
	},


	
	filters: {
		
	},
	watch: {
		categorySeq: function(seq){
			var vm = this;
			var categorySeq = seq;
			vm.value = null;
			 $.ajax({
 	   			url: "/getCategoryList",
 	   		  	data:{inputseq:categorySeq},
 	   		  	type:'GET',
 	   		  	success: function(list){
 	   		 	 	vm.options=[];
 	   				vm.array={};
						$.each(list,function(i, e){
		                    vm.id = e.categorySeq;
		                    vm.label = e.categoryNme;
		                    array = {
			                    	id:vm.id,
			                   		label:vm.label
	                    		};
	                   		vm.options.push(array)
							})		
	    	   		  	},
 	   		  	error : function(){
 	   		  		alert("hhhh");
	   		  		}
	   		  })
		},		
	},
	mounted : function(){
		var vm = this;
	   	vm.selectCategoryList();
 	   	vm.AuthorityList();
	   	vm.selectReportInfo();
	   	vm.updateDatasetBox();
	   	vm.updateCategorySeq();
	   	vm.selectTypePaper();
	   	vm.selectOriginFileNme();
	},
});
//���� ���ε�� ���� �̸� ��ȸ
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function(){
			if(window.FileReader){
		    	var filename = $(this)[0].files[0].name;
		    } 
			else {
		    	var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.upload-name').val(filename);
		});
	}); 
			
</script>