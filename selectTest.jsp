<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>명함 표시</title>

<!-- style 태그를 사용했습니다. -->

<style>

table {
	font-family: fantasy;	/*폰트 종류 '판타지(fantasy)'체로 변경합니다.*/
	opacity: 0.8; 			/*표의 투명도를 조절합니다.*/
	border-color: Orchid;	/*표의 선 색과 배경색, 글자색을 지정합니다.*/
	background-color: Orchid;
	color: White;
	margin-left: auto;		/*좌, 우 여백을 자동으로 하여 중앙 정렬할 수 있도록 하였습니다.*/
    margin-right: auto;
    text-align: center;		/*글자를 중앙 정렬합니다.*/
}
h2 {
	color: White;
}
hr {
	height: 2px;
	color: Orchid;
	background-color: Orchid;
}
.box {
			float: center;
			border: 3px solid gray;
			width: 30vw;
			margin: 1% auto;
			padding: 1.0%;
		}
</style>


</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	<%-- <table border="1">
		<!-- <tr>
			<th width="100">이름</th>
			<th width="200">이메일(E-mail)</th>
			<th width="200">전화번호</th>
			<th width="100">부서</th>
		</tr> -->
	<div class="box">
		<div style="float:right; border: 1px solid black;">
			<img src="https://ww.namu.la/s/48f891bd3fd17a8284ff15b4634abfa0703fad644bced35ce30a3e673891f74d2c1af8489b19669d012ca10637f8df20f7c0ccf7fbe5ba9cbefb99fe3bb03dda9dfcbdd531f30d529bf089b872f816046722901b0d217a89cde4ae5e231972fc" width="100" height="100" alt="이미지">
		</div>
		<div style="margin-bottom: 2%">
			<h4 style="display: inline-block;">name</h4>
		</div>
		<div>
			<h4 style="display: inline-block;">email</h4>
		</div>
		<div style="margin: 2% 0;">
			<h4 style="display: inline-block;">tell</h4>
		</div>
		<div>
			<h4 style="display: inline-block;">department</h4>
		</div>
	</div> --%>
		<%
		Connection conn=null;
  		PreparedStatement pstmt=null;
  		ResultSet rs=null;

  		/*예외 처리 부분입니다.*/
  		try{
  			/*연동할 DB를 포함한 url입니다.*/
	 		String jdbcUrl="jdbc:mysql://localhost:3306/micom";

  			/*사용자 계정과 패스워드입니다.*/
     			String dbId="root";
     			String dbPass="root";

	 		Class.forName("com.mysql.jdbc.Driver");   /*DriverManager에 등록합니다.*/
	 		conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );	/*Connection 객체를 얻어옵니다.*/

	 		String sql= "select * from memberTBL";
	 		pstmt=conn.prepareStatement(sql);
	 		rs=pstmt.executeQuery();

		 	while(rs.next()){
	       		String name= rs.getString("name");
	       		String email= rs.getString("email");
	       		String tell= rs.getString("tell");
	       		String department= rs.getString("department");
%>

	<div class="box">
		<div style="float:right; border: 1px solid black;">
			<img src="https://ww.namu.la/s/48f891bd3fd17a8284ff15b4634abfa0703fad644bced35ce30a3e673891f74d2c1af8489b19669d012ca10637f8df20f7c0ccf7fbe5ba9cbefb99fe3bb03dda9dfcbdd531f30d529bf089b872f816046722901b0d217a89cde4ae5e231972fc" width="100" height="100" alt="이미지">
		</div>
		<div style="margin-bottom: 2%">
			<h4 style="display: inline-block;"><%=name%></h4>
		</div>
		<div>
			<h4 style="display: inline-block;"><%=email%></h4>
		</div>
		<div style="margin: 2% 0;">
			<h4 style="display: inline-block;"><%=tell%></h4>
		</div>
		<div>
			<h4 style="display: inline-block;"><%=department%></h4>
		</div>
	</div>

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
	</table>
</body>
</html>
