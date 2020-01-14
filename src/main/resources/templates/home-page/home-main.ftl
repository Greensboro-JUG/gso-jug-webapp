<#import "../layouts/application-base-layout.ftl" as layout>
<@layout.application_base_layout "GSO-JUG Home">

<#include "home-carousel.ftl">

      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">
	      	
	      	<div id="InauguralEventDiv" class="bg-blue">
	      		<#include "home-learn-more.ftl">
	      	</div>

		    <hr id="LocationDiv" />

		    <div id="LocationDiv" class="bg-blue">
			   <#include "location.ftl">
		    </div>
	      	
	      	<hr id="AboutUsDiv" />
	      	
	      	<div class="bg-orange">
	      		<#include "home-about-us.ftl">
	      	</div>
	      	
	      	<hr id="SponsorsDiv" />

			<div class="bg-blue">
	      		<#include "home-sponsors.ftl">	
	      	</div>	
	      	
	      	<hr id="ContactUsDiv" />
	      	
	      	<div class="bg-gray">
	      		<#include "home-contactus.ftl">	
	      	</div>		
	      																
      </div>

      </@layout.application_base_layout>