$(window).scroll(function () {
    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
        $('.return-to-top').fadeIn(200);    // Fade in the arrow
    } else {
        $('.return-to-top').fadeOut(200);   // Else fade out the arrow
    }
});

$('.return-to-top').click(function () {    // When arrow is clicked
    $('body,html').animate({
        scrollTop: 0                         // Scroll to top of body
    }, 500);
});

$('#raffleForm').submit(function (event){
    var form = this;
    if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
    } else{

        $.ajax({
            type: 'POST',
            url: 'raffle',
            data: JSON.stringify({
                'first_name': $('#first_name').val(),
                'last_name': $('#last_name').val(),
                'email': $('#email_id').val().trim()
            }),
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {

                console.log("Registered Successfully");
                setInterval(window.location.reload(true), 5000);

            },
            error: function(data){
                console.log("Errored out");
            }
        });
    }
});

/*
$(".modal").on("hidden.bs.modal", function(){
    $('#first_name').val('');
    $('#last_name').val('');
    $('#email_id').val('');
});*/
