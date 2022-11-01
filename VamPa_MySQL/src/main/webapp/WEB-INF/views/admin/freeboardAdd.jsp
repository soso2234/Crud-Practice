<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/freeboardAdd.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>

<%@include file="../includes/admin/header.jsp" %>

<div class="admin_content_wrap">
	<div class="admin_content_subject"><span>자유게시판 등록</span></div>
	<div class="admin_content_main">
		<form action="/admin/freeboardAdd" method="post" id="freeboardAddForm">
			<div class="form_section">
	  			<div class="form_section_title">
	  				<label>작성자</label>
	  			</div>
	  			<div>
	  				<input name="reg_id" type="hidden" value="${member.memberId}" disabled >
	  			</div>
	  			<div class="form_section_content">
	  				<input name="reg_nm" type="text" value="${member.memberName}" disabled>
	  			</div>
	  		</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>제목</label>
				</div>
				<div class="form_section_content">
					<input name="title">
					<span id="warn_freeboardTitle">제목을 입력 해주세요.</span>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>내용</label>
				</div>
				<div class="form_section_content">
					<textarea name="conts" id="conts" rows="4" cols="80 "placeholder="내용을 입력하세요."></textarea>
					<span id="warn_freeboardConts">제목을 입력 해주세요.</span>
				</div>
			</div>
		</form>
		<div class="btn_section">
			<button id="cancelBtn" class="btn">취 소</button>
	 		<button id="freeboardAddBtn" class="btn enroll_btn">등 록</button>
	 	</div> 
	</div>
</div>

<%@include file="../includes/admin/footer.jsp" %>

<script>

let freeboardAddForm = $("#freeboardAddForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/freeboard"
	
});

/* 상품 등록 버튼 */
$("#freeboardAddBtn").on("click",function(e){
	
	let title = $(".form_section_content input[name='title']").val();
	let conts = $(".form_section_content textarea").val();	
	
	let	titleCk = false;
	let contsCk = false;
	
	e.preventDefault();
	
	if(!title){
		$("#warn_freeboardTitle").css("display", "block");
	} else {
		$("#warn_freeboardTitle").css("display", "none");
		titleCk = true;
	}
	if(!conts){
		$("#warn_freeboardConts").css("display", "block");
	} else {
		$("#warn_freeboardConts").css("display", "none");
		contsCk = true;
	}
	
	if(titleCk && contsCk ){
		$("input[name=reg_id]").attr("disabled", false);
		$("input[name=reg_nm]").attr("disabled", false);
		freeboardAddForm.submit();
	} else {
		return false;
	}
	
});

</script> 

</body>
</html>