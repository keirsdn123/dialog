<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var vm = new Vue({
				el : "#dataManageInfo",
				data : {
					cateCode : 0, //카테고리seq
					cateTitle : '', //카테고리명
					cateRoot : '', //카테고리 관계
					cateList : [], //카테고리 정보 리스트
					cateInfo : {}, //카테고리 정보
					cateCount : 0, //카테고리 별 데이터셋 갯수
					
					dtSetList1 : [], //일시데이터셋 리스트
					dtSetList2 : [], //정기데이터셋 리스트
					dataCode : 0, //데이터셋seq
					dataType : '', //데이터타입
					
					infoRawDataColumn : [], //raw데이터 컬럼
					infoRawDataRecode : [], //raw데이터 레코드 리스트

					infoSdDataRecode : [], //표준데이터
					infoSdDataDetailRecode : [], //표준데이터 상세

					regularDataCode : '', //정기테이블seq
					regularDataTableLoot : '', //정기테이블 관계
					regularDataTableTitle : '', //정기테이블명
					rD : {}, //정기테이블 정보
					regularData : [], //정기테이블 정보 리스트
					
					selected: 1, // 검색조건
					options: [
						{text: '제목', value: '1'},
						{text: '내용', value: '2'},
						{text: '작성자', value: '3'},
					], // 검색옵션
					searchWrd: '', // 검색어
					
					pagingInfo1: {
		                currentPage: 1,
		                records: 0,
		                perPage: 5,
		            }, //일시페이징
		            pagingInfo2: {
		                currentPage: 1,
		                records: 0,
		                perPage: 5,
		            }, //정기페이징
				},
				
				methods : {
					
					//카테고리 조회
					categoryList : function() {
						var vm = this;
						$.ajax({
							url : "/dataManage/getCategoryList",
							type : 'post',
							success : function(list) {
								$.each(list, function(i, e) {
									vm.cateCode = e.cateCode;
									vm.cateRoot = "#";
									vm.cateTitle = e.cateTitle;
									vm.cateCount = e.cateCount;
									vm.cateInfo = {
										id : vm.cateCode,
										parent : vm.cateRoot,
										text : vm.cateTitle + "(" + vm.cateCount + ")"
									};
									vm.cateList.push(vm.cateInfo)
								})
								$('#cateTree').jstree({
									'plugins' : [ "wholerow" ],
									'core' : {
										'data' : vm.cateList,
										'themes' : {
											'name' : 'proton',
											'responsive' : true
										}
									}
								});

								$('#cateTree').on("select_node.jstree", function(e, data) {
									vm.cateCode = data.node.id;
									vm.selectDtset();
								});

								vm.cateCode = 0;
								vm.cateTitle = '';
								vm.cateRoot = '';
								vm.cateCount = 0;
								vm.cateList = [];
								vm.cateInfo = {};
								
								vm.selectDtset();
								
// 								vm.infoRawData(1,"일시","Y");
							},
							error : function() {
								swal({
									title: '카테고리 조회 실패.',
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    allowOutsideClick:false,
							        allowEscapeKey:false,
								})
							}
						});
					}, 
					
					//데이터셋 조회
					selectDtset : function() {
						var vm = this;
						$.ajax({
							url : '/dataManage/selectDtset',
							data : {
								"cateCode" : vm.cateCode,
								"selected" : vm.selected,
								"searchWrd" : vm.searchWrd,
								"currentPage1" : vm.pagingInfo1.currentPage,
				    			"perPage1" : vm.pagingInfo1.perPage,
				    			"currentPage2" : vm.pagingInfo2.currentPage,
				    			"perPage2" : vm.pagingInfo2.perPage,
							},
							type : 'post',
							success : function(list) {
								vm.dtSetList1 = list.selectDtset1;
								vm.dtSetList2 = list.selectDtset2;
								vm.pagingInfo1.records = list.countDtset1;
								vm.pagingInfo2.records = list.countDtset2;
							},
							error : function() {
								swal({
									title: '데이터셋 조회 실패.',
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    allowOutsideClick:false,
							        allowEscapeKey:false,
								})
							}
						})
					},
					
					// raw데이터, 표준데이터정보, 표준데이터상세 조회
					infoRawData : function(code, type, whether) {
						var vm = this;
						vm.dataType = type;
						if(whether == "N" || whether == null){
							swal({
								text: '해당 데이터셋은 데이터베이스가 존재하지 않습니다.',
								type: 'warning',
								confirmButtonColor: '#3085d6',
								confirmButtonText: '확인',
								confirmButtonClass: 'btn',
								allowOutsideClick:false, //밖에 클릭해도 안없어짐
								allowEscapeKey:false, //esc 눌러도 안없어짐
							})
							return;
						}
						$.ajax({
							url : '/dataManage/infoRawData',
							data : {
								"dataCode" : code,
								"dataType" : vm.dataType,
							},
							type : 'post',
							beforeSend: function(){
								$("#loading").show();
							},
							success : function(info) {
								$("#loading").hide();
								vm.infoRawDataColumn = info.infoRawDataColumn;
								vm.infoRawDataRecode = info.infoRawDataRecode;
								vm.infoSdDataRecode = info.infoSdDataRecode;
								vm.infoSdDataDetailRecode = info.infoSdDataDetailRecode;
								
								vm.dataCode = code;

								$.each(info.selectRegularTb, function(i, e) {
									vm.regularDataCode = e.regularDataCode;							
									if (type == "일시") {
										vm.regularDataTableLoot = "#";
									}
									else {
										vm.regularDataTableLoot = e.regularDataTableLoot;
									}
									vm.regularDataTableTitle = e.regularDataTableTitle;
									vm.rD = {
										id : vm.regularDataCode,
										parent : vm.regularDataTableLoot,
										text : vm.regularDataTableTitle
									};
									vm.regularData.push(vm.rD)
								})

								$('#rawTableTree').jstree("destroy");
								$('#rawTableTree').jstree({
									'plugins' : [ "wholerow" ],
									'core' : {
										'data' : vm.regularData,
										'themes' : {
											'name' : 'proton',
											'responsive' : true
										}
									}
								});
								
								$('#rawTableTree').on("select_node.jstree", function(e, data) {
									vm.regularDataTableTitle = data.node.text;
									vm.infoRd(vm.regularDataTableTitle, vm.dataType);
								});
										
								if(info.tbTitle.normalDataStandardTableTitle == null){
									swal({
										text: '시각화가 되지않은 데이터셋입니다.',
										type: 'warning',
										confirmButtonColor: '#3085d6',
										confirmButtonText: '확인',
										confirmButtonClass: 'btn',
										allowOutsideClick:false, //밖에 클릭해도 안없어짐
										allowEscapeKey:false, //esc 눌러도 안없어짐
									})
									info.tbTitle.normalDataStandardTableTitle = "표준테이블이 존재하지 않습니다.";
								}
								$('#sdTableTree').jstree("destroy");
								$('#sdTableTree').jstree({
									'plugins' : [ "wholerow" ],
									'core' : {
										'data' : {id: 0, parent: "#", text: info.tbTitle.normalDataStandardTableTitle},
										'themes' : {
											'name' : 'proton',
											'responsive' : true
										}
									}
								});
								
								vm.regularDataCode = '';
								vm.regularDataTableTitle = '';
								vm.regularDataTableLoot = '';
								vm.regularData = [];
								vm.rD = {};
							},
							error : function() {
								$("#loading").hide();
								swal({
									title: '데이터베이스 조회 실패.',
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    allowOutsideClick:false,
							        allowEscapeKey:false,
								})
							}
						})
					},
					
 					// 테이블구조에 따른 raw데이터레코드 조회
					infoRd : function(title,type) {
						var vm = this;
						$.ajax({
							url : '/dataManage/infoRd',
							data : {
								"normalDataTableTitle" : title,
								"dataType" : type,
							},
							type : 'post',
							beforeSend: function(){
								$("#loading").show();
							},
							success : function(info) {
								$("#loading").hide();
								vm.infoRawDataColumn = info.infoRawDataColumn;
								vm.infoRawDataRecode = info.infoRawDataRecode;

							},
							error : function() {
								$("#loading").hide();
								swal({
									title: 'raw데이터 조회 실패.',
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    allowOutsideClick:false,
							        allowEscapeKey:false,
								})
							}
						})
					},

				},

				filters : {

				},
				watch : {

				},
				mounted : function() {
					var vm = this;
					vm.categoryList();
					this.$refs.table1.$on('change', function(page){
			            if(vm.pagingInfo1.currentPage != page) {
			               vm.pagingInfo1.currentPage = page;
 			               vm.selectDtset();//데이터셋조회
			            }
			        });
					this.$refs.table2.$on('change', function(page){
			            if(vm.pagingInfo2.currentPage != page) {
			               vm.pagingInfo2.currentPage = page;
 			               vm.selectDtset();
			            }
			        });
				},
			});
</script>