<html>
<head>
		<meta charset="utf-8">
    <!-- Custom CSS -->
    <link rel="icon" type="image/png" sizes="16x16" href="../static/assets/images/favicon.png">
    <title>CoConut</title>
    <link href="/static/css/screen.css" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href="<spring:url value='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>"/>
		<!--//webfonts-->
</head>

<body>
	<div class="main">
		<form action="/">
    		<h1><span>¡Error 401!</span> <lable>¡No estás autorizado!</lable> </h1>
  			<div class="inset">
	  			<p>
	    		 <label for="user">Inicia sesión por favor.</label>
   	 			<!--<input type="text" placeholder="nombre.apellido" name="user" required/>

  				<p>
				    <label for="password">PASSWORD</label>
				    <input type="password" placeholder="password" name="password" required/>
  				</p>

				  <p>
				    <input type="checkbox" name="remember" id="remember">
				    <label for="remember">Agree to Continue</label>
				  </p>
          -->
					 </p>
 			 </div>

			  <p class="p-container">
			    <!--<span><a href="#">Forgot password ?</a></span>-->
					<input type="button" value="Volver" onclick="location.href='/'">
			  </p>
		</form>
	</div>
  <script type="application/javascript">
      addEventListener("load", function() {
          setTimeout(hideURLbar, 0); },
          false);
          function hideURLbar(){ window.scrollTo(0,1); }
  </script>
</body>
</html>
