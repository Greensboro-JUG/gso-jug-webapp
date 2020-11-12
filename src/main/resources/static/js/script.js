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
            'email' : $('#email').val()
        }),
        dataType: 'json',
        contentType: 'application/json',
        success: function (data){
            $('#inputs').addClass('invisible');
            $('#enterRaffle').addClass('invisible');
            $('#ticketNo').text(data);
            $('#raffleModalLabel').text('Thank You!!');
            $('#confirmation').removeClass('invisible');
        }
    });
});