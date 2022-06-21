<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%-- 웹 브라우저에서 서버로 넘어오는 파라미터 값에 한글이 있는 경우, 한글 깨짐을 방지합니다.(post 방식)--%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- request 내장객체의 getParameter() 메소드를 사용하여 프로퍼티 값을 읽어옵니다. --%>
<%
String name= request.getParameter("name");
String tell= request.getParameter("tell");
String department= request.getParameter("department");

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

/*예외 처리 부분입니다.*/
	try{
		/*연동할 DB를 포함한 url입니다.*/
		String jdbcUrl="jdbc:mysql://localhost:3306/micom";

		/*사용자 계정과 패스워드입니다.*/
		// String dbId="jspid";
    // 	String dbPass="jsppass";//기존 아디 비번
			String dbId="root";
				String dbPass="root";

		Class.forName("com.mysql.jdbc.Driver");    /*DriverManager에 등록합니다.*/
		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );	/*Connection 객체를 얻어옵니다.*/

		String sql= "select name, tell from memberTBL where name= ?";
		pstmt=conn.prepareStatement(sql);	/*sql이 실행할 쿼리문입니다.*/
    	pstmt.setString(1,name);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String rName=rs.getString("name");
			String rTell=rs.getString("tell");

		if(name.equals(rName) && tell.equals(rTell)){
			sql= "update memberTBL set department= ?  where name= ? ";
			pstmt=conn.prepareStatement(sql);
		    pstmt.setString(1,department);
		    pstmt.setString(2,name);
	    	pstmt.executeUpdate();
%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<title>레코드 수정</title>
<!-- style 태그에서 배경이미지와 표의 투명도를 설정하였습니다. -->
<style>

table {
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
					<a class="nav-link active" aria-current="page">영진 컴퍼니 사내 명함관리 시스템</a>
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
	<h2 style="background-color: Orchid" align="center">회원 정보를 수정했습니다.</h2>

<%
		}
		else {
%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
	<div class="container-fluid">
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
		<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
			<ul class="navbar-nav" style="width: 70vw;">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page">영진 컴퍼니 사내 명함관리 시스템</a>
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
	<h2 style="background-color: Blue" align="center">전화번호를 확인해 주세요</h2>

<%
		}
	}
	else {
%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
	<div class="container-fluid">
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
		<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
			<ul class="navbar-nav" style="width: 70vw;">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page">영진 컴퍼니 사내 명함관리 시스템</a>
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
	<h2 style="background-color: Blue" align="center">이름을 확인해 주세요</h2>
<%
	}
}catch(Exception e){e.printStackTrace();}
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
