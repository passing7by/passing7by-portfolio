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
					<form action="/${adminUrl }/project/add" method="post" class="form-valide" id="add-form">
					
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
						<hr><hr>
						
						<!-- 폼 추가/삭제 기능 구현 -->
						<h5>프로젝트 기록물</h5>
						<br>
						<div id="project-note-box">
							<div class="project-note-row">
							
								<div class="form-group row">
									<label class="col-lg-2 col-form-label" for="projectNoteVOs[0].title">제목
										<span class="text-danger">*</span>
									</label>
									
									<div class="col-lg-7">
										<input type="text" class="form-control" id="projectNoteVOs[0].title" name="projectNoteVOs[0].title" value="${vo.projectNoteVOs[0].title }">
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-lg-2 col-form-label" for="projectNoteVOs[0].url">링크
										<span class="text-danger">*</span>
									</label>
									
									<div class="col-lg-7">
										<input type="text" class="form-control" id="projectNoteVOs[0].url" name="projectNoteVOs[0].url" value="${vo.projectNoteVOs[0].url }">
									</div>
								</div>
								
								<div class="row m-0 justify-content-end">
									<button class="btn btn-danger m-b-30" type="button">삭제</button>
								</div>
								<br>
							</div>
						</div>
						
						<div class="row m-0 justify-content-end">
							<button class="btn btn-normal m-b-30" type="button">추가</button>
						</div>
						<hr>
						
						<!-- 폼 추가/삭제 기능 구현 -->
						<h5>추가 항목</h5>
						<br>
						<div id="project-note-box">
							<div class="project-note-row">
							
								<div class="form-group row">
									<label class="col-lg-2 col-form-label" for="sectionVOs.title">제목
										<span class="text-danger">*</span>
									</label>
									
									<div class="col-lg-7">
										<input type="text" class="form-control" id="sectionVOs.title" name="sectionVOs.title" value="${vo.sectionVOs.title }">
									</div>
								</div>
								
								<div class="form-group row">
									<label class="col-lg-2 col-form-label" for="sectionVOs.url">내용
										<span class="text-danger">*</span>
									</label>
									
									<div class="col-lg-10">
										<textarea class="form-control" rows="7" id="sectionVOs.url" name="sectionVOs.url" value="${vo.sectionVOs.url }">
										</textarea>
									</div>
								</div>
							
								<div class="row m-0 justify-content-end">
									<button class="btn btn-danger m-b-30" type="button">삭제</button>
								</div>
								<br>
							
							</div>
						</div>
						
						<div class="row m-0 justify-content-end">
							<button class="btn btn-normal m-b-30" type="button">추가</button>
						</div>
						<hr>
						
						<!-- 폼 추가/삭제 기능 구현 -->
						<h5>첨부 이미지</h5>
						<br>
						<div id="project-note-box">
							<div class="project-note-row">
							
								<div class="form-group row">
									<div class="col-lg-6">
										<input type="file" class="form-control" id="fileVO" name="fileVO" value="${vo.fileVO.originalName }.${vo.fileVO.extension }">
									</div>
								</div>
								
								<div class="row m-0 justify-content-end">
									<button class="btn btn-danger m-b-30" type="button">삭제</button>
								</div>
								<br>
							
							</div>
							
							<div class="row m-0 justify-content-end">
								<button class="btn btn-normal m-b-z30" type="button">추가</button>
							</div>
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