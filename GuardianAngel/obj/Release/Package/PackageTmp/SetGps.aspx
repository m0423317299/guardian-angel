<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetGps.aspx.cs" Inherits="GuardianAngel.SetGpsNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel Gps安全區域設定</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" /><!-- 網站描述 -->
    <meta name="author" content="" /><!-- 網站作者 -->
    <!--css連結-->
    <link rel="stylesheet" href="assets/css/fancybox/jquery.fancybox.css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/slippry.css"/>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/color/default.css"/>
    <!--css連結結束-->
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
        /*面板*/
        #panel {
            width: 200px;
            font-family: Arial, sans-serif;
            font-size: 13px;
            float: right;
            margin: 10px;
        }
         /*調色盤*/
        #color-palette {
            clear: both;
        }
         /*色鈕*/
        .color-button {
            width: 14px;
            height: 14px;
            font-size: 0;
            margin: 2px;
            float: left;
            cursor: pointer;
        }
         /*刪除鍵*/
        #delete-button {
            margin-top: 5px;
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
    <script src="assets/js/masonry.pkgd.min.js"></script>
    <script src="assets/js/imagesloaded.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/validate.js"></script>
    <script src="assets/js/AnimOnScroll.js"></script>

<!--google map 相關的javascript-->
    <script>
        var drawingManager;  //繪圖管理員
        var selectedShape;  // 選擇形狀
        var colors = ['#1E90FF', '#FF1493', '#32CD32', '#FF8C00', '#4B0082'];  //顏色  "藍色 粉紅色 綠色 橘色 紫色"
        var selectedColor;  //選擇顏色
        var colorButtons = {};  //顏色按鈕
        var rectangle;                                          //宣告一個矩形區域名為 rectangle
        var map;                                                //宣告map
        var infoWindow;                                        //宣告訊息視窗名為 infoWindow
        var 高雄85大樓 = { lat: 22.611639, lng: 120.300210 };   //設定座標(22.611271, 120.300455)為高雄85大樓  
        var CurrentPosition                                     //宣告當前位置
        var Marker                                              //標記

        //方法 清空選項
        function clearSelection() {
            if (selectedShape) {   //if(選擇形狀){
                if (selectedShape.type !== 'marker') {  //if(選擇形狀.類型 !== '標記')
                    selectedShape.setEditable(false);   //選擇形狀.可編輯設定(false);
                }                                         

                selectedShape = null;   //選擇形狀 =  null;
            }
        }

        //方法 設定選擇的形狀
        function setSelection(shape) { 
            if (shape.type !== 'marker') {
                clearSelection();
                shape.setEditable(true);
                selectColor(shape.get('fillColor') || shape.get('strokeColor'));
            }

            selectedShape = shape;
        }

        //方法 刪除選擇的形狀
        function deleteSelectedShape() {
            if (selectedShape) {
                selectedShape.setMap(null);
            }
        }

        //方法 選擇顏色
        function selectColor(color) {
            selectedColor = color;
            for (var i = 0; i < colors.length; ++i) {
                var currColor = colors[i];
                colorButtons[currColor].style.border = currColor == color ? '2px solid #789' : '2px solid #fff';
            }
            //從繪圖管理器中檢索當前選項，並根據需要替換筆觸或填充顏色。
           
            var rectangleOptions = drawingManager.get('rectangleOptions');
            rectangleOptions.fillColor = color;
            drawingManager.set('rectangleOptions', rectangleOptions);
        }

        //方法 設定選擇形狀的顏色
        function setSelectedShapeColor(color) {
            if (selectedShape) {
                if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
                    selectedShape.set('strokeColor', color);
                } else {
                    selectedShape.set('fillColor', color);
                }
            }
        }

        //方法 製作彩色按鈕
        function makeColorButton(color) {
            var button = document.createElement('span');
            button.className = 'color-button';
            button.style.backgroundColor = color;
            google.maps.event.addDomListener(button, 'click', function () {
                selectColor(color);
                setSelectedShapeColor(color);
            });
            return button;
        }

        //方法 建立調色盤
        function buildColorPalette() {
            var colorPalette = document.getElementById('color-palette');
            for (var i = 0; i < colors.length; ++i) {
                var currColor = colors[i];
                var colorButton = makeColorButton(currColor);
                colorPalette.appendChild(colorButton);
                colorButtons[currColor] = colorButton;
            }
            selectColor(colors[0]);
        }

        //  ★╔════地圖內放置的內容════╗★
        function initMap() {
            //  ╔════google地圖基本架構════╗
            map = new google.maps.Map(document.getElementById('map'), {
                center: 高雄85大樓 ,          //地圖中心(必須)，目前預設(22.611271,120.300455)為高雄85大樓。
                zoom: 17,                     //縮放級別(必須)，1為世界、5為陸地、10為城市、20為建築物。
                disableDefaultUI: false,  //左上角地圖與衛星檢視
                zoomControl: true  //右下角 +-
            });
            //  ╚════google地圖基本架構════╝
            var polyOptions = {
                strokeWeight: 0,
                strokeOpacity: 0.75,
                fillColor: '#00f',
                fillOpacity: 0.25,
                editable: true,
                draggable: true
            };
//創建附加到地圖的繪圖管理器，允許用戶繪製標記，線條和形狀。
            drawingManager = new google.maps.drawing.DrawingManager({
                drawingMode: google.maps.drawing.OverlayType.POLYGON,
                drawingControl: true,
                drawingControlOptions: {
            position: google.maps.ControlPosition.TOP_CENTER,
            drawingModes: ['rectangle']
          },
                markerOptions: {
                    draggable: true
                },
                polylineOptions: {
                    editable: true,
                    draggable: true
                },
                rectangleOptions: polyOptions,
                circleOptions: polyOptions,
                polygonOptions: polyOptions,
                map: map
            });

//繪製完成後切換回選擇模式
            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (e) {
                var newShape = e.overlay;

                newShape.type = e.type;

                if (e.type !== google.maps.drawing.OverlayType.MARKER) {
                    //繪製形狀後切換回非繪圖模式。
                    drawingManager.setDrawingMode(null);
                   //添加一個事件監聽器，當用戶按下它時，它會選擇新繪製的形狀。
                    google.maps.event.addListener(newShape, 'click', function (e) {
                        if (e.vertex !== undefined) {
                            if (newShape.type === google.maps.drawing.OverlayType.POLYGON) {
                                var path = newShape.getPaths().getAt(e.path);
                                path.removeAt(e.vertex);
                                if (path.length < 3) {
                                    newShape.setMap(null);
                                }
                            }
                            if (newShape.type === google.maps.drawing.OverlayType.POLYLINE) {
                                var path = newShape.getPath();
                                path.removeAt(e.vertex);
                                if (path.length < 2) {
                                    newShape.setMap(null);
                                } buildColorPalette
                            }
                        }
                        setSelection(newShape);
                    });
                    setSelection(newShape);
                }
                else {
                    google.maps.event.addListener(newShape, 'click', function (e) {
                        setSelection(newShape);
                    });
                    setSelection(newShape);
                }
            });
//更改繪圖模式或單擊地圖時清除當前選擇。
            google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelection);   //添加事件監聽器(繪圖管理員, 繪圖模式_更改, 清空選項)
            google.maps.event.addListener(map, 'click', clearSelection);  //添加事件監聽器(地圖, 點擊, 清空選項)
            google.maps.event.addDomListener(document.getElementById('delete-button'), 'click', deleteSelectedShape);
            //添加事件監聽器(方法, 得到元素id(delete-button), 點擊, 刪除所選形狀)
           buildColorPalette();  //建立調色盤
        }
        //  ★╚════地圖內放置的內容════╝★

        google.maps.event.addDomListener(window, 'load', initMap);
    </script>


    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtew4UfK3oV04WO5uExwq5aTvlkxhYi8Y&callback=initMap&libraries=drawing"
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
                                <li class="current"><a href="index.aspx">功能介紹</a></li>
                                <li><a href="hintindex.aspx">溫馨小語</a></li>
                                <li><a href="SetGPS.aspx">Gps設定</a></li>
                                <li><a href="GaCare.aspx">設定守護對象資料</a></li>
                                <li><a href="">會員資料</a></li>
                                <li><a href="sign_in.aspx">登出</a></li>
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
                                   <li><button id="delete-button" class="myButton01">刪除安全範圍</button></li>
                                    <li><label>選擇顏色</label></li>
                                </ul>
                            <div id="panel">
                                <div id="color-palette"></div>
                            </div>                              
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