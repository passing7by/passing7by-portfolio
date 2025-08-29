<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewort" content="width=device-width,initial-scale=1">
	<title>${cat } list</title>
	
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
	
	<!-- TODO 수정/삭제 js로 구현 -->
	<div class="col-lg-10">
	<div class="card">
		<div class="card-body">
			<div class="card-title row m-0 justify-content-between">
			
				<h4 style="text-transform: capitalize;">${cat} List</h4>
				
				<div class="row m-0">
					<a class="btn btn-primary m-b-30 mr-2" href="/${adminUrl }/project/add">등록</a>
<!-- 					<button class="btn btn-success m-b-30 mr-2">수정</button>
					<button class="btn btn-danger m-b-30">삭제</button> -->
				</div>
				
			</div>
			<br>
			
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th class="col-md-4">제목</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>등록</th>
							<th>수정</th>
							<th>공개여부</th>
						</tr>
					</thead>
					<tbody>
						
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach items="${list }" var="vo">
									<tr>
										
										<th>${vo.rowNumber }</th>
										<td><a href="/${adminUrl }/project/detail?id=${vo.id }">${vo.title }</a></td>
										<%-- INFO 
										로그인 기능이 구현되기 전까지는 이 a태그는 동작하지 않음. 
										detail 페이지를 테스트하기 위해서는 주소창에 직접 
										/${adminUrl}/project/detail?id=id값&adminId=adminId값 을 입력하여 테스트할 것. --%>
										<td>${not empty vo.startDate ? vo.startDate : '-' }</td>
										<td>${not empty vo.endDate ? vo.endDate : '-' }</td>
										<td>${vo.formattedRegDate }</td>
										<td>${not empty vo.modDate ? vo.formattedModDate : '-' }</td> <!-- INFO vo.formatedModDate 로 조건을 검사할 수 없음... 왜? -->
										<td><span class="badge ${vo.isPublished eq true ? 'badge-primary' : 'badge-success' } px-2">
											${vo.isPublished eq true ? '공개' : '비공개' }
										</span></td>
									</tr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<p>조회할 데이터가 없습니다.</p>
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- /# card -->
</div>
	<!-- Contents End -->
	
	<c:import url="/WEB-INF/views/admin/common/wrapper_end.jsp"/>
	<!-- Wrapper End -->
</body>
</html>