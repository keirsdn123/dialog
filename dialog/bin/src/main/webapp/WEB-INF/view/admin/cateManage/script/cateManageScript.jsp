<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <style>

 </style>
<script>
	var vm = new Vue({
		el: "#cateManage",
		data: {
			cateCode : 0, //카테고리seq
			
			cateTitle : '', //카테고리명
			cateTitle1: '', //메인카테고리명(등록)
			cateTitle2: '', //하위카테고리명
			cateTitle3: '', //메인카테고리명(조회)
			
			updateTitle1: '', //메인카테고리명(수정)
			updateTitle2: '', //하위카테고리명(수정)
			updateTitle3: '', //카테고리명(수정)
			
			cateRoot : '', //카테고리 관계
			cateCount : 0, //카테고리 별 데이터셋 갯수
			cateInfo : {}, //카테고리 정보
			cateList : [], //카테고리 정보 리스트
			
			parentCate: [], //메인 카테고리 리스트
			childCate: [], //하위 카테고리 리스트
			ppppp: '메인 카테고리가 선택되지 않았습니다.',
			
			cateRoot1:'',
			selector: 0,
		},
		
		methods: {	
			//카테고리조회
			selectCate: function(){
				var vm = this;
				$.ajax({
					url: '/cateManage/selectCate',
					data:{
						
					},
					type:'post',
					success: function(list){
						vm.parentCate = list.selectCate1;
						$.each(list.selectCate1, function(i,e){
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
						
						$.each(list.selectCate2, function(i,e){
							vm.cateCode = e.cateCode;
							vm.cateRoot = e.cateRoot;
							vm.cateTitle = e.cateTitle;
							vm.cateCount = e.cateCount;
							vm.cateInfo = {
								id : vm.cateCode,
								parent : vm.cateRoot,
								text : vm.cateTitle + "(" + vm.cateCount + ")"	
							};
							vm.cateList.push(vm.cateInfo)
						})
						
						$('#cateTree').jstree("destroy");
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
						
						vm.cateCode = 0;
						vm.cateTitle = '';
						vm.cateCount = 0;
						vm.cateList = [];
						vm.cateInfo = {};
						
					},
					error: function(){
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
		
			//상위카테고리 등록
			insertCate: function(){
				var vm = this;
				if(this.cateTitle1 == ""){
					swal({
						title: '카테고리명을 입력하세요.',
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
					url: '/cateManage/insertCate',
					data: {
						"cateTitle": vm.cateTitle1,		
					},
					type: 'post',
					success: function(){
						swal({
							title: '카테고리가 추가되었습니다.',
							type: 'success',
							confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								vm.selectCate();
								vm.formShow(1);
								vm.cateTitle1='';
							}
						}).catch(swal.noop);
					},
					error: function(){
						swal({
							title: '카테고리 추가 실패.',
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
			
			//하위카테고리 등록
			insertCate2: function(){
				var vm = this;
				if(this.cateTitle2 == ""){
					swal({
						title: '카테고리명을 입력하세요.',
						type: 'warning',
						confirmButtonColor: '#3085d6',
						confirmButtonText: '확인',
						confirmButtonClass: 'btn',
						allowOutsideClick:false,
						allowEscapeKey:false,
					})
					return;
				}
				$.ajax({
					url: '/cateManage/insertCate2',
					data: {
						"cateTitle": vm.cateTitle2,
						"cateRoot": vm.cateRoot1,
					},
					type: 'post',
					success: function(){
						swal({
							title: '카테고리가 추가되었습니다.',
							type: 'success',
							confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								vm.selectCate();
								vm.formShow(2);
								vm.selectChild(vm.cateRoot1, vm.cateTitle3);
								vm.cateTitle2='';
							}
						}).catch(swal.noop);
					},
					error: function(){
						swal({
							title: '카테고리 추가 실패.',
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
			
			//하위카테고리조회
			selectChild: function(seq, title){
				var vm = this;
				vm.selector = seq;
				vm.cateRoot1 = seq;
				vm.cateTitle3 = title;
				$.ajax({
					url: '/cateManage/selectChild',
					data: {
						"cateRoot": vm.cateRoot1,
					},
					type: 'post',
					success: function(list){
						vm.childCate = list;
						vm.formShow(3);
						vm.cancelShow(0,4);
					},
					error: function(){
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
				})
					
			},
			
			//카테고리수정
			updateCate: function(seq,type){
				var vm = this;
				if(type==1){
					if(this.updateTitle1 == ""){
						swal({
							title: '카테고리명을 입력하세요.',
							type: 'warning',
							confirmButtonColor: '#3085d6',
							confirmButtonText: '확인',
							confirmButtonClass: 'btn',
							allowOutsideClick:false,
							allowEscapeKey:false,
						})
						return;
					}
					vm.updateTitle3 = vm.updateTitle1;
				}
				else{
					if(this.updateTitle2 == ""){
						swal({
							title: '카테고리명을 입력하세요.',
							type: 'warning',
							confirmButtonColor: '#3085d6',
							confirmButtonText: '확인',
							confirmButtonClass: 'btn',
							allowOutsideClick:false,
							allowEscapeKey:false,
						})
						return;
					}
					vm.updateTitle3 = vm.updateTitle2;
				}
				$.ajax({
					url: '/cateManage/updateCate',
					data: {
						"cateCode": seq,
						"cateType": type,
						"cateTitle": vm.updateTitle3,	
					},
					type: 'post',
					success: function(){
						swal({
							title: '카테고리가 변경되었습니다.',
							type: 'success',
							confirmButtonColor: '#3085d6',
		                    confirmButtonText: '확인',
		                    confirmButtonClass: 'btn',
		                    allowOutsideClick:false,
					        allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								vm.selectCate();
							
								if(type==1){
									vm.cateTitle3 = vm.updateTitle1;
									
									vm.cancelShow(0,3);
								}
								else{
									vm.selectChild(vm.cateRoot1, vm.cateTitle3);
									vm.cancelShow(0,4);
								}
								
								vm.updateTitle1='';
								vm.updateTitle2='';
								vm.updateTitle3='';
							}
						}).catch(swal.noop);
					},
					error: function(){
						swal({
							title: '카테고리 변경 실패.',
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
			
			//카테고리삭제
			deleteCate: function(seq,type){
				var vm = this;
				swal({
					title: '카테고리를 삭제하시겠습니까?',
					text: '해당 카테고리의 데이터셋은 "기타" 카테고리로 변경되며 하위 카테고리는 삭제됩니다.', 
				    type: 'question',
				    showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '확인',
			        cancelButtonText: '취소',
			        confirmButtonClass: 'btn',
			        cancelButtonClass: 'btn btn-cencle',
			        allowOutsideClick:false,
			        allowEscapeKey:false,
				}).then(function(isConfirm){
					if(isConfirm){
						$.ajax({
							url: '/cateManage/deleteCate',
							data: {
								"cateCode": seq,
								"cateType": type,
							},
							type: 'post',
							success: function(){
								swal({
									title: '카테고리가 삭제되었습니다.',
									type: 'success',
									confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    allowOutsideClick:false,
							        allowEscapeKey:false,
								}).then(function(isConfirm){
									if(isConfirm){
										vm.selectCate();
										if(type==1){
											$("tr[id^='childTr']").remove();
											vm.ppppp = '메인 카테고리가 선택되지 않았습니다.';		
											$("#ppp").show();
											$("#cC").hide();
										}
										else{
											vm.selectChild(vm.cateRoot1, vm.cateTitle3);
										}
									}
								}).catch(swal.noop);
							},
							error: function(){
								swal({
									title: '카테고리 삭제 실패.',
				                    type: 'error',
				                    confirmButtonColor: '#3085d6',
				                    confirmButtonText: '확인',
				                    confirmButtonClass: 'btn',
				                    allowOutsideClick:false,
							        allowEscapeKey:false,
								})
							}
						})
					}
				}).catch(swal.noop);
			},
			
			//toggle이벤트 시작
			formShow : function(num){			
				if(num==1){
					$("#aa").toggle();
			        $("#aaa").toggle();
			        $("#aaaa").toggle();
			        $("#pC").toggle();
			        this.cateTitle1='';
				}
				else if(num==2){
					$("#bb").toggle();
			        $("#bbb").toggle();
			        $("#bbbb").toggle();
					$("#cC").toggle();
					this.cateTitle2='';
				}
				else{
					$("#bb").hide();
			        $("#bbb").hide();
			        $("#bbbb").hide();
			        $("#cC").show();
			        $("#ppp").hide();
			        this.ppppp = this.cateTitle3 + ' > 하위 카테고리';
				}	
			},
			
			updateShow: function(seq,num){
				if(num==1){	
					$("#div" + seq).show();
					
					$("#list" + seq).hide();
					$("#pen" + seq).hide();
					$("#del" + seq).hide();
				}
				else{
					$("#childDiv" + seq).show();
					
					$("#childList" + seq).hide();
					$("#childPen" + seq).hide();
					$("#childDel" + seq).hide();
				}
			},
			
			cancelShow: function(seq,num){
				if(num==1){	
					$("#div" + seq).hide();
					
					$("#list" + seq).show();
					this.updateTitle1 = '';
				}
				else if(num==2){
					$("#childDiv" + seq).hide();
					
					$("#childList" + seq).show();
					this.updateTitle2 = '';
				}
				else if(num==3){
					$("div[id^='div']").hide();
					
					$("a[id^='list']").show();
					this.updateTitle1 = '';
				}
				else{
					$("div[id^='childDiv']").hide();
					
					$("a[id^='childList']").show();
					this.updateTitle2 = '';
				}
			},
			
			showIcon : function(seq,num){
				if(num==1){
					$("#pen" + seq).show();
					$("#del" + seq).show();
				}
				else{
					$("#childPen" + seq).show();
					$("#childDel" + seq).show();
				}
			},
			
			hideIcon : function(seq,num){
				if(num==1){
					$("#pen" + seq).hide();
					$("#del" + seq).hide();
				}
				else{
					$("#childPen" + seq).hide();
					$("#childDel" + seq).hide();
				}	
			}, //toggle이벤트 끝
			
		},
		
		filters: {
			
		},
		watch: {
			
		},
		
		mounted: function(){
			var vm = this;
			vm.selectCate();
		},
	});
</script>