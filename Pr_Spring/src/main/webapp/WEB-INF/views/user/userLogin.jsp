<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BBS Test</title>

<!--login만 적용되는 css-->
<style>
.table-striped>tbody>tr {
	background-color: #f9f9f9
}

.join-form {
	margin: 100px auto;
	padding: 20px;
	width: 50%;
	float: none;
	background-color: white;
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
						로그인<small>(가운데정렬)</small>
					</h2>


					<form action="<c:url value='/user/userLogin'/>" method="post" id="loginForm">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" name="userId" placeholder="아이디">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" name = "userPw" placeholder="비밀번호 ">
						</div>

						<div class="form-group">
							<button type="button" id = "registBtn" class="btn btn-lg btn-success btn-block">회원가입</button>
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
	
	<script>
		$(function() {
			
			$('#registBtn').click(function(){
				alert("회원가입 페이지로 이동합니다.");
				location.href="<c:url value='/user/userJoin'/>";
				// 회원 가입 페이지로 이동하도록 요청을 보냄 
				
			}); 
			// 회원가입 버튼 이벤트 처리 
			
			$('#loginBtn').click(function(){
				if($('#id').val() === ''){
					alert('아이디 입력란이 비어있습니다.');
					$('#id').focus(); 
				}
				else if ($('#password').val() === ''){
					alert('비밀번호 입력란이 비어있습니다.');
					$('#password').focus(); 
				}
				else{
					$('#loginForm').submit();
				}
				
			});
			
		}); 
		
	</script>


</body>

</html>