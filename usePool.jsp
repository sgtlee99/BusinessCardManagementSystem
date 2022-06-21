<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*, javax.naming.*" %>

<html>
<head>
	<title>커넥션 풀을 사용한 테이블의 레코드를 화면에 표시</title>
</head>

<body>
	<h3>커넥션 풀을 사용한 member 테이블의 레코드를 화면에 표시</h3>
  	<TABLE border="1">
  	<TR>
  		<TD width="100">이름</TD>
  		<TD width="100">이메일</TD>
  		<TD width="100">전화번호</TD>
  		<TD width="250">부서</TD>
  	</TR>
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  /* 예외 처리 부분입니다.*/
  try{
	Context initCtx = new InitialContext();
    Context envCtx = (Context) initCtx.lookup("java:comp/env");
    DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
    conn = ds.getConnection();

	String sql= "select * from memberTBL";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

		while(rs.next()){
			String name= rs.getString("name");
      		String email= rs.getString("email");
      		String tell= rs.getString("tell");
      		String department= rs.getString("department");

%>
	<TR>
		<TD width="100"><%=name%></TD>
  	   	<TD width="100"><%=email%></TD>
  	   	<TD width="100"><%=tell%></TD>
  	   	<TD width="250"><%=department%></TD>
    </TR>
<%
		}
	}
	catch(Exception e){out.println("Error! " + e.toString());}
	finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>
</table>
</body>
</html>
