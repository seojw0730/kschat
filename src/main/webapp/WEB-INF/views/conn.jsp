<style>
body > div{
	width: max-content;
	margin: 10vh auto 0 auto;
	border-radius: 30px;
}
body > div > div.card-header{
	background-color: #ffc0cb;
	border-radius: 30px 30px 0 0;
}
body > div > div.card-body{
	text-align: center;
}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kschat</title>
</head>
<body>
	<div class="card" style="
	width: max-content;
	margin: 10vh auto 0 auto;
	">
	  <div class="card-header" style="
	  background-color: #ffc0cb;
	  ">
	    kschat
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">사용할 이름을 입력해주세요.</h5>
	    <p class="card-text"><input type="text" name="name" placeholder="여기여기" style="
	    border-radius: 10px;
	    border: 1px solid black;
	    "></p>
	    <a href="#" class="btn btn-primary" style="
	    background-color: #ffb6c1;
	    border: 0;
	    ">입장하기</a>
	  </div>
	</div>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>