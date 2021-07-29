$(document).ready(function () {
    // visual
    $("#visual").mouseenter(function(){
        $(".swiper-button-next, .swiper-button-prev").fadeIn(300);
    }).mouseleave(function(){
        $(".swiper-button-next, .swiper-button-prev").fadeOut(300);
    });

    // charts
    $(".charts tr").mouseenter(function () {
        var btn_list = $(this).index();

        $(this).siblings().removeClass("on");
        $(this).addClass("on");
    });

    // charts preventDefault
    $(".play_music, .add_list").click(function(e){
        e.preventDefault();
    })

});