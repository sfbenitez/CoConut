<html>
<head>
		<meta charset="utf-8">
    <!-- Custom CSS -->
    <link href="static/css/screen.css" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href="<spring:url value='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>"/>
		<!--//webfonts-->
</head>

<body>
	<div class="main">
		<form action="/dashboard" method="post">
    		<h1><span>Alumno</span> <lable> Login </lable> </h1>
  			<div class="inset">
	  			<p>
	    		 <label for="userName">USER NAME</label>
   	 			<input type="text" placeholder="nombre.apellido" required/>
				</p>
  				<p>
				    <label for="password">PASSWORD</label>
				    <input type="password" placeholder="password" required/>
  				</p>
          <!--
				  <p>
				    <input type="checkbox" name="remember" id="remember">
				    <label for="remember">Agree to Continue</label>
				  </p>
          -->
 			 </div>

			  <p class="p-container">
			    <!--<span><a href="#">Forgot password ?</a></span>-->
			    <input type="submit" value="Login">
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
