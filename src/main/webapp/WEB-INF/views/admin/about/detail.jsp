<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewort" content="width=device-width,initial-scale=1">
	<title>${cat} detail</title>
	
	<!-- Favicon icon -->
	<!-- <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png"> -->
	
	<!-- Theme Style -->
	<c:import url="/WEB-INF/views/admin/common/head.jsp"/>
</head>

<body>
	<!-- Preloader -->
	<c:import url="/WEB-INF/views/admin/common/preloader.jsp"/>
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/admin/common/header.jsp"/>
	
	<!-- Sidebar -->
	<c:import url="/WEB-INF/views/admin/common/sidebar.jsp"/>

	<!-- Wrapper Start -->
	<c:import url="/WEB-INF/views/admin/common/wrapper_start.jsp"/>

	<!-- Contents Start -->
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="read-content">

					<div class="media mb-4 mt-1">
						<div class="media-body">
							<span class="text-muted">등록됨 · ${vo.formattedRegDate }</span>
							<br>
							<c:if test="${vo.modDate ne null }">
								<span class="text-warning">수정됨 · ${vo.formattedModDate }</span>
							</c:if>
							<br><br>
							
							<h3 class="m-0 text-primary">
								<span class="mb-1 badge ${vo.isPublished eq true ? 'badge-primary' : 'badge-success' } px-2">
									${vo.isPublished eq true ? '공개' : '비공개' }
								</span>&nbsp;
								${vo.title }
							</h3>
							<p class="text-muted">${vo.name}</p>
						</div>
					</div>
					
					<div class="media media-reply">
						<div class="media-body">
							
							<h5 class="m-b-5 p-t-15">깃허브 링크</h5>
							<c:choose>
								<c:when test="${vo.githubUrl ne null }">
									<p><a style="text-decoration: underline;" href="${vo.githubUrl }">${vo.githubUrl }</a></p>				
								</c:when>
								<c:otherwise>
									<p>-</p>
								</c:otherwise>
							</c:choose>
							
							<h5 class="m-b-5 p-t-15">블로그 링크</h5>
								<c:choose>
									<c:when test="${vo.blogUrl ne null }">
										<p><a style="text-decoration: underline;" href="${vo.blogUrl }">${vo.blogUrl }</a></p>
									</c:when>
									<c:otherwise>
										<p>-</p>
									</c:otherwise>
								</c:choose>
							
							<h5 class="m-b-5 p-t-15">이메일 링크</h5>
								<c:choose>
									<c:when test="${vo.emailUrl ne null }">
										<p><a style="text-decoration: underline;" href="${vo.emailUrl }">${vo.emailUrl }</a></p>
									</c:when>
									<c:otherwise>
										<p>-</p>
									</c:otherwise>
								</c:choose>
							
						</div>
					</div>
				
					<div class="media media-reply">
						<div class="media-body">
						
							<h5 class="m-b-5 p-t-15">기술</h5>
 							<c:choose>
								<c:when test="${not empty vo.skillVOs }">
									<c:forEach items="${vo.skillVOs }" var="sk">
										<b class="m-b-5 p-t-15 text-warning">${sk.name }</b> <!--  -->
										<p>${sk.description }</p>
									</c:forEach>						
								</c:when>
								<c:otherwise>
									<p>-</p>
								</c:otherwise>
							</c:choose> 
					
						</div>
					</div>
					
					<div class="media media-reply">
						<div class="media-body">
						
							<h5 class="m-b-5 p-t-15">추가 항목</h5>
							<c:choose>
								<c:when test="${not empty vo.sectionVOs }">
									<c:forEach items="${vo.sectionVOs }" var="s">
											<b class="m-b-5 p-t-15 text-warning">${s.title }</b>
											<p>${s.content }</p>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p>-</p>
								</c:otherwise>
							</c:choose>
							
						</div>
					</div>
					
					<div class="media media-reply">
						<div class="media-body">
						
							<h5 class="m-b-5 p-t-15">첨부 이미지</h5>
							<c:choose>
								<c:when test="${not empty vo.fileVOs }">
									<c:forEach items="${vo.fileVOs }" var="f">
											<img alt="프로젝트 이미지" src="${f.savedName }.${f.extension }"> <!-- TODO 파일을 다루는 기능을 구현한 뒤 src 변경 -->
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p>-</p>
								</c:otherwise>
							</c:choose>
						
						</div>
					</div>
					
				</div>
				<br>
				
				<!-- TODO 시간이 된다면 form에 다 때려넣는 방식 대신 js 사용 방식으로 수정 -->
				<div class="row m-0 justify-content-end">
					<form action="/${adminUrl }/about/update" method="get" class="mr-2">
						<input type="hidden" name="id" value="${vo.id }">
						<button class="btn btn-success m-b-30">수정</button>
					</form>
					<form action="/${adminUrl }/about/delete" method="post">
						<input type="hidden" name="id" value="${vo.id }">
						<button class="btn btn-danger m-b-30">삭제</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Contents End -->
	
	<c:import url="/WEB-INF/views/admin/common/wrapper_end.jsp"/>
	<!-- Wrapper End -->
</body>
</html>