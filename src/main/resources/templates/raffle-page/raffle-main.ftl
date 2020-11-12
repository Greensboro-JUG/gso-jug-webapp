<#import "../layouts/application-base-layout.ftl" as layout>
<@layout.application_base_layout "GSO-JUG Home">

    <hr/>

    <div class="container marketing">

        <div id="raffleDiv" class="bg-blue">
            <form id="raffleForm" class="needs-validation" >
                <div class="form-group">
                    <label for="first_name">First Name:</label>
                    <input type="text" required class="form-control" id="first_name" placeholder="First Name">
                </div>
                <div class="form-group">
                    <label for="last_name">Last Name:</label>
                    <input type="text" required class="form-control" id="last_name" placeholder="Last Name">
                </div>
                <div class="form-group">
                    <label for="email_id">Email:</label>
                    <input type="email" required class="form-control" id="email_id" aria-describedby="emailHelp"
                           placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                        else.</small>
                </div>
                <div class="form-group">
                    <button type="submit" id="enterRaffle" class="btn btn-primary">Register For Raffle</button>
                </div>
            </form>
        </div>

        <hr/>

        <div class="bg-orange">
            <table id="raffleTable" class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">FName</th>
                    <th scope="col">LName</th>
                    <th scope="col">Email</th>
                </tr>
                </thead>
                <tbody>
					<#list raffleList as raffle>
                        <#if raffle.picked>
                            <tr class="bg-success" >
                                <th scope="row">${raffle?index+1}</th>
                                <td>${raffle.first_name}</td>
                                <td>${raffle.last_name}</td>
                                <td>${raffle.email?substring(0, 1)}xxxxx@${raffle.email?keep_after("@")}</td>
                            </tr>
                        <#else>
                            <tr>
                                <th scope="row">${raffle?index+1}</th>
                                <td>${raffle.first_name}</td>
                                <td>${raffle.last_name}</td>
                                <td>${raffle.email} ${raffle.email?substring(0, 1)}xxxxx@${raffle.email?keep_after("@")}</td>
                            </tr>
                        </#if>
					</#list>
                </tbody>
            </table>
        </div>

    </div>

</@layout.application_base_layout>