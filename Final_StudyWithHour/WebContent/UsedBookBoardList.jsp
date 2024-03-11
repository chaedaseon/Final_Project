<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UsedBookBoardList.jsp</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle.css">
<link rel="stylesheet" type="text/css" href="css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sideMenuStyle.css">
<link rel="stylesheet" type="text/css" href="css/sliderStyle.css">
<link rel="stylesheet" type="text/css" href="css/boardPageStyle.css">
<script type="text/javascript">

	$(function(){
		 
	    $(".search_btn").click(function ()
	    {
	    	//alert($(location).attr("href","testest.do?searchType=" + $(searchType).val() + "&keyword=" + $(keyword).val()));
	    	if ($(searchType).val() == "searchNum")
	    	{
	    		$(location).attr("href","boardcommunitysearchnum.do?searchNum=" + $(keyword).val());
	    	}
	    	else if ($(searchType).val() == "searchTitle")
	    	{
	    		$(location).attr("href","boardcommunitysearchtitle.do?searchTitle=" + $(keyword).val() + "&vNum=1");
	    	}
	    	else if ($(searchType).val() == "searchNick")
	    	{
	    		$(location).attr("href","boardcommunitysearchnick.do?searchNick=" + $(keyword).val()  + "&vNum=1");
	    	}
	    	else
	    	{
	    		$(location).attr("boardcommunitylist.do");
	    	}
	    })
	});

</script>
</head>
<body>

<header>
	<c:import url="/Menu.jsp"></c:import>
</header>

<section class="py-6 bg-light-primary">
	<div id="content">
		<div class="category_bar">
			<c:import url="/imageSlide.jsp"></c:import>
			<div class="board_title">
				<span><a href="boardusedbooklist.do" style="color: #94bc32;">중고책방</a></span>
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav" id="category_nav">
					      		<li class="nav-item" id="category_element">
									<a class="nav-link"
									 href="boardusedbooksearchcategory.do?bsCode=5&vNum=1">삽니다</a>
								</li>
					      		<li class="nav-item" id="category_element">
									<a class="nav-link"
									 href="boardusedbooksearchcategory.do?bsCode=6&vNum=1">팝니다</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		    <div class="container">
	        <div class="row row-cols-lg-3 row-cols-md-2 row-cols-1 text-center justify-content-center px-xl-6 aos-init aos-animate" data-aos="fade-up">
	            <c:choose>
					<c:when test="${list == null}">
						<td colspan="6">조회 결과 없음</td>						
					</c:when>
					<c:otherwise>
						<c:forEach var="usedBook" items="${list}">
				            <div class="col my-3">
				                <div class="card border-hover-primary hover-scale">
				                    <div class="card-body">
				                        <div class="text-primary mb-5">
				                        	<img src="..\Downloads\the_little_prince.jpg" class="book_icon">  
				                        	<div class="detail_1">
				                        		<div id="post_title">
					                        		<span>
					                        		<c:if test="${usedBook.bsCode==5}">(삽니다)</c:if>
					                        		<c:if test="${usedBook.bsCode==6}">(팝니다)</c:if>
					                        		</span><br>
					                        		<a href="boardview.do?boCode=${usedBook.boCode}&boView=${usedBook.boView}"><span>${usedBook.boTitle}</span></a>
				                        		</div>
				                        	</div>  
				                        </div>
				                        <div id="post_info">
					                        <div>
					                        	<span>
					                        		${usedBook.boWriter} 
					                        	</span>
												<span class="count">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-text" viewBox="0 0 16 16">
													  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
													  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6m0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"/>
													</svg>
												${usedBook.replyCount}
												</span>
												<span class="count"> 
													<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
													  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
													  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
													</svg>
												${usedBook.boView} 
												</span>
											</div>
											<div id="postnum_box">
												<span class="count" id="posting_number">NO. ${usedBook.no} </span>
											</div>
										</div>
				                    </div>    
				                </div>
				            </div>
	            	</c:forEach>
			    </c:otherwise>
			    </c:choose>
	        </div>
	   		<div class="search_div">
				<div class="category_search">
					<form id="searchForm" autocomplete="off">
						<select id="searchType" name="searchType">
							<option value="searchNum">번호</option>
							<option value="searchTitle">제목</option>
							<option value="searchNick">작성자</option>
						</select> 
					<input type="text" id="keyword" name="keyword" class="search_input">
					<button type="button" class="search_btn">Search</button>
					</form>
				</div>
			</div>
			<c:choose>
				<c:when test="${urlparam == 'usedbooksearchcategory'}">
					<c:choose>
						<c:when test="${count > 9 }">
							<nav aria-label="Page navigation example paging" class="paging">
							<ul class="pagination">
							<c:if test="${vNum!=1 }">
								<li class="page-item"><a class="page-link" href="boardusedbooksearchcategory.do?bsCode=${param.bsCode}&vNum=${vNum-1}">Previous</a></li>
								<li class="page-item"><a class="page-link" href="boardusedbooksearchcategory.do?bsCode=${param.bsCode}&vNum=1">&lt;</a></li>
							</c:if>
								<c:forEach var="pageNum" items="${page }">
									<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
									href="boardusedbooksearchcategory.do?bsCode=${param.bsCode}&vNum=${pageNum }">					
									${pageNum }
									</a></li>
								</c:forEach>
								<c:if test="${vNum!=lastNum }">
									<li class="page-item"><a class="page-link" href="boardusedbooksearchcategory.do?bsCode=${param.bsCode}&vNum=${lastNum}">&gt;</a></li>
									<li class="page-item"><a class="page-link" href="boardusedbooksearchcategory.do?bsCode=${param.bsCode}&vNum=${vNum+1 }">Next</a></li>
								</c:if>
							</ul>
							</nav>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${count > 9 }">
								<nav aria-label="Page navigation example paging" class="paging">
								<ul class="pagination">
								<c:if test="${vNum!=1 }">
									<li class="page-item"><a class="page-link" href="boardusedbooklist.do?vNum=${vNum-1 }">Previous</a></li>
									<li class="page-item"><a class="page-link" href="boardusedbooklist.do?vNum=1">&lt;</a></li>
								</c:if>
									<c:forEach var="pageNum" items="${page }">
										<li class="page-item"><a class="page-link" <c:if test="${pageNum == vNum }"></c:if>
										href="boardusedbooklist.do?vNum=${pageNum }">					
										${pageNum }
										</a></li>
									</c:forEach>
									<c:if test="${vNum!=lastNum }">
										<li class="page-item"><a class="page-link" href="boardusedbooklist.do?vNum=${lastNum}">&gt;</a></li>
										<li class="page-item"><a class="page-link" href="boardusedbooklist.do?vNum=${vNum+1 }">Next</a></li>
									</c:if>
								</ul>
								</nav>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
					</c:otherwise>
			</c:choose>
	    </div>
	    </div>
    </div>

</section>

<footer>
	<c:import url="/Footer.jsp"></c:import>
</footer>
</body>
</html>