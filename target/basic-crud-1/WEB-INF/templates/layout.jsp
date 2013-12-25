<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="iso-8859-1">
	<title><tiles:getAsString name="title" /></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="${pageContext.request.contextPath}/resources/css/<tiles:getAsString name="css"  rel="stylesheet" type="text/css" />" />
	
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Cadastros <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/pais/listagem">País</a></li>
						<li><a href="${pageContext.request.contextPath}/estado/listagem">Estado</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>

	<tiles:insertAttribute name="body" />

	<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
