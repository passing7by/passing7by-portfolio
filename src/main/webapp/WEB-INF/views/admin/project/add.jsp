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
	
	<script defer type="text/javascript" src="/admin/js/project_add.js"></script>
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
					<form action="${uri }" method="post" class="form-valide" id="add-form">
						
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
							<label class="col-lg-2 col-form-label" for="summary">요약
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="summary" name="summary" value="${vo.summary }">
							</div>
						</div>
						<hr>
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label" for="keyFeatures">주요 기능 소개
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="7" id="keyFeatures" name="keyFeatures">
									${vo.keyFeatures }
								</textarea>
							</div>
						</div>
						<hr>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="teamSize">팀 규모
								<span class="text-danger">*</span>
							</label>
							<div class="col-4 row m-0">
								<input type="number" class="form-control col-7" id="teamSize" name="teamSize" value="${vo.teamSize }">
								<span class="col-2 align-self-center">인</span>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-lg-2 col-form-label" for=techStack>사용 기술
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-7">
								<input type="text" class="form-control" id="techStack" name="techStack" value="${vo.techStack }">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="startDate">시작일
								<span class="text-danger">*</span>
							</label>
							<div class="col-5">
								<input type="date" class="form-control" id="startDate" name="startDate" value="${vo.startDate }">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="endDate">종료일
								<span class="text-danger">*</span>
							</label>
							<div class="col-5">
								<input type="date" class="form-control" id="endDate" name="endDate" value="${vo.endDate }">
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
							<label class="col-2 col-form-label" for="demoUrl">배포 링크
								<span class="text-danger">*</span>
							</label>
							<div class="col-7">
								<input type="url" class="form-control" id="demoUrl" name="demoUrl" value="${vo.demoUrl }">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-2 col-form-label" for="pptUrl">PPT 링크
								<span class="text-danger">*</span>
							</label>
							<div class="col-7">
								<input type="url" class="form-control" id="pptUrl" name="pptUrl" value="${vo.pptUrl }">
							</div>
						</div>
						<hr>
						
						<div class="row m-0 justify-content-between">
							<h5>프로젝트 기록물</h5>						
							<button class="btn btn-normal m-b-30 add-btn" id="add-project-note" type="button">추가</button>
						</div>
						<br>
						
						<div id="project-note-box">
							<c:if test="${not empty vo.projectNoteVOs }">
								<c:forEach items="${vo.projectNoteVOs }" varStatus="i" var="pn">
								
									<div class="project-note-row">
										<div class="form-group row title-fg-row">
											<label class="col-lg-2 col-form-label title-label"
												for="projectNoteVOs[${i }].title">제목<span
												class="text-danger">*</span></label>
											<div class="col-lg-7">
												<input class="form-control title-input" type="text"
													name="projectNoteVOs[${i }].title" value="${pn.title }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label content-label"
												for="projectNoteVOs[${i }].url">링크<span
												class="text-danger">*</span></label>
											<div class="col-lg-7 content-input-div">
												<input class="form-control content-input" type="text"
													name="projectNoteVOs[${i }].url" value="${pn.url }">
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
										<div class="form-group row title-fg-row">
											<label class="col-lg-2 col-form-label title-label"
												for="sectionVOs[${i }].title">제목<span
												class="text-danger">*</span></label>
											<div class="col-lg-7">
												<input class="form-control title-input" type="text"
													name="sectionVOs[${i }].title" value="${s.title }">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label content-label"
												for="sectionVOs[${i }].content">내용<span
												class="text-danger">*</span></label>
											<div class="content-input-div col-lg-10">
												<textarea class="form-control content-textarea"
													name="sectionVOs[${i }].content" rows="7">${s.content }</textarea>
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
						
						<!-- INFO 파일 기능 구현하기 전까지는 일단 건드리지 마라.... -->
						<div class="row m-0 justify-content-between">
							<h5>첨부 이미지</h5>
							<button class="btn btn-normal m-b-z30 add-btn" id="add-file" type="button">추가</button>
						</div>
						<br>
						
						<div id="file-box">
							<c:if test="${not empty vo.fileVOs }">
							<!-- TODO 버튼 눌렀을 때 삭제되도록 구현 -->
 								<c:forEach items="${vo.fileVOs }" varStatus="i" var="f">
									<button class="deleteFile mb-1 btn" type="button" data-file-num = "${f.id}">${f.oriName}</button>
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