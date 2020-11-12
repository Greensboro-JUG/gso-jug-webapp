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

$('#enterRaffle').click(function (){
    $.ajax({
        type: 'POST',
        url: 'raffle',
        data: JSON.stringify({
            'first_name' : $('#first_name').val(),
            'last_name' : $('#last_name').val(),
            'email' : $('#email').val().trim()
        }),
        dataType: 'json',
        contentType: 'application/json',
        success: function (data){
            $('#raffle').modal('toggle');
            $('#first_name').val('');
            $('#last_name').val('');
            $('#email').val('');
        }
    });
});

$(".modal").on("hidden.bs.modal", function(){
    $('#first_name').val('');
    $('#last_name').val('');
    $('#email').val('');
});