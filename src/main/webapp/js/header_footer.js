function rising() {
    $(".rising ul").animate({
        "top": "-20px"
    }, 1000, function () {
        $(".rising ul li").eq(0).appendTo(".rising ul");
        $(".rising ul").css({
            "top": "0px"
        });
    }).delay(3000);
}

$(document).ready(function () {
    // rising
    var rise_auto = setInterval(rising);

    // gnb
    $(".gnb > li").mouseenter(function () {
        $(".gnb_sub").stop().fadeIn(300);
    }).mouseleave(function () {
        $(".gnb_sub").stop().fadeOut(300);
    });
    $(".gnb_sub").mouseenter(function () {
        $(this).stop().fadeIn(300);
    }).mouseleave(function () {
        $(".gnb_sub").stop().fadeOut(300);
    });

    $("#gnb_li_last, #user_name").off("mouseenter");
    
    $("#gnb_li_last").click(function(){
        alert("로그인이 필요합니다.");
        window.location.href = 'login.html';
    });

    $("#gnb_li_last").mouseenter(function(){
        $(".mymusic_sub").stop().fadeIn(300);
    }).mouseleave(function () {
        $(".mymusic_sub").stop().fadeOut(300);
    });
});