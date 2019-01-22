<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="GuardianAngel.IndexNew" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuardianAngel首頁</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/slippry.css">
    <link rel="stylesheet" href="assets/color/default.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/agency.min.css" rel="stylesheet">

    <script>
        function signOut() {
            alert("您已成功登出!");
        }
    </script>


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
              <a class="nav-link js-scroll-trigger" href="#services">功能介紹</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">連絡我們</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="hintindex.aspx">溫馨小語</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="GaCare.aspx">守護對象資料</a>
            </li>
            <li class="nav-item">
              <a id="Member" class="nav-link js-scroll-trigger" href="MemberArea.aspx">
                  <asp:Label ID="lblMember" runat="server" Text="會員資料"></asp:Label>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="Index.aspx" onclick="signOut()">
                  登出
                </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">歡迎使用Guardian Angel</div>
          <div class="intro-heading text-uppercase">Welcome to use Guardian Angel</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Tell me more</a>
        </div>
      </div>
    </header>

    <!-- Services -->
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">功 能 介 紹</h2>
            <h3 class="section-subheading text-muted">Function introduce</h3>
          </div>
        </div>
        <div class="row text-center">
            <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i> 
                    <i class="fas  fa-vector-square fa-stack-1x fa-inverse"></i>                                               
                </span>
                <h4 class="service-heading">劃定安全區域</h4>
                <p class="text-muted">您可以劃定被照顧者的安全區域，輸入的地址為中心，以及拉取您所需的矩形範圍，我們將為您偵測是否離開安全區。</p>
              </div>
            <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-map-marked-alt fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">GPS定位偵測通知</h4>
            <p class="text-muted">利用Google GPS服務，當被照護者離開區域，我們將發出手機、mail等訊息通知，以及當下的GPS定位給使用者，降低失智老人走失機率。</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-exclamation-triangle fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">跌倒偵測及回報</h4>
            <p class="text-muted">陀螺儀的G力測量，判斷被照顧者是否發生跌倒事件，並於事件發生時30秒後自動撥打電話及傳送訊息予緊急連絡人。</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <!--<i class='fas fa-capsules' style='font-size:48px;color:black'></i>-->
              <i class="fas fa-capsules fa-stack-1x fa-inverse" style="color:"></i>
            </span>
            <h4 class="service-heading">用藥提醒</h4>
            <p class="text-muted">用藥包的形式，打包在同一時段必須吃的藥品，於吃藥時間，我們將送出該藥包之所有藥品的照片及數量來提醒吃藥者。
            </p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-hand-holding-heart fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">貼心小語</h4>
            <p class="text-muted">不再讓年長者感到科技冷漠，用最簡單的操作讓長輩也能輕鬆看到家人的照片、感受來自家人關心的話語，讓空虛寂寞的心溫暖起來。</p>
          </div>
        </div>
      </div>
    </section>
    <!-- Contact -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">聯絡我們</h2>
            <h3 class="section-subheading text-muted">contact us</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input class="form-control" id="name" type="text" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number.">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 text-center">
                  <div id="success"></div>
                  <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
                </div>
              </div>
          </div>
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
