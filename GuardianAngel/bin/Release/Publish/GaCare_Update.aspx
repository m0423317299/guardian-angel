<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GaCare_Update.aspx.cs" Inherits="WebPro.web.mPurpose_master.GaCare_Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel 守護對象資料</title>
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
            font-size: 50px;
            color: #EEEEEE;
            font-weight: bold;
            text-shadow: black 0.1em 0.1em 0.2em;            
        }
        .tableFont{
            width:80%;
            border:0px solid #FFFFFF;
            padding:3px;
            margin:0 auto;            
            border:3px solid #FFFFFF;
        }
        /*上半項目欄位*/
       .tableTitleFont{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:200%;
            font-weight:bold;
            align-content:center; 
            height:300%; 
            text-align:center;
            letter-spacing: 1px;       
            background: rgba(90%,90%,90%,0.7);
            border:3px solid #FFFFFF;
            padding:1px;
        }
       /*上半值欄位*/
        .tableCFont{
            font-family:微軟正黑體; 
            color:#003377;
            font-size:200%;
            font-weight:bold;
            align-content:center; 
            height:300%; 
            text-align:center;
            letter-spacing: 1px;       
            background: rgba(90%,90%,90%,0.7);
            border:3px solid #FFFFFF;            
            padding:10px;
        }
         /*下半寛項目欄位*/
        .tableQTitleFont{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:200%;
            font-weight:bold;
            align-content:center; 
            height:500%; 
            text-align:center;
            letter-spacing: 1px;  
            background: rgba(90%,90%,90%,0.7);
            border:3px solid #FFFFFF;
            padding:10px;
        }
        /*下半寛值欄位*/
         .tableQCFont{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:200%;
            font-weight:bold;
            align-content:center; 
            height:500%; 
            text-align:center;
            letter-spacing: 1px;
            background: rgba(90%,90%,90%,0.7);
            border:3px solid #FFFFFF; 
            padding:20px;
        }
           .tableQCFont2{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:150%;
            font-weight:bold;
            align-content:center; 
            height:80px; 
            text-align:center;
            background: rgba(90%,90%,90%,0.7);
            border:0px solid #FFFFFF; 
        }
           /*按鈕列*/
           .tableQCFont3{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:150%;
            font-weight:bold;
            align-content:center; 
            height:80px; 
            text-align:center;
            background: rgba(90%,90%,90%,0.7);
            border:0px 0px 3px 0px solid #FFFFFF; 
            
        }
          .tableHead{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:150%;
            font-weight:bold;
            align-content:center; 
            height:200px; 
            padding:5px;
            text-align:center;
            letter-spacing: 1px; 
            border:0px solid #FFFFFF;     
            background:none;
        }

          .tableFoot{
            font-family:微軟正黑體; 
            color: #003377;
            font-size:150%;
            font-weight:bold;
            align-content:center; 
            height:100px; 
            text-align:center;
            letter-spacing: 1px; 
            border:0px solid #FFFFFF;     
            background:none;
        }
         .btnFont{            
            font-family:微軟正黑體; 
            color: #FFFFFF;
            font-size:150%;
            font-weight:bold;
            align-content:center; 
            text-align:center;
            background-color:#666666;
        
         }
         /*連結鈕*/
         .btnstyle{            
          /*background-color:#666666;
            font-family:微軟正黑體; 
            color: #FFFFFF;
            font-size:150%;
            font-weight:bold;
            align-content:center; 
            text-align:center;
         */
            background-image: url(/img/1.png);
            
        }

        .auto-style3_1 {
            font-family: 微軟正黑體;
            color: #003377;
            font-size: 150%;
            font-weight: bold;
            align-content: center;
            height: 128px;
            text-align: center;
            letter-spacing: 1px;
            padding: 5px;
            border: 0px solid #FFFFFF;
        }
        .rwd{
             overflow-x: auto;
        }
        .tableMsg{
            font-family:微軟正黑體; 
            color: red;
            font-size:100%;
            font-weight:bold;
            align-content:center; 
            text-align:center;
            letter-spacing: 1px;       
            background: rgba(90%,90%,90%,0.7);
            border:0px solid #FFFFFF;
            padding: 3px;
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
<body  style="background-image:url(/assets/img/background/careTransparent.jpg); background-size: cover;">
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
     <form id="careForm" runat="server" class="rwd">
	
    <!--主頁內容-->
       <!-- Javascripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
		<script src="js/bootstrap.min.js"></script>

        <script>
        	$('.show-tooltip').tooltip();
        </script>       
        
        
                <table class="tableFont">
                    <tr>
                       <td colspan="3" class="tableHead"><p class="fontSet">
                            守護對象<br /><br /><br />＜<asp:Label ID="lblOld" runat="server" Text="個人"></asp:Label>＞</p></td>
                    </tr>

                    <tr>
                        <td class="tableTitleFont">編號</td>
                        <td class="tableCFont" colspan="2">
                            <asp:TextBox ID="tbxId" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>                    
                    <tr>
                        <td class="tableTitleFont">姓名</td>
                        <td class="tableCFont" colspan="2">
                            <asp:TextBox ID="tbxName" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">生日</td>
                        <td class="tableCFont" colspan="2">
                            <asp:TextBox ID="tbxBirth" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">電話</td>
                        <td class="tableCFont" colspan="2">
                            <asp:TextBox ID="tbxPhone" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">血型</td>
                        <td class="tableCFont" colspan="2">
                            <asp:DropDownList ID="DdBlood" runat="server" Width="90%">
                                <asp:ListItem Value="A">A型</asp:ListItem>
                                <asp:ListItem Value="B">B型</asp:ListItem>
                                <asp:ListItem Value="O">O型</asp:ListItem>
                                <asp:ListItem Value="AB">AB型</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="tableTitleFont">疾病</td>
                        <td class="tableCFont" colspan="2">
                            <asp:TextBox ID="tbxDisease" runat="server" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tableQTitleFont">地址</td>
                        <td class="tableQCFont" colspan="2">
                            <asp:TextBox ID="tbxAddress" runat="server" Width="93%" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tableQTitleFont" rowspan="2">連結</td>
                        <td class="tableQCFont3">
                            <asp:ImageButton ID="ibtnGM" runat="server" Height="80%" ImageUrl="~/img/1.png"  Width="60%" OnClick="ibtnGM_Click1" />
                            </td>
                        <td class="tableQCFont3">
                            <asp:ImageButton ID="ibtnGill" runat="server" Height="80%" ImageUrl="~/img/2.png"  Width="60%" OnClick="ibtnGill_Click1" />
                      </td>
                    </tr>
                    <tr>
                        <td class="tableQCFont3">
                            <asp:ImageButton ID="ibtnEvent" runat="server" Height="80%" ImageUrl="~/img/4.png" Width="60%" OnClick="ibtnEvent_Click1" />
                         </td>
                        <td class="tableQCFont3">
                            <asp:ImageButton ID="ibtnHospital" runat="server" Height="80%" ImageUrl="~/img/3.png" Width="60%" OnClick="ibtnHospital_Click1" />
                         </td>
                    </tr>
                    <tr>
                        <td  class="tableQTitleFont">QRCODE</td>
                        <td class="tableQCFont" colspan="2">
                            <asp:Image ID="imgQrcodd" runat="server" Height="200px" Width="200px"  />
                        </td>
                    </tr>
                    <tr>
                       <td colspan="3" class="tableMsg">
                         *可利用被守護者手機，在app中掃瞄QRCODE，即可將被守護者資料自動登入
                           </td>   
                        </tr>
                    <tr>
                    <td colspan="3" class="auto-style3_1">
                        <asp:Button ID="btnOK" runat="server"  Height="70%" Width="35%"  Text="送出" OnClick="btnOK_Click1"/> 
                &nbsp;<asp:Button ID="btnBack" runat="server"  Height="70%" Width="35%"  Text="返回" OnClick="btnBack_Click1"/>
               
                        
                        </td>
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
