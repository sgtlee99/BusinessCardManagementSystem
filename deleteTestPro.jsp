<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글 깨짐을 방지합니다.(post 방식)--%>
<%request.setCharacterEncoding("utf-8");%>

<%
String name= request.getParameter("name");
String tell= request.getParameter("tell");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

/* 예외 처리 부분입니다.*/
try{
	/*연동할 DB를 포함한 url입니다.*/
	// String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp?serverTimezone=Asia/Seoul";
	String jdbcUrl="jdbc:mysql://localhost:3306/micom";

	/*사용자 계정과 패스워드입니다.*/
   	// String dbId="jspid";
   	// String dbPass="jsppass";
		String dbId="root";
		String dbPass="root";

   	/*DriverManager에 등록합니다.*/
	Class.forName("com.mysql.jdbc.Driver");

	/*Connection 객체를 얻어옵니다.*/
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	/*위치홀더(?) 번호에 해당되는 필드의 데이터 타입은 문자열입니다.*/
	String sql= "select name, tell from memberTBL where name= ?";
	pstmt=conn.prepareStatement(sql);

	/*PrepareStatement 객제가 제공하는 setString 메소드입니다.*/
   	pstmt.setString(1,name);
	rs=pstmt.executeQuery();

	if(rs.next()){
		/*PrepareStatement 객제가 제공하는 getString 메소드입니다.*/
  		String rName=rs.getString("name");
  		String rTell=rs.getString("tell");

		if(name.equals(rName) && tell.equals(rTell)){
			sql= "delete from memberTBL where name= ? ";
    		pstmt=conn.prepareStatement(sql); /*sql이 실행할 쿼리문입니다.*/
    		pstmt.setString(1,name);
    		pstmt.executeUpdate();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>레코드 삭제</title>
<style>

table {
	font-family: fantasy;
	opacity: 0.8;
	margin-left: auto;
    margin-right: auto;
    text-align: center;
}
h2 {
	color: White;
}
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

	<h2 style="background-color: Orchid" align="center">퇴사하였습니다.</h2>
	<table width="600" border="0" align="center">
		<tr align="center" bgcolor="white">
			<td><img src="https://ww.namu.la/s/48f891bd3fd17a8284ff15b4634abfa0703fad644bced35ce30a3e673891f74d2c1af8489b19669d012ca10637f8df20f7c0ccf7fbe5ba9cbefb99fe3bb03dda9dfcbdd531f30d529bf089b872f816046722901b0d217a89cde4ae5e231972fc" alt="프로젝트 공식 로고" width="50" height="50" /></td>
			</tr>
			<tr align="center" bgcolor="white">
			<td>지금까지 영진 컴퍼니의 일원으로 활동해주셔서 감사합니다.</td>
			</tr>

	</table>
<%
		}
		else {
%>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>에러</title>
</head>
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



			<h2 style="background-color: Orchid" align="center">허나 윤허하지 않았다</h2>
			<table width="600" border="0" align="center">
				<tr align="center" bgcolor="white">
					<td><img src="https://ww.namu.la/s/48f891bd3fd17a8284ff15b4634abfa0703fad644bced35ce30a3e673891f74d2c1af8489b19669d012ca10637f8df20f7c0ccf7fbe5ba9cbefb99fe3bb03dda9dfcbdd531f30d529bf089b872f816046722901b0d217a89cde4ae5e231972fc" alt="프로젝트 공식 로고" width="50" height="50" /></td>
					</tr>
					<tr align="center" bgcolor="white">
					<td>전화번호를 다시 입력해 주시길 바랍니다</td>
					</tr>

			</table>
<%
		}
	}

	else {
%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>에러</title>
</head>
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



			<h2 style="background-color: Orchid" align="center">허나 윤허하지 않았다</h2>
			<table width="600" border="0" align="center">
				<tr align="center" bgcolor="white">
					<td><img src="https://ww.namu.la/s/48f891bd3fd17a8284ff15b4634abfa0703fad644bced35ce30a3e673891f74d2c1af8489b19669d012ca10637f8df20f7c0ccf7fbe5ba9cbefb99fe3bb03dda9dfcbdd531f30d529bf089b872f816046722901b0d217a89cde4ae5e231972fc" alt="프로젝트 공식 로고" width="50" height="50" /></td>
					</tr>
					<tr align="center" bgcolor="white">
					<td>이름을 다시 입력해 주시길 바랍니다</td>
					</tr>

			</table>
<%
	}
}
catch(Exception e){e.printStackTrace();}
finally{
	if(rs != null)
		try{rs.close();}catch(SQLException sqle){}
 	if(pstmt != null)
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
}
%>
</body>
</html>
