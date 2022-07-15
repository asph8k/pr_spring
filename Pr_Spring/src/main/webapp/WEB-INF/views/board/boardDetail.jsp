<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>BBS Test</title>

</head>
<body>
	<%@ include file="../includes/header.jsp"%>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 col-sm-12 join-form">
					<h2>
						게시판 상세보기<small>(디자인이궁금하세요?)</small>
					</h2>

					<form action="<c:url value='/board/boardModify?BNum=${board.BNum }&writer=${board.BWriter }'/>" method="get" name="modiBtn">
					<!-- 이거 왜 파라미터 안먹히는거지? -->
						<div class="form-group">
							<label>등록일</label> <input type="text" class="form-control"
								value="${board.BDate} }" id="Bdate" readonly>
						</div>
						<div class="form-group">
							<label>글번호</label> <input type="text" class="form-control"
								value="${board.BNum }" id="Bnum" readonly>
						</div>
						<div class="form-group">
							<label>글쓴이</label> <input type="text" class="form-control"
								value="${board.BWriter }" id="Bwriter" readonly>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" class="form-control"
								value="${board.BTitle }" id="Btitle" >
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="5" id="Bcontent">${board.BContent }</textarea>
						</div>

						<!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
						<div class="form-group">
							<button type="button" class="btn btn-success" id = "listBtn">목록</button>
							<button type="button" class="btn btn-info" id = "modiBtn">수정</button>
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
				console.log('목록 요청 버튼 클릭 ');
				
				if (confirm('게시글 목록으로 이동하시겠습니까? ')){
					location.href='<c:url value="/board/boardList?pageNum=${page.pageNum}&countPerPage=${page.countPerPage}" />';
					// 다시 목록으로 갔을 때 사용자가 이전에 요청한 페이지번호를 그대로 가지고 와서 계속 작업을 진행할 수 있도록 진
				}
				else{
					return;
				}
			});
			
			$('#modiBtn').click(function(){
				console.log('수정 요청 버튼 클릭 ');
				
				if (confirm('수정하시겠습니까?')){
					document.modiBtn.submit();
				}
			});
		});
	
	</script>


</body>
</html>