<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
Vue.component('treeselect', VueTreeselect.Treeselect)
var vm = new Vue({
	el: "#reportUpdate" ,
	data : {
		getCategoryList:[], //橡穣但税 朝砺壱軒 亜走壱身
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
		selectDataList : [], //橡穣但税 汽戚斗実 災君神奄
		selectRatingList : {},
		selectCategory : [], //橡穣但税 朝砺壱軒紺 汽戚斗実 亜走壱神奄
		dataSort: 0, // 舛慶
		dataSearchWrd : '', // 伊事嬢
		selectdSearchDataSet : [],
		reportCode : ${reportCode},
		uReportInfo : {},
		reportTypeNormalPaper:'',
		originFileTitle: '',
	},
	methods : {
		//去系廃暗 耕軒 災君神奄
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
					alert("照災君神革?");
				}
			})
		},
		//左壱辞 呪舛(析鋼左壱辞/轄庚)
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
						if(vm.reportTypeNormalPaper == "析鋼左壱辞"){
							$("input:radio[name='typeNormalRegularly'][value='析鋼左壱辞']").prop("checked", true);
						} else
							$("input:radio[name='typeNormalRegularly'][value='轄庚']").prop("checked", true);
					}
				},
				error : function() {
					alert("照災君神革?");
				}
			})
		},
		//左壱辞 呪舛(督析戚硯)
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
					alert("照災君神革?");
				}
			})
		},
		//呉獄 映廃
		AuthorityList : function(){
			 var vm = this;
			 $.ajax({
				url: "/selectRatingList", 		
			 	data :{
			 	},
			 	type:'post',
			 	success: function(list){
			 		("訊 jsp亜 照鞠澗 依戚劃 叡榎馬亀陥");
			 		vm.selectRatingList = list;
			 	},
			 	error : function(){
			 		alert("hhhh");
			 	}
			 })
			},
		
		//朝砺壱軒 識澱
		selectCategoryList : function(){
			var vm = this;
			$.ajax({
				url: "/getCategotyList", //DataSetAjaxController 拭 赤陥.
				data: {					
				},
				type: 'post',
				success: function(list){
					vm.getCategoryList = list;
				},
				error : function () {
					alert("朝砺壱軒 照吉陥.");
				}
			})
		},	
		
		//尻淫 凧繕 汽戚斗
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
				url:"/selectDataSetBox", //識澱廃 汽戚斗実 尻淫 凧繕 汽戚斗拭 td 匝拭 級嬢娃陥.
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
					alert("汽戚斗実 酵什 壱舌概陥.");
				}
			})
		},
		//呪舛獣 尻淫汽戚斗実 耕軒 災君辛艦陥
		updateDatasetBox : function(){
			var vm = this;
			$.ajax({
				url:"/selectUDataSetBox", //識澱廃 汽戚斗実 尻淫 凧繕 汽戚斗拭 td 匝拭 級嬢娃陥.
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
					alert("汽戚斗実 酵什 壱舌概陥.");
				}
			})
		},
		selectFileType1 : function(){ 
			var vm = this;
			$.ajax({
				url:"/selectFileType1", //析獣旋 汽戚斗 適遣獣 叔楳
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
				url:"/selectFileType2", //舛奄旋 汽戚斗 適遣獣 叔楳
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
				url:"/selectMyFile", //蟹幻税 汽戚斗 適遣獣 叔楳
				data : {
					
				},
				type: 'post',
				success: function(list){
					vm.selectDataList = list;
				}
			})
		},
		//汽戚斗実 伊事
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
					alert("拭君");
				}
			})
		},
		//尻淫凧繕 汽戚斗 昼社
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
		//左壱辞 呪舛
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
		                  title: "汽戚斗 実 呪舛 刃戟",
	                      type: 'success',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '溌昔',
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
		                  title: "汽戚斗 実 呪舛 神嫌",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '溌昔',
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
 	   		  		alert("けけけけけけけけけけけけけけ");
	   		  		}
			})
		},
		updateSecCategorySeq : function(seq){
			var vm = this;
			console.log("朝砺壱軒1託"+seq);
			console.log("左壱辞seq"+vm.reportCode);
			
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
                	   console.log("焼焼焼肖肖!!!"+list[i].categorySeq);
                	   
                	   vm.id = list[i].categorySeq;
	                	                   
	               		vm.value.push(vm.id)
	               		console.log(vm.value);
                   }
	 	   				
							
				},
				error : function(){
 	   		  		alert("けけけけけけけけけけけけけけ");
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
//督析 穣稽球獣 督析 戚硯 繕噺
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