<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">

        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active" >
            <div class="container-fluid carousel-image">
              <div class="carousel-caption text-left" >
                <h1>Our Next Meetup Event</h1>
                <h4>
                	March 11, 2021 @ 6:00 pm Thu US EST<br />
                	<big class="d-none d-sm-block">An Introduction to Kotlin - by <b>Todd Ginsberg, Research Architect @ Netspend</b> </big><br />
                  <big class="d-block d-sm-none pt-1">An Introduction to Kotlin - by <b>Todd Ginsberg, Research Architect @ Netspend</b></big>
                </h4>
                <p><a class="btn btn-lg btn-green" href="#KotlinEvent" role="button">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item " style="background-color: black">

            <img class="meetup-logo" src="images/jetbrains-logo.svg" alt="Meetup Logo">
            <div class="container-fluid">
                <div class="carousel-caption text-right">
                    <h4>Follow us on twitter <a href="https://twitter.com/GreensboroJug" target="_twitter">
                            @GreensboroJug </a> <br/> to enter for a chance to win a FREE!!! JetBrains license at the
                        MeetUp event.</h4>

                    <a class="btn btn-outline-primary text-white" href="/raffle-main" role="button">Enter Raffle</a>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="container-fluid carousel-image-past-event">
                <div class="carousel-caption text-left">
                    <h1>Successful Inaugural Event</h1>
                    <h4>
                        Great session from Dr. Venkat Subramaniam. <br/>Thank you every one for the support !
                    </h4>
                </div>
            </div>
        </div>
        <div class="carousel-item meetup">
            <img class="meetup-logo" src="images/meetup-logo.svg" alt="Meetup Logo">
            <div class="container-fluid">
                <div class="carousel-caption text-right">
                    <h1>Join Us on Meetup</h1>
                    <h4>See who's already joined our group<br/>and invite your friends and colleagues,<br/>so no one
                        misses out!</h4>
                    <p><a class="btn btn-lg btn-meetup" href="https://www.meetup.com/GSO-JUG/" target="_meetup"
                          role="button">Go to Meetup</a></p>
                </div>
            </div>
        </div>

    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="modal fade" id="raffle" tabindex="-1" role="dialog" aria-labelledby="raffleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="raffleModalLabel">Enter Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="inputs">
                    <div class="form-group">
                        <label for="first-name"  class="col-form-label">First Name:</label>
                        <input type="text" id="first_name" class="form-control" id="first-name">
                    </div>
                    <div class="form-group">
                        <label for="last-name" class="col-form-label">Last Name:</label>
                        <input type="text" id="last_name" class="form-control" id="last-name">
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-form-label">Email:</label>
                        <input type="email" id="email" class="form-control" id="email">
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="enterRaffle" class="btn btn-primary">Enter</button>
            </div>
        </div>
    </div>
</div>