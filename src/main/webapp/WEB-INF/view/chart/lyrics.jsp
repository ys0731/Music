<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<%
	String path = request.getContextPath();
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lyrics</title>
    <link rel="stylesheet" href="<%=path %>/css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        var wid = $(window).outerWidth();
        var hei = $(window).outerHeight();

        $(document).ready(function () {
            $(window).resize(function () {
                wid = $(window).outerWidth();
                hei = $(window).outerHeight();
            });

            $("textarea").width(wid - 40).height(hei - 125);
        });
    </script>
    <style>
        body {
            padding: 10px;
            overflow: hidden;
        }

        h1 {
            font-size: 25px;
        }

        h2 {
            font-size: 15px;
            margin-top: 5px;
        }

        .wrapper_top,
        .wrapper_bottom {
            background-color: #ccc;
            padding: 10px;
            border-radius: 5px;
        }

        .wrapper_top>div {
            float: left;
            margin-left: 10px;
        }

        a {
            float: left;
            display: block;
            width: 50px;
        }

        a img {
            height: 50px;
        }

        .wrapper_bottom {
            resize: none;
            border: none;
            font-family: sans-serif;
            font-size: 15px;
            text-indent: 0px;
            letter-spacing: 0px;
            margin-top: 10px;
            border-radius: 0px;
        }

        .no_outline:focus {
            outline: none;
        }
    </style>
</head>

<body>
    <div class="wrapper_top clear">
        <a href="#"><img src="<%=path %>/upload/${vo.rel}" id="rel" alt="album1"></a>
        <div>
            <h1 id="title">${vo.title }</h1>
            <h2 id="artist">${vo.artist }</h2>
        </div>
    </div>
    <textarea class="wrapper_bottom no_outline" id="lyrics" readonly>
	${vo.lyrics }
    </textarea>
</body>

</html>