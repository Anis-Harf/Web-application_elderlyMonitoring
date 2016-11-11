<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<link href="${pageContext.request.contextPath}/et-line-font/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
 
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
<div id="wrapper" class="home-page">
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
                        <li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li> 
						<c:if test="${!empty sessionScope.identifiant}"><li><a href="${pageContext.request.contextPath}/surveillance">Patients</a></li></c:if>
						<li><a href="${pageContext.request.contextPath}/apropos">A propos</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                        <c:if test="${!empty sessionScope.identifiant}"><li><a href="${pageContext.request.contextPath}/logout">Déconnexion</a></li></c:if>
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->
	<section id="banner">
	 
	<!-- Slider -->
        <div id="main-slider" class="flexslider">
            <ul class="slides">
              <li>
                <img src="${pageContext.request.contextPath}/img/slides/2.jpg" alt="" />
                <div class="flex-caption">
                    <h3>Suivi en temps réel</h3> 
					<p>Garder un oeil sur les plus vulnérables</p> 
					 
                </div>
              </li>
              <li>
                <img src="${pageContext.request.contextPath}/img/slides/1.jpg" alt="" />
                <div class="flex-caption">
                    <h3>Assistance</h3> 
					<p>Etre pret à intervenir en cas de besoin</p> 
					 
                </div>
              </li>
            </ul>
        </div>
	<!-- end slider -->
 
	</section>
	<section class="hero-text">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<c:choose>
	<c:when test="${!empty sessionScope.identifiant}">
		<div class="aligncenter">
						<div class="aligncenter"><h1 class="aligncenter"><c:out value="   Bonjour ${sessionScope.identifiant} ! vous etês bien connecté"></c:out></h1>
						</div>
		
		</div>
	</c:when>
	<c:otherwise>
					<div class="aligncenter"><h1 class="aligncenter">Authentification</h1></div>
	
	</c:otherwise>
	</c:choose>
				
			</div>
		</div>
	</div>
	</section>
	
<c:if test="${empty sessionScope.identifiant}">
	<!-- Mixins-->
	<section id="content">
	<div class="container2">
	<div class="card"></div>
  <div class="card">
    <h1 class="title2">Accès</h1>
    	<div class="aligncenter">
   			 <c:if test="${!empty errone}"><p><c:out value="${errone}"></c:out></p></c:if>
   		</div>
    <form method="post" action="index">
      <div class="input-container">
        <input type="text" id="Username" name="Username" required="required"/>
        <label for="Username">Pseudo</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id="Password" name="Password" required="required"/>
        <label for="Password">mot de passe</label>
        <div class="bar"></div>
      </div>
      <div class="button-container">
        <button type="submit"><span>Valider</span></button>
      </div>
      <div class="footer2"><a href="#">mot de passe oublié?</a></div>
    </form>
  </div>
  <div class="card alt">
    <div class="toggle"></div>
    <h1 class="title2">S'enregistrer
      <div class="close"></div>
    </h1>
    <form method="post" action="index">
      <div class="input-container">
        <input type="text" id="identifiant" name="identifiant" required="required"/>
        <label for="identifiant">Identifiant</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id="mp" name="mp" required="required"/>
        <label for="mp">Mot de passe</label>
        <div class="bar"></div>
      </div>
      <div class="input-container">
        <input type="password" id="rp" name="rp" required="required"/>
        <label for="rp">Confirmation mot de passe</label>
        <div class="bar"></div>
      </div>
      <div class="button-container">
        <button type="submit"><span>Suivant</span></button>
      </div>
    </form>
  </div>
  </div>
  </section>
</c:if>
  

	    	
	
	
	<section class="testimonial-area">
    <div class="testimonial-solid">
       
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