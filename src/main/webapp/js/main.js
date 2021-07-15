$(document).ready(function () {
    // visual
    $("#visual").mouseenter(function(){
        $(".swiper-button-next, .swiper-button-prev").fadeIn(300);
    }).mouseleave(function(){
        $(".swiper-button-next, .swiper-button-prev").fadeOut(300);
    });

    // $(".swiper-slide div a").mouseenter(function () {
    //     $(this).css({ "filter": "grayscale(0)" });
    //     $(this).siblings().css({ "filter": "grayscale(75%)" });
    //     $(this).parent().siblings().children().css({ "filter": "grayscale(75%)" });
    // });

    // $(".swiper-slide a").mouseleave(function () {
    //     $(this).css({ "filter": "grayscale(0)" });
    //     $(this).siblings().css({ "filter": "grayscale(0)" });
    //     $(this).parent().siblings().children().css({ "filter": "grayscale(0)" });
    // });

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

    //add list img toggle
    $(".add_list").click(function(){
        $(this).toggleClass("on");
    });
    
    //play music img toggle
    $(".play_music").click(function(){
        $(this).toggleClass("on");
    });
});