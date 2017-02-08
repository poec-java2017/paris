/**
 * Created by xylphid on 01/02/17.
 */
$(function() {
    $('footer .title > span').on('click', function() {
        $('.legal').slideToggle();
    })
});

/**
 * Modal pari
 */
// Fonction de calcul automatique du gain potentiel

$('.betButton').click(function(){
    // Intitulé du match
    var title = $(this).parent().find('.info > .display').text();
    $('.betModalTitle').text(title);

    // Cote du match
    var quotation = $(this).text();
    $('.betModalQuotation > span:last-child').text(quotation);

    // Choix du pari
    var betOn = $(this).attr('data-bet');
    $('.betModalBetOn > span:last-child').text(betOn);
})

$('#betInput').change(function(){
    var quotation = $('.betModalQuotation > span:last-child').text() * 1;
    var bet = $('#betInput').val();
    var sum = Number(quotation) * Number(bet);
    $('.betModalSum').text(sum);
})
