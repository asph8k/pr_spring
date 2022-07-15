<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">
<title>BBS Test</title>


<!--메인만 적용되는 css영역-->
<style>
body {
	background-image: /Pr_Spring/images/main.jpg;
	background-repeat: no-repeat;
	background-size: cover
}
</style>
</head>

<body>

	<nav class="navbar navbar-default" id="nav">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/' />">MIN and PARK</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<c:url value='/' />" style="margin-right: 10px;">메인</a></li>
				<li><a href="<c:url value='/board/boardList' />">게시판</a></li>
				<!-- 게시판 이동 경로 설정 -->
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<c:choose>
						<c:when test="${login == null }">
							<li><a href="<c:url value='/user/userLogin' />">로그인</a></li>
							<li><a href="<c:url value='/user/userJoin' />">회원가입</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="<c:url value='/user/userMypageInfo' />">마이페이지</a></li>
							<li><a href="<c:url value='/user/userLogout' />">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					</ul></li>
			</ul>

		</div>
	</nav>
</body>