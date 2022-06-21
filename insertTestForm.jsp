<%--JSP 페이지에 대한 정보를 page 디렉티브의 속성들을 사용하여 정의하였습니다. --%>
<%--JSP 페이지가 생성할 문서의 타입을 아래와 같이 지정하였습니다. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>회원가입</title>

<!-- style 태그에 사용된 디자인이 적용됩니다. -->
<style>
body {
	/* 배경 전체에 이미지를 삽입합니다. */
	background-image:
		url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyL_KIyQm10DcPgQpMtMTzAPeI83OwgLZYiQ&usqp=CAU');
}
table {
	font-family: fantasy;	/*폰트 종류 '판타지(fantasy)'체로 변경합니다.*/
	opacity: 0.8; 			/*표의 투명도를 조절합니다.*/
	margin-left: auto;		/*좌, 우 여백을 자동으로 하여 중앙 정렬할 수 있도록 하였습니다.*/
    margin-right: auto;
}


</style>
<!--
<style>
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
-->
</head>

<body>
	<br>
	<!-- post 방식의 form 구문을 사용하여 submit 버튼을 클릭하면 action 속성에 지정된 웹 서버에 연결하도록 하였습니다. -->
	<form method="post" action="insertTestPro.jsp">

		<!-- 표의 가로를 600, 테두리는 없애고, 칸과 칸 사이의 여백은 0, 칸 안쪽 여백은 2, 중앙 정렬로 하였습니다.-->
		<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
			<tr align="center" bgcolor="white">

				<!-- 가로 50, 세로 50의 이미지를 삽입하였습니다. 만약 이미지가 없을 경우 "프로젝트 공식 로고" 라는 글이 나타나게 됩니다. -->
				<td><img src="logo.png" alt="프로젝트 공식 로고" width="50" height="50" /></td>

				<!-- colspan을 사용하여 3개 셀의 열을 합칩니다. -->
				<td colspan="3"><b style="font-size: 30px">동아리 회원 등록</b></td>
			</tr>
			<tr>
				<td width="100" bgcolor="white">이름:</td>
				<td width="200" bgcolor="black">

				<!-- required 속성을 두어 반드시 입력하도록 하였습니다. -->
				<input type="text" name="name" maxlength="10" size="30" required></td>
				<td width="300" bgcolor="black" style="color: white">*이름을 입력하세요.</td>
			</tr>
			<tr>
				<td width="100" bgcolor="white">이메일:</td>
				<td width="200" bgcolor="black">

				<!-- required 속성을 두어 반드시 입력하도록 하였습니다. -->
				<!-- placeholder 속성을 두어 사용자에게 입력할 내용의 힌트를 주도록 하였습니다. -->
				<input type="text" name="email" maxlength="30" size="30" placeholder="id@host" required></td>
				<td width="300" bgcolor="black" style="color: white">*E-mail을 입력하세요.</td>
			</tr>
			<tr>
				<td width="100" bgcolor="white">전화번호:</td>
				<td width="200" bgcolor="black">

				<!-- required 속성을 두어 반드시 입력하도록 하였습니다. -->
				<!-- placeholder 속성을 두어 사용자에게 입력할 내용의 힌트를 주도록 하였습니다. -->
				<input type="text" name="tell" maxlength="30" size="30" placeholder="010-1111-1234" required></td>
				<td width="300" bgcolor="black" style="color: white">*전화번호를 입력하세요.</td>
			</tr>
			<tr>
				<td width="100" bgcolor="white">부서:</td>
				<td width="200" bgcolor="black"><select name="department">
				<!-- "미정"인 값이 selected 속성을 두어 드롭다운 리스트에 가장 먼저 표시되고 기본값이 되도록 설정하였습니다. -->
						<option value="미정" selected> ======  미정(none)  ====== </option>
						<option value="기획부">기획부(plan)</option>
						<option value="개발부">개발부(development)</option>
						<option value="홍보부">홍보부(promotion)</option>
				</select></td>
				<td width="300" bgcolor="black" style="color: white">원하는 부서를 선택해주세요.</td>
			</tr>
			<tr>
				<!-- colspan을 사용하여 3개 셀의 열을 합칩니다. -->
				<td colspan="3" align="center" bgcolor="white">
				<input type="submit" value="회원 가입"> &nbsp; &nbsp; &nbsp; &nbsp;
				<input type="reset" value="다시 작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>
