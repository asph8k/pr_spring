<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>


	<section>
		<%@ include file="../includes/header.jsp"%>

		<div class="container">
			<div class="row join-wrap">
				<!--join-form을 적용한다 float해제 margin:0 auto-->
				<div class="col-xs-12 col-md-9 join-form">

					<div class="titlebox">${user.userName }님의 정보</div>

					<p>*표시는 필수 입력 표시입니다</p>
					<form action="<c:url value='/user/userMyPageInfo'/>" method="post" id = "upForm">
					
					<table class="table">
						<tbody class="m-control">
							<tr>
								<td class="m-title">*ID</td>
								<td><input class="form-control input-sm" value="${user.userId }" name = "userId"></td>
							</tr>
							<tr>
								<td class="m-title">*이름</td>
								<td><input class="form-control input-sm" value="${user.userName }" name="userName" id="userName"></td>
							</tr>
							<tr>
								<td class="m-title">*비밀번호</td>
								<td><input class="form-control input-sm" name="userPw" id="userPw"></td>
							</tr>
							<tr>
								<td class="m-title">*비밀번호확인</td>
								<td><input class="form-control input-sm" id="checkPw"></td>
							</tr>
							<tr>
								<td class="m-title">*E-mail</td>
								<td><input class="form-control input-sm" value="${user.totalUserEmail }" name="totalUserEmail" id="userEmail"></td>
							</tr>
							<tr>
								<td class="m-title">*휴대폰</td>
								<td><input class="form-control input-sm sel" value="${user.totalUserTel }" name="totalUserTel" id="userTel"></td>
							</tr>
							<tr>
								<td class="m-title">*주소</td>
								<td><input class="form-control input-sm add" value="${user.totalUserAddr }" name="totalUserAddr" id="userAddr">
								<button type="button" class="btn btn-primary" id="addBtn">주소찾기</button></td>
								
							</tr>
						</tbody>
					</table>
					</form>

					<div class="titlefoot">
						<button class="btn" id="modiBtn">수정</button>
						<!-- <button class="btn" id="">목록</button> -->
					</div>

				</div>


			</div>

		</div>

	</section>
	<%@ include file="../includes/footer.jsp"%>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(function() {
			
			// 다음 주소 api 
	        $('#addBtn').click(function() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                	console.log('클릭발생');
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var addr = ''; 
	                    // 주소 변수
	                    var extraAddr = ''; 
	                    // 참고항목 변수

	                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                        addr = data.roadAddress;
	                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                        addr = data.jibunAddress;
	                    }

	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('userAddr').value = data.zonecode + addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    
	                    // 내가 지정한 곳에 값을 넣어줌
	                    document.getElementById('userAddr').focus();
	                }
	            }).open();
	        })
			
			$('#modiBtn').click(function(){
				const name = $('#username').val();
				const pw = $('#userPw').val();
				const chPw = $('#checkPw').val();

				
				if (pw !== chPw){
					alert('비밀번호가 틀립니다.');
					return
				}
				else{
					$('#upForm').submit();
				}
				
				
				
			});
			// 수정 이벤트 끄읏~ 
			
		});
	
	</script>


</body>
</html>