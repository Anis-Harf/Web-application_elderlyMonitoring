<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta http-equiv="refresh" content="30">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Health Care</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://webthemez.com" />
<!-- css -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/fancybox/jquery.fancybox.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/flexslider.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
 
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<div id="wrapper">

	<!-- start header -->
		<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"/></a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/index">Home</a></li> 
                        <li class="active"><a href="${pageContext.request.contextPath}/surveillance">Patients</a></li>
						<li><a href="${pageContext.request.contextPath}/apropos">A propos</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                        <c:if test="${!empty sessionScope.identifiant}"><li><a href="${pageContext.request.contextPath}/logout">Déconnexion</a></li></c:if> 
                    </ul>
                </div>
            </div>
        </div>
	</header><!-- end header -->
	<section id="inner-headline3">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Patients</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<div class="aligncenter">
				<form method="post" action="surveillance">

        				<input type="text" id="Patient" name="Patient" placeholder="Recherche patient"/>
        				<button type="submit"><span>Valider</span></button>
        			  
				</form>
			</div>
				<section id="content">
					<div class="container3">
					</div>
				</section>
				<div class="row">
					<section id="projects">
					<ul id="thumbs" class="portfolio">

						
						<c:forEach var="pat" items="${liste}">
        					<li class="item-thumbs col-lg-3 design">
        					<div class="aligncenter">
							<a href="${pageContext.request.contextPath}/patient?prenom=${pat.prenom}&nom=${pat.nom}" title="Télé-surveillance"><c:out value="${fn:toUpperCase(pat.nom)} ${pat.prenom}"></c:out></a>
        					</div>
        					<c:choose>
							<c:when test="${!empty pat.image}">
        					<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="${fn:toUpperCase(pat.nom)} ${pat.prenom}" href="ftp://anis:password@127.0.0.1/patients/${pat.image}">
						<!--	<span class="overlay-img"></span>
							  <span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-code"></i></span> -->
							</a>
							
							<img alt="" src="ftp://anis:password@127.0.0.1/patients/${pat.image}">
							</c:when>
							<c:otherwise>
							<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="${fn:toUpperCase(pat.nom)} ${pat.prenom}" href="ftp://anis:password@127.0.0.1/patients/inconnu.jpg">
						<!--	<span class="overlay-img"></span>
							  <span class="overlay-img-thumb"><i class="icon-info-blocks fa fa-code"></i></span> -->
							</a>
							<img alt="" src="ftp://anis:password@127.0.0.1/patients/inconnu.jpg">
							</c:otherwise>
							</c:choose>
        					</li>
        				</c:forEach>
						
						<!-- End Item Project -->
					</ul>
					</section>
				</div>
			</div>
		</div>
	</div>
	</section>
<footer>
	
	<div id="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="copyright">
						<p>
							<span>&copy; health care 2016 All right reserved. </span>
						</p>
					</div>
				</div>
				<div class="col-lg-6">
					<ul class="social-network">
						<li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</footer>
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.fancybox.pack.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.fancybox-media.js"></script> 
<script src="${pageContext.request.contextPath}/js/portfolio/jquery.quicksand.js"></script>
<script src="${pageContext.request.contextPath}/js/portfolio/setting.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script src="${pageContext.request.contextPath}/js/animate.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>