<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GpsOld.aspx.cs" Inherits="GuardianAngel.GPS" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuardianAngel會員資料</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/agency.min.css" rel="stylesheet">

    <link href="css/r7style.css" rel="stylesheet" type="text/css" />

    <!--GOOGLE地圖相關的css-->
    <link href="css/r7Map.css" rel="stylesheet" type="text/css" />

    <!--GOOGLE地圖相關的javascript-->
    <script src="js/r7Map.js"></script>
    <script async defer 
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtew4UfK3oV04WO5uExwq5aTvlkxhYi8Y&callback=initMap&libraries=places">
    </script>
    
    <style type="text/css">
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: x-large;
        }
        .auto-style3 {
            font-family: 微軟正黑體;
            font-size: medium;
            font-weight: bold;
        }
    </style>

</head>

<body id="page-top">

    <form id="form1" runat="server">

    <!-- Navigation導覽列 -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Guardian Angel</a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="Homepage.aspx">首頁</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="hintindex.aspx">溫馨小語</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="GaCare.aspx">守護對象資料</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" style="color:#FFCC22" href="#page-top">會員資料</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index.aspx">登出</a> 
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div style="height:185px;"></div>
      </div>
    </header>

    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">GPS 定 位 設 定</h2>
            <h3 class="section-subheading text-muted">GPS Positioning Setting</h3>
          </div>
        </div>
          <div style="float:left; margin-right:10px;">
              <table class="w-100">
                  <tr>
                      <td class="text-left">
                          <strong>
                          <asp:Label ID="Label1" runat="server" Text="保護對象名稱：" CssClass="auto-style2"></asp:Label>
                          <asp:Label ID="Label2" runat="server" Text="姓氏" CssClass="auto-style2"></asp:Label>
                          <asp:Label ID="Label3" runat="server" Text="名字" CssClass="auto-style2"></asp:Label>
                          </strong>
                      </td>
                  </tr>
                  <tr>
                      <td class="text-left">
                          <strong>
                          <asp:Label ID="Label4" runat="server" Text="搜尋地點：" CssClass="auto-style2"></asp:Label>
                          <input id="pac-input" placeholder="輸入地點" type="text" />
                          <asp:Button ID="Button1" runat="server" CssClass="auto-style3" Text="搜尋" />
                          </strong>
                      </td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                  </tr>
              </table>
          </div>
          <div id="map" class="r7MapStyle1"></div>
          <!--提示窗內容-->
          <div id="infowindow-content">
            <img src="" width="16" height="16" id="place-icon">
            <span id="place-name" class="title"></span><br>
            <span id="place-address"></span>
          </div>
      </div>
    </section>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; 2018 Guardian Angel</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="service list-inline-item ">
                 服務電話 : 07-351-2345 (10:00AM-18:00PM)
              </li>               
            </ul>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

    </form>

  </body>

</html>
