<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html data-ng-app>
<head>
    <meta charset="UTF-8">
	<title><tiles:getAsString name="title" /></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/css/toastr.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/css/<tiles:getAsString name="css" />"  rel="stylesheet" type="text/css" />
	
</head>
<body>
	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">
			<ul class="nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Cadastros <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/pais/listagem">País</a></li>
						<li><a href="${pageContext.request.contextPath}/estado/listagem">Estado</a></li>
						<li><a href="${pageContext.request.contextPath}/cidade/listagem">Cidade</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>

	<tiles:insertAttribute name="body" ignore="true" />

	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/angular.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.blockUI.js"></script>
	<script src="${pageContext.request.contextPath}/js/sammy.js"></script>
	<script src="${pageContext.request.contextPath}/js/toastr.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/constants.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/js/model.js"></script>
	<script src="${pageContext.request.contextPath}/js/controllerCadastro.js"></script>
	<script src="${pageContext.request.contextPath}/js/controllerListagem.js"></script>
	<c:set var="x"><tiles:getAsString name="js" ignore="true" /></c:set>
	<c:if test="${not empty x}">
		<script src="${pageContext.request.contextPath}/js/<tiles:getAsString name="js" ignore="true" />"></script>
	</c:if> 
</body>
</html>
