<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글 깨짐을 방지합니다.(post 방식)--%>
<%request.setCharacterEncoding("utf-8");%>

<%-- request 내장객체의 getParameter() 메소드를 사용하여 프로퍼티 값을 읽어옵니다. --%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String tell = request.getParameter("tell");
String department = request.getParameter("department");

Connection conn = null;
PreparedStatement pstmt = null;
String str = "";

/*예외 처리 부분입니다.*/
try {
	/*연동할 DB를 포함한 url입니다.*/
	String jdbcUrl = "jdbc:mysql://localhost:3306/micom";

	/*사용자 계정과 패스워드입니다.*/
	String dbId = "root";
	String dbPass = "root";

	Class.forName("com.mysql.jdbc.Driver");	 /*DriverManager에 등록합니다.*/
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);	/*Connection 객체를 얻어옵니다.*/

	String sql = "insert into memberTBL values (?,?,?,?)";	/*위치홀더(?) 번호에 해당되는 필드의 데이터 타입은 문자열입니다.*/
	pstmt = conn.prepareStatement(sql);	/*sql이 실행할 쿼리문입니다.*/

	/*PrepareStatement 객제가 제공하는 setString 메소드입니다.*/
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, tell);
	pstmt.setString(4, department);

	pstmt.executeUpdate();

	str = "명함 등록이 완료되었습니다 :)";

}
catch (Exception e) {
	e.printStackTrace();
	str = "명함 등록에 실패했습니다";
}
finally {
	if (pstmt != null)
		try {
			pstmt.close();
		} catch (SQLException sqle) {}
	if (conn != null)
		try {
			conn.close();
		} catch (SQLException sqle) {}
}
%>

<html>
<head>
<title>명함 추가</title>

<!-- style 태그를 적용하였습니다. -->
<style>
table {
	/*표와 텍스트를 중앙 정렬하였습니다.*/
	margin-left: auto;
    margin-right: auto;
    text-align: center;
}
h2 {
	color: White;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- 강의에서 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http=equiv="x-ua-compatible" content="ie=edge"> <!-- 강의에서 추가 -->

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>
		 <%-- <main class="form-signin w-100 m-auto"> --%>
		 <nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
	 		<div class="container-fluid">
	 		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
	 			<span class="navbar-toggler-icon"></span>
	 		</button>
	 			<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
	 				<ul class="navbar-nav" style="width: 70vw;">
	 					<li class="nav-item">
	 						<a class="nav-link active" aria-current="page">명함 리스트</a>
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

		<%--  --%>

	<h2 style="background-color: Blue"  align="center"><%=str%></h2>

	<%--
	<table>
		<tr>
			<!-- img 태그를 사용하여 src 속성값이 나타나도록 하였습니다. 만약 이미지 파일이 없을 경우 alt 속성값이 나타납니다. -->

			<button class="w-100 btn btn-lg btn-primary" onclick="location.href='selectTest.jsp'" type="button">확인하러 가기</button>
			<p></p>
			<button class="w-100 btn btn-lg btn-primary" onclick="location.href='updateTestForm.jsp'" type="button">수정하러 가기</button>
<p></p>
			<button class="w-100 btn btn-lg btn-primary" onclick="location.href='deleteTestForm.jsp'" type="button">삭제하러 가기</button>

			<%-- <td><img src="a.png" alt="개발자 모집" width="300" height="300" /></td> --%>
			<%-- <td><img src="b.jpg" alt="디자이너 모집" width="300" height="300" /></td>
			<td><img src="c.jpg" alt="기획 & 마케팅 모집" width="300" height="300" /></td> --%>
		<%-- </tr>
	</table> --%>


	<%-- <h3 style="background-color: Yellow" align="center">아직 부서 선택을 하지 않은 부원들은 위의 포스터를 참고하시길 바랍니다!</h3> --%>
	<%-- 이거 아닌가 --%>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
