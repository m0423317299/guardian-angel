﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GaCare.aspx.cs" Inherits="WebPro.web.mPurpose_master.GaCare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>    
<title>Guardian Angel 守護對象資料</title> <!--分頁標題-->
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>
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
<!--額外css-->
    <style>
/*css按鈕*/
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

/*css字體*/
    .myFont01 {
        font-family: Microsoft JhengHei;
        font-weight: bold;
    }
/*老人資料css*/
  .careFont {
      font-family: 微軟正黑體;
      text-align: center;
      line-height:100px;
        }
        .fontSet{
            font-family: 微軟正黑體;
            text-align: center;
            font-size: 350%;
            color: #888888;
            font-weight: bold;
            color: white;
            text-shadow: black 0.1em 0.1em 0.2em;
        }   
        .auto-style2 {
            margin-top: 0%;
            text-align: center;
        }
         
        
       
        .auto-style3 {
            position: relative;
            display: table;
            border-collapse: separate;
            left: 0px;
            top: 0px;
        }
         
        
       
        .auto-style4 {
            font-size: x-large;
        }
         
        
       
        .rwd{
             overflow-x: auto;
        }
        
        
        .auto-style5 {
            font-family: 微軟正黑體;
            text-align: center;
            font-size: 350%;
            color: #888888;
            font-weight: bold;
            color: #FFFFCC;
            text-shadow: black 0.1em 0.1em 0.2em;
        }
        
        
    </style>
<!--額外css結束-->

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


<body style="background-image:url(/assets/img/background/careTransparent.jpg); background-size: cover; background-repeat: no-repeat; ">
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
    <div class="rwd">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
        <p class="auto-style5" ><strong>守護對象資料</strong></p>
    <form id="careForm" runat="server">
		<div class="auto-style2">
			&nbsp;<div class="coming-soon-subscribe container">
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3">
                        <div class="auto-style3">
                            <asp:TextBox ID="tbxSearch" runat="server" class="form-control input-lg" Text="輸入關鍵字查詢守護對象"
                                OnFocus="javascript:if(this.value=='輸入關鍵字查詢守護對象') {this.value=''}"
                                OnBlur="javascript:if(this.value==''){this.value='輸入關鍵字查詢守護對象'}"></asp:TextBox>
                            <%-- <input type="text" class="form-control input-lg" placeholder="輸入關鍵字查詢守護對象"/>--%>
                            <span class="input-group-btn">
                                <asp:Button ID="btnSearch" runat="server" class="btn btn-lg" Text="查詢" OnClick="btnSearch_Click" />                          
                            </span>
                        </div>
                    </div>
                </div>
			</div>
		</div>

    <!--主頁內容-->
              <!-- Javascripts -->
              <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>

        <script>
        	$('.show-tooltip').tooltip();
        </script>       
        
         <table class="nav-justified">        
        <tr  style="background: rgba(90%,90%,90%,0.5);">
            <td class="text-center">&nbsp;
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CaptionAlign="Bottom" HorizontalAlign="Center" 
                  Width="85%" Height =" 85%" ViewStateMode="Enabled" OnPageIndexChanging="GridView1_PageIndexChanging" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Names="微軟正黑體" Font-Size="150%"
                    > 
                   <Columns>
                         <asp:CommandField HeaderText="修改" SelectText="修改" ShowCancelButton="False" ShowSelectButton="True" />
                         <asp:TemplateField HeaderText="刪除">
                             <EditItemTemplate>
                                 <asp:CheckBox ID="CheckBox1" runat="server" />
                             </EditItemTemplate>
                            <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle HorizontalAlign="Center" />
                    <EmptyDataRowStyle Font-Size="100%" />
                    <HeaderStyle Font-Bold="True" Font-Overline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <PagerSettings FirstPageText="第一頁" LastPageText="最終頁" NextPageText="下一頁" PreviousPageText="上一頁" />
                   </asp:GridView>
                <br />
                <asp:Button ID="btnAdd" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#CCFFFF" Height="30px" OnClick="btnAdd_Click" Text="新增" Width="80px" PostBackUrl="GaCare_Add.aspx" />
                <span class="auto-style31">　<asp:Button ID="btnUpdate" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#CCFFFF" Height="30px" OnClick="btnUpdate_Click" Text="修改" Width="80px" Visible="False" />
                　<asp:Button ID="btnDelete" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#CCFFFF" Height="30px" OnClick="btnDelete_Click" Text="刪除" Width="80px" />
                </span>
                <br />
                <br />
                <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False" CssClass="auto-style4" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="text-center">&nbsp;</td>
        </tr>
        <tr>
            <td class="text-center">&nbsp;</td>
        </tr>
    </table>



    </form>
    </div>

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
