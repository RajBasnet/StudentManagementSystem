
<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Student Management</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
    <a href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.css.map"></a>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <a href="${pageContext.request.contextPath}/assets/css/bootstrap.css.map"></a>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <a href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css.map"></a>
    <a href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css.map"></a>
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>

    <a href="${pageContext.request.contextPath}/assets/fonts/glyphicons-halflings-regular.eot"></a>
    <a href="${pageContext.request.contextPath}/assets/fonts/glyphicons-halflings-regular.svg"></a>
    <a href="${pageContext.request.contextPath}/assets/fonts/glyphicons-halflings-regular.ttf"></a>
    <a href="${pageContext.request.contextPath}/assets/fonts/glyphicons-halflings-regular.woff"></a>
    <a href="${pageContext.request.contextPath}/assets/fonts/glyphicons-halflings-regular.woff2"></a>

    <script src="../assets/js/npm.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap.js" type="text/javascript"></script>
    <script>


        (function (document) {
            'use strict';

            var LightTableFilter = (function (Arr) {

                var _input;

                function _onInputEvent(e) {
                    _input = e.target;
                    var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                    Arr.forEach.call(tables, function (table) {
                        Arr.forEach.call(table.tBodies, function (tbody) {
                            Arr.forEach.call(tbody.rows, _filter);
                        });
                    });
                }

                function _filter(row) {
                    var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                    row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                }

                return {
                    init: function () {
                        var inputs = document.getElementsByClassName('light-table-filter');
                        Arr.forEach.call(inputs, function (input) {
                            input.oninput = _onInputEvent;
                        });
                    }
                };
            })(Array.prototype);

            document.addEventListener('readystatechange', function () {
                if (document.readyState === 'complete') {
                    LightTableFilter.init();
                }
            });

        })(document);
    </script>

    <script>
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("slide");
            if (n > x.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = x.length
            }
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[slideIndex - 1].style.display = "block";
        }
    </script>



    <style>
        select{width: 100%;
               padding: 10px 10px;
               border:solid;
               border-width: 1px;
               border-color:black;

        }

        #input1[type=text] {
            background-image: url('../search.png');
            background-position: 10px 10px; 
            background-repeat: no-repeat;
            width: 130px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;

            padding: 12px 20px 12px 40px;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
        }

        #input1[type=text]:focus {
            width: 100%;
            background-color: lightgoldenrodyellow;
        }



        input[type=text] {
            width: 100%;
            padding: 10px 10px;

            border:solid;
            border-width: 1px;
            box-sizing: border-box;
        }

        #input2{
            width: 100%;
            padding: 10px 10px;

            border:solid;
            border-width: 1px;
            box-sizing: border-box;
        }

        #a1{
            background-color: #4CAF50;
            border: solid;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            transition: all 0.5s;

        }

        #a1 span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        #a1 span:after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }

        #a1:hover span {
            padding-right: 25px;
        }

        #a1:hover span:after {
            opacity: 1;
            right: 0;
        }

        #h1a{
            width: 250px;
            position: relative;
            left:450px;

            background-color:#38B243;
        }

        #h1b{
            width: 50%;
            position: relative;
            left: 250px;


            height:50px;
            background-color: turquoise;
        }

        th{

            color: white;
            background-color: #4CAF50
        }


    </style>



</head>


<body> <!id="image" style="background: url(https://www.clipartsgram.com/image/1648601212-bg.jpg) no-repeat; width: 100%; height: 150px; background-size: 100%;">


<div class="container">

