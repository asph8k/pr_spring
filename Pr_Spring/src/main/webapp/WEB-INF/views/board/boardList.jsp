<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>BBS Test</title>

<!--게시판만 적용되는 css-->
<style>
.table-striped>tbody>tr {
	background-color: rgba(255, 255, 255)
}

.row h2 {
	color: aliceblue;
}

.pagination-sm {
	margin: 0;
}
</style>
</head>
<body>
	
	<%@ include file="../includes/header.jsp" %>
	
	<section>

		<div class="container">
			<div class="row">

				<h2>게시판 목록</h2>
				<table class="table table-striped"
					style="text-align: center; border: 2px solid #737373">
					<thead>
						<tr>
							<th style="background-color: #9DCAFF; text-align: center;">번호</th>
							<th style="background-color: #9DCAFF; text-align: center;">제목</th>
							<th style="background-color: #9DCAFF; text-align: center;">작성자</th>
							<th style="background-color: #9DCAFF; text-align: center;">내용</th>
							<th style="background-color: #9DCAFF; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bList}" var="b">	
							<tr>
								<%-- <td>${b }</td> --%>
								<!-- 변수는 bNum인데 get할 떄 b가 대문자 B가 됨  -->
								<td>${b.BNum}</td>
								<td><a href="<c:url value='/board/boardDetail/${b.BNum }/${page.makeURI(page.paging.pageNum) }'/>">${b.BTitle}</a></td>
								<!-- 제목을 클릭하게 된다면 해당 게시물의 번호도 같이 서버에 전송되도록 진행 -->
								<td>${b.BWriter}</td>
								<td>${b.BContent}</td>
								<td><fmt:formatDate value="${b.BDate }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

		    <form action="<c:url value= '/board/boardList'/>" name="pageForm">

				<div class="text-center">
					<ul class="pagination pagination-sm" id="paging">
					<c:if test="${page.previous }">
						<li><a href="#" data-pagenum="${page.beginPage-1 }">이전</a></li>
					</c:if>
					
					<c:forEach var="pc" begin="${page.beginPage}" end = "${page.endPage }">
						<li class="${page.paging.pageNum == pc ? 'acive' : '' }"><a href="#" data-pagenum="${pc }">${pc }</a></li>
					</c:forEach>
						
					<c:if test="${page.next }">
						<li><a href="#" data-pagenum= "${page.endPage+1 }">다음</a></li>
					</c:if>
					</ul>
					
					<button type = "button" class="btn btn-info pull-right" id="regiBtn">글쓰기</button>
					<!-- 글쓰기 클릭하게 된다면 요청 보내기  -->
				</div> 
				
			     <!-- 페이지 관련 버튼(이전, 다음 , 페이지 번호) 클릭 시 같이 숨겨서 보내줄 공통 값 -->
                 <input type="hidden" name="pageNum" value="${pcv.paging.pageNum }">
                 <input type="hidden" name="cpp" value="${pcv.paging.cpp }">
		    </form>
			

			</div>
		 </div> 
	</section>
	
	<%@ include file="../includes/footer.jsp" %>
	<script>
	
		$(function() {
			const msg = '${msg}';
			if (msg !== ''){
				alert(msg);
				}
			
			$('#regiBtn').click(function() {
				console.log('글쓰기 버튼 클릭 ');
				if (confirm('게시글을 작성하시겠습니까?')){
					location.href='<c:url value="/board/boardRegist" />';
				}
				else {
					return;
				}
			}); 
			// 글쓰기 이벤트 끄읏 
			
			$('#paging').on('click', 'a', function(event){
				
				event.preventDefault();
				// a태그의 고유 기능을 없앰 
				
				const value = $(event.target).data('pagenum'); 
				console.log('pagenum 값 : ' + value);
				// 이벤트가 발생한 곳의 data-pagenum 속성의 값을 가져옴 
				document.pageForm.pageNum.value=value;
				document.pageForm.submit();
				// 페이지 이동 버튼을 클릭하게 된다면 클릭한 곳의 값을 가지고 와서 pageNum이라는 input의 value에 값을 넣어서 다시 요청을 보냄 
				
			});
		});
		
	</script>
	
	
</body>
</html>