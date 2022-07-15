<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
</style>


</head>
<body>
	<%@ include file="../includes/header.jsp"%>


	<section>
		<div class="container">
			<div class="row join-wrap">

				<div class="col-xs-12 col-md-9 join-form">

					<div class="titlebox">MEMBER</div>
					<div>
						<p>${user.userName }님 회원정보</p>
					</div>
					<div>
						<button type="button" id="modiBtn" class="btn btn-primary">회원정보변경</button>
						<button type="button"  class="btn btn-primary" id="delCheck">회원
							탈퇴</button>

					</div>
					<div class="delete-hidden">
						<form>
							<input type="password" class="form-control"
								placeholder="비밀번호를 입력하세요" id="delPw">
							<button type="button" id = "delBtn" class="btn btn-primary">확인</button>
						</form>
					</div>

					<br>
<!-- 					<div>
						<p>xx님의 작성 게시물</p>
						<table class="table table-striped"
							style="text-align: center; border: 2px solid #737373">
							<thead>
								<tr>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td><a>Test</a></td>
									<td>Min</td>
									<td>2019-09-14 08:05</td>
								</tr>
								<tr>
									<td>2</td>
									<td><a>Lorem Ipsum is simply dummyg industry.</a></td>
									<td>MBW</td>
									<td>2019-09-15 13:05</td>
								</tr>

							</tbody>
						</table>
					</div> -->


				</div>


			</div>

		</div>

	</section>


	<%@ include file="../includes/footer.jsp"%>

	<script>
        //탈퇴버튼 디스플레이 처리
        var delCheck = document.getElementById("delCheck");
        delCheck.onclick = function() {
            var del  = document.querySelector(".delete-hidden");
            if(del.style.display == "none" || del.style.display == "") {
                del.style.display = "inline";
            } else {
                del.style.display = "none";
            }
        }
        
        $(function() {
        	
        	// 회원정보 수정 요청
        	$('#modiBtn').click(function(){
        		location.href = "<c:url value='/user/userMypageInfo'/>";
        	});
        	
			// 회원 삭제         	
        	$('#delBtn').click(function(){
        		const pw = $('#delPw').val(); 
        		
        		if (pw === ''){
        			alert('비밀번호를 입력해주세요.');
        			return 
        		}
        		
        		$.ajax({
        			type : 'post',
        			url : '<c:url value="/user/userDel"/>',
        			data : pw, 
        			dataType : 'text',
        			contentType : 'application/json',
        			
        			success : function(result){
        				
        				if (result === 'SuccessDel'){
        					alert('삭제가 완료되었습니다.');
        					location.href = '<c:url value="/user/userLogin"/>';
        				}
        				else{
        					alert('비밀번호가 틀립니다. 다시 확인해주세요.');
        				}
        			},
        			error : function(){
        				alert('오류입니다. 관리자에게 문의하세요.');
        			}
        			
        		});
        		// ajax 끄읏 
        		
        	});
			// 회원삭제 끄읏 
        });
        
        
    </script>

</body>
</html>