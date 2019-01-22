<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldRemind_View.aspx.cs" Inherits="WebPro.GA.less.OldRemind_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        .新增樣式2 {
            font-family: 微軟正黑體;
        }
        .新增樣式3 {
            font-family: 微軟正黑體;
        }
        .auto-style3 {
            font-family: 微軟正黑體;
            font-size: large;
            font-weight: bold;
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
    <form id="form1" runat="server">
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
    <!--主頁內容-->
        <p class="text-center">
        <span class="fontSet"><b><strong>檢視藥包</strong></b></span></p>
        <!-- Page Title --> 
        <div class="auto-style2">
			<div class="coming-soon-subscribe container">
                <div class="row">
    <p>
            &nbsp;</p>
        <table class="nav-justified">
            <tr>
                <td>
                    <span class="auto-style31"/>
                                                    
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT N_id,N_name, N_startdate + '~' + N_enddate AS Expr2 FROM Notice WHERE (N_id = @N_id)">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="N_id" QueryStringField="nid" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource2" GridLines="None" Height="225px" Width="400px" horizontalalign="Center" CssClass="新增樣式1" ForeColor="#333333" Font-Size="Large" DataKeyNames="N_id">
                                            <AlternatingRowStyle BackColor="White" />
                                            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                            <Fields>
                                                <asp:BoundField DataField="N_id" HeaderText="藥包編號" SortExpression="N_id" InsertVisible="False" ReadOnly="True" >
                                                <HeaderStyle BackColor="#006699" ForeColor="White" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="N_name" HeaderText="藥包名稱" SortExpression="N_name" >
                                                <HeaderStyle BackColor="#006699" ForeColor="White" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="用藥時間">
                                                    <HeaderStyle BackColor="#006699" ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Expr2" HeaderText="服藥期間" ReadOnly="True" SortExpression="Expr2" >
                                                <HeaderStyle BackColor="#006699" ForeColor="White" />
                                                </asp:BoundField>
                                                
                                            </Fields>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                        </asp:DetailsView>
                                               
                                                </span>
                    <br />
                                               
                                                </td>
            </tr>
            <tr>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
                </div>
			</div>
		</div>  
                                       <div class="text-center">
                    <span class="auto-style31"/>
                                           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                               <ContentTemplate>
                    <span class="auto-style31"/>
                                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Guardian_Angel %>" SelectCommand="SELECT B.P_id, B.P_name, A.P_number, B.P_remark, B.P_photo FROM NPGrouping AS A INNER JOIN Pill AS B ON A.P_id = B.P_id INNER JOIN Notice AS C ON C.N_id = A.N_id WHERE (A.N_id = @N_id)">
                                                       <SelectParameters>
                                                           <asp:QueryStringParameter Name="N_id" QueryStringField="nid" Type="Int32" />
                                                       </SelectParameters>
                                                   </asp:SqlDataSource>
                                                   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style2" DataKeyNames="P_id" DataSourceID="SqlDataSource1" Font-Size="Large" ForeColor="#333333" GridLines="None" horizontalalign="Center" Width="400px" ShowHeaderWhenEmpty="True">
                                                       <AlternatingRowStyle BackColor="White" horizontalalign="Center" />
                                                       <Columns>
                                                           <asp:TemplateField HeaderText="勾選刪除" InsertVisible="False" SortExpression="P_id">
                                                               <EditItemTemplate>
                                                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("P_id") %>'></asp:Label>
                                                               </EditItemTemplate>
                                                               <ItemTemplate>
                                                    <span class="auto-style31"/>
                                                                   &nbsp;&nbsp;&nbsp;&nbsp;
                                                                   <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("P_id") %>'></asp:Label>
                                                                   </span>
                                                               </ItemTemplate>
                                                               <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Large" />
                                                               <ItemStyle Font-Size="Medium" HorizontalAlign="Center" Width="150px" VerticalAlign="Middle" />
                                                           </asp:TemplateField>
                                                           <asp:BoundField DataField="P_name" HeaderText="名稱" SortExpression="P_name" >
                                                           <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="Large" />
                                                           <ItemStyle Font-Size="Medium" HorizontalAlign="Left" Width="180px" />
                                                           </asp:BoundField>
                                                           <asp:BoundField DataField="P_number" HeaderText="數量" SortExpression="P_number">
                                                           <HeaderStyle Width="120px"  Font-Size="Large" />
                                                           <ItemStyle Font-Size="Large" HorizontalAlign="Center" Width="100px" />
                                                           </asp:BoundField>
                                                           <asp:HyperLinkField DataNavigateUrlFields="P_id" DataNavigateUrlFormatString="OldRemind_ViewPill.aspx?pid={0}" HeaderText="說明" Text="檢視" Target="_blank">
                                                           <ItemStyle HorizontalAlign="Left" Width="80px" />
                                                           </asp:HyperLinkField>
                                                       </Columns>
                                                       <EditRowStyle BackColor="#2461BF" />
                                                       <EmptyDataRowStyle ForeColor="Red" />
                                                       <EmptyDataTemplate>
                                                           抱歉!!!沒有找到任何紀錄~
                                                       </EmptyDataTemplate>
                                                       <FooterStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Font-Size="Large"/>
                                                       <HeaderStyle BackColor="#006699" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Height="80px" />
                                                       <PagerStyle BackColor="#006699" ForeColor="White" HorizontalAlign="Center" />
                                                       <RowStyle BackColor="#EFF3FB" Font-Names="微軟正黑體" Font-Size="Medium" />
                                                       <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                       <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                       <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                       <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                       <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                   </asp:GridView>
                                                   <br />
                                                   <asp:Button ID="btnDelete" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#CCFFFF" Height="40px" OnClick="btnDelete_Click" Text="刪除" ToolTip="刪除藥品" Width="80px" />
                                                   </span>&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style31"/>
                                                   <asp:Button ID="btnAdd" runat="server" BackColor="#336699" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Large" ForeColor="#CCFFFF" Height="40px" OnClick="btnAdd_Click" Text="新增" ToolTip="新增藥品" Width="80px" CssClass="新增樣式2" />
                                                   &nbsp; &nbsp;&nbsp;
                                                   </span>
                                                   <strong>
                                                   <asp:Button ID="btnBack" runat="server" BackColor="#336699" CssClass="auto-style3" ForeColor="#CCFFFF" Height="40px" OnClick="btnBack_Click" Text="返回藥包列表" Width="174px" />
                                                   </strong>
                                               </ContentTemplate>
                                           </asp:UpdatePanel>
                                           </span>
                                           <table class="nav-justified">
                                               <tr>
                                                   <td>
                                                       <table class="nav-justified">
                                                           <tr>
                                                               <td>&nbsp;</td>
                                                           </tr>
                                                       </table>
                                                   </td>
                                               </tr>
                                           </table>
                                           <div>
                                        
                                                   <span class="auto-style31"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                                                                          
                   

                                                   </div>
                
 <div class="contact-form-wrapper">
                            
        <div class="section" runat="server">
            <div class="container">
                <div class="row">
                    
                        </div>
                        <!-- End Contact Info -->
                    </div>
                </div>
            </div>       
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
                                &copy;2015 Groovin - All right reserved | Designed by             </p>
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
