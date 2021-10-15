<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
var vm = new Vue({
	el: "#reportUpdate" ,
	data : {
		getCategoryList:[], //팝업창의 카테고리 가지고옴
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
		selectDataList : [], //팝업창의 데이터셋 불러오기
		selectRatingList : {},
		selectCategory : [], //팝업창의 카테고리별 데이터셋 가지고오기
		dataSort: 0, // 정렬
		dataSearchWrd : '', // 검색어
		selectdSearchDataSet : [],
		reportCode : ${reportCode},
		uReportInfo : {},
		reportTypeNormalPaper:'',
		originFileTitle: '',
	},
	methods : {
		//등록한거 미리 불러오기
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
					alert("안불러오네?");
				}
			})
		},
		//보고서 수정(일반보고서/논문)
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
						if(vm.reportTypeNormalPaper == "일반보고서"){
							$("input:radio[name='typeNormalRegularly'][value='일반보고서']").prop("checked", true);
						} else
							$("input:radio[name='typeNormalRegularly'][value='논문']").prop("checked", true);
					}
				},
				error : function() {
					alert("안불러오네?");
				}
			})
		},
		//보고서 수정(파일이름)
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
					alert("안불러오네?");
				}
			})
		},
		//멤버 권한
		AuthorityList : function(){
			 var vm = this;
			 $.ajax({
				url: "/selectRatingList", 		
			 	data :{
			 	},
			 	type:'post',
			 	success: function(list){
			 		("왜 jsp가 안되는 것이냐 궁금하도다");
			 		vm.selectRatingList = list;
			 	},
			 	error : function(){
			 		alert("hhhh");
			 	}
			 })
			},
		
		//카테고리 선택
		selectCategoryList : function(){
			var vm = this;
			$.ajax({
				url: "/getCategotyList", //DataSetAjaxController 에 있다.
				data: {					
				},
				type: 'post',
				success: function(list){
					vm.getCategoryList = list;
				},
				error : function () {
					alert("카테고리 안된다.");
				}
			})
		},	
		
		//연관 참조 데이터
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
				url:"/selectDataSetBox", //선택한 데이터셋 연관 참조 데이터에 td 줄에 들어간다.
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
					alert("데이터셋 박스 고장났다.");
				}
			})
		},
		//수정시 연관데이터셋 미리 불러옵니다
		updateDatasetBox : function(){
			var vm = this;
			$.ajax({
				url:"/selectUDataSetBox", //선택한 데이터셋 연관 참조 데이터에 td 줄에 들어간다.
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
					alert("데이터셋 박스 고장났다.");
				}
			})
		},
		selectFileType1 : function(){ 
			var vm = this;
			$.ajax({
				url:"/selectFileType1", //일시적 데이터 클릭시 실행
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
				url:"/selectFileType2", //정기적 데이터 클릭시 실행
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
				url:"/selectMyFile", //나만의 데이터 클릭시 실행
				data : {
					
				},
				type: 'post',
				success: function(list){
					vm.selectDataList = list;
				}
			})
		},
		//데이터셋 검색
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
					alert("에러");
				}
			})
		},
		//연관참조 데이터 취소
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
		//보고서 수정
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
		                  title: "데이터 셋 수정 완료",
	                      type: 'success',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
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
		                  title: "데이터 셋 수정 오류",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
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
 	   		  		alert("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
	   		  		}
			})
		},
		updateSecCategorySeq : function(seq){
			var vm = this;
			console.log("카테고리1차"+seq);
			console.log("보고서seq"+vm.reportCode);
			
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
                	   console.log("아아아앙앙!!!"+list[i].categorySeq);
                	   
                	   vm.id = list[i].categorySeq;
	                	                   
	               		vm.value.push(vm.id)
	               		console.log(vm.value);
                   }
	 	   				
							
				},
				error : function(){
 	   		  		alert("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
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
//파일 업로드시 파일 이름 조회
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