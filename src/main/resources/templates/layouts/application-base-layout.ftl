<#macro application_base_layout title="Base Layout">
<!DOCTYPE html>
<html>
	<head>
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
	    
	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	    <script>window.jQuery || document.write('<script src="vendorjs/jquery-slim.min.js"><\/script>')</script>
	    <script src="vendorjs/popper.min.js"></script>
	    <script src="vendorjs/bootstrap.min.js"></script>
	    <script src="vendorjs/holder.min.js"></script>
	    
	</body>

</html>
</#macro>