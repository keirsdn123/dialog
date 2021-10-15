 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	var vm = new Vue({
		el : "#standarData",
		data : {
			dbDatasetCoList: [],		//db데이터셋 컬럼명 리스트
			dbDatasetList: [],			//db데이터셋 데이터 리스트
			columnName: [],				//db데이터셋 데이터 조회를 위한 컬럼명 텍스트 뽑기
			selecColumn: [],			//체크박스 선택시 바인딩 되는 리스트
			processList: [],			//팝업창 데이터 조회
			processQueryList: ["CASE"],	//팝업창 값변경 쿼리	
			standarLabelList: [],		//표준설명리스트
			totalObject: [],			//최종 결과
			
			standarColumName: "",		//표준데이터 컬럼명
			standarLableName: "",		//표준데이터 컬럼레이블명
			vizRequests: "",			//시각화 요청내용
			
			calQueryText: "",			//수치컬럼 합치기 계산쿼리
			concatQueryText: "",		//문자컬럼 합치기 concat쿼리
			processQueryText: "",		//가공쿼리 
			keyword: "",				//키워드빈도 변수
			
			normalDataTableTitle: "${normalDataTableTitle}",	//데이터셋 테이블명
			dataCode: ${dataCode},								//데이터 코드
			standarTbTitle: "${normalDataTableTitle}_st"+${dataCode}+"_detail",		//표준데이터 테이블명 
			
			intCount: 0,
			varCount: 0,
			
			btnFlag: true,
			elseFlag: true,		//그외값 설정 여부 flag
		},	
		methods : {
<!--컬럼명  리스트조회-->			
			selectDbDatasetCoList : function() {
					var vm = this;
					$.ajax({
						url : '/dataSetCreate/selectDbDatasetCoList',
						data : {
							"normalDataTableTitle" : vm.normalDataTableTitle,
							"dataCode" : vm.dataCode,
						},
						type : "POST",
						success : function(selecMap) {
							vm.dbDatasetCoList = selecMap.coList;
							vm.vizRequests = selecMap.vizRequests;
							
							$.grep(selecMap.coList,function(value, index){
							   vm.columnName.push("`"+value.columnName+"`");
							});				
							
							var scolNme = vm.columnName.toString();					
							vm.selectDbDatasetList(scolNme);
						},
						error : function() {
							alert("에러다dd");
						}
					})
			},
<!--생성DB데이터 리스트조회-->
			selectDbDatasetList : function(scolNme) {		
					var vm = this;
					
					$.ajax({
						url : '/dataSetCreate/selectDbDatasetList',
						data: {
							"colNme": scolNme,
							"normalDataTableTitle" : vm.normalDataTableTitle,
						},
						type: "POST",
						success : function(list) {							
							vm.dbDatasetList = list;							
						},
						error : function() {
							alert("에러다z");
						}
					})
			},
<!--추가 버튼들 btnType-1:추가, 2:가공 후 추가, 3:컬럼합치기-->
			standardBtn: function(btnType){
			
				if(!this.selecColumn.length){		<!--컬럼선택 안했을때-->	
					swal({
						text:"표준화할 컬럼을 선택하세요",
	                    type: 'warning',
	                    confirmButtonColor: '#3085d6',
	                    confirmButtonText: '확인',
	                    confirmButtonClass: 'btn',
	                    allowOutsideClick:false, //밖에 클릭해도 안 없어짐
	                    allowEscapeKey:false, //esc 눌러도 안 없어짐
					});
					return false;
				}
				else if(btnType == 2 && this.selecColumn.length > 1 || btnType == 4 && this.selecColumn.length > 1){	<!--가공 후 추가인데 한컬럼이상 선택했을때-->	
					swal({
		                  text:"컬럼을 하나만 선택하세요.",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
	                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
	                      allowEscapeKey:false, //esc 눌러도 안 없어짐
	                      
					});
					return;
				}
				else if(btnType == 3 && this.selecColumn.length < 2 || btnType == 3 && this.selecColumn.length > 2){	<!--컬럼합치기인데 컬럼 2개아닐때-->	
					swal({
		                  text:"컬럼을 두개만 선택하세요.",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
	                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
	                      allowEscapeKey:false, //esc 눌러도 안 없어짐
					});
					return;   
				} 
				else if(btnType == 1 && this.selecColumn.length){	<!--일반추가이고 선택한 컬럼이 있을 떄-->			
					for(var i = 0; i<this.selecColumn.length; i++){
						
						if(this.varCount < 5 && this.selecColumn[i].dataType == "varchar"){
							var test = {
									"stColNme" : this.selecColumn[i].columnName,
									"stLableNme" : this.standarLableName,
									"stDataType" : this.selecColumn[i].dataType,
									"stQryList" : "`"+this.selecColumn[i].columnName+"`",					
							}		
							this.varCount++;
							this.totalObject.push(test);	
						}
						else if(this.intCount < 5 && this.selecColumn[i].dataType == "int" || this.intCount < 5 && this.selecColumn[i].dataType == "double"){
					
							var test = {
									"stColNme" : this.selecColumn[i].columnName,
									"stLableNme" : this.standarLableName,
									"stDataType" : this.selecColumn[i].dataType,
									"stQryList" : "`"+this.selecColumn[i].columnName+"`",					
							}
							this.intCount++;
							this.totalObject.push(test);	
						}
						else if(this.varCount >= 5){
							swal({
								  title: "문자 가공목록을 확인하세요.",
				                  text: "문자 가공컬럼은 5개를 초과할 수 없습니다.",
			                      type: 'warning',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
			                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			                      allowEscapeKey:false, //esc 눌러도 안 없어짐
							});
							return;
						}
						else if(this.intCount >= 5){
							swal({
								  title: "수치 가공목록을 확인하세요.",
				                  text: "수치 가공컬럼은 5개를 초과할 수 없습니다.",
			                      type: 'warning',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
			                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			                      allowEscapeKey:false, //esc 눌러도 안 없어짐
							});
							return;
						}			
						console.log(this.intCount);
					}
					this.selecColumn = [];
					
				}
				else if(btnType == 2 && this.selecColumn.length == 1){
					
					var vm = this;
					if(this.intCount >= 5){
						swal({
							title: "수치 가공목록을 확인하세요.",
							text: "수치 가공컬럼은 5개를 초과할 수 없습니다.",
							type: 'warning',
							confirmButtonColor: '#3085d6',
							confirmButtonText: '확인',
							confirmButtonClass: 'btn',
							allowOutsideClick:false, //밖에 클릭해도 안 없어짐
							allowEscapeKey:false, //esc 눌러도 안 없어짐
						});
					}else{
						if(this.selecColumn[0].dataType == "varchar"){
							$("#standar_popvar").modal();					
						}else{						
							$("#standar_popint").modal();
						}
					}
					$.ajax({
						url : '/dataSetCreate/selectProcessList',
						data : {
							"colNme" : vm.selecColumn[0].columnName,
							"normalDataTableTitle" : vm.normalDataTableTitle,
						},
						type : "POST",
						success : function(ProcessList) {							
							vm.processList = ProcessList;	
						},
						error : function() {
							alert("가공 후 추가 에러다");
						}
					})	
				}
				else if(btnType == 3 && this.selecColumn.length == 2){		
					
					if(this.selecColumn[0].dataType == "double" && this.selecColumn[1].dataType == "double" || this.selecColumn[0].dataType == "double" && this.selecColumn[1].dataType == "int"
						||this.selecColumn[0].dataType == "int" && this.selecColumn[1].dataType == "double" || this.selecColumn[0].dataType == "int" && this.selecColumn[1].dataType == "int"){	<!--수치수치 컬럼합치기 선택시 -->	
						
						if(this.intCount >= 5){
							swal({
								title: "수치 가공목록을 확인하세요.",
								text: "수치 가공컬럼은 5개를 초과할 수 없습니다.",
								type: 'warning',
								confirmButtonColor: '#3085d6',
								confirmButtonText: '확인',
								confirmButtonClass: 'btn',
								allowOutsideClick:false, //밖에 클릭해도 안 없어짐
								allowEscapeKey:false, //esc 눌러도 안 없어짐
							});
						}else{
							$("#aa").css("display","table-row");
							$("#concatQueryT").css("display","none");
							$("#concatQuery").css("display","none");
							$("#calQueryT").css("display","block");
							$("#calQuery").css("display","block");
							$("#standar_popPlus").modal();
						}
					}		
					else{															<!--문자수치/문자문자 컬럼합치기 선택시 -->	
						if(this.varCount >= 5){
							swal({
								title: "문자 가공목록을 확인하세요.",
								text: "문자 가공컬럼은 5개를 초과할 수 없습니다.",
								type: 'warning',
								confirmButtonColor: '#3085d6',
								confirmButtonText: '확인',
								confirmButtonClass: 'btn',
								allowOutsideClick:false, //밖에 클릭해도 안 없어짐
								allowEscapeKey:false, //esc 눌러도 안 없어짐
							});
						}else{
							$("#aa").css("display","none");
							$("#calQueryT").css("display","none");
							$("#calQuery").css("display","none");
							$("#concatQueryT").css("display","block");
							$("#concatQuery").css("display","block");
							$("#standar_popPlus").modal();
							this.concatQueryText = "concat(`"+ this.selecColumn[0].columnName+"`,`" + this.selecColumn[1].columnName+"`)";		
						}
					}
				}
				else if(btnType == 4){
					if(this.intCount >= 5){
						swal({
							title: "수치 가공목록을 확인하세요.",
							text: "수치 가공컬럼은 5개를 초과할 수 없습니다.",
							type: 'warning',
							confirmButtonColor: '#3085d6',
							confirmButtonText: '확인',
							confirmButtonClass: 'btn',
							allowOutsideClick:false, //밖에 클릭해도 안 없어짐
							allowEscapeKey:false, //esc 눌러도 안 없어짐
						});
					}else{
						$("#standar_popkey").modal();
						$("#standar_popkey").on('shown.bs.modal', function(){
							$("#keywordText").focus();
							return;
						});
					}
				}				
			},

<!--컬럼합치기 계산-->		
			cal: function(calType){
				
				if(calType == 1){
					this.calQueryText = "`"+this.selecColumn[0].columnName+ "` + `" + this.selecColumn[1].columnName+"`";
					
				}else if(calType == 2){
					this.calQueryText = "(`"+this.selecColumn[0].columnName+ "` + `" + this.selecColumn[1].columnName + "`)"+"/2";
					
				}else if(calType == 3){
					this.calQueryText = "`"+this.selecColumn[0].columnName+ "` * `" + this.selecColumn[1].columnName+"`";
					
				}else{
					this.calQueryText = "`"+this.selecColumn[0].columnName+ "` / `" + this.selecColumn[1].columnName+"`";
				}
			},
<!--데이터 가공 processType-1:문자->수치, 2:수치 결측값처리, 3:문자 결측값처리, 4:범위번경-->			
			processAdd: function(processType){
				this.elseFlag = true;
				if(processType == 1){
					this.processQueryList.push(" WHEN `"+this.selecColumn[0].columnName+"`='"+$("#processList").val()+"' THEN "+$("#processList2").val());	
					this.standarLabelList.push($("#processList2").val()+":"+ $("#processList").val()+" ");
				}else if(processType == 2){
					this.processQueryList.push(" WHEN ISNULL(`"+this.selecColumn[0].columnName+"`) OR `"+this.selecColumn[0].columnName+"`= '' THEN "+ $("#null2").val());
				}else if(processType == 3){
					this.processQueryList.push(" WHEN ISNULL(`"+this.selecColumn[0].columnName+"`) OR `"+this.selecColumn[0].columnName+"`= '' THEN "+ $("#null").val());
					this.standarLabelList.push($("#null").val()+":널 값 ");
				}else if(processType == 4){
					this.processQueryList.push(" WHEN `"+this.selecColumn[0].columnName+"` BETWEEN "+ $("#rangeList").val()+" AND "+$("#rangeList2").val()+" THEN "+$("#between").val());
				}
			
				var puniq = this.processQueryList.reduce(function(a,b){			<!--중복제거-->
							if (a.indexOf(b) < 0 ) a.push(b);
							return a;},[]);
				
				var suniq = this.standarLabelList.reduce(function(a,b){			<!--중복제거-->
							if (a.indexOf(b) < 0 ) a.push(b);
							return a;},[]);

				this.processQueryText = puniq.toString().replace(/\,/gi,'');
				this.standarLableName = suniq.toString();
			},
<!--데이터 가공 그외값 설정-->
			setElse: function(){
				if(this.processQueryList == "CASE"){
					swal({
		                  text:"변경할 값을 추가하세요.",
	                      type: 'warning',
	                      confirmButtonColor: '#3085d6',
	                      confirmButtonText: '확인',
	                      confirmButtonClass: 'btn',
	                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
	                      allowEscapeKey:false, //esc 눌러도 안 없어짐
					}).then(function(){
						$("#processList").focus();
					});
					return;
				}
				else if(this.elseFlag == true){
					if(this.selecColumn[0].dataType == "varchar"){
						this.processQueryText += " ELSE "+$("#else").val()+" END";
						this.standarLableName += ","+$("#else").val()+":그외 값";
						this.elseFlag = false;
					}else if(this.selecColumn[0].dataType == "int" || this.selecColumn[0].dataType == "double"){
						this.processQueryText += " ELSE "+$("#else2").val()+" END";
						this.elseFlag = false;
					}
				}
			},
<!--팝업창 저장 saveType-1:cal, 2:concat, 3:varchar가공 , 4:int가공-->
			saveStandar: function(saveType){
				var test;
				
				if(saveType == 1){
					if(!this.standarColumName){
						swal({
			                  text:"표준화 컬럼명을 입력하세요",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
		                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
		                      allowEscapeKey:false, //esc 눌러도 안 없어짐
						}).then(function(){
							$("#standarColumName").focus();
						});
						return;
					}
					else {
						test = {
								"stColNme" : this.standarColumName,
								"stLableNme" : this.standarLableName,
								"stDataType" : "double",
								"stQryList" : this.calQueryText,
						}
						this.intCount++;
						this.calQueryText = "";
						$("#standar_popPlus").modal("hide");
					}
					
				}else if(saveType == 2){
					if(!this.standarColumName){
						swal({
			                  text:"표준화 컬럼명을 입력하세요",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
		                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
		                      allowEscapeKey:false, //esc 눌러도 안 없어짐
						}).then(function(){
							$("#standarColumName").focus();
						});
						return;
					}
					else {
						test = {
								"stColNme" : this.standarColumName,
								"stLableNme" : this.standarLableName,
								"stDataType" : "varchar",
								"stQryList" : this.concatQueryText,
						}			
						this.varCount++;
						this.concatQueryText = "";
						$("#standar_popPlus").modal("hide");	
					}			
				}else if(saveType == 3){
					if(this.elseFlag == true){
						swal({
			                  text:"나머지 값을 설정하세요.",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
		                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
		                      allowEscapeKey:false, //esc 눌러도 안 없어짐
						}).then(function(){
							$("#else").focus();
							
						});
						return;
					}
					else{
						test = {
					
								"stColNme" : this.selecColumn[0].columnName,
								"stLableNme" : "{"+this.standarLableName+"}",
								"stDataType" : "double",
								"stQryList" : this.processQueryText,
						}
						this.intCount++;
						this.processQueryText = "";
						this.standarLableName = "";
						this.processQueryList = ["CASE"];
						this.standarLabelList = [];
						this.elseFlag = true;
						$("#standar_popvar").modal("hide");
			
					}				
				}else if(saveType == 4){
					if(this.elseFlag == true){
						swal({
			                  text:"나머지 값을 설정하세요.",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
		                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
		                      allowEscapeKey:false, //esc 눌러도 안 없어짐
						}).then(function(){
							$("#else2").focus();									
						});
						return;
					}
					else{
						test = {
								"stColNme" : this.selecColumn[0].columnName,
								"stLableNme" : this.standarLableName,
								"stDataType" : "double",
								"stQryList" : this.processQueryText,
						}							
						this.intCount++;
						this.processQueryText = "";
						this.elseFlag = true;
						$("#standar_popint").modal("hide");
					}
				}else if(saveType == 5){
					console.log(this.keyword);
					if(!this.keyword){
						swal({
			                  text:"count할 키워드를 입력하세요.",
		                      type: 'warning',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
		                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
		                      allowEscapeKey:false, //esc 눌러도 안 없어짐
						}).then(function(){
							$("#keywordText").focus();
							
						});
						return;
						
					}
					else if(this.keyword){
						test = {
								"stColNme" : this.keyword+" 의 빈도",
								"stLableNme" : "{"+this.keyword+" 의 빈도:1, 미포함:0}",
								"stDataType" : "double",
								"stQryList" : "CASE WHEN `"+ this.selecColumn[0].columnName+"` LIKE '%"+this.keyword+"%' THEN 1 ELSE 0 END",
						}	
						this.intCount++;
						this.keyword = "";
						$("#standar_popkey").modal("hide");
					}
				}
				this.totalObject.push(test);
				this.selecColumn = [];
				this.standarColumName = "";
			},
<!--가공 취소-->
			standardCancle: function(){
				if(this.totalObject[this.totalObject.length-1].stDataType == "varchar"){
					this.totalObject.pop();
					this.varCount--;
				}else{
					this.totalObject.pop();
					this.intCount--;
				}
				console.log(this.intCount+"dd");
			},
<!--팝업창 닫기-->
			cancelPopup: function(cancelType){
				if(cancelType == 1){
					this.standarColumName = "";
					this.calQueryText = "";
					$("#standar_popPlus").modal("hide");
				}
				else if(cancelType == 2){
					this.standarColumName = "";
					this.concatQueryText = "";
					$("#standar_popPlus").modal("hide");
				}
				else if(cancelType == 3){
					this.processQueryText = "";
					this.standarLableName = "";
					this.processQueryList = ["CASE"];
					this.standarLabelList = [];
					$("#standar_popvar").modal("hide");
				}
				else if(cancelType == 4){
					this.processQueryText = "";
					$("#standar_popint").modal("hide");
					$("#rangeList").val("");
					$("#rangeList2").val("");
					$("#between").val("");
					$("#else2").val("");
					$("#null2").val("");
				}
				else if(cancelType == 5){
					this.keyword = "";
					$("#standar_popkey").modal("hide");
				}
			},
<!--쿼리 미리보기-->			
			setQuery: function () {
				
				var queryText = "";
					for (var i = 0; i < this.totalObject.length; i++) {
						queryText += this.totalObject[i].stQryList+",";
					}
				return queryText;
			},			
<!--표준데이터 등록 및 생성-->	
			insertStandarData: function() {
				var vm = this;

				var totalObject = JSON.stringify(this.totalObject)
// 				$.ajaxSettings.traditional = true;
				$.ajax({
					url : '/dataSetCreate/insertStandarData',
					data : {
						"totalObject" : totalObject,
						"dataCode" : vm.dataCode,
						"normalDataTableTitle" : vm.normalDataTableTitle,
					},
					type : "POST",
					beforeSend: function(){
						$("#loading").show();
					},
					success : function(errorTypeMap) {
						$("#loading").hide();
						if(errorTypeMap.errorType == 3){
							swal({
				                  title: "테이블 생성 오류",
				                  text:"이미 표준화된 데이터입니다.",
			                      type: 'error',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
			                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			                      allowEscapeKey:false, //esc 눌러도 안 없어짐
							});
						}else{
							swal({
				                  title: "테이블 생성 성공",
			                      type: 'success',
			                      confirmButtonColor: '#3085d6',
			                      confirmButtonText: '확인',
			                      confirmButtonClass: 'btn',
			                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
			                      allowEscapeKey:false, //esc 눌러도 안 없어짐
							}).then(function(){
								vm.standarPreviewList(vm.dataCode, vm.standarTbTitle);	
							});		
						}
					},
					error : function() {
						$("#loading").hide();
						swal({
			                  title: "쿼리 오류",
			                  text: "가공 할 데이터를 추가해주세요.",
		                      type: 'error',
		                      confirmButtonColor: '#3085d6',
		                      confirmButtonText: '확인',
		                      confirmButtonClass: 'btn',
		                      allowOutsideClick:false, //밖에 클릭해도 안 없어짐
		                      allowEscapeKey:false, //esc 눌러도 안 없어짐
						});
					}
				})
			},
<!--표준데이터 미리보기 화면이동-->	
			standarPreviewList: function(dataCode, standarTbTitle) {

				$("#pageChange").html(
						"<input type='hidden' name='dataCode' value="+dataCode+">"+
						"<input type='hidden' name='standarTbTitle' value='"+standarTbTitle+"'>"
				);
				$("#pageChange").attr("action", "/dataCreate/selectViewStandarPreview");
				$("#pageChange").submit();
			},
		},
		filters : {

		},
		watch : {
			
		},
		mounted : function() { //dom을 다 읽고 vue객체가 생성되었다는 뜻ready와 비슷(?)
			var vm = this;
			vm.selectDbDatasetCoList();			
		},
	});
	
</script>