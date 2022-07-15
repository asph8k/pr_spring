<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>BBS Test</title>


<!--회원가입 폼만 적용되는 css-->
<style type="text/css">
.table-striped>tbody>tr {
	background-color: #f9f9f9
}

.join-form {
	margin: 0 auto;
	padding: 20px;
	width: 50%;
	float: none;
	background-color: white;
}

.form-group>.sel {
	width: 120px;
	display: inline-block;
}
</style>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-9 col-sm-12 join-form">
					<h2>
						회원가입<small>(가운데정렬)</small>
					</h2>

					<form action="<c:url value='/user/userJoin'/>" method="post" id="joinForm">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="userId" name="userId" placeholder="아이디를 (영문포함 4~12자 이상)">
							<div class="input-group-addon">
								<button id="idCheckBtn" type="button" class="btn btn-primary">아이디중복체크</button>
							</div>
						</div>
						
						<span id="msgId">*필수 사항입니다.</span>
						
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="userPw" name ="userPw"
								placeholder="비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상)">
						</div>
						<div class="form-group">
							<label for="password-confrim">비밀번호 확인</label> <input
								type="password" class="form-control" id="password-confirm"
								placeholder="비밀번호를 확인해주세요.">
								<span id="msgPw-c"></span>
						</div>
						<div class="form-group">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요.">
						</div>
						<!--input2탭의 input-addon을 가져온다 -->
						<div class="form-group">
							<label for="hp">휴대폰번호</label><br> <input
								class="form-control sel" placeholder="010" id="userTel1" name="userTel1"> - <input
								class="form-control sel" placeholder="xxxx" id="userTel2" name="userTel2"> - <input
								class="form-control sel" placeholder="xxxx" id = "userTel3" name="userTel3">

						</div>
						<div class="form-group email-form">
							<div class="form-group">
								<label for="hp">이메일</label><br> <input
									class="form-control sel" id ="userEmail1" name="userEmail1"> <select
									class="form-control sel" id="userEmail2" name="userEmail2">
									<option>@naver.com</option>
									<option>@gmail.com</option>
									<option>@daum.net</option>
								</select>
								
								<div class="input-group-addon">
									<button type="button" id="mail-check-btn"
										class="btn btn-primary">이메일 인증</button>
								</div>
							</div>
							
							<div class="mail-check-box">
								<input type="text" class="form-control mail-check-input"
									placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
								<span id="mail-check-warn"></span>
								<!-- 인증번호 맞는지 틀린지 유무 표시하는 곳 -->
							</div>
						</div>

						<div class="form-group">
							<label for="addr-num">주소</label>
							<div class="input-group">
								<input type="text" class="form-control" id="userAddr1" name="userAddr1"
									placeholder="우편번호" readonly>
								<div class="input-group-addon">
									<button type="button" class="btn btn-primary"
										onclick="searchAddress()">주소찾기</button>
										<!-- 주소찾기 버튼이 클릭이 되면 goPopup()함수 실행  -->
										<!-- 주소찾기 버튼이 클릭이 되면 searchAddress()함수 실행 -->
								</div>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="userAddr2" name ="userAddr2"
								placeholder="기본주소">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="userAddr3" name ="userAddr3"
								placeholder="상세주소">
						</div>
						
						<div class="form-group">
							<button type="button" id="registBtn" class="btn btn-lg btn-success btn-block">회원가입</button>
						</div>
						<div class="form-group">
							<button type="button" id = "loginBtn" class="btn btn-lg btn-info btn-block">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>


	</section>
	<%@ include file="../includes/footer.jsp"%>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		var id = document.getElementById("userId");
		// 아이디가 들어있는 요소 찾기 
		console.log(id);
		
		// 아이디 형식 검사 
		id.onkeyup = function(){
			var regex = /^[A-Za-z0-9+]{4,12}$/;
			if (regex.test($('#userId').val())){
				document.getElementById("userId").style.borderColor="green";
				document.getElementById("msgId").innerHTML = "아이디 중복체크는 필수입니다.";
				$('#userId').attr('readonly', true);
			}
			else{
				document.getElementById("userId").style.borderColor = "red";
				document.getElementById("msgId").innerHTML = "사용불가능한 아이디형식입니다.";
			}
		} 
		// 아이디 형식 검사 끄읏 ~ 
		
		// 비밀번호 형식 검사 
		var pw = document.getElementById("userPw");
		console.log(pw);

		pw.onkeyup = function(){
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			
			if (regex.test($('#userPw').val())){
				document.getElementById("userPw").style.borderColor = "green";
			}
			else {
				document.getElementById("userPw").style.borderColor="red";
			}
		}
		// 비밀번호 형식 검사 끄읏 ~ 
		
		// 비밀번호가 같은지 검사 
		var chPw = document.getElementById("password-confirm");
		chPw.onkeyup = function(){
			var regex = /^[A-Za-z0-9+]{8, 16}$/;
			console.log(chPw);

			
			if ($('#password-confirm').val() == $('#userPw').val()){
				document.getElementById("password-confirm").style.borderColor="green";
				document.getElementById("msgPw-c").innerHTML="비밀번호가 동일합니다.";
			}
			else{
				document.getElementById("password-confirm").style.borderColor="red";
				document.getElementById("msgPw-c").innerHTML="비밀번호가 동일하지 않습니다.";
			}
		}
		// 비밀번호가 같은지 검사 끄읏 
		
		
		// 아이디 중복 검사 
		$(function(){
			
			$('#idCheckBtn').click(function()  {
				const id = $('#userId').val();
				
				if (id === ''){
					alert('아이디 값이 비어있습니다.');
					return
				}
				
				$.ajax({
					type:'post',
					url : '<c:url value="/user/userCheckId" />',
					data : id,
					dataType :  'text',
					contentType :'application/json',
					
					success : function(result){
						if (result === 'Fail'){
							alert('중복된 아이디입니다. 다시 입력해주세요.');
							$('#userId').val('');
							$('#userId').focus();
						}
						else {
							alert('사용가능한 아이디입니다.');
							document.getElementById('msgId').innerHTML = "사용가능한 아이디입니다.";
						}
					},
					
					error : function(){
						alert('오류입니다. 관리자에게 문의하세요.');
					}
				});
				// end ajax 
				
			});
			// 아이디 중복 체크 로직 끄읏 ~ 
			
			// 이메일 인증 로직 
			let code = '';
			$('#mail-check-btn').click(function(){
				const email = $('#userEmail1').val() + $('#userEmail2').val(); 
				// 이메일 완성 
				
				console.log('완성된 이메일 보기' + email)
				$.ajax({
					type:'get',
					url : '<c:url value="/user/CheckMail?email="/>' + email,
					// 요청과 함께 데이터도 함께 보냄 
					
					success : function(result){
						console.log('컨트롤러에서 받은 인증번호 : ' + result);
						$('.mail-check-input').attr("disabled", false);
						// 비활성화 된 인증번호 창 활성화 
						// attr함수를 활용해서 속성 변경 
						
						code = result;
						alert('인증번호가 전송되었습니다. 확인 후 입력란에 인증번호를 작성해주세요.');
					},
					
					error : function(){
						alert('오류입니다. 관리자에게 문의하세요.');
					}
					
				}); 
				// end ajax 
				
				// mail
				$('.mail-check-input').blur(function(){
					// 해당 창을 벗어나게 된다면 함수 발동 
					
					const inputCode = $(this).val();
					// 사용자가 입력한 인증코드 
					const msg = $('#mail-check-warn');
					
					if (inputCode == code){
						// 사용자가 입력한 코드와 진짜 인증 코드가 같다면 
						msg.html('인증번호가 일치합니다.');
						msg.css('color', 'green');
						
						$('#mail-check-btn').attr('disabled',  true);
						// 이메일 인증버튼을 다시 누르지 못하도록 비활성화 
						
						$('#userEmail1').attr('readonly', true);
						
						$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
						$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
						// 위의 2개 코드를 작성해야 select 태그에 지정된 값이 움직이지 못하게 막아줌 
						
						$(this).css('display', 'none');
						
					}
					else{
						msg.html('인증번호가 일치하지 않습니다.');
						msg.css('color', 'red');
					}
				});
				// blur 이벤트 끄읏 ~
				
			});
			// 이메일 인증 로직 끄읏 ~
			
			$('#registBtn').click(function(){
				
				if (!$('#userId').attr('readonly')){
					// userId의 속성인 readonly가 true가 아니라면 중복체크를 하지 않았다는 
					alert('아이디 중복체크는 필수입니다.');
					return
				}
				else if($('#userPw').val === '' || $('#userPw').val() !== $('#password-confirm').val()){
					alert('비밀번호 부분이 비어있거나 일치하지 않습니다.');
					$('#userPw').focus();
					return 
				}
				else if ($('#userName').val === ''){
					alert('이름을 작성해주세요 ');
					return
				}
				else {
					$('#joinForm').submit();
				}
				
				
			});
		});
		// end jQuery 
		
		
		
		// 다음 주소 api 사용 
		function searchAddress(){
			new daum.Postcode({
				oncomplete: function(data){
					var addr = '';
					
					var extraAddr = '';
					
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                
	                document.getElementById('userAddr1').value = data.zonecode;
	                document.getElementById('userAddr2').value = addr;
	                document.getElementById('userAddr3').focus(); 
				}
			}).open();
			
		}

	
	</script>
	


</body>
</html>