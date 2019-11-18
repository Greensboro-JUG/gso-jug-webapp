<#import "../layouts/application-base-layout.ftl" as layout>
<@layout.application_base_layout "GSO-JUG Home">

<#include "home-carousel.ftl">

      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">
      	<!-- START THE FEATURETTES -->
      	<div id="InauguralEventDiv" class="bg-blue">
      		<#include "home-learn-more.ftl">
      	</div>
      	<hr />
      	<div id="AboutUsDiv" class="bg-orange">
      		<#include "home-about-us.ftl">
      	</div>
      	<!-- /END THE FEATURETTES -->
      	<hr />
      	<div id="ContactUsDiv" class="bg-gray">
      		<#include "home-contactus.ftl">																			
      	</div><!-- /.container-fluid -->
      </div>

      </@layout.application_base_layout>