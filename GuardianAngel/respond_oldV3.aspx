﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="respond_oldV3.aspx.cs" Inherits="GuardianAngel.respond_oldV3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel 異常事件回報</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" /><!-- 網站描述 -->
    <meta name="author" content="" /><!-- 網站作者 -->
<!--基礎css連結new-->
    <link rel="stylesheet" href="assets/css/fancybox/jquery.fancybox.css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/slippry.css"/>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/color/default.css"/>
<!--基礎css連結new結束-->
<!--css連結old-->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/icomoon-social.css"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/leaflet.css" />
    <link rel="stylesheet" href="assets/css/fancybox/jquery.fancybox.css"/>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/slippry.css"/>
    <link href="assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/color/default.css"/>
    <link rel="stylesheet" href="css/main.css"/>
<!--css連結old結束-->

    <style>

    
    .fontSet{
            font-family: 微軟正黑體;
            text-align: center;
            font-size: 60px;
            color: #FFFFFF;
            font-weight: bold;
            color: white;
            text-shadow: black 0.1em 0.1em 0.2em;
        }
    
    .auto-style2 {
            margin-top: 0%;
            text-align: center;
        }
    
    </style>


<!-- 基礎javascript new -->
    <script src="assets/js/modernizr.custom.js"></script>
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
<!-- 基礎javascript new 結束 -->
<!-- 基礎Javascript old -->
    <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
    <script src="js/jquery.fitvids.js"></script>
    <script src="js/jquery.sequence-min.js"></script>
    <script src="js/jquery.bxslider.js"></script>
    <script src="js/main-menu.js"></script>
    <script src="js/template.js"></script>
<!-- 基礎Javascript old 結束 -->
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
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
    <p class="text-center">
        <span class="fontSet"><b><strong>事件列表</strong></b></span></p>
    <form id="careForm" runat="server">
		<div class="auto-style2">
			&nbsp;<div class="coming-soon-subscribe container">
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
                        <div class="auto-style3">
                            


                        </div>
                    </div>
                </div>
			</div>
		</div>
        <!-- Navigation導覽列 & Logo標題 結束-->

        <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>

        <script>
        	$('.show-tooltip').tooltip();
        </script>       
        <br />
         <table class="nav-justified">        
        <tr>
            <td class="text-center">&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                AutoGenerateSelectButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
                BorderWidth="5px" CaptionAlign="Bottom" CellPadding="3" HorizontalAlign="Center" 
                ViewStateMode="Enabled" OnPageIndexChanging="GridView1_PageIndexChanging" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                    <EditRowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="Large" />
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />


                    <Columns>
                     <asp:BoundField DataField="O_name" HeaderText="姓名" SortExpression="O_name"/>                
                     </Columns>
                     <Columns>
                     <asp:BoundField DataField="A_date" HeaderText="日期" SortExpression="A_date" />
                     </Columns>
                     <Columns>
                      <asp:BoundField DataField="A_time" HeaderText="時間"      SortExpression="A_time" />
                     </Columns>
                     <Columns>
                       <asp:BoundField DataField="A_style" HeaderText="類型" SortExpression="A_style" />
                     </Columns>
                </asp:GridView>
                <br />
               
               
                <br />
                <br />
               
            </td>
        </tr>
        <tr>
            
        </tr>
        <tr>
            <td class="text-center">&nbsp;</td>
        </tr>
    </table>



    </form>

    <!--主頁END-->
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
