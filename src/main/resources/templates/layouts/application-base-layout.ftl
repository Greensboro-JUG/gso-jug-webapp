<#macro application_base_layout title="Base Layout">
<!DOCTYPE html>
<html>
	<head>
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=UA-157182323-1"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'UA-157182323-1');
		</script>

	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <title>Greensboro JUG</title>
	
	    <!-- Bootstrap core CSS -->
	    <link href="vendorcss/bootstrap.min.css" rel="stylesheet">
	    <link href="styles/carousel.css" rel="stylesheet">
	    <link href="styles/styles.css" rel="stylesheet">
	</head>

	<body>
		
		<#include "header.ftl">
	    
	    <main role="main">
	      <#nested/>
	    </main>
	    
		<#include "footer.ftl">

		<!-- <div class="return-to-top"><i class="fa fa-chevron-up"></i></div> -->
	    
	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script>window.jQuery || document.write('<script src="vendorjs/jquery-slim.min.js"><\/script>')</script>
	    <script src="vendorjs/popper.min.js"></script>
	    <script src="vendorjs/bootstrap.min.js"></script>
	    <script src="vendorjs/holder.min.js"></script>
	    <!-- <script src="js/script.js"></script> -->
	    
	</body>

</html>
</#macro>