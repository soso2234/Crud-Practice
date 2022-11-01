<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/freeboardDetail.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<%@include file="../includes/admin/header.jsp" %>
<div class="admin_content_wrap">
    <div class="admin_content_subject"><span>자유게시판 상세</span></div>

    <div class="admin_content_main">

   		<div class="form_section">
   			<div class="form_section_title">
   				<label>제목</label>
   			</div>
   			<div class="form_section_content">
   				<input name="title" value="<c:out value="${freeboardInfo.title}"/>" disabled>
			</div>
		</div>
		<div class="form_section">
      			<div class="form_section_title">
      				<label>내용</label>
      			</div>
      			<div class="form_section_content">
      				<textarea class="input_block" name="conts" readonly="readonly"><c:out value='${freeboardInfo.conts}'/></textarea>
      			</div>
      	</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>등록 날짜</label>
			</div>
			<div class="form_section_content">
				<input value="<fmt:formatDate value='${freeboardInfo.reg_dt}' pattern='yyyy-MM-dd'/>" disabled>
			</div>
		</div>
		<div class="form_section">
			<div class="form_section_title">
				<label>최근 수정 날짜</label>
			</div>
			<div class="form_section_content">
				<input value="<fmt:formatDate value='${freeboardInfo.update_dt}' pattern='yyyy-MM-dd'/>" disabled>
			</div>
		</div>
		 <div class="btn_section">
			<button id="cancelBtn" class="btn">목록</button>
			<button id="modifyBtn" class="btn modify_btn">수정 </button>
		 </div> 
	</div>      


    <form id="moveForm" action="/admin/freeboard" method="get" >
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
    </form>
	
</div>
<%@include file="../includes/admin/footer.jsp" %>

<script>

/* 목록 이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
	
	$("#moveForm").submit();	
	
});

/* 수정 페이지 이동 */
$("#modifyBtn").on("click", function(e){
	
	e.preventDefault();
	
	let addInput = '<input type="hidden" name="freeboard_seq" value="${freeboardInfo.freeboard_seq}">';
	
	$("#moveForm").append(addInput);
	$("#moveForm").attr("action", "/admin/freeboardModify");
	$("#moveForm").submit();
	
});

</script>

</body>
</html>