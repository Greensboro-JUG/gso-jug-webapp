<#import "../layouts/application-base-layout.ftl" as layout>
<@layout.application_base_layout "GSO-JUG Home">

	 <#include "home-carousel.ftl">
      
      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">

        
        <!-- START THE FEATURETTES -->

        <hr id="InauguralEventDiv"  class="featurette-divider">

        <#include "home-learn-more.ftl">

        <hr id="AboutUsDiv" class="featurette-divider">

		<#include "home-about-us.ftl">

        <hr id="SponsorsDiv" class="featurette-divider">

        <!-- <#include "home-sponsors.ftl"> -->

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

      </div><!-- /.container -->
</@layout.application_base_layout>