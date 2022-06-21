<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>레코드 수정</title>

<!-- style 태그에 사용된 디자인이 적용됩니다. -->
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
		<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
			<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
				<ul class="navbar-nav" style="width: 70vw;">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page">명함 변경</a>
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
	<!-- post 방식의 form 구문을 사용하여 submit 버튼을 클릭하면 action 속성에 지정된 웹 서버에 연결하도록 하였습니다-->
	<form method="post" action="updateTestPro.jsp">
		<%-- <table border="1" align="center">
		<!-- 이름, 전화번호, 변경할 부서는 각각 required 속성을 두어 반드시 입력하도록 하였습니다. -->
		<!-- 또한, placeholder 속성을 두어 사용자에게 입력할 내용의 힌트를 주도록 하였습니다. -->
			<tr>
				<td width="200">이름: </td>
				<td width="200"><input type="text" name="name" maxlength="10" size="30" required></td>
			</tr>
			<tr>
				<td width="200">전화번호: </td>
				<td width="200"><input type="text" name="tell" maxlength="30" size="30" placeholder="010-1111-1234" required></td>
			</tr>
			<tr>
				<td width="200">변경할 부서: </td>
				<td width="200"><input type="text"	name="department" maxlength="10" size="30" placeholder="기획부/개발부/홍보부" required></td>
			</tr>
			<tr>
				<!-- colspan을 사용하여 2개 셀의 열을 합칩니다. -->
				<td colspan="2" align="center">
					<input type="submit" value="입력완료">&nbsp; &nbsp; &nbsp; &nbsp;
					<input type="reset" value="다시 작성">
				</td>
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
		<div class="form-floating">
			<input type="text" name="department" maxlength="10" class="form-control" id="floatingInput" placeholder="부서 개발부/기획부/홍보부" required >
			<label for="floatingInput">부서 개발부/기획부/홍보부</label>
		</div>
		<p></p>

<button class="w-100 btn btn-lg btn-primary" type="submit">입력완료</button>
<p></p>
<button class="w-100 btn btn-lg btn-primary" type="reset">다시입력</button>


	</form>
</body>
</html>
