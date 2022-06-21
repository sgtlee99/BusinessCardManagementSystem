<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en">

  <head>
    <style>
    body {
      height: 100%;
    }

    body {
      align-items: center;
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
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> <!-- 강의에서 추가 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http=equiv="x-ua-compatible" content="ie=edge"> <!-- 강의에서 추가 -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>명함 등록하기</title>
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

<main class="form-signin w-100 m-auto">
   		 <!-- 로고 이미지 -->
   		 <img class="mb-4" src="https://ww.namu.la/s/48f891bd3fd17a8284ff15b4634abfa0703fad644bced35ce30a3e673891f74d2c1af8489b19669d012ca10637f8df20f7c0ccf7fbe5ba9cbefb99fe3bb03dda9dfcbdd531f30d529bf089b872f816046722901b0d217a89cde4ae5e231972fc" alt="" width="72" height="57">
         <!-- 로고 이미지 -->
<%--
   <h1 class="h3 mb-3 fw-normal">영진 컴퍼니</h1>
   <h1 class="h3 mb-3 fw-normal">명함 관리 프로그램</h1> --%>

   	<br>
   	<!-- post 방식의 form 구문을 사용하여 submit 버튼을 클릭하면 action 속성에 지정된 웹 서버에 연결하도록 하였습니다. -->
   	<form method="post" action="insertTestPro.jsp">

   			<h1 class="h3 mb-3 fw-normal">명함등록</h1>

   		<div class="form-floating">
   			<input type="text" name="name" maxlength="10" class="form-control" id="floatingInput" placeholder="이름" required >
   			<label for="floatingInput">이름</label>
   		</div>

   		<%-- <input type="text" name="email" maxlength="30" size="30" placeholder="id@host" required></td>
   		<td width="300" bgcolor="black" style="color: white">*E-mail을 입력하세요.</td> --%>

   		<div class="form-floating">
   			<input type="email" name="email"  maxlength="30" class="form-control" id="floatingInput" placeholder="name@example.com" requried>
   			<label for="floatingInput">이메일</label>
   		</div>

   		<%-- <input type="text" name="tell" maxlength="30" size="30" placeholder="010-1111-1234" required></td>
   		<td width="300" bgcolor="black" style="color: white">*전화번호를 입력하세요.</td> --%>
   		<div class="form-floating">
   			<input type="text" name="tell"  maxlength="30" class="form-control" id="floatingInput" placeholder="010-1234-5678" requried>
   			<label for="floatingInput">전화번호</label>
   		</div>


<div class="form-floating">
      <%-- <td width="150" bgcolor="black"> --%>
        <select name="department" class="form-control">
      <!-- "미정"인 값이 selected 속성을 두어 드롭다운 리스트에 가장 먼저 표시되고 기본값이 되도록 설정하였습니다. -->
          <option value="미정" selected> ======  미정(none)  ====== </option>
          <option value="기획부">기획부(plan)</option>
          <option value="개발부">개발부(development)</option>
          <option value="홍보부">홍보부(promotion)</option>
          <%-- 내가 새로추가한거 --%>
          <option vlaue="마케팅">마케팅부(marketing)</option>
      </select>
    <%-- </td> --%>
      <%-- <td width="300" bgcolor="black" style="color: white">부서</td> --%>
      <label for="floatingInput">부서</label>
    </div>




   		<button class="w-100 btn btn-lg btn-primary" type="submit">Add</button>
      <p></p>
   		<button class="w-100 btn btn-lg btn-primary" type="reset">Again</button>
   		    <p class="mt-5 mb-3 text-muted">CP-B 웹 프로그래밍 4조</p>

   	</form>
   </body>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
