<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetGpsOld.aspx.cs" Inherits="GuardianAngel.SetGps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel Gps安全區域設定</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" /><!-- 網站描述 -->
    <meta name="author" content="" /><!-- 網站作者 -->
    <!-- 樣板styles -->
    <link rel="stylesheet" href="assets/css/fancybox/jquery.fancybox.css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/slippry.css"/>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/color/default.css"/>
<!--地圖相關-->
    <style>
        /* 始終顯式設置地圖高度以定義包含地圖的div元素的大小。 */
        #map {
            height: 600px;
            width: 800px;
        }
        /* 讓頁面填滿視窗. */
        html, body {
            height: 100%;
            margin: 0px;
            padding: 0px;
        }
        /*控制項*/
        .controls {
            background-color: #fff;
            border-radius: 2px;
            border: 1px solid transparent;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            box-sizing: border-box;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            height: 29px;
            margin-left: 17px;
            margin-top: 10px;
            outline: none;
            padding: 0 11px 0 13px;
            text-overflow: ellipsis;
            width: 400px;
        }
              .controls:focus {
                border-color: #4d90fe;
              }
        .title {
            font-weight: bold;
        }
        #infowindow-content {
            display: none;
        }
        #map #infowindow-content {
            display: inline;
        }
    </style>

<!--按鈕-->
    <style>
        .myButton01 {
            -moz-box-shadow: inset 0px 1px 0px 0px #7a8eb9;
            -webkit-box-shadow: inset 0px 1px 0px 0px #7a8eb9;
            box-shadow: inset 0px 1px 0px 0px #7a8eb9;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #637aad), color-stop(1, #5972a7));
            background: -moz-linear-gradient(top, #637aad 5%, #5972a7 100%);
            background: -webkit-linear-gradient(top, #637aad 5%, #5972a7 100%);
            background: -o-linear-gradient(top, #637aad 5%, #5972a7 100%);
            background: linear-gradient(to bottom, #637aad 5%, #5972a7 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#637aad',endColorstr='#5972a7',GradientType=0);
            background-color: #637aad;
            border: 1px solid #314179;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 13px;
            font-weight: bold;
            padding: 3.5px 13px;
            text-decoration: none;
        }
            .myButton01:hover {
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #5972a7), color-stop(1, #637aad));
                background: -moz-linear-gradient(top, #5972a7 5%, #637aad 100%);
                background: -webkit-linear-gradient(top, #5972a7 5%, #637aad 100%);
                background: -o-linear-gradient(top, #5972a7 5%, #637aad 100%);
                background: linear-gradient(to bottom, #5972a7 5%, #637aad 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#5972a7', endColorstr='#637aad',GradientType=0);
                background-color: #5972a7;
            }

            .myButton01:active {
                position: relative;
                top: 1px;
            }
    </style>
<!--字體-->
    <style>
    .myFont01 {
        font-family: Microsoft JhengHei;
        font-weight: bold;
    }
    </style>

    <script src="assets/js/modernizr.custom.js"></script>

    <!-- javascript -->
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/jquery.easing.js"></script>
    <script src="assets/js/classie.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/slippry.min.js"></script>
    <script src="assets/js/nagging-menu.js"></script>
    <script src="assets/js/jquery.nav.js"></script>
    <script src="assets/js/jquery.scrollTo.js"></script>
    <script src="assets/js/jquery.fancybox.pack.js"></script>
    <script src="assets/js/jquery.fancybox-media.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
    <script src="assets/js/masonry.pkgd.min.js"></script>
    <script src="assets/js/imagesloaded.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/validate.js"></script>
    <script src="assets/js/AnimOnScroll.js"></script>

<!--google map 相關的javascript-->
    <script>

        var rectangle;                                          //宣告一個矩形區域名為 rectangle
        var map;                                                //宣告map
        var infoWindow;                                        //宣告訊息視窗名為 infoWindow
        var 高雄85大樓 = { lat: 22.611639, lng: 120.300210 };   //設定座標(22.611271, 120.300455)為高雄85大樓  
        var CurrentPosition                                     //宣告當前位置
        var Marker                                              //標記


        //  ★╔════地圖內放置的內容════╗★
        function initMap() {
            //  ╔════google地圖基本架構════╗
            map = new google.maps.Map(document.getElementById('map'), {
                center: 高雄85大樓 ,          //地圖中心(必須)，目前預設(22.611271,120.300455)為高雄85大樓。
                zoom: 17,                     //縮放級別(必須)，1為世界、5為陸地、10為城市、20為建築物。
            });
            //  ╚════google地圖基本架構════╝
            //  ╔════標示使用者目前的地理位置════╗
            if (navigator.geolocation) {
                //獲取當前位置，該位置為(position)
                navigator.geolocation.getCurrentPosition(function(position) {
                //宣告經緯度
                    CurrentPosition = {
                        lat: position.coords.latitude,           //lat：地理位置_座標_緯度
                        lng: position.coords.longitude           //lat：地理位置_座標_經度
                     };
                //設定訊息視窗位置
                    infoWindow.setPosition(CurrentPosition);      //訊息視窗「infoWindow」的位置，位置座標放在(  )內。
                //設定訊息視窗內容
                    infoWindow.setContent('您目前的位置在此');     //訊息視窗「infoWindow」的內容，內容放在(  )內。
                //設定訊息視窗放置的地圖
                    infoWindow.open(map);                        //將訊息視窗「infoWindow」放在(map)內。
                //設定地圖中心的座標
                    map.setCenter(CurrentPosition);              //設定地圖中心，中心位置為(    )內的座標。
                },
                 function () {
                        handleLocationError(true, infoWindow, map.getCenter());
                 });
            }
            else {
                 // 瀏覽器不支援geolocation定位時
                 handleLocationError(false, infoWindow, map.getCenter());
            }
            //  方法 handleLocationError  定位發生錯誤
            function handleLocationError(browserHasGeolocation, infoWindow, CurrentPosition) {
                infoWindow.setPosition(CurrentPosition);
                infoWindow.setContent(browserHasGeolocation ?
                              '發生錯誤：衛星定位服務失敗。' :
                              '發生錯誤：您的瀏覽器不支援衛星定位服務。');
                infoWindow.open(map);
            }
            //  ╚════標示使用者目前的地理位置════╝
            //  ╔════標記════╗
            Marker = new google.maps.Marker({
                position: 高雄85大樓,  //中心點
                map: map,             //放到地圖上
                title:'高雄85大樓',    //內容
            });
            //  ╚════標記════╝
            //  ╔════單擊滑鼠左鍵新增標記════╗
            map.addListener('click', function(e) {
                placeMarkerAndPanTo(e.latLng, map);
            });

                function placeMarkerAndPanTo(latLng, map) {
                    Marker = new google.maps.Marker({
                            position: latLng,
                            map: map
                    });
                    map.panTo(latLng);
                }
            //  ╚════雙擊滑鼠左鍵新增標記════╝
            //  ╔════安全區域範圍════╗
             var bounds = {
                    north: 22.611726,  //北邊絕對位置。 
                    south: 22.610226,  //南邊絕對位置。
                    east: 120.301405,  //東邊絕對位置。
                    west: 120.299505   //西邊絕對位置。
             };
            //  ╚════安全區域範圍════╝
            //  ╔════矩形安全區域的屬性════╗
            rectangle = new google.maps.Rectangle({
                    editable: true,              //編輯該區域大小，預設值為false，如設為true就可以更改該區域的大小。
                    bounds: bounds,              //設定範圍
                    draggable: true,             //是否可拖曳該區域，預設值為false，設為true則可拖曳該區域。
                    map: map,                    /*將矩形放置地圖上，也可使用「rectangle.setMap(map);」的寫法，
                                                   放在「rectangle = new google.maps.Rectangle({    });」之外*/
                    fillColor: '#00f',           //該區域內填滿的顏色。
                    fillOpacity: 0.25,           //區域內顏色的透明度，數值為0.0~1.0之間，越接近0越透明。
                    strokeOpacity: 0.75,         //區域外框線的透明度，數值為0.0~1.0之間，越接近0越透明。
            });
            //  ╚════矩形安全區域的屬性════╝
            // ╔════在矩形安全區域上增加事件監聽器════╗
            rectangle.addListener(
                'bounds_changed', showNewRect       //bounds_changed，區域大小改變時。
            ); 
            // ╚════在矩形安全區域上增加事件監聽器════╝
            //  ╔════在地圖上增加訊息視窗。════╗
            infoWindow = new google.maps.InfoWindow();
            //  ╚════在地圖上增加訊息視窗。════╝
        }
        //  ★╚════地圖內放置的內容════╝★
        // ★╔════在訊息視窗中顯示新的座標════╗★
        function showNewRect(event) {
            var ne = rectangle.getBounds().getNorthEast();      //宣告取得的座標    矩形.得到座標().得到東北頂點座標
            var sw = rectangle.getBounds().getSouthWest();      //宣告取得的座標    矩形.得到座標().得到西南頂點座標
            var Message = '<b>安全區域目前位置為：</b><br>' +
                                               '東北頂點座標為: ' + ne.lat() + ', ' + ne.lng() + '<br>' +
                                               '西北頂點座標為: ' + sw.lat() + ', ' + sw.lng();  //宣告訊息視窗內的內容
            // 設置信息窗口的內容和位置。
            infoWindow.setContent(Message);  //設定訊息視窗內的內容
            infoWindow.setPosition(ne);      //設定訊息視窗顯示的位置
            infoWindow.open(map);            //將訊息視窗放放到map上
        }
        // ★╚════在訊息視窗中顯示新的座標════╝★
    </script>
    <script>
      // ★╔════搜尋地點════╗★

      // ★╚════搜尋地點════╝★
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtew4UfK3oV04WO5uExwq5aTvlkxhYi8Y&callback=initMap" 
        async defer>
    </script>
    <!--加載Maps JavaScript API-->
    <!--金鑰為AIzaSyCtew4UfK3oV04WO5uExwq5aTvlkxhYi8Y-->
    <!--google map 相關的javascript 結束-->

</head>
<body style="background-image:url(/assets/img/background/careTransparent.jpg); background-size: cover;">
    <!-- 導覽列開始 start Navbar -->
    <header>
        <div id="navigation" class="navbar navbar-inverse navbar-fixed-top default" role="navigation">
            <div class="container">
                <!--未知功能  Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!--商標LOGO-->
                    <a class="navbar-brand" href="index.html">Guardian Angel</a>
                </div>
                <!--選單-->
                <div class="navigation">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <nav>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="current"><a href="Features.html">功能介紹</a></li>
                                <li><a href="Respond.aspx">異常回報</a></li>
                                <li><a href="SetGPS.aspx">Gps設定</a></li>
                                <li><a href="Remind.aspx">用藥提醒</a></li>
                                <li><a href="MemberProfile.html">設定守護對象資料</a></li>
                                <li><a href="UserProfile.html">會員資料</a></li>
                                <li><a href="#">登出</a></li>
                            </ul>
                        </nav>
                    </div><!-- /.navbar-collapse -->
                </div>
            </div>
        </div>
    </header>
    <!-- 導覽列結束 end Navbar -->
    <!-- GPS系統 開頭-->
    <section id="contact" class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="heading">
                        <h3 class="myfont01"><span>GPS安全區域劃分系統</span></h3>
                    </div>
                </div>
            </div>
        </div>
            <!--google地圖功能列表-->
        <div class="section">
            <div class="container">
                <div class="row">
                    <!--功能列表 start-->
                    <div class="col-md-3 blog-sidebar right_nav">
                        <h4 class="myFont01">搜尋Google地圖</h4>
                        <form>
                            <div class="input-group">
                                <input class="form-control input-md" id="" type="text"/>
                                <span class="input-group-btn">
                                    <button class="myButton01" type="button" id="btn-search">Search</button>
                                </span>
                            </div>
                        </form>
                        <h4 class="myFont01">安全區域設定</h4>
                        <ul class="recent-posts">
                            <li>
                                <label>選擇使用者&nbsp&nbsp&nbsp&nbsp</label>
                                <select>
                                    <option value="Marco">Marco</option>
                                    <option value="Selina">Selina</option>
                                    <option value="June">June</option>
                                    <option value="Hebe">Hebe</option>
                                </select>
                            </li>
                            <li><input type="button" class="myButton01" onclick="initMap()" value="新增新安全區域" id="btn-SaveAdd"/></li>
                            <li>
                                <label>選擇安全區域&nbsp&nbsp&nbsp&nbsp</label>
                                <select>
                                    <option value="Marco">第一區</option>
                                    <option value="Selina">第二區</option>
                                    <option value="June">第三區</option>
                                    <option value="Hebe">第四區</option>
                                </select>
                            </li>
                            <li><input type="button" class="myButton01" onclick="initMap()" value="刪除此安全區域" id="btn-SaveDel"/></li>
                        </ul>

                        <h4 class="myFont01">GPS及時追蹤</h4>
                        <ul>
                            <li>
                                <label>選擇使用者&nbsp&nbsp&nbsp</label>
                                <select>
                                    <option value="Marco">Marco</option>
                                    <option value="Selina">Selina</option>
                                    <option value="June">June</option>
                                    <option value="Hebe">Hebe</option>
                                </select>
                            </li>
                        </ul>

                        <h4 class="myFont01">歷史軌跡查詢</h4>
                        <ul class="blog-categories">
                            <li>
                                <label>選擇使用者&nbsp&nbsp&nbsp</label>
                                <select>
                                    <option value="Marco">Marco</option>
                                    <option value="Selina">Selina</option>
                                    <option value="June">June</option>
                                    <option value="Hebe">Hebe</option>
                                </select>
                            </li>
                            <li><label>選擇日期&nbsp</label><input type="date" /></li>
                            <li><input type="button" class="myButton01" onclick="initMap()" value="顯示活動軌跡" id="btn-Act"/></li>
                        </ul>
                    </div>
                    <!--功能列表 end-->
                    <!--google地圖 開始-->
                    <div id="map" style="float:right;border-color:#0000FF; border-style:solid;"></div>
                    <!--google地圖 結束-->
                </div>
            </div>
        </div>
    </section>
        <!-- GPS系統 結尾 -->
    <!-- 頁尾 -->
    <footer>
        <div class="verybottom">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aligncenter">
                            <ul class="social-network social-circle">
                                <li><a href="#" class="icoRss" title="Rss"><i class="fa fa-rss"></i></a></li>
                                <!--連結到RSS-->
                                <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <!--連結到Facebook-->
                                <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <!--連結到twitter-->
                                <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                                <!--連結到Google-->
                                <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                <!--連結到linkedin-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="aligncenter">
                            <p>
                                &copy;2015 Groovin - All right reserved | Designed by <a href="http://bootstraptaste.com">BootstrapTaste</a>.
                            </p>
                            <!--
                                在頁尾所有連結必須保持不變。
                                有關許可訊息，需要訪問: http://bootstraptaste.com/license/
                                您可以在此購買主題: http://bootstraptaste.com/buy/?theme=Groovin
                            -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- 頁尾 結尾-->
    <a href="#" class="scrollup"><i class="fa fa-angle-up fa-2x"></i></a>
</body>
</html>
