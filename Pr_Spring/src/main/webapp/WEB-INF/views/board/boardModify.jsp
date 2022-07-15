<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 col-sm-12 join-form">
					<h2>
						게시판 수정<small>(디자인이궁금하세요?)</small>
					</h2>

					<form action="<c:url value='/board/boardModify/'/>" method="post" name="modiBtn">
						<div class="form-group">
							<label>글번호</label> <input type="text" class="form-control" name="BNum" value="${board.BNum}" readonly>
						</div>
						<div class="form-group">
							<label>글쓴이</label> <input type="text" class="form-control"
								name="Bwriter" value="${board.BWriter}" readonly>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								name="BTitle" value="${board.BTitle }">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" name="BContent">${board.BContent }</textarea>
						</div>

						<!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
						<div class="form-group">
							<button type="button" class="btn btn-success" id="listBtn">목록</button>
							<button type="button" class="btn btn-info" id="modiBtn">수정</button>
							<button type="button" class="btn btn-default" id="delBtn">삭제</button>
						</div>

					</form>
				</div>
			</div>
		</div>


	</section>
	<%@ include file="../includes/footer.jsp"%>
	<script>
		$(function() {
			$('#listBtn').click(function(){
				console.log('목록 버튼 클릭 ');
				if(confirm('게시물 목록으로 돌아가시겠습니까? ')){
					location.href='<c:url value="/board/boardList"/>';
				}
				else{
					return;
				}
			});
			
			$('#modiBtn').click(function(){
				console.log('수정 버튼 클릭 ');
				if (confirm('게시글을 수정하시겠습니까? ')){
					document.modiBtn.submit();
				}
				else{
					return;
				}
			});
			
			$('#delBtn').click(function(){
				console.log('삭제 버튼 클릭 ');
				
				if(confirm('게시글을 삭제하시겠습니까? ')){
					location.href='<c:url value="/board/boardDelete/${board.BNum}"/>';
				}
				else{
					return;
				}
			});
		})
		
	</script>

</body>
</html>