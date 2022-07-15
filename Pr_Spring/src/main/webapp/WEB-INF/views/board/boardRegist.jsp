<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>BBS Test</title>


<!--글쓰기만 적용되는 css-->
<style>
.table-striped {
	text-align: center;
	border: 2px solid #737373;
}

.table-striped>tbody>tr {
	background-color: #f9f9f9
}
</style>
</head>

<body>
	<%@ include file="../includes/header.jsp" %>

	<section>
		<div class="container" style="margin-top: 5%;">
			<div class="row">
				<form action="<c:url value='/board/boardRegist'/>" method="post" name="regiBtn">
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2"
									style="background-color: #9DCAFF; text-align: center;">게시판
									글쓰기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="작성자" name="bWriter" maxlength="50"></td>
							</tr>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="bTitle" maxlength="50"></td>
							</tr>
							<tr>
								<td><textarea rows="15" class="form-control"
										placeholder="1000 글자 이하" name="bContent" maxlength="1000"></textarea></td>
							</tr>
						</tbody>
					</table>

					<input  class="btn btn-primary pull-left" id = "regiBtn" value="글쓰기">
					<input  class="btn btn-primary pull-right" id="listBtn" value="목록">
					<!-- form으로 글쓰기를 클릭하면 서버에 데이터를 보내고 목록은 jquery를 사용  -->
				</form>
			</div>
		</div>
	</section>
	
	<%@ include file="../includes/footer.jsp" %>
	
	<script>
	
		$(function() {
			$('#regiBtn').click(function() {
				console.log('글작성 버튼 눌림 ');
				if ($('input[name=bWriter]').val() ==''){
					alert('작성자는 필수 값입니다.');
					$('input[name=bWriter]').focus();
					return;
				}
				else if ($('input[name=bTitle]').val() ==''){
					alert('제목은 필수 값입니다.');
					$('input[name=bTitle]').focus();
					return;
				}
				else if ($('textarea[name=bContent]').val() ==''){
					alert('내용은 필수 값입니다.');
					$('input[name=bContent]').focus();
					return;
				}
				else{
					document.regiBtn.submit();
				}
			});
			
			$('#listBtn').click(function(){
				if(confirm('게시물 목록으로 돌아가시겠습니까?')){
					console.log('글 목록 버튼 눌림 ');
					location.href= '<c:url value="/board/boardList" />';
				}
				else{
					return;
				}
			});
			
		});
	
	
	
	</script>
	
</body>
</html>