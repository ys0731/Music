<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>music player</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/player.css">
</head>

<body>
    <div class="main">
        <!-- show_song_number -->
        <div class="show_song_no">
            <p id="present">1</p>
            <p>/</p>
            <p id="total">1</p>
        </div>

        <!--- left part --->
        <div class="left">

            <!--- song img --->
            <img id="track_image">
            <div class="volume">
                <p id="volume_show">50</p>
                <i class="fa fa-volume-up" aria-hidden="true" onclick="mute_sound()" id="volume_icon"></i>
                <input type="range" min="0" max="100" value="50" onchange="volume_change()" id="volume">
            </div>
        </div>

        <!--- right part --->
        <div class="right">
            <!--- song title & artist name --->
            <div class="song_detail">
                <p id="title">title.mp3</p>
                <p id="artist">Artist name</p>
            </div>

            <!--- middle part --->
            <div class="middle">
                <button onclick="previous_song()" id="pre"><i class="fa fa-step-backward"
                        aria-hidden="true"></i></button>
                <button onclick="justplay()" id="play"><i class="fa fa-play" aria-hidden="true"></i></button>
                <button onclick="next_song()" id="next"><i class="fa fa-step-forward" aria-hidden="true"></i></button>
            </div>

            <!--- song duration part --->
            <div class="duration">
                <input type="range" min="0" max="100" value="0" id="duration_slider" onchange="change_duration()">
                <button id="auto" onclick="autoplay_switch()">Auto &nbsp;<i class="fa fa-circle-o-notch"
                        aria-hidden="true"></i></button>
            </div>
        </div>
    </div>

    <!--- Add javascript file --->
    <script>
	  //All songs list
	  let All_song = [
	      {
	          name: "${playlist.title}",
	          path: "<%=request.getContextPath()%>/upload/${playlist.src_real}",
	          img: "<%=request.getContextPath()%>/upload/${playlist.album_img}",
	          singer: "${playlist.artist_name}"
	      },
	  ];
    </script>
    <script src="<%=request.getContextPath()%>/js/player.js"></script>
</body>

</html>