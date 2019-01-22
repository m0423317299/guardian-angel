<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldRemind_Add.aspx.cs" Inherits="WebPro.GA.less.OldRemind_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel 用藥提醒</title>
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
/*合併css*/
    .careFont {
            font-family: 微軟正黑體;
            text-align: center;
            line-height:100px;
        }
    .fontSet{
            font-family: 微軟正黑體;
            text-align: center;
            font-size: 60px;
            color: #FFFFFF;
            font-weight: bold;
            color: white;
            text-shadow: black 0.1em 0.1em 0.2em;
        }
    .tableFont{
            width:600px;
            border:3px solid #FFFFFF;
            padding:3px;
            margin:0 auto;            
        }
    .tableTitleFont{
            font-family:微軟正黑體; 
            color: #FFFFFF;
            font-size:14pt;
            font-weight:bold;
            align-content:center; 
            height:40px; 
            text-align:center;
            letter-spacing: 1px;       
            background-color:#479AC7;
            border:3px solid #FFFFFF;
       }
    .tableQTitleFont{
            font-family:微軟正黑體; 
            color: #FFFFFF;
            font-size:14pt;
            font-weight:bold;
            align-content:center; 
            height:80px; 
            text-align:center;
            letter-spacing: 1px;  
            background-color:#479AC7;
        }
    .tableCFont{
            font-family:微軟正黑體; 
            color: #000000;
            font-size:14pt;
            font-weight:bold;
            align-content:center; 
            height:40px; 
            text-align:center;
            letter-spacing: 1px;
            background-color:skyblue;
            border:3px solid #FFFFFF;
        }
    .tableQCFont{
            font-family:微軟正黑體; 
            color: #000000;
            font-size:14pt;
            font-weight:bold;
            align-content:center; 
            height:80px; 
            text-align:center;
            letter-spacing: 1px;
            background-color:skyblue;
            border:3px solid #FFFFFF;     
        }
    .btnFont{            
            font-family:微軟正黑體; 
            color: #FFFFFF;
            font-size:14pt;
            font-weight:bold;
            align-content:center; 
            text-align:center;
            background-color:#000080;
        
         }
    .新增樣式1 {
            font-family: 微軟正黑體;
        }
    .auto-style2 {
            margin-top: 0%;
            text-align: center;
        }
     .tableQCFont{
            font-family:微軟正黑體; 
            color: #000000;
            font-size:14pt;
            font-weight:bold;
            align-content:center; 
            height:80px; 
            text-align:center;
            letter-spacing: 1px;
            background-color:skyblue;
            border:3px solid #FFFFFF;     
        }
        .auto-style3 {
            left: 0px;
            top: 0px;
        }
        .auto-style4 {
            font-family: 微軟正黑體;
            color: #000000;
            font-size: 14pt;
            font-weight: bold;
            align-content: center;
            height: 40px;
            text-align: center;
            letter-spacing: 1px;
            background-color: skyblue;
            border: 3px solid #FFFFFF;
            width: 298px;
        }
        .auto-style5 {
            font-family: 微軟正黑體;
            color: #000000;
            font-size: 14pt;
            font-weight: bold;
            align-content: center;
            height: 40px;
            text-align: center;
            letter-spacing: 1px;
            background-color: skyblue;
            border: 3px solid #FFFFFF;
            width: 274px;
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
    <p><span class="auto-style22">&nbsp;</span><span class="auto-style22">[</span><a href="OldRemind_List.aspx"><span class="auto-style22">回藥包列表</span></a><span class="auto-style22">]</span></p>
    <p>&nbsp;</p>

       
<!--主頁內容-->
        
        <!-- Page Title -->
   <p class="text-center">
        <span class="fontSet"><b><strong>新增藥包</strong></b></span></p>  
   <form id="careForm" runat="server">
		<div class="auto-style2">
			&nbsp;<div class="coming-soon-subscribe container">
                <div class="row">
                    <div class="auto-style3">
                        <div class="auto-style3">
                            <%-- <input type="text" class="form-control input-lg" placeholder="輸入關鍵字查詢守護對象"/>--%>
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
         <tr>
          <td class="text-center">
              <p>
                  <strong>
                <asp:Label ID="lblMsg" runat="server" Text="Label" Visible="False" CssClass="auto-style1" Font-Names="微軟正黑體"></asp:Label>
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
                  </strong>
              </p>
              <br />
              
              
              
            <span class="auto-style31">
            </span>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                      <table class="tableFont">
                          <tr>
                              <td class="tableTitleFont">被照護者姓名</td>
                              <td class="auto-style4">
                                  <asp:Label ID="lblOlderName" runat="server" BackColor="White" Width="90%"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="tableTitleFont">藥包名稱</td>
                              <td class="auto-style4">
                                  <asp:TextBox ID="tbNname" runat="server" Width="90%"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="tableTitleFont">設定用藥時間</td>
                              <td class="auto-style4">
                                  <asp:Button ID="btnAddTime" runat="server" OnClick="btnAddTime_Click" Text="+ 新增用藥時間" Width="90%" />
                            <br />
                                  <asp:Panel ID="Panel1" runat="server">
                                      <asp:DropDownList ID="DropDownList1" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 時&nbsp;
                                      <asp:DropDownList ID="DropDownList2" runat="server" Width="74px">
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 分&nbsp;&nbsp;
                                      <asp:Button ID="btnSetTimeCancel1" runat="server" OnClick="btnSetTimeCancel1_Click" Text="取消" Width="64px" />
                                  </asp:Panel>
                                  <asp:Panel ID="Panel2" runat="server">
                                      <asp:DropDownList ID="DropDownList3" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 時&nbsp;
                                      <asp:DropDownList ID="DropDownList4" runat="server" Width="74px">
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 分&nbsp;&nbsp;
                                      <asp:Button ID="btnSetTimeCancel2" runat="server" OnClick="btnSetTimeCancel2_Click" Text="取消" Width="64px" />
                                  </asp:Panel>
                                  <asp:Panel ID="Panel3" runat="server">
                                      <asp:DropDownList ID="DropDownList5" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 時&nbsp;
                                      <asp:DropDownList ID="DropDownList6" runat="server" Width="74px">
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 分&nbsp;&nbsp;
                                      <asp:Button ID="btnSetTimeCancel3" runat="server" OnClick="btnSetTimeCancel3_Click" Text="取消" Width="64px" />
                                  </asp:Panel>
                                  <asp:Panel ID="Panel4" runat="server">
                                      <asp:DropDownList ID="DropDownList7" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 時&nbsp;
                                      <asp:DropDownList ID="DropDownList8" runat="server" Width="74px">
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 分&nbsp;&nbsp;
                                      <asp:Button ID="btnSetTimeCancel4" runat="server" OnClick="btnSetTimeCancel4_Click" Text="取消" Width="64px" />
                                  </asp:Panel>
                                  <asp:Panel ID="Panel5" runat="server">
                                      <asp:DropDownList ID="DropDownList9" runat="server">
                                          <asp:ListItem Value="0"></asp:ListItem>
                                          <asp:ListItem Value="1"></asp:ListItem>
                                          <asp:ListItem Value="2"></asp:ListItem>
                                          <asp:ListItem Value="3"></asp:ListItem>
                                          <asp:ListItem Value="4"></asp:ListItem>
                                          <asp:ListItem Value="5"></asp:ListItem>
                                          <asp:ListItem Value="6"></asp:ListItem>
                                          <asp:ListItem Value="7"></asp:ListItem>
                                          <asp:ListItem Value="8"></asp:ListItem>
                                          <asp:ListItem Value="9"></asp:ListItem>
                                          <asp:ListItem Value="10"></asp:ListItem>
                                          <asp:ListItem Value="11"></asp:ListItem>
                                          <asp:ListItem Value="12"></asp:ListItem>
                                          <asp:ListItem Value="13"></asp:ListItem>
                                          <asp:ListItem Value="14"></asp:ListItem>
                                          <asp:ListItem Value="15"></asp:ListItem>
                                          <asp:ListItem Value="16"></asp:ListItem>
                                          <asp:ListItem Value="17"></asp:ListItem>
                                          <asp:ListItem Value="18"></asp:ListItem>
                                          <asp:ListItem Value="19"></asp:ListItem>
                                          <asp:ListItem Value="20"></asp:ListItem>
                                          <asp:ListItem Value="21"></asp:ListItem>
                                          <asp:ListItem Value="22"></asp:ListItem>
                                          <asp:ListItem Value="23"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 時&nbsp;
                                      <asp:DropDownList ID="DropDownList10" runat="server" Width="74px">
                                          <asp:ListItem Value="00"></asp:ListItem>
                                          <asp:ListItem Value="30"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; 分&nbsp;&nbsp;
                                      <asp:Button ID="btnSetTimeCancel5" runat="server" OnClick="btnSetTimeCancel5_Click" Text="取消" Width="64px" />
                                  </asp:Panel>
                            <br />
                              </td>
                          </tr>
                          <tr>
                              <td class="tableTitleFont">服藥日期(開始)</td>
                              <td class="auto-style4">
                                  <asp:TextBox ID="tbStartDate" runat="server" Width="200px"></asp:TextBox>
                                  &nbsp;
                                  <asp:Button ID="btnSetDate1" runat="server" OnClick="btnSettDate1_Click" Text="設定" Width="64px" />
                            <br />
                                  <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px">
                                      <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                      <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                      <OtherMonthDayStyle ForeColor="#999999" />
                                      <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                      <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                      <TodayDayStyle BackColor="#CCCCCC" />
                                  </asp:Calendar>
                              </td>
                          </tr>
                          <tr>
                              <td class="tableTitleFont">服藥日期(結束)</td>
                              <td class="auto-style4">
                                  <asp:TextBox ID="tbEndDate" runat="server" Width="200px"></asp:TextBox>
                                  &nbsp;
                                  <asp:Button ID="btnSetDate2" runat="server" OnClick="btSetDate2_Click" Text="設定" Width="64px" />
                            <br />
                                  <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar2_SelectionChanged" Width="350px">
                                      <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                      <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                      <OtherMonthDayStyle ForeColor="#999999" />
                                      <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                      <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                      <TodayDayStyle BackColor="#CCCCCC" />
                                  </asp:Calendar>
                              </td>
                          </tr>
                      </table>
                      <br />
                      <asp:Button ID="btnOK" runat="server" class="btnFont" Height="50px" OnClick="btnOK_Click" Text="新增" Width="100px" />
                      　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 　<asp:Button ID="btnCancel" runat="server" class="btnFont" Height="50px" OnClick="btnCancel_Click" Text="取消" Width="100px" />
                      　<br />
                  </ContentTemplate>


              </asp:UpdatePanel>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="text-center">
                <br />
                <br /><br />
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
