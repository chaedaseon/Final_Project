<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String adCode = (String)session.getAttribute("adCode");
	String guCode = (String)session.getAttribute("guCode");
	String hoCode = (String)session.getAttribute("hoCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardView.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/gusetRedStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
<link rel="stylesheet" type="text/css" href="css/postViewStyle.css">
<script type="text/javascript">

	$(function()
	{
		var ssessionGuCode = $("#ssessionGuCode").val();
		var adCode = $("#guCode").val();
		
		if(guCode == ssessionGuCode)
		{
			$("#modify_button").css("display","inline");
			$("#delete_button").css("display","inline");
		}
	})

</script>
<script type="text/javascript">
		
    $(document).ready(function() {	// 답글 버튼 클릭 시 댓글 입력창 보이기/숨기기
        
        $(".replyBtn").click(function()
        {
        	var rpCode = $(this).attr("id").split("_")[1];
        	
            if($("#replyComment_" + rpCode).css("display")=="none")
	        {
	        	$("#replyComment_" + rpCode).css("display","block");
	        } 
	        else 
	        {
	            $("#replyComment_" + rpCode).css("display","none");
	        }
            
        });
    });
    
</script>


<script type="text/javascript">
    
	$(document).ready(function() 
	{
		var guCode = $("#ssessionGuCode").val();
    	const urlParams = new URL(location.href).searchParams;
    	const boCode = urlParams.get('boCode');
    	
        $("#modify_button").click(function()	// 수정 버튼 클릭 시 해당 게시글의 작성자인지
        {									    // 판단후 게시글 수정폼으로 이동
        	var boGuCode = $("#guCode").val();
        	
            if(guCode == boGuCode)
	        {
            	$(location).attr("href","boardviewmodifyform.do?boCode=" + boCode);
	        } 
	        else
	        {
	        	alert("작성자 본인이 아닙니다.");
	        }
        });
        
        $("#delete_button").click(function()	// 삭제버튼 클릭 시 해당 게시글의 작성자인지 판단 후 게시글 삭제처리
        {
        	var boGuCode = $("#guCode").val();
        	
            if(guCode == boGuCode)
	        {
            	$("#boardViewDelete").modal("show");
	        } 
	        else
	        {
	        	alert("작성자 본인이 아닙니다.")
	        }
        });
        
        $(".replyModifyBtn").click(function() 
        {
            // 수정 버튼이 속한 댓글 요소의 replyGuCode 값을 가져오기
            var replyGuCode = $(this).closest("li").find("#replyGuCode").val();
            var rpCode = $(this).closest("li").find("#rpCode").val();
            
            // 현재 사용자의 guCode 값 가져오기
            var guCode = $("#ssessionGuCode").val();
            
            // 현재 사용자의 guCode와 댓글 작성자의 replyGuCode 비교
            if (guCode === replyGuCode) 
            {
                // 수정 가능한 경우 처리
                if ($("#modifyComment_" + rpCode).css("display") == "none") 
                {
                    $("#modifyComment_" + rpCode).css("display", "block");
                } 
                else 
                {
                    $("#modifyComment_" + rpCode).css("display", "none");
                }
            } else {
                // 다른 경우 처리
                alert("작성자 본인이 아닙니다.");
            }
        });
        
        $(".rereplyModifyBtn").click(function()
        {
        	// 수정 버튼이 속한 대댓글 요소의 replyGuCode 값을 가져오기
            var rereplyGuCode = $(this).closest("li").find("#rereplyGuCode").val();
            var rreCode = $(this).closest("li").find("#rreCode").val();
            
            // 현재 사용자의 guCode 값 가져오기
            var guCode = $("#ssessionGuCode").val();
        	
            if(guCode == rereplyGuCode)	// 세션 일치할 경우 대댓글 수정 폼 보이기/숨기기
	        {
                if($("#modifyrereply_" + rreCode).css("display")=="none")
    	        {
    	        	$("#modifyrereply_" + rreCode).css("display","block");
    	        } 
    	        else 
    	        {
    	            $("#modifyrereply_" + rreCode).css("display","none");
    	        }
	        } 
	        else
	        {
	        	alert("작성자 본인이 아닙니다.");
	        }
        });
        
    });
</script>
<script type="text/javascript">
	var guCode = $("#ssessionGuCode").val();
   	const urlParams = new URL(location.href).searchParams;
   	const boCode = urlParams.get('boCode');
   	
	$(document).ready(function() {
    	
		$(".replyDeleteBtn").click(function() {
		    // 삭제 버튼이 속한 댓글 요소의 replyGuCode 값을 가져오기
		    var replyGuCode = $(this).closest("li").find("#replyGuCode").val();
		    var rpCode = $(this).closest("li").find("#rpCode").val();
		    
		    // 현재 사용자의 guCode 값 가져오기
		    var guCode = $("#ssessionGuCode").val();
		    if (guCode == replyGuCode) {
		        // 모달에 rpCode 저장 및 모달 열기
		        $("#replyDelete").modal("show");
		        $("input[name=rpCode]").val(rpCode);
		    } 
		    else 
		    {
		        alert("작성자 본인이 아닙니다.");
		        return;
		    }
		});
	});
	
	$(document).ready(function() 
	{
		$(".rereplyDeleteBtn").click(function()
	    {
        	// 삭제 버튼이 속한 댓글 요소의 replyGuCode 값을 가져오기
            var rereplyGuCode = $(this).closest("li").find("#rereplyGuCode").val();
            var rreCode = $(this).closest("li").find("#rreCode").val();
            
            // 현재 사용자의 guCode 값 가져오기
            var guCode = $("#ssessionGuCode").val();
        	
            if(guCode == rereplyGuCode)	// 세션 일치할 경우 대댓글 삭제 모달창 호출
	        {
            	$("#rereplyDelete").modal("show");
            	$("input[name=rreCode]").val(rreCode);	// 모달 내 인풋 태그에 밸류값 전달
	        } 
	        else
	        {
	        	alert("작성자 본인이 아닙니다.")
	        	return;
	        }
        });
	});
	
	/* 페이지가 로드되면서 신고가 반려된 게시글은 신고하기 버튼 block 후 분쟁 처리 완료 표시 출력 */
	function checkRed()
	{
		const boCode = urlParams.get('boCode');
		var info = "boCode="+ boCode;
		
		$.ajax(
		{
			type:"GET"
			, url:"boardviewcheckred.do"
			, data:info
			, success:function(args)
			{
				var result = $.trim(args);
				
				if(result == "1")
				{
					$("#redCount").css("display","none");
					$("#redDisable").css("display", "block");
				}
			}
			, error:function(e)
			{
				alert(e.responseText);
			}
		});
	}
</script>

<!-- 각 댓글과 대댓글을 순서에 맞게 출력하기 위해 c:forEach문을 중첩해서 사용
     두 테이블 간의 연결점은 rpCode(댓글 코드) 따라서 해당 게시글의 댓글을 우선적으로 나열한 후
     각 댓글에 맞는 rpCode를 가진 대댓글을 나열함. 반복문으로 데이터를 가져오는 과정에서 
     각 태그에 id에 각 댓글 및 대댓글의 고유 코드값을이용해 id=(id_ + 코드값) 이라는 id를 부여
     이를 통해 각 댓글 및 대댓글을 클릭 시 같은 클래스로 지정해 놓았더라도 각 태그의 id마다 끝 숫자가
     다르기 때문에 어느 댓글을 클릭하였는지 구분할 수 있음. 신고버튼도 마찬가지.
     
     각 댓글 및 대댓글 수정, 삭제 버튼마다 모달창을 할당하였음. 스크립트 함수도 각각의 버튼속성에 따라 할당
     뒤로가기 버튼 목록에 중고책방이랑 전체목록이 따로 있는 이유는 두 게시판이 같은 뷰 페이지에서 출력되기
     때문에 상세페이지로 접속하기 전 어떤 리스트에서 접속하였는지에 따라 돌아갈 리스트를 선택하게 할 의무가 있음 -->
     

</head>
<body onload="checkRed();">
	<header>
		<c:import url="/WEB-INF/view/main/Menu.jsp"></c:import>
	</header>
<input type="hidden" id="ssessionGuCode" value="<%=guCode%>"/>
	<section>
		<div id="content">
			<div class="category_bar">
			<!-- content div 시작 부분 -->
				<div class="content_div">
					<c:forEach var="view" items="${list}">
					<input type="hidden" id="guCode" value="${view.guCode }"/>
					<div id="category">
						<h3>
							<c:if test="${view.bsCode ==1 }">[공부팁]</c:if>
				            <c:if test="${view.bsCode ==2 }">[고민상담]</c:if>
				            <c:if test="${view.bsCode ==3 }">[자유게시판]</c:if>
				            <c:if test="${view.bsCode ==4 }">[질문]</c:if>
				            <c:if test="${view.bsCode ==5 }">[삽니다]</c:if>
				            <c:if test="${view.bsCode ==6 }">[팝니다]</c:if>
						</h3>
					</div>
					<div id="title"><h5>${view.boTitle}</h5>
						<%-- <span class="count" id="posting_number"> 게시글 고유번호 : ${view.boCode}</span> --%>
					</div>
					<div id="post_info">
						<div class="dropdown">
						    <button class="friend_btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    ${view.boWriter}
						    </button>
						    <ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="friendinsert.do?type=1&boCode=${view.boCode}&boWriter=${view.guCode}&guCode=<%=guCode%>">계정 찜</a></li>
							    <li><a class="dropdown-item" href="friendinsert.do?type=2&boCode=${view.boCode}&boWriter=${view.guCode}&guCode=<%=guCode%>">계정 차단</a></li>
						    </ul>
					    </div>
						<p id="posting_date">&nbsp;|&nbsp; ${view.boDate}</p>
						<div class="detail_info">
							<span class="count">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-text" viewBox="0 0 16 16">
								  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
								  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6m0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"/>
								</svg>
							${allReplyCount}
							</span>
							<span class="count"> 
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
								  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
								</svg>
							${view.boView }
							</span>
							<span class="count"> 
								<a href="#" class="scrap_button" data-bs-toggle="modal" data-bs-target="#boardViewScrap">
									<!-- <img src="images/scrap.png" class="count_icon"> --> ⭐ 스크랩
								</a>
							</span>
							<span class="count" id="redCount">
								<a href="#" class="report_button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
									<!-- <img src="images/siren.png" class="count_icon"> --> 🚨 신고하기
								</a>
							</span>
							<!-- 신고처리 반려 상태인 게시물에서는 신고하기 버튼 보이지 않고 해당 안내 출력 -->
							<span class="count" id="redDisable" style="display: none;">
								&nbsp;&nbsp;✔분쟁 해결
							</span>
						</div>
					</div>
				<div class="content_main">
					<p style="white-space: pre-line;">${view.boContent }</p>
				</div>
					<div class="board_btn">
						<button type="button" class="btn" id="modify_button" style="display: none">수정</button>
						<!-- 버튼 눌러서 모달창 띄우기 -->
						<button type="button" class="btn" id="delete_button" style="display: none">삭제</button>
						
						<form action="boardviewscrap.do" method="post">
						<div class="modal fade" id="boardViewScrap" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      <input type="hidden" name="boCode" value="${param.boCode }">
						      <input type="hidden" name="guCode" value="<%=guCode%>">
						        이 글을 스크랩 하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						        <button type="submit" class="btn btn-primary" id="scrapSubmit" >스크랩</button>
						      </div>
						    </div>
						  </div>
						</div>
						</form>
						
						<form action="boardviewdelete.do" method="post">
						<div class="modal fade" id="boardViewDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      <input type="hidden" name="boCode" value="${param.boCode }">
						        정말로 삭제하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						        	<button type="submit" class="btn btn-primary" id="deleteSubmit" >삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
						</form>
						
						<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-body" id="red_body">
									<div class="red_div">
										<span class="sub_title">🚨신고하기🚨</span>
										<div class="content_box">
											
											<div class="mb-3">
												<label for="exampleFormControlInput1" class="form-label">작성자 : ${view.boWriter }</label>
												<br>
												<label for="exampleFormControlInput1" class="form-label">유형 : 게시물</label>
												<br>
												<label for="exampleFormControlInput1" class="form-label" id="reason">신고 사유를 선택하세요</label>
											</div>
											<form action="boardredinsert.do?redGuCode=<%=guCode %>&boCode=${param.boCode }" method="post">
											<div id="red_radioBox">
												<input type="radio" class="btn-check" name="reason_code" id="option1" value="201" autocomplete="off">
												<label class="btn" for="option1">스팸/홍보 도배글입니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option2" value="202" autocomplete="off">
												<label class="btn" for="option2">음란물입니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option3" value="203" autocomplete="off">
												<label class="btn" for="option3">불법정보를 포함하고 있습니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option4" value="204" autocomplete="off">
												<label class="btn" for="option4">청소년에게 유해한 내용입니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option5" value="205" autocomplete="off">
												<label class="btn" for="option5">욕설/생명경시/혐오/차별적 표현을 포함하고 있습니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option6" value="206" autocomplete="off">
												<label class="btn" for="option6">개인정보 노출 게시물입니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option7" value="207" autocomplete="off">
												<label class="btn" for="option7">불쾌한 표현을 포함하고 있습니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option8" value="208" autocomplete="off">
												<label class="btn" for="option8">카테고리와 맞지 않는 게시물입니다.</label>
												<input type="radio" class="btn-check" name="reason_code" id="option9" value="209" autocomplete="off">
												<label class="btn" for="option9">만남 유도성 게시물입니다.</label>
												
												<div style="    margin-top: 30px; display: flex; justify-content: center;">
													<button type="button" class="btn btn-secondary" id="backBtn" data-bs-dismiss="modal">취소</button>
													<button type="submit" class="btn btn-secondary" id="submitBtn">신고하기</button>
												</div>
											</div>
											</form>
											<!-- 허위 신고 패널티 구현x
											<div class="warning_msg">
												<label for="exampleFormControlInput1">
												※주의※<br> 
												해당 게시물에 이상이 없거나<br>
												 해당 사유와 연관이 없을 경우<br>
												 신고자에게 패널티가 돌아갈 수 있습니다!</label>
											</div>
											 -->
										</div>
									</div>
						      </div>
						    </div>
						  </div>
						</div>
			
						<!-- <button type="submit" class="btn">삭제</button> -->
					</div>
				<div id="comment_box">
					<div id="comment_count">전체 댓글 수 : ${allReplyCount}</div> 				
				</div>
				</c:forEach>
				<div class="comment">
				<div id="comment_list">
					<ul>
						<c:forEach var="reply" items="${replyList }">
						<li><p id="comment_id">${reply.rpWriter }</p>
						<p id="comment_detail" style="white-space: pre-line;">
						${reply.rpContent }
						</p><p id="comment_date">${reply.rpDate }</p>
						<a type="button" class="replyBtn" id="replyBtn_${reply.rpCode }">답글</a> 
						<a type="button" class="replyModifyBtn" id="replyModify_${reply.rpCode }" data-rpCode="${reply.rpCode}">수정</a> 
						<a type="button" class="replyDeleteBtn" id="replyDelete_${reply.rpCode }" data-target="#staticBackdrop1"  data-rpCode ="${reply.rpCode }" >삭제</a>
						<a type="button" class="redBtn" id="replyRed_${reply.rpCode }">🚨 신고하기</a>
						<input type="text" id="replyGuCode" value="${reply.guCode }" style="display: none;"/>
						<input type="text" id="rpCode" value="${reply.rpCode }" style="display: none;"/>
						<br>
						<!-- 모달 영역 -->
						<form action="boardviewreplydelete.do" method="post">
						<div class="modal fade" id="replyDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						      <input type="hidden" name="rpCode">
						      <input type="hidden" name="boCode" value="${param.boCode }">
						        정말로 삭제하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						        	<button type="submit" class="btn btn-primary" id="deleteSubmit" >삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
						</form>
						<div class="write_comment" id="replyComment_${reply.rpCode }" style="display: none;">
							<form action="boardrereplyinsert.do" method="post">
								<table class="table">
									<tr>
										<td style="display: none;">
											<input type="text" id="boCode" name="boCode" value="${param.boCode }"/>
											<input type="text" id="rereplyId" name="guCode" value="<%=guCode %>"/>
											<input type="text" id="rereply_rpCode" name="rpCode" value="${reply.rpCode }"/>
										</td>
										<td rowspan="2" id="comment_input"><textarea name="rreContent" id="comment_text"></textarea></td>
										<td colspan="2">
											<button type="submit" class="btn" id="reply_submit">대댓글 등록</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
						</li>
						<div class="modify_comment" id="modifyComment_${reply.rpCode }" style="display: none;">
							<form action="boardreplymodify.do" method="post">
								<table class="table">
									<tr>
										<td style="display: none;">
											<input type="text" id="replyView" name="boCode" value="${param.boCode }"/>
											<input type="text" id="replyCode" name="rpCode" value="${reply.rpCode }"/>
										</td>
										<td id="comment_input"><textarea name="rpContent" id="comment_text" ></textarea></td>
										<td id="comment_submit">
											<button type="submit" class="btn" id="reply_submit">댓글 수정</button>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<c:forEach var="rereply" items="${reReplyList}">
						<c:choose>
							<c:when test="${reply.rpCode == rereply.rpCode }">
							<li id="rereply_id">
								<p id="comment_id">re : ${rereply.rreWriter }</p>
								<p id="comment_detail" style="white-space: pre-line;">
									${rereply.rreContent }
									</p><p id="comment_date">${rereply.rreDate }</p>
									<a type="button" class="rereplyModifyBtn" id="rereplyModify_${rereply.rreCode }">수정</a> 
									<a type="button" class="rereplyDeleteBtn" id="rereplyDelete_${rereply.rreCode }">삭제</a>
									<a type="button" class="redBtn" id="replyRed_${rereply.rreCode }">🚨 신고하기</a>
									<input type="text" id="rereplyGuCode" value="${rereply.guCode }" style="display: none;"/><!-- style="display: none;" -->
									<input type="text" id="rreCode" value="${rereply.rreCode }" style="display: none;"/>
								<br>
							</li>
							<!-- 모달 영역 -->
							<form action="boardviewrereplydelete.do" method="post">
							<div class="modal fade" id="rereplyDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      <input type="hidden" name="rreCode">
							      <input type="hidden" name="boCode" value="${param.boCode }">
							        정말로 삭제하시겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
							        	<button type="submit" class="btn btn-primary" id="deleteSubmit" >삭제</button>
							      </div>
							    </div>
							  </div>
							</div>
							</form>
							<div class="modify_comment" id="modifyrereply_${rereply.rreCode }" style="display: none;"> 
								<form action="boardrereplymodify.do" method="post">
									<table class="table">
										<tr>
											<td style="display: none;">
												<input type="text" id="boCode" name="boCode" value="${param.boCode }"/>
												<input type="text" id="rereplyId" name="guCode" value="<%=guCode %>"/>
												<input type="text" id="rereply_rreCode" name="rreCode" value="${rereply.rreCode }"/>
											</td>
											<td rowspan="2" id="comment_input"><textarea name="rreContent" id="comment_text"></textarea></td>
											<td colspan="2">
												<button type="submit" class="btn" id="reply_submit">대댓글 수정</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="write_comment">
				<form action="boardreplyinsert.do" method="post">
					<table class="table">
						<tr>
							<td style="display: none;">
								<input type="text" id="replyId" name="guCode" value="<%=guCode %>"/>
								<input type="text" id="replyView" name="boCode" value="${param.boCode }"/>
							</td>
							<td id="comment_input"><textarea name="rpContent" id="comment_text" ></textarea></td>
							<td id="comment_submit">
								<button type="submit" class="btn" id="reply_submit">댓글 등록</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="button_box">
				<button onclick="history.back()" class="btn">뒤로가기</button>
				<button class="btn" onclick="location.href='boardusedbooklist.do?'">중고책방목록</button>
				<button class="btn" onclick="location.href='boardcommunitylist.do?'">전체목록</button>
			</div>
			</div>
		</div>		
	</div>		
	</section>
	
	<footer>
		<c:import url="/WEB-INF/view/main/Footer.jsp"></c:import>
	</footer>

</body>
</html>