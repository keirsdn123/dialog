<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
	var idFlag = 0; // 1이면 회원가입 가능(id 중복체크 한것!)
	var pwFlag = 0; // 1이면 회원가입 가능(id 중복체크 한것!)
	
	// 회원가입
	function memInsert(){
		if(idFlag == 0){
			swal({
                title: "아이디 중복확인을 해주세요",
                type: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인',
                confirmButtonClass: 'btn',
                allowOutsideClick:false,
		          allowEscapeKey:false,
			})
		}
		else if(pwFlag == 0){
			swal({
                title: "비밀번호를 확인 해주세요",
                type: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인',
                confirmButtonClass: 'btn',
                allowOutsideClick:false,
		          allowEscapeKey:false,
			})
		}
		else if($("#memberName").val()==""){
			swal({
                title: "회원가입을 위해 사용자 이름   	입력은 필수 입니다",
                type: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인',
                confirmButtonClass: 'btn',
                allowOutsideClick:false,
		          allowEscapeKey:false,
			})
			
		}
		else if($("#memberEmail1").val()==""){
			swal({
                title: "회원가입을 위해 이메일 입력은 필수 입니다",
                type: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인',
                confirmButtonClass: 'btn',
                allowOutsideClick:false,
		          allowEscapeKey:false,
			})
			
		}
		else if($("#memberEmail2").val()==""){
			swal({
                title: "회원가입을 위해 이메일 입력은 필수 입니다",
                type: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: '확인',
                confirmButtonClass: 'btn',
                allowOutsideClick:false,
		          allowEscapeKey:false,
			})
			
		}
		else{
			var formData= new FormData($("#joinFrm")[0]);
			console.log(formData);
//         document.joinFrm.action = "/insertViewInfo";
//         document.joinFrm.submit();
		$.ajax({
        type:"POST",
			url: "/insertViewInfo", // id 중복확인
	             data : formData,      
   	             processData: false,
   	             contentType: false,   
   				 beforeSend: function(){
   					$("#loading").show();
   				 },
   				 success : function() {
				    	$("#loading").hide();
				        swal({
				            title: "회원가입이 완료되었습니다",
				            type: 'success',
				            confirmButtonColor: '#3085d6',
				            confirmButtonText: '확인',
				            confirmButtonClass: 'btn',
				            allowOutsideClick:false,
					          allowEscapeKey:false,
						}).then(function(isConfirm){
							if(isConfirm){
								window.location.href='/login';
							}
						}).catch(swal.noop);
   				 },
    				error : function(xhr, status, error) {
    					$("#loading").hide();
    					swal({
    		                  title: "데이터 셋 등록 오류",
    	                      type: 'warning',
    	                      confirmButtonColor: '#3085d6',
    	                      confirmButtonText: '확인',
    	                      confirmButtonClass: 'btn',
    					});
    				}
	 })
		}

		

	}
		// 이메일 선택, 직접입력
	function insertEmail(){
	    if (joinFrm.email.value == '직접입력') {
	    	joinFrm.memberEmail2.readOnly = false;
	    	joinFrm.memberEmail2.value = '';
	    	joinFrm.memberEmail2.focus();
	    }
	    else {
	    	joinFrm.memberEmail2.readOnly = true;
	    	joinFrm.memberEmail2.value = joinFrm.email.value;
	    }
	}
	
		// 중복확인, 아이디체크
	function idCheck(){
			if(idFlag == 1){
				$("#memberId").attr("readonly", false);
				idFlag = 0;
			$('#idCheckBtn').attr("value","중복확인");
			$("#idCheckDIV").html("<font color='red'>아이디 중복 체크를 해주세요.</font>");
			}
			
			else{
			// 아이디 길이 체크 (4~12자)
		 		var memberId = $("#memberId").val();
		 		if (memberId.length<4 || memberId.length>12) {
		 			$("#idCheckDIV").html("<font color='red'>아이디는 4~12자로 입력해주세요.</font>");
		 			joinFrm.memberId.focus();
					return false;
				}
		 		// 입력된 첫번째 문자가 숫자인지 체크
		 		else if(!isNaN(memberId.substr(0,1))){
		 			$("#idCheckDIV").html("<font color='red'>아이디는 숫자로 시작할 수 없습니다.</font>");
		 			joinFrm.memberId.focus();
		            return;
		 		}
		 		// 영어와 숫자로만 구성되어 있는지 체크
				for (i=0; i<memberId.length; i++)
				{
					var ch = memberId.charAt(i);//문자를 반환(정수형), 범위 검사 가능
					//입력된 문자를 검사
					if ( ( ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9" ) ) 
					{
						$("#idCheckDIV").html("<font color='red'>아이디는 영문 소문자,숫자로만 입력 가능 합니다.</font>");
						joinFrm.memberId.focus();
						return;
					}
				}
				$.ajax({
					type:"POST",
					url: "/selectMemIdCheck", // id 중복확인
					data:{"memberId":$("#memberId").val()},
					success:function(check){
						if(check == 0){
							$("#idCheckDIV").html("<font color='blue'>사용가능한 아이디입니다.</font>");
							idFlag = 1;
							$('#memberId').attr("readonly",true);
							$('#idCheckBtn').attr("value","취소");
						}
						else{
							$("#idCheckDIV").html("<font color='red'>이미 존재하는 아이디입니다.</font>");
							idFlag = 0;
						}
					},
				    error:function(xhr,status,error)
				    { //ajax 오류인경우  
				    	alert("잘못된 입력입니다.");
			            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
			   		}
				});
			}
		}
	
		// 패스워드 체크
		function pwCheck(){
			var memberPassword = $("#memberPassword").val();
			var memPwConfirm = $("#memPwConfirm").val();
	
			if(memberPassword == '' || memberPassword == null){
				$("#pwCheckDIV").html("<font color='red'>비밀번호를 입력해 주세요.</font>");
				pwFlag = 0;
			}
			else if(memberPassword.length<4 || memberPassword.length>12){
			$("#pwCheckDIV").html("<font color='red'>비밀번호는 4~12자로 입력해주세요.</font>");
			pwFlag = 0;
		}
			else if(memPwConfirm == '' || memPwConfirm == null){
			$("#pwCheckDIV").html("<font color='red'>비밀번호 확인을 입력해주세요.</font>");
			pwFlag = 0;
		}
			else{
				if(memberPassword == memPwConfirm){
					$("#pwCheckDIV").html("<font color='blue'>비밀번호 / 확인이 일치합니다.</font>");
					pwFlag = 1;
				}
				else{
					$("#pwCheckDIV").html("<font color='red'>비밀번호 / 확인이 일치하지 않습니다.</font>");
					pwFlag = 0;
				}
			}
			
		}
</script>
