<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewort" content="width=device-width,initial-scale=1">
	<title>${cat} add</title>
	
	<!-- Favicon icon -->
	<!-- <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png"> -->
	
	<!-- Theme Style -->
	<c:import url="/WEB-INF/views/admin/common/head.jsp"/>
	
	<script defer type="text/javascript" src="/admin/js/content_add.js"></script>
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
<%-- 	<form action="${uri }" method="post">
		<c:if test="${uri eq '/${adminUrl }/project/update' }">
			<input type="text" name="id" value="6">
		</c:if>
		<input type="text" name="adminId" value="1">
		<input type="text" name="title" value="test">
		<button>add</button>
	</form> --%>
	
	<!-- TODO spring validation을 적용하여 form을 form:form으로 변경 -->
	<div class="col-lg-8">
		<div class="card">
			<div class="card-body">
				<div class="form-validation">
					<form action="${uri }" method="post" enctype="multipart/form-data" class="form-valide" id="add-form">
					<!-- form 태그에 반드시 enctype="multipart/form-data" 를 작성해 주어야 파일 데이터를 컨트롤러가 받을 수 있음 -->
						
						<input type="hidden" name="id" value="${vo.id }">
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label" for="title">제목
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="title" name="title" value="${vo.title }">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label" for="name">이름
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="name" name="name" value="${vo.name }">
							</div>
						</div>
						<hr>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="githubUrl">깃허브 링크
								<span class="text-danger">*</span>
							</label>
							<div class="col-7">
								<input type="url" class="form-control" id="githubUrl" name="githubUrl" value="${vo.githubUrl }">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="blogUrl">블로그 링크
								<span class="text-danger">*</span>
							</label>
							<div class="col-7">
								<input type="url" class="form-control" id="blogUrl" name="blogUrl" value="${vo.blogUrl }">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="emailUrl">이메일 링크
								<span class="text-danger">*</span>
							</label>
							<div class="col-7">
								<input type="url" class="form-control" id="emailUrl" name="emailUrl" value="${vo.emailUrl }">
							</div>
						</div>
						<hr>
						
						<div class="row m-0 justify-content-between">
							<h5>기술</h5>						
							<button class="btn btn-normal m-b-30 add-btn" id="add-skill" type="button">추가</button>
						</div>
						<br>
						
						<div id="skill-box">
							<c:if test="${not empty vo.skillVOs }">
								<c:forEach items="${vo.skillVOs }" varStatus="i" var="sk">
								
									<div class="skill-row">
										<input type="hidden" name="skillVOs[${i.index }].id" value="${sk.id }">
										<div class="form-group row title-fg-row">
											<label class="col-lg-2 col-form-label title-label"
												for="skillVOs[${i.index }].name">이름<span
												class="text-danger">*</span></label>
											<div class="col-lg-7">
												<input class="form-control title-input" type="text"
													name="skillVOs[${i.index }].name" value="${sk.name }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label content-label"
												for="skillVOs[${i.index }].description">설명<span
												class="text-danger">*</span></label>
											<div class="col-lg-7 content-input-div">
												<input class="form-control content-input" type="text"
													name="skillVOs[${i.index }].description" value="${sk.description }">
											</div>
										</div>
										<div class="row m-0 justify-content-end">
											<button class="btn btn-danger m-b-30 del" type="button">삭제</button>
										</div>
										<br>
									</div>
									
								</c:forEach>
							</c:if>
						</div>
						<hr>
						
						<div class="row m-0 justify-content-between">
							<h5>추가 항목</h5>
							<button class="btn btn-normal m-b-30 add-btn" id="add-section" type="button">추가</button>
						</div>
						<br>
						
						<div id="section-box">
							<c:if test="${not empty vo.sectionVOs }">
								<c:forEach items="${vo.sectionVOs }" varStatus="i" var="s">

									<div class="section-row">
										<input type="hidden" name="sectionVOs[${i.index }].id" value="${s.id }">
										<div class="form-group row title-fg-row">
											<label class="col-lg-2 col-form-label title-label"
												for="sectionVOs[${i.index }].title">제목<span
												class="text-danger">*</span></label>
											<div class="col-lg-7">
												<input class="form-control title-input" type="text"
													name="sectionVOs[${i.index }].title" value="${s.title }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label content-label"
												for="sectionVOs[${i.index }].content">내용<span
												class="text-danger">*</span></label>
											<div class="content-input-div col-lg-10">
												<textarea class="form-control content-textarea"
													name="sectionVOs[${i.index }].content" rows="7">${s.content }</textarea>
											</div>
										</div>
										<div class="row m-0 justify-content-end">
											<button class="btn btn-danger m-b-30 del" type="button">삭제</button>
										</div>
										<br>
									</div>

								</c:forEach>
							</c:if>
						
						</div>
						<hr>
						
						<div class="row m-0 justify-content-between">
							<h5>첨부 이미지</h5>
							<button class="btn btn-normal m-b-z30 add-btn" id="add-file" type="button">추가</button>
						</div>
						<br>
						
						<div id="file-box">
							<c:if test="${not empty vo.fileVOs }">
							<!-- TODO 버튼 눌렀을 때 삭제되도록 구현 -->
 								<c:forEach items="${vo.fileVOs }" varStatus="i" var="f">
									<button class="delFile mb-1 btn" type="button" data-file-id = "${f.id}">${f.oriName}</button>
								</c:forEach>
							</c:if>
							
						</div>
						<br><br>
						
						<div class="form-group row m-0 justify-content-end">
							<label class="btn btn-success m-b-30 mr-2 btn-publish" for="temp-save">임시저장</label>
							<input type="submit" class="btn btn-success m-b-30 mr-2 d-none btn-publish" id="temp-save" name="isPublished" value="0">
							
							<label class="btn btn-primary m-b-30 btn-publish" for="save">저장</label>
							<input type="submit" class="btn btn-danger m-b-30 d-none btn-publish" id="save" name="isPublished" value="1">
						</div>
						
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