<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/header_footer.js"></script>
    <script src="js/main.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header_footer.css">
    <link rel="stylesheet" href="css/main.css">

</head>

<body>
    <%@ include file="/WEB-INF/view/include/top.jsp" %>
    <div id="container">
        <div class="center">
            <div id="visual">
                <div class="swiper-container mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album1.jpg" alt="album1"></a>
                                <a href="album_info.html"><img src="img/album2.jpg" alt="album2"></a>
                                <a href="album_info.html"><img src="img/album3.jpg" alt="album3"></a>
                                <a href="album_info.html"><img src="img/album4.jpg" alt="album4"></a>
                                <a href="album_info.html"><img src="img/album5.jpg" alt="album5"></a>
                            </div>
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album6.jpg" alt="album6"></a>
                                <a href="album_info.html"><img src="img/album7.jpg" alt="album7"></a>
                                <a href="album_info.html"><img src="img/album8.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album9.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album10.jpg" alt="album8"></a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album1.jpg" alt="album1"></a>
                                <a href="album_info.html"><img src="img/album2.jpg" alt="album2"></a>
                                <a href="album_info.html"><img src="img/album3.jpg" alt="album3"></a>
                                <a href="album_info.html"><img src="img/album4.jpg" alt="album4"></a>
                                <a href="album_info.html"><img src="img/album5.jpg" alt="album5"></a>
                            </div>
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album6.jpg" alt="album6"></a>
                                <a href="album_info.html"><img src="img/album7.jpg" alt="album7"></a>
                                <a href="album_info.html"><img src="img/album8.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album9.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album10.jpg" alt="album8"></a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album1.jpg" alt="album1"></a>
                                <a href="album_info.html"><img src="img/album2.jpg" alt="album2"></a>
                                <a href="album_info.html"><img src="img/album3.jpg" alt="album3"></a>
                                <a href="album_info.html"><img src="img/album4.jpg" alt="album4"></a>
                                <a href="album_info.html"><img src="img/album5.jpg" alt="album5"></a>
                            </div>
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album6.jpg" alt="album6"></a>
                                <a href="album_info.html"><img src="img/album7.jpg" alt="album7"></a>
                                <a href="album_info.html"><img src="img/album8.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album9.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album10.jpg" alt="album8"></a>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album1.jpg" alt="album1"></a>
                                <a href="album_info.html"><img src="img/album2.jpg" alt="album2"></a>
                                <a href="album_info.html"><img src="img/album3.jpg" alt="album3"></a>
                                <a href="album_info.html"><img src="img/album4.jpg" alt="album4"></a>
                                <a href="album_info.html"><img src="img/album5.jpg" alt="album5"></a>
                            </div>
                            <div class="clear">
                                <a href="album_info.html"><img src="img/album6.jpg" alt="album6"></a>
                                <a href="album_info.html"><img src="img/album7.jpg" alt="album7"></a>
                                <a href="album_info.html"><img src="img/album8.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album9.jpg" alt="album8"></a>
                                <a href="album_info.html"><img src="img/album10.jpg" alt="album8"></a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <div class="banner"></div>
            <div class="cont_1 clear">
                <div class="cont_1_left">
                    <h2>곡 차트</h2><a class="more" href="chart_chart_24hits.html">더 보기</a>
                    <table class="charts">
                        <tr class="on">
                            <td>1</td>
                            <td><a href="album_info.html"><img src="img/album1.jpg" alt="album1"></a><span>Bohemian Rhapsody</span></td>
                            <td><a href="artist_info.html">Queen</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="album_info.html"><img src="img/album2.jpg" alt="album2"></a><span>Just the Way You Are</span></td>
                            <td><a href="artist_info.html">Billy Joel</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="album_info.html"><img src="img/album3.jpg" alt="album3"></a><span>Killer Queen</span></td>
                            <td><a href="artist_info.html">Queen</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><a href="album_info.html"><img src="img/album4.jpg" alt="album4"></a><span>Yesterday Once More</span></td>
                            <td><a href="artist_info.html">Carpenters</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td><a href="album_info.html"><img src="img/album5.jpg" alt="album5"></a><span>Lemon Tree</span></td>
                            <td><a href="artist_info.html">Fools Garden</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td><a href="album_info.html"><img src="img/album6.jpg" alt="album6"></a><span>When I'm 64</span></td>
                            <td><a href="artist_info.html">Beatles</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td><a href="album_info.html"><img src="img/album7.jpg" alt="album7"></a><span>Uptown Girl</span></td>
                            <td><a href="artist_info.html">Billy Joel</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td><a href="album_info.html"><img src="img/album8.jpg" alt="album8"></a><span>I Love You Baby</span></td>
                            <td><a href="artist_info.html">Frank Sinatra</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td><a href="album_info.html"><img src="img/album9.jpg" alt="album9"></a><span>Country Road</span></td>
                            <td><a href="artist_info.html">John Denver</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td><a href="album_info.html"><img src="img/album10.jpg" alt="album10"></a><span>Keep Yourself Alive</span></td>
                            <td><a href="artist_info.html">Queen</a></td>
                            <td><a class="play_music button_icons" href="#"></a></td>
                            <td><a class="add_list button_icons" href="#"></a></td>
                        </tr>
                    </table>
                </div>
                <div class="cont_1_right">
                    <h2>오늘의 추천</h2><a class="more" href="recommend_list.html">더 보기</a>
                    <ul class="recom">
                        <li>
                            <a class="clear" href="recommend_info.html">
                                <img src="img/album1.jpg" alt="album1">
                                <div>
                                    <p>올 롸잇!</p>
                                    <p><span>1</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="clear" href="#">
                                <img src="img/album2.jpg" alt="album2">
                                <div>
                                    <p>니 안에 내 있다</p>
                                    <p><span>2</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="clear" href="#">
                                <img src="img/album3.jpg" alt="album3">
                                <div>
                                    <p>내 미래처럼 깜깜한 밤에</p>
                                    <p><span>3</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="clear" href="#">
                                <img src="img/album4.jpg" alt="album4">
                                <div>
                                    <p>끝없는 코딩에 지친 당신</p>
                                    <p><span>4</span><span>곡</span></p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="cont_2 clear">
                <div class="cont2_left">
                    <h2>최신 뮤직비디오</h2>
                    <ul class="rec_mv clear">
                        <li>
                            <iframe width="232.8" height="150" src="https://www.youtube.com/embed/quH6XxJTj-k"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        </li>
                        <li>
                            <iframe width="232.8" height="150" src="https://www.youtube.com/embed/a9k7MF_-HPQ"
                                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"\
                                allowfullscreen></iframe>
                        </li>
                        <li>
                            <iframe width="232.8" height="150" src="https://www.youtube.com/embed/Jp4-snWZuoI"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>
                        </li>
                    </ul>
                </div>
                <div class="cont2_right">
                    <h2>매거진</h2>
                    <div class="magazine">
                        <a href="https://www.rollingstone.com/music/">
                            <img src="img/magazine.jpg" alt="magazine">
                        </a>
                    </div>
                </div>
            </div>
            <div class="notice clear">
                <span>공지사항</span>
                <p>
                    <a href="notice_list.html">샌드뮤직 창립일 기념축사 이벤트</a>
                </p>
            </div>
        </div>
    </div>
   <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    <!-- https://stackoverflow.com/questions/4126708/is-it-possible-to-style-html5-audio-tag -->
    <!-- <div class="mp3_player">
        <div class="player_info clear">
            <img src="img/disk.png" alt="disk">
            <div>
                <span>Keep Yourself Alive</span>
                <span>Queen</span>
            </div>
        </div>
        <audio id="audio_player" controls controlsList="nodownload" autoplay loop> <!-- hidden -->
            <!-- <source id="audio_route" src="music/music.mp3" type="audio/mpeg">
        </audio>
        <div></div> -->
        <!-- <div> 
            <button onclick="document.getElementById('audio_player').play()">Play</button> 
            <button onclick="document.getElementById('audio_player').pause()">Pause</button> 
            <button onclick="document.getElementById('audio_player').volume += 0.1">Vol +</button> 
            <button onclick="document.getElementById('audio_player').volume -= 0.1">Vol -</button>
        </div> -->
    </div> -->
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
            loop: true,
            autoplay: {
                delay: 8000,
            }
        });
    </script>
</body>

</html>
