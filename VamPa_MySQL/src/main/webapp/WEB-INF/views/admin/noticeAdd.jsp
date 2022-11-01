<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/noticeAdd.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>
	<%@include file="../includes/admin/header.jsp" %>
	    
	<div class="admin_content_wrap">
	    <div class="admin_content_subject">
	    	<span>공지사항 등록</span>
	    </div>
	     <div class="admin_content_main">
	     	<form action="/admin/noticeAdd.do" method="post" id="noticeForm">
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
	     				<span id="warn_noticeAddTitle">제목을 입력 해주세요.</span>
	     			</div>
	     		</div>
	     		<div class="form_section">
	     			<div class="form_section_title">
	     				<label>내용</label>
	     			</div>
	     			<div class="form_section_content">
	     				<textarea name="conts" id="conts" rows="4" cols="80 "placeholder="내용을 입력하세요."></textarea>
	     				<span id="warn_noticeAddConts">내용을 입력 해주세요.</span>
	     			</div>
	     		</div>
	    		</form>
    			<div class="btn_section">
    				<button id="cancelBtn" class="btn">취 소</button>
		      		<button id="noticeAddBtn" class="btn enroll_btn">등 록</button>
		      	</div> 
	     </div>
	</div>
	
	<%@include file="../includes/admin/footer.jsp" %>
                
<script>
	/* 등록 버튼 */
	$("#noticeAddBtn").click(function(){
		/* 검사 통과 유무 변수 */
	    let titleCheck = false;            				// 제목
	    let contsCheck = false;        					// 내용
	    /* 입력값 변수 */
	    let title = $('input[name=title]').val();        // 제목
	    let conts = $('input[name=conts]').val();        // 내용
	    /* 공란 경고 span태그 */
	    let wTitle = $('#warn_noticeAddTitle');
	    let wConts = $('#warn_noticeAddConts');
	    
	    /* 제목 공란 체크 */
	    if(title ===''){
	    	wTitle.css('display', 'block');
	    	titleCheck = false;
	    } else{
	    	wTitle.css('display', 'none');
	        titleCheck = true;
	    }
	    
	    /* 내용 공란 체크 */
	    if(conts ===''){
	    	wConts.css('display', 'block');
	    	contsCheck = false;
	    } else{
	    	wConts.css('display', 'none');
	    	contsCheck = true;
	    }
	    
		/* 최종 검사 */
	    if(titleCheck && contsCheck){
	    	$("input[name=reg_id]").attr("disabled", false);
			$("input[name=reg_nm]").attr("disabled", false);
	    	
	    	$("#noticeForm").submit();
	    	alert("등록을 완료하였습니다.");
	    } else{
	        return;
	    }
		
	});
	 
	/* 취소 버튼 */
	$("#cancelBtn").click(function(){
	    location.href="/admin/notice"
	});
</script>

</body>
</html>