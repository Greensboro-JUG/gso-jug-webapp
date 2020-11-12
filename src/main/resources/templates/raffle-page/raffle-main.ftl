<#import "../layouts/application-base-layout.ftl" as layout>
<@layout.application_base_layout "GSO-JUG Home">

	<div class="container-fluid mt-10">
		<div id="inputs" class="row justify-content-center">
			<div class="card bg-secondary col-6 mt-5 pt-4 pb-4">
				<div class="form-group row">
					<label for="first-name"  class="col-form-label col-2 text-white">First Name:</label>
					<input type="text" id="first_name" class="form-control col-4" id="first-name">
				</div>
				<div class="form-group row">
					<label for="last-name" class="col-form-label col-2 text-white">Last Name:</label>
					<input type="text" id="last_name" class="form-control col-4" id="last-name">
				</div>
				<div class="form-group row">
					<label for="email" class="col-form-label col-2 text-white">Email:</label>
					<input type="email" id="email" class="form-control col-4" id="email">
				</div>
				<div class="col-6">
					<button type="button" id="enterRaffle" class="btn btn-primary float-right">Enter</button>
				</div>
			</div>

		</div>

	</div>


</@layout.application_base_layout>