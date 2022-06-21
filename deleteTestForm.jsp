<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>명함 삭제</title>

<!-- style 태그를 적용하여 배경 전체 이미지, 테이블과 h2 태그에 디자인을 적용하였습니다. -->
<style>

table {
	font-family: fantasy;
	opacity: 0.8;
	border-color: Orchid;
	background-color: Yellow;
	color: Black;
	margin-left: auto;
    margin-right: auto;
    text-align: center;
}
h2 {color: Yellow;}
</style>
</head>

<body>
	<%-- <h2 style="background-color: Black" align="center" color="White">퇴  사</h2> --%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
		<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
			<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
				<ul class="navbar-nav" style="width: 70vw;">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page">퇴  사</a>
					</li>
				</ul>
				<ul class="navbar-nav" style="">
					<li class="nav-item" style="">
						<a class="nav-link" href="insertCardForm.jsp" style="">추가</a>
					</li>
					<li class="nav-item" style="">
						<a class="nav-link" href="updateTestForm.jsp" style="">변경</a>
					</li>
					<li class="nav-item" style="">
						<a class="nav-link" href="deleteTestForm.jsp" style="">삭제</a>
					</li>
					<li class="nav-item" style="">
						<a class="nav-link" href="selectTest.jsp" style="">리스트</a>
					</li>
				</ul>
			</div>



		</div>
	</nav>
	<!-- post 방식의 form 구문을 사용하여 submit 버튼을 클릭하면 action 속성에 지정된 웹 서버에 연결하도록 하였습니다.-->
	<form method="post" action="deleteTestPro.jsp">
		<%-- <table border="1" align="center">
		<!-- 이름과 전화번호는 required 속성을 두어 필수로 입력하도록 하였습니다. -->
			<tr>
				<td width="200">이름: </td>
				<td width="200">
				<input type="text" name="name" maxlength="10" size="30" required></td>
			</tr>
			<tr>
				<td width="200">전화번호: </td>
				<td width="200">
				<!-- placeholder 속성을 두어 입력 시 힌트를 주었습니다. -->
				<input type="text" name="tell" maxlength="30" size="30" placeholder="010-1111-1234" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="입력완료">&nbsp; &nbsp; &nbsp; &nbsp;
				<input type="reset" value="다시 작성"></td>
			</tr>
		</table> --%>

		<div class="form-floating">
			<input type="text" name="name" maxlength="10" class="form-control" id="floatingInput" placeholder="이름" required >
			<label for="floatingInput">이름</label>
		</div>
		<div class="form-floating">
			<input type="text" name="tell" maxlength="30" class="form-control" id="floatingInput" placeholder="전화번호" required >
			<label for="floatingInput">전화번호</label>
		</div>

		<p></p>

<button class="w-100 btn btn-lg btn-primary" type="submit">입력완료</button>
<p></p>
<button class="w-100 btn btn-lg btn-primary" type="reset">다시입력</button>


	</form>
</body>
</html>
