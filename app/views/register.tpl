<html>
<head>
		<meta charset="utf-8">
    <!-- Custom CSS -->
		<link rel="icon" type="image/png" sizes="16x16" href="../static/assets/images/favicon.png">
		<title>CoConut</title>
    <link href="static/css/screen.css" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href="<spring:url value='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text.css'/>"/>
		<!--//webfonts-->
</head>

<body>
	<div class="main-reg">
		<form action="/register" method="post">
    		<h1><span>CoConut</span> <lable> Register </lable> </h1>
  			<div class="inset">
					<p>
					 <label for="data">Datos del usuario</label>
					</p>
	  			<p>
	    		 <label for="user">USER NAME</label>
   	 			 <input type="text" placeholder="nombre.apellido" name="user" required/>
				  </p>
  				<p>
				    <label for="password">PASSWORD</label>
				    <input type="password" placeholder="password" name="password" required/>
  				</p>
					<p>
						<label for="name">Nombre completo</label>
						<input type="text" placeholder="nombre completo" name="name" required/>
					</p>
					<p>
				    <label for="mail">E-MAIL</label>
				    <input type="text" placeholder="e-mail" name="mail" required/>
  				</p>
					<p>
				    <label for="date">Fecha de nacimiento</label>
				    <input type="text" placeholder="DD/MM/YYYY" name="date" required/>
  				</p>
					<p>
	    		 <label for="virt">Máquinas virtuales</label>
   	 			</p>
					<p>
	    		 <label for="ipmickey">Mickey</label>
   	 			 <input type="text" placeholder="IP Mickey" name="ipmickey" required/>
				  </p>
				  <p>
				   <label for="ipminnie">Minnie</label>
				   <input type="text" placeholder="IP Minnie" name="ipminnie" required/>
			    </p>
				  <p>
				   <label for="ipdonald">Donald</label>
				   <input type="text" placeholder="IP Donald" name="ipdonald" required/>
			    </p>
        </div>
			  <p class="p-container">
			    <!--<span><a href="#">Forgot password ?</a></span>-->
 				  <input type="button" value="Volver" onclick="location.href='/'">
					<input type="submit" value="New user">
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
