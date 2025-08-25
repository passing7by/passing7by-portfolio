<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewort" content="width=device-width,initial-scale=1">
	<title>${cat} Detail</title>
	
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
	${vo }
	
	<form action="/${adminUrl }/project/delete" method="post">
		<input type="text" name="id" value="6">
		<input type="text" name="adminId" value="1">
		<button>delete</button>
	</form>
	
	<!-- TODO 아래 양식 마저 구현 -->
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="form-validation">
					<form action="#" method="post" class="form-valide">
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-username">Username
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-username"
									name="val-username" placeholder="Enter a username..">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-email">Email
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-email"
									name="val-email" placeholder="Your valid email..">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-password">Password
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" id="val-password"
									name="val-password" placeholder="Choose a safe one..">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-confirm-password">Confirm
								Password <span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="password" class="form-control"
									id="val-confirm-password" name="val-confirm-password"
									placeholder="..and confirm it!">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-suggestions">Suggestions
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<textarea class="form-control" id="val-suggestions"
									name="val-suggestions" rows="5"
									placeholder="What would you like to see?"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-skill">Best
								Skill <span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<select class="form-control" id="val-skill" name="val-skill">
									<option value="">Please select</option>
									<option value="html">HTML</option>
									<option value="css">CSS</option>
									<option value="javascript">JavaScript</option>
									<option value="angular">Angular</option>
									<option value="angular">React</option>
									<option value="vuejs">Vue.js</option>
									<option value="ruby">Ruby</option>
									<option value="php">PHP</option>
									<option value="asp">ASP.NET</option>
									<option value="python">Python</option>
									<option value="mysql">MySQL</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-currency">Currency
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-currency"
									name="val-currency" placeholder="$21.60">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-website">Website
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-website"
									name="val-website" placeholder="http://example.com">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-phoneus">Phone
								(US) <span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-phoneus"
									name="val-phoneus" placeholder="212-999-0000">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-digits">Digits
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-digits"
									name="val-digits" placeholder="5">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-number">Number
								<span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-number"
									name="val-number" placeholder="5.0">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label" for="val-range">Range
								[1, 5] <span class="text-danger">*</span>
							</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" id="val-range"
									name="val-range" placeholder="4">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-lg-4 col-form-label"><a href="#">Terms
									&amp; Conditions</a> <span class="text-danger">*</span> </label>
							<div class="col-lg-8">
								<label class="css-control css-control-primary css-checkbox"
									for="val-terms"> <input type="checkbox"
									class="css-control-input" id="val-terms" name="val-terms"
									value="1"> <span class="css-control-indicator"></span> I
									agree to the terms
								</label>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-8 ml-auto">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
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